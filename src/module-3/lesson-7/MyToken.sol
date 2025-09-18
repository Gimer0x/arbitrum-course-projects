// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "openzeppelin-contracts/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    event LogTokenCreation(address _initialOwner, uint256 _initialSupply, string _name, string _symbol);

    event LogMint(address _sender, address _to, uint256 _amount);

    constructor(uint256 _initialSupply, string memory _name, string memory _symbol)
        ERC20(_name, _symbol)
        Ownable(msg.sender)
    {
        _mint(msg.sender, _initialSupply);
        emit LogTokenCreation(msg.sender, _initialSupply, _name, _symbol);
    }

    function mint(address _to, uint256 _amount) public virtual onlyOwner {
        _mint(_to, _amount);
        emit LogMint(msg.sender, _to, _amount);
    }

    function burn(uint256 _amount) public virtual {
        _burn(msg.sender, _amount);
    }
}
