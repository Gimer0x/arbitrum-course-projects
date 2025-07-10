// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {Initializable} from "@openzeppelin-contracts/contracts/proxy/utils/Initializable.sol";

contract BoxV1 is Initializable {
    string public name;
    uint256 public value;

    function initialize(string memory _name, uint256 _value) public initializer {
        name = _name;
        value = _value;
    }

    function down() public {
        value--;
    }
}
