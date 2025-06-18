// SPDX-License-Identifier: MIT
pragma solidity>= 0.8.0;    // like special rules that you can add to your functions to control how they behave. They let you add conditions or checks before or after the function runs, without having to repeat the same code in multiple places.
contract modifiers{
address public owner;
constructor (){
    owner=msg.sender;
}
modifier onlyOwner {
    require (msg.sender==owner);_;
}
function sendMoney() public onlyOwner{
     
}
}