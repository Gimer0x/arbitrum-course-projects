// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {BeaconProxy} from "@openzeppelin/contracts/proxy/beacon/BeaconProxy.sol";
import {BoxBeacon} from "./BoxBeacon.sol";
import {BoxV1} from "./BoxV1.sol";

contract Factory {

    mapping(uint256 => address) private boxes;

    BoxBeacon immutable beacon;

    constructor(address _logic) {
        beacon = new BoxBeacon(_logic);
    }

    function create(string calldata _name, uint256 _vaLue, uint256 x) external returns (address) {
        BeaconProxy proxy = new BeaconProxy(
            address(beacon), 
            abi.encodeWithSelector(BoxV1(address(0)).initialize.selector, 
            _name, 
            _vaLue)
        );
        boxes[x] = address(proxy);
        return address(proxy);
    }

    function getImplementation() public view returns (address) {
        return beacon.implementation();
    }

     function getBeacon() public view returns (address) {
        return address(beacon);
    }

     function getBox(uint256 x) public view returns (address) {
        return boxes[x];
    }
}