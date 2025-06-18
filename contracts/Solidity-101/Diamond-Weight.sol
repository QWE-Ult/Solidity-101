// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract DiamondTracker {

    // Array to store the weights of diamonds
    uint[] public diamondWeights;

    // Function to add diamonds by their weights
    function importDiamonds(uint[] memory weights) public {
        for (uint i = 0; i < weights.length; i++) {
            diamondWeights.push(weights[i]);
        }
    }

    // Function to return the number of diamonds with a specific weight
    function availableDiamonds(uint weight) public view returns (uint) {
        uint count = 0;
        for (uint i = 0; i < diamondWeights.length; i++) {
            if (diamondWeights[i] == weight) {
                count++;
            }
        }
        return count;
    }
}
