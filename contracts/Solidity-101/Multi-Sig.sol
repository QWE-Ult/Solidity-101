// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
contract MultisigWallet{
    event Deposit(address indexed sender, uint amount);
    event Submit(uint indexed txId);
    event Approve(address indexed owner, uint indexed txId);
    event Revoke(address indexed owner, uint indexed txId);
    event Execute(uint indexed txId);
    struct Transaction{
        address to;
        uint value;
        bytes data;
        bool executed;
    }
    address [] public owners;
    mapping(address=>bool) public isOwner;// to check the owner returns true
    uint public required;// number of approvals required for execution
 

     Transaction[] public transactions;// storing every txns
     mapping(uint=>mapping(address=>bool)) public approved;// txn is approved or not by owners
     
     modifier onlyOwner(){
        require(isOwner[msg.sender], "not owner");
        _;
     }
     modifier txExists(uint _txId){
        require(_txId< transactions.length,"tx does not exist");
        _;
     }
          modifier notApproved(uint _txId){
require(!approved[_txId][msg.sender], "tx already approved");_;        
     }
     modifier notExecuted(uint _txId){
        require(!transactions[_txId].executed,"tx already executed");_;
     }

     constructor(address[] memory _owners, uint _required){
        require(_owners.length>0);
        require(_required>0 && _required<=_owners.length);
        for(uint i; i<_owners.length; i++){
            address owner=_owners[i];

            require(owner!=address(0));
            require(!isOwner[owner],"owner is jnot unique");

            isOwner[owner]= true;
            owners.push(owner);
        }
        required=_required;//Sets the required state variable to the number of approvals needed for a transaction to be executed.
            
        }
                receive() external payable{
                    emit Deposit(msg.sender, msg.value);

     }
     function submit(address _to, uint _value, bytes calldata _data) external onlyOwner{
         transactions.push(Transaction(_to,_value,_data,false));
         emit Submit(transactions.length-1);
     }
     function approve(uint _txId) external onlyOwner txExists(_txId)notApproved(_txId)notExecuted(_txId){
        approved[_txId][msg.sender]=true;
        emit Approve(msg.sender,_txId);

     }
     function _getApprovalCount(uint _txId ) private view returns(uint count){
        for(uint i ; i< owners.length; i++){
            if (approved[_txId][owners[i]]){
                count +=1;
            }
        }
        
        
     }
     function execute (uint _txId) external txExists(_txId) notExecuted(_txId){
        require(_getApprovalCount(_txId)>= required,"approvals<required");
        Transaction storage txns=transactions[_txId];
        txns.executed=true;
                    // Using `call` for safety against reentrancy

        (bool success, )= txns.to.call{value:txns.value}(
            txns.data
        );
        require(success, "tx failed");
        emit Execute(_txId);

     }
     function revoke (uint _txId) external onlyOwner txExists(_txId)notExecuted(_txId){
        require(approved[_txId][msg.sender],"tx not approved");
        approved[_txId][msg.sender] = false;
        emit Revoke(msg.sender, _txId);
     }


}