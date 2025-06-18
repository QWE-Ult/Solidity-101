// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MaxNumberContract {

    // Function to find the maximum number in an array
    function findMaxNumber(uint256[] memory numbers) external pure returns (uint256) {
        // Ensure that the array is not empty
        require(numbers.length > 0, "Array cannot be empty");

        uint256 maxNumber = numbers[0];  // Start by assuming the first element is the max
        // Iterate through the array to find the max number
        for (uint256 i = 1; i < numbers.length; i++) {
            if (numbers[i] > maxNumber) {
                maxNumber = numbers[i];  // Update maxNumber if a larger number is found
            }
        }

        return maxNumber;  // Return the maximum number
    }
}
