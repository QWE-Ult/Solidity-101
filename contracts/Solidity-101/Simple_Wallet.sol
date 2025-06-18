// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
contract Wallet{
    address public owner;
    constructor(){
        owner=msg.sender;
    }
    modifier onlyOwner (){
        require(msg.sender==owner,"you are not the owner");
        _;
    }
    function addMoney() public payable{

    }
    function getMoney(uint amount) public onlyOwner{
        require(address(this).balance>=amount,"not enough money");
        payable(owner).transfer(amount);
    } 
    function getbal() public onlyOwner view returns(uint){
        return address(this).balance;
    }
}