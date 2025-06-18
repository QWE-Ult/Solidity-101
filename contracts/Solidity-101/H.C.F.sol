// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HCF {

    // Function to calculate the HCF (GCD) using the Euclidean algorithm
    function calculateHCF(uint256 a, uint256 b) public pure returns (uint256) {
        // Using the Euclidean algorithm to find HCF
        while (b != 0) {
            uint256 t = b;
            b = a % b; // Get the remainder
            a = t;  // Update a to the previous b
        }
        return a; // The result is the HCF
    }
}
