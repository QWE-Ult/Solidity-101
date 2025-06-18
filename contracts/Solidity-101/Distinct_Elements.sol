// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
contract Rough{
    mapping(uint=>bool) private seen;
    event DistinctCount(uint count);
    function distinct(uint[] memory array) public  returns(uint){
        uint distinctCount = 0;
        for(uint i=0; i<array.length; i++){
            delete seen[array[i]];
        }
                for(uint i=0; i<array.length; i++){
               if (!seen[array[i]]) {
                seen[array[i]] = true;
                distinctCount++;
            }
        }
        emit DistinctCount(distinctCount);
        return distinctCount;
    }
}