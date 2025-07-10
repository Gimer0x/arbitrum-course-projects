// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "openzeppelin-contracts/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    event LogTokenCreation(
        address _sender, address _initialOwner, uint256 _initialSupply, string _name, string _symbol
    );

    event LogMint(address _sender, address _to, uint256 _amount);

    constructor(address _initialOwner, uint256 _initialSupply, string memory _name, string memory _symbol)
        ERC20(_name, _symbol)
        Ownable(_initialOwner)
    {
        _mint(_initialOwner, _initialSupply);
        emit LogTokenCreation(msg.sender, _initialOwner, _initialSupply, _name, _symbol);
    }

    function mint(address _to, uint256 _amount) public virtual onlyOwner {
        _mint(_to, _amount);
        emit LogMint(msg.sender, _to, _amount);
    }

    function burn(address _from, uint256 _amount) public virtual {
        _burn(_from, _amount);
    }
    // Modify the code to receive ether.

    receive() external payable {}

    // Adding a function to recover the ether in this contract.
    function withdraw() external onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }
}
