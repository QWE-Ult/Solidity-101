// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract UserRegistration {
    
    // Define a struct to hold user information
    struct UserInfo {
        string name;
        string email;
    }
    
    // Define a mapping to store user information
    mapping(address => UserInfo) private userMapping;
    
    // Define events to emit when user information is registered, updated, or deleted
    event NewUserRegistered(address indexed userAddress, string name, string email);
    event UserInfoUpdated(address indexed userAddress, string name, string email);
    event UserDeleted(address indexed userAddress);

    // Define the contract owner
    address public owner;
    
    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Define a modifier to restrict certain functions to the owner of the contract
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }
    
    // Define a function to register user information
    function registerUser(string memory _name, string memory _email) public {
        userMapping[msg.sender] = UserInfo(_name, _email);
        emit NewUserRegistered(msg.sender, _name, _email);
    }
    
    // Define a function to retrieve user information
    function getUserInfo() public view returns(string memory name, string memory email) {
        return (userMapping[msg.sender].name, userMapping[msg.sender].email);
    }
    
    // Define a function to update user information
    function updateUserInfo(string memory _name, string memory _email) public {
        require(bytes(userMapping[msg.sender].name).length > 0, "User not registered");
        userMapping[msg.sender].name = _name;
        userMapping[msg.sender].email = _email;
        emit UserInfoUpdated(msg.sender, _name, _email);
    }
    
    // Define a function to delete user information
    function deleteUser() public {
        require(bytes(userMapping[msg.sender].name).length > 0, "User not registered");
        delete userMapping[msg.sender];
        emit UserDeleted(msg.sender);
    }
}
