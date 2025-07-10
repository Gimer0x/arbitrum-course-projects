// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract FunctionScope {
    uint256 private value;

    function funcExternal(uint256 _val) external pure returns (uint256) {
        return _val + 1;
    }

    function funcPublic() public view returns (uint256) {
        return value;
    }

    function funcPrivate(uint256 _newVal) private {
        value = _newVal;
    }

    function funcSetValue(uint256 _val) internal {
        funcPrivate(_val);
    }
}

contract A is FunctionScope {
    function SetNewValue(uint256 _val) external {
        funcSetValue(_val);
    }
}
