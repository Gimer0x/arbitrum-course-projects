//SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Victim {
    bool value;
    mapping(address => uint) public userBalance;
    
    constructor() payable {}

    function victimBalance() public view returns (uint) { 
        return address(this).balance;
    }

    function receiveFunds() external payable {
        userBalance[msg.sender] += msg.value;
    }

    function withdraw() external {
        require(userBalance[msg.sender] > 0, "user has no funds!");        
        (value, ) = msg.sender.call{value: userBalance[msg.sender]}("");
        userBalance[msg.sender] = 0;
    }
}