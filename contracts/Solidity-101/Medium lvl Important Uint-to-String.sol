// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract UintToString {

    // Function to convert uint to string
    function uintToString(uint256 value) public pure returns (string memory) {
        if (value == 0) {
            return "0";  // Special case for zero
        }
        
        uint256 temp = value;
        uint256 digits;
        
        // Count how many digits the number has
        while (temp != 0) {
            digits++;
            temp /= 10;
        }

        // Create a new string with the required length
        bytes memory buffer = new bytes(digits);

        // Convert the uint to string
        uint256 index = digits - 1;
        while (value != 0) {
            buffer[index--] = bytes1(uint8(48 + (value % 10)));  // Get the last digit and convert to ASCII
            value /= 10;
        }

        return string(buffer);  // Convert bytes to string
    }
}
