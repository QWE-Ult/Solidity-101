pragma solidity ^0.8.0;

contract StringManipulation {
    
    string public message;
    
    function setMessage(string memory _newMessage) public {
      require(bytes(_newMessage).length>0,"kkkkk");
        // TODO: ensure _newMessage is not an empty string
        // TODO: set message
      bytes memory b1=bytes(_newMessage);
      uint length=b1.length;
              bytes memory reversed = new bytes(length); // Create a new bytes array to store the reversed string
for(uint i =0; i<length;i++){
  reversed[i]=b1[length-1-i];
  
}
              message = string(reversed);

    }
    
    function reverseMessage() public view returns (string memory) {
      return message ;
        // TODO: add code here to reverse the order of characters in the `message` string
    }
}
