// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShipmentService {
    address public owner;
    address public customers;
    uint public tCompletedDeliveries;
    mapping(uint=>address) custom;
      mapping(address => string) public customerStatus;
    constructor(){
     owner= msg.sender;
    }

    //This function inititates the shipment
    function shipWithPin(address customerAddress, uint pin) public  {
        require(msg.sender==owner,'you are not the owner');
        custom[pin]=customerAddress;



    }

    //This function acknowlegdes the acceptance of the delivery
    function acceptOrder(uint pin) public   {
        address customerAddress=custom[pin] ;
        require( msg.sender == customerAddress,"you are not the ordered customer");
         customerStatus[customerAddress] = "Accepted";

    }

    //This function outputs the status of the delivery
    function checkStatus(address customerAddress) public view  returns (string memory){
         require( msg.sender == customerAddress,"you are not the ordered customer");
       string memory status = customerStatus[customerAddress];
        if (bytes(status).length == 0) {
            return "No shipment initiated for this address";
        }

        return status;  // Return the current status of the shipment

        }
    function completeDelivery() public {
    require(msg.sender == owner, "Only the owner can complete the delivery");
    tCompletedDeliveries += 1;
}

    //This function outputs the total number of successful deliveries
    function totalCompletedDeliveries() public view returns (uint) {
         return tCompletedDeliveries;
    }
}