// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import "forge-std/Test.sol";
import {SquareRoot} from "../../../src/module-3/lesson-4/SquareRoot.sol";

contract SquareRootTest is Test {
    SquareRoot squareRoot;

    function setUp() public {
        squareRoot = new SquareRoot();
    }

    function test_Differential() public view {
        for (uint256 i = 0; i < 5; i++) {
            uint256 babylonianResult = squareRoot.sqrtBabylonian(i);
            uint256 binarySearchResult = squareRoot.sqrtBinarySearch(i);

            // Check if both functions return the same output
            assertEq(
                babylonianResult, binarySearchResult, string(abi.encodePacked("Mismatch for input: ", uint2str(i)))
            );
        }
    }

    // Helper function to convert uint to string for error messages
    function uint2str(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) return "0";
        uint256 j = _i;
        uint256 length;
        while (j != 0) {
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint256 k = length;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - (_i / 10) * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }
}
