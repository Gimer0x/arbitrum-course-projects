// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract SquareRoot {
    // Function A: Babylonian Method
    function sqrtBabylonian(uint256 x) public pure returns (uint256) {
        if (x == 0) return 0;
        uint256 z = (x + 1) / 2;
        uint256 y = x;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
        return y;
    }

    // Function B: Binary Search Method
    function sqrtBinarySearch(uint256 x) public pure returns (uint256) {
        if (x == 0) return 0;
        uint256 left = 1;
        uint256 right = x;
        uint256 result;
        while (left <= right) {
            uint256 mid = left + (right - left) / 2;
            if (mid * mid <= x) {
                result = mid;
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return result;
    }
}
