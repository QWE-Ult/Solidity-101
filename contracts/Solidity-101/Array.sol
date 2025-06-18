// SPDX-License-Identifier: MIT
pragma solidity >0.8.9;
contract Array{   
          // data structure that stores fixed collections of elements of same data types in which all elements has specific location called index
                                    // holds multiple values of same data

uint[] public numbers= [1,2,3,4];

function getarr() public  {
 //  numbers[0]=0;// returns (uint)
   // return numbers[0];// returns (uint[]memory)
       //return numbers.length;//returns (uint)
      // numbers.push(6);
numbers.pop();
}

}








// uint[3] public numbers =[0,1,2]; - FIXED ARRAY
// uint[] public numbers =[0,1,2,3,4,5,6,7....]; - DYNAMIC ARRAY