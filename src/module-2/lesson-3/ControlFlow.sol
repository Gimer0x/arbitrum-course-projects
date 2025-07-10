// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract ControlFlow {
    uint256 public initialValue;

    constructor() {}

    function getFactorial(uint256 val) public pure returns (uint256) {
        if (val > 1) {
            uint256 facto = 1;
            for (uint256 i = 2; i <= val; i++) {
                facto = facto * i;
            }

            return facto;
        } else {
            return 1;
        }
    }

    function loop(uint256 val) public pure returns (uint256) {
        uint256 sum;
        while (val > 0) {
            sum = sum + val;
            val--;
        }
        return sum;
    }

    function conditional(uint256 val) public {
        (val > 0) ? initialValue = val : initialValue = 0;
    }
}
