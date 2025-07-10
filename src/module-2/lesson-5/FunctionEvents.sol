// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Events {
    address private sender;
    uint256 private balance;

    event LogInitialize(address _sender, uint256 _balance);
    event LogIncreaseBalance(address _sender, uint256 _amount);

    constructor() payable {
        sender = msg.sender;
        balance = msg.value;
        emit LogInitialize(msg.sender, balance);
    }

    // This function is originally external
    function getSender() public view returns (address) {
        return sender;
    }

    function getBalance() external view returns (uint256) {
        return balance;
    }

    function increaseBalance() external payable returns (bool) {
        balance += msg.value;

        emit LogIncreaseBalance(msg.sender, msg.value);

        return true;
    }
}
