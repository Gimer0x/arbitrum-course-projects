// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract FunctionErrors {
    address private sender;
    uint256 private balance;

    error ErrorZeroAddress();
    error ErrorOnlyOwner(address);
    error ErrorValueNotAllowed();

    modifier onlySender() {
        require(msg.sender == getSender(), ErrorOnlyOwner(msg.sender));
        _;
    }

    modifier greaterThanZero(uint256 _val) {
        if (_val == 0) revert ErrorValueNotAllowed();
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

    function getBalance() external view onlySender returns (uint256) {
        return balance;
    }

    function increaseBalance() external payable greaterThanZero(msg.value) onlySender returns (bool) {
        balance += msg.value;
        return true;
    }
}
