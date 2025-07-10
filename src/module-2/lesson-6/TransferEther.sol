// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract TransferEther {
    error TransactionFailed();

    constructor() payable {}

    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function transferSend(address payable _to, uint256 _amount) external returns (bool) {
        bool result = _to.send(_amount);
        require(result, TransactionFailed());

        return result;
    }

    function transferTransfer(address payable _to, uint256 _amount) external returns (bool) {
        _to.transfer(_amount);

        return true;
    }

    function transferCall(address payable _to, uint256 _amount) external returns (bool, bytes memory) {
        (bool result, bytes memory data) = _to.call{value: _amount, gas: 100000}("");
        require(result, TransactionFailed());

        return (result, data);
    }
}
