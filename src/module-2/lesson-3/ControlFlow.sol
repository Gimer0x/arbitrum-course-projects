// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract ControlFlow {
    uint public initialValue;
    constructor() {}

    function getFactorial(uint val) public pure returns (uint) {
        if(val > 1){
            uint facto = 1;
            for (uint i = 2; i <= val; i++)
                facto = facto * i;
            
            return facto;
        } else
            return 1;
    }

    function loop(uint val) public pure returns (uint) {
        uint sum;
        while(val > 0){
            sum = sum + val;
            val--;
        }
        return sum;
    }

    function conditional(uint val) public {
        (val > 0) ? initialValue = val : initialValue = 0;
    }
}