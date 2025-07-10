// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract FirstContract {

    uint private value;

    constructor () {}

    function setValue (uint _value) external {
        value = _value;
    }

    function getValue() external view returns (uint) {
        return value;
    }
}