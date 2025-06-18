// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
contract diss{
    uint public val = 4; // state variable = the variables that fall under contract, not in function and whose values are stored permanently in cont.storage.
    function get() public pure returns(uint ) {
        uint val2=3;// local variable= the variables that fall under function,  values of which are present till function execution.
        return val2;
    }
    function global() public view returns (uint){
        return msg.sender.balance;
    }
        

}
// Global variables= special variables exists in global namespaces used to get info about blockchain.Eg = msg.sender,block.timestamp etc