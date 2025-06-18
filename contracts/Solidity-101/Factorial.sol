// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FactorialContract {
    function calculateFactorial(uint256 n) public pure returns (uint256) {
      uint result =1;
      for(uint256 i=1; i<=n;i++){
         result *= i; 

      }
      return result;

        

     
    }
}

