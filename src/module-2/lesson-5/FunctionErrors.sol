// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract FunctionErrors {
    address private sender;
    uint private balance;

    error ErrorZeroAddress();
    error ErrorOnlyOwner(address);
    error ErrorValueNotAllowed();


    modifier onlySender() {
        require(msg.sender == getSender(), ErrorOnlyOwner(msg.sender));
        _;
    }

    modifier greaterThanZero(uint _val) {
        if (_val == 0 ) revert ErrorValueNotAllowed();
        _;
    }

    modifier validAddress(address _addr) {
        require(_addr != address(0), "should be different from zero address!");
        _;
    }

    constructor() payable {
        sender = msg.sender;
        balance = msg.value;
    }

    // This function is originally external
    function getSender() public view returns (address) {
        return sender;
    }
    
    function getBalance() onlySender external view returns (uint) {
        return balance;
    }

    function increaseBalance() 
        greaterThanZero(msg.value) 
        onlySender() 
        external 
        payable 
        returns (bool) 
    {
        balance += msg.value;
        return true;
    }
}
