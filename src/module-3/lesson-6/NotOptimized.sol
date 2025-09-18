// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {Ownable} from "openzeppelin-contracts/contracts/access/Ownable.sol";

contract NotOptimized is Ownable {
    uint256 public immutable MIN_PRICE;
    uint256 public price;
    uint256 public sum;

    event LogNewPrice(uint256 _price);

    constructor(uint256 _price) payable Ownable(msg.sender) {
        MIN_PRICE = _price;
    }

    function newPrice(uint256 _newPrice) external {
        require(_newPrice >= MIN_PRICE, "Price was not updated correctly");
        price = _newPrice;
        emit LogNewPrice(price);
    }

    function sumValues(uint256[] memory values) external {
        uint256 val;
        for (uint256 i = 0; i < values.length; i++) {
            val += values[i];
        }
        sum = val;
    }

    function returnProduct(uint256 a, uint256 b) external pure returns (uint256) {
        return a * b;
    }
}
