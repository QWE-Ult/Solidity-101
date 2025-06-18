// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract SimpleOperations {


    function calculateAverage(
        uint256 a,
        uint256 b
    ) public pure  returns (uint256) {
        return (a+b)/2;
    }

  
   function getBit(uint256 num, uint256 position) public pure returns (uint8) {
     uint32 i = 1;
      while (num != 0) { 
        uint8 bit = uint8(num % 2);
         if (i == position) 
         { return bit; }
          num /= 2; 
          i++; }
           revert(); }
    

  
    function sendEth(address to) public payable {
        require(msg.sender!=to,"both cant be same");
        payable(to).transfer(msg.value);
    }
}