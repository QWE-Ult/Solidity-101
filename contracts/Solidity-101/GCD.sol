// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
contract Sel{
    function gcd(uint256 a ,uint256 b) public pure  returns (uint){
        while(b !=0){
            uint temp =b;
            b=a%b;
            temp=a;

        }
        return a;
    }
}