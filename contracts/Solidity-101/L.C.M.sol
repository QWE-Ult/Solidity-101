// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LCMCalculator {

    // Function to calculate the Least Common Multiple (LCM) without using GCD
    function lcm(uint a, uint b) public pure returns (uint result) {
        uint max = a > b ? a : b;  // Start with the maximum of the two numbers
        
        // Iterate through multiples of the max number
        for (uint i = max; i <= a * b; i += max) {
            if (i % a == 0 && i % b == 0) {
                return i;  // Return the first multiple of max that is divisible by both a and b
            }
        }
        
        // This will never be reached because the loop guarantees a result before it ends
        return 0;  // Just in case, but this shouldn't happen
    }
}
