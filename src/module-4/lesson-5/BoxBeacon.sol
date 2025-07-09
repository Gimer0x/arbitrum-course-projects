// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {UpgradeableBeacon} from "@openzeppelin/contracts/proxy/beacon/UpgradeableBeacon.sol";

contract BoxBeacon {
    UpgradeableBeacon immutable beacon;

    address public logic;

    constructor(address _logic) {
        beacon = new UpgradeableBeacon(_logic, address(this));
        logic = _logic;
    }

    function update(address _logic) public {
        beacon.upgradeTo(_logic);
        logic = _logic;
    }

    function implementation() public view returns (address) {
        return beacon.implementation();
    }
}
