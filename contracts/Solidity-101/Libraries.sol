// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
library fun{
    function add() public pure returns (uint){
        return 5+4;
    }
    function sub () public pure returns (uint){
        return 5-4;
    }
}
contract main{
        function call () public pure returns (uint){
return fun.add();

}}

// Libraries are like a set of ready-to-use functions that you can call later in your contracts.
// By putting common functions in libraries, you avoid repeating the same code in multiple contracts.
// Since libraries don't store state, they don't use much gas on their own. When you call a function from a library in a contract, 
//it helps make the contract more efficient and cheaper to deploy because you aren't duplicating code.
// In Solidity, libraries are special types of smart contracts that contain reusable code that can be called by other contracts. 
//Libraries are meant to be used for code that is stateless (i doesn't store state variables), 
//and their functions can be called by other contracts to avoid duplicating the same logic.

