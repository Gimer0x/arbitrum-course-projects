// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Functions {
    address private sender;
    uint private balance;

    constructor() payable {
        sender = msg.sender;
        balance = msg.value;
    }

    // This function is originally external
    function getSender() public view returns (address) {
        return sender;
    }
    
    function getBalance() external view returns (uint) {
        if(msg.sender == getSender())
            return balance;
        
        return 0;
    }

    function increaseBalance() external payable returns (bool) {
        if( msg.value > 0) {
            balance += msg.value;
            return true;
        }
        
        return false;
    }
}