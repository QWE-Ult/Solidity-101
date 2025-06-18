// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract ArrayDoubler {
    function doubleArray(uint[] memory inputArray) public pure returns (uint[] memory) {
        for (uint i = 0; i < inputArray.length; i++) {
            inputArray[i] = inputArray[i] * 2;  // Double each element in the array
        }
        return inputArray;  // Return the modified array
    }
}
// pragma solidity >=0.8.0;// addition of each numbers in arry
// contract Sol{
//    function Arr(uint [] memory arr) public pure returns(uint){
//     uint r =0;
//     for(uint i =0; i<arr.length; i++){
//         r+=arr[i];
//     }
//     return r;
//    } 
// }
