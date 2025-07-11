// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {UpgradeableBeacon} from "@openzeppelin/contracts/proxy/beacon/UpgradeableBeacon.sol";

contract BoxBeacon {
    UpgradeableBeacon immutable beacon;

    address public logic;

    constructor(address _logic) {
        beacon = UpgradeableBeacon(_logic);
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
