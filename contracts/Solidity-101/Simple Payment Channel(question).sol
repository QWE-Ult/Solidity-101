// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimplePaymentChannel {
    address public recipientAddress;  // Alice's address (the recipient)
    address public buyer; // Shopkeeper's address (sender)
    uint256 public depositAmount;     // Total amount deposited by the shopkeeper
    uint256 public totalPayments;     // Total payments made by the shopkeeper
    uint256[] public payments;        // List of payments made by the shopkeeper

    // Constructor to set the recipient address (Alice's address)
    constructor(address _recipientAddress) {
        recipientAddress = _recipientAddress; // Set Alice's address
    }

    // Function to deposit funds into the channel
    function deposit() public payable {
        require(msg.value ==100 wei, "Deposit must be greater than 0");
        buyer = msg.sender;  // Set the shopkeeper's address (sender)
        depositAmount += msg.value;      // Increase deposit amount
    }

    // Function to list payments for purchases
    function listPayment(uint256 amount) public {
        require(msg.sender == buyer, "Only shopkeeper can list payments");
        require(amount <= depositAmount - totalPayments, "Insufficient funds for this payment");

        totalPayments += amount; // Add the payment to the total
        payments.push(amount);    // Store the payment amount in the array
    }

    // Function to close the channel and return remaining funds
    function closeChannel() public {
        require(msg.sender == buyer || msg.sender == recipientAddress, "Only shopkeeper or recipient can close channel");

        uint256 remainingBalance = depositAmount - totalPayments;  // Calculate remaining balance
        if (msg.sender == recipientAddress) {
            payable(recipientAddress).transfer(totalPayments); // Transfer to Alice
        } else {
            payable(buyer).transfer(remainingBalance); // Refund remaining balance to shopkeeper
        }

        // Reset the contract state
        depositAmount = 0;
        totalPayments = 0;
        delete payments; // Clear the payments array
    }

    // Function to check the current deposit balance
    function checkBalance() public view returns (uint256) {
        return depositAmount; // Return the total deposit amount
    }

    // Function to get all listed payments
    function getAllPayments() public view returns (uint256[] memory) {
        return payments; // Return the list of payments
    }
}
