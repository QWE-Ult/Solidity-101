// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract PercentFee {
    address public owner;
    mapping(address => uint) balances;
    uint public FeePercent;

    // Constructor: sets initial fee percentage and owner
    constructor(uint _FeePercent) {
        require(_FeePercent <= 100, "Fee must be between 0 and 100");
        FeePercent = _FeePercent;
        owner = msg.sender;
    }

    // Only owner modifier
    modifier onlyOwner {
        require(owner == msg.sender, "You are not the owner");
        _;
    }

    // Function to set fee percentage by owner
    function setpercent(uint _FeePercent) public onlyOwner {
        require(_FeePercent <= 100, "Fee must be between 0 and 100");
        FeePercent = _FeePercent;
    }

    // Function to deposit Ether into the contract with fee deduction
    function deposit() external payable {
        require(msg.value > 0, "You must send some Ether");

        // Directly calculate and transfer fee to owner and the remaining amount to user
        uint cut=(msg.value * FeePercent) / 100;
        payable(owner).transfer( cut);// Transfer fee to the owner
        payable(msg.sender).transfer(msg.value - (cut)); // Transfer remaining amount to user

        // Update user's balance with the remaining Ether after fee
        balances[msg.sender] += msg.value - ((cut));
    }

    // Function to withdraw Ether with fee deduction
    function Withdraw(uint amount) public {
        uint sb = balances[msg.sender]; // Sender's balance
        require(amount <= sb, "Insufficient balance");

        // Directly calculate and transfer fee to owner and the remaining amount to user
        payable(owner).transfer((amount * FeePercent) / 100); // Transfer fee to the owner
        payable(msg.sender).transfer(amount - ((amount * FeePercent) / 100)); // Transfer remaining amount to user

        // Update sender's balance after withdrawal
        balances[msg.sender] -= amount;
    }

    // Function to get the contract's balance
    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }

    // Function to get the current fee percentage
    function getFeePercentage() public view returns (uint) {
        return FeePercent;
    }
}

