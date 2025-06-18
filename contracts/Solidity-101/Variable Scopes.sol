// Scope is about where a variable or function can be used or accessed in your contract.
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
contract a {
    uint public val =5; // can be accessed everywhere, internal can be used internally on contract and cant be inherited without using this word.and private only internally of contract
    function get() public view returns (uint){
        return val;
    }

}

contract b is   a {
        function get2() public view returns (uint){
        return val ;

}
}