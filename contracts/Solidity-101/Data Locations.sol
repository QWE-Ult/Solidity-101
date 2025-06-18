// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract StorageExample {
    uint public counter;  // This is stored in storage.

    function increment() public {
        counter++;  // Writing to storage will cost gas.
    }
}
pragma solidity ^0.8.0;

contract MemoryExample {
    function sum(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 result = a + b;  // 'result' is stored in memory.
        return result;
    }
}

