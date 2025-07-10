// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract SimpleStorage{
    uint256 number;
    address public owner;

    event LogStorage(address _sender, uint256 _newValue);

    error notOwner();

    modifier onlyOwner() {
        require(msg.sender != owner, notOwner());
        _;
    }

    constructor(uint256 _initialValue) {
        number = _initialValue;
        owner = msg.sender;
    }

    function store(uint256 _num) external onlyOwner {
        number = _num;
        emit LogStorage(msg.sender, number);
    }

    function retrieve() external view returns (uint256) {
        return number;
    }
    
}