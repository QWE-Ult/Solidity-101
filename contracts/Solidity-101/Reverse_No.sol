// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReverseNumber {
    function reverse(uint256 num) public pure returns (uint256) {
        uint256 reversed = 0;
        while (num != 0) {
            uint256 digit = num % 10;         // Get the last digit of num
            reversed = reversed * 10 + digit; // Append the digit to reversed
            num = num / 10;                   // Remove the last digit from num
        }
        return reversed;
    }
}
// when num!=0;
// num=12345;
//12345%10=5;
//reversed =0;0*10+5=5
//12345/10=1234
// return reversed=5
//num=1234;
//1234%10=4;
//reversed=5=5*10+4=54
//1234/10=123
//......
