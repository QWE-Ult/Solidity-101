// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
contract Mappings {

mapping(address=>uint) public balance;
function addbalance(uint bal) public {
    balance[msg.sender]=bal;

}

    }



