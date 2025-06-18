// SPDX-License-Identifier: MIT
pragma solidity>=0.8.0;
contract Const{
                                 // special function used to initialize the contract ,It is executed only once,
     address public owner;         //typically used to set up the initial state of the contract, such as setting owner addresses, 
         uint public balance;         //initializing variables, or any other setup necessary before the contract is used.
          constructor   (uint _balance){                   
owner=msg.sender;
balance= _balance;
         }}
        // contract Derived is Const(20){
         contract Derived is Const{
            constructor() Const(20) {
                
            }

         }