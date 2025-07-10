// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract FirstContract {
    uint256 private value;

    constructor() {}

    function setValue(uint256 _value) external {
        value = _value;
    }

    function getValue() external view returns (uint256) {
        return value;
    }
}
