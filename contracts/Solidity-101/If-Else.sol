// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
contract decision {
    function done(uint a,uint b,uint c) public pure returns(string memory){
        if (a>b && a>c){
            return "a is greater than b and c ";
        }
        else if (b>a && b>c){
             return "b is greater than a and c ";
        }
        else if (c>a && c>b){
            return "c is greater ";
        }
        else{
            return "they are equal";
        }
        }
    }
  







//   function get(int a) public pure returns(string memory){
        
//         if(a>0){
//             return "a is greater";
//         }
//         else if (a<0){
//             return "a is smaller";
//         }
//         else{
//             return "a is equal to zero ";
//         }
//     }