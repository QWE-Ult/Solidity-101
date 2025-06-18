// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract RightAngledTriangle {
    //To check if a triangle with side lenghts a,b,c is a right angled triangle
    function check(uint a, uint b, uint c) public pure returns (bool) {
       return (c**2 == a**2 + b**2) && (a*b*c) > 0;
    }
}
