
// pragma solidity >=0.8.0;
// contract MyContract{
//     function Deposit() public  payable{}
//     function Withdrawal(address payable to,uint amount) public {
//       to.call {value:amount}(""); // This is a low-level call function used to send Ether to an address. It’s like saying "call the to address and send some Ether."
//     }                             // sending money to yourself
// }


// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract MyContract {
    // Deposit function allows Ether to be sent to the contract
    function Deposit() public payable {}

    // Withdrawal function sends Ether to the specified address
    function Withdrawal(address payable to, uint amount) public {
        // Ensure the contract has enough balance to send the amount
        require(address(this).balance >= amount, "Insufficient balance");
        
        // Attempt to send Ether using low-level call
        (bool success, ) = to.call{value: amount}("");
        
        // If the call fails, revert with an error message
        require(success, "Transfer failed");
    }
}
