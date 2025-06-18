// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
contract Fun{
    function pn(uint n) public pure returns (uint){
           if (n <= 1) {
                return 0;}
       for (uint i = 2; i *i <= n; i++) {
            if (n % i == 0) {
                return 0; // not prime if divisible by any number other than 1 and n
            }
       }
        return 1;
    }
}