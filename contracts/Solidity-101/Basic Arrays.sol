// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
contract Array{
    uint[] public balances;
    function add (uint el) public {
        balances.push(el);
    }
    function read (uint i ) public view returns(uint){
        return balances[i];
    }
    function update (uint el, uint i ) public {
        balances[i]=el;
    }
    function delel(uint i ) public {
        delete balances[i];
    }
}