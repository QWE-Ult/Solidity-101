// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;    // when an erroe occurs the state is reverted back to its original state.
contract error {
    address public owner;
    uint public count;
    constructor(){
        owner=msg.sender;

    }
    function call()public {
       count++;

       if(msg.sender==owner){
        revert("caller is not owner");
       }

            //    assert (msg.sender==owner);

        // require(msg.sender==owner,"you are not owner");
        
    }
}