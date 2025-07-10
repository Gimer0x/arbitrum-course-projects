// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

interface ITarget {
    function getReceiverOrigin() external view returns (address);
    function getReceiverSender() external view returns (address);
}

contract GlobalVariables {
    address public owner;
    uint256 public initialAmount;
    uint256 public timestamp;
    uint256 public currentBlock;
    uint256 public chainId;
    uint256 public contractBalance;

    constructor() payable {
        owner = msg.sender;
        initialAmount = msg.value;
        timestamp = block.timestamp;
        currentBlock = block.number;
        chainId = block.chainid;
        contractBalance = address(this).balance;
    }

    function callReceiverOrigin(address _contract) external view returns (address) {
        return ITarget(_contract).getReceiverOrigin();
    }

    function callReceiverSender(address _contract) external view returns (address) {
        return ITarget(_contract).getReceiverSender();
    }
}

contract Target {
    address public owner;

    constructor() payable {
        owner = msg.sender;
    }

    function getReceiverOrigin() external view returns (address) {
        if (tx.origin != owner) {
            return address(0);
        }

        return tx.origin;
    }

    function getReceiverSender() external view returns (address) {
        return msg.sender;
    }
}
