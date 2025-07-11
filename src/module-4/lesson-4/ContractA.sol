// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;
//@openzeppelin-contracts-upgradeable
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract ContractA is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 public value;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(address initialOwner, uint256 _setValue) public initializer {
        __Ownable_init(initialOwner);
        __UUPSUpgradeable_init();

        value = _setValue;
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}