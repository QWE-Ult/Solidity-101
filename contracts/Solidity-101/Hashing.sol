// SPDX-License-Identifier: MIT
pragma solidity>=0.8.0;
contract hash{
    bytes32 public password;
    function genpass(string memory _pass) public{
        password= keccak256(abi.encodePacked(_pass));
    }
    function sendmoney(string memory _pass) public view {
        require(keccak256(abi.encodePacked(_pass))== password,"wrong password");
    }
}


// encode packed gives output like (aaa,bbb)=1234567890 and (aaab,bb)=1234567890(same)
// encode solve this gives different answer