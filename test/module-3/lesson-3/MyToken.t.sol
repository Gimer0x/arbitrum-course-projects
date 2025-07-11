// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import {MyToken} from "../../../src/module-3/lesson-3/MyToken.sol";

contract TokenTest is Test {
    MyToken token;
    address initialOwner;
    address alice = vm.addr(0x1);
    address bob = vm.addr(0x2);
    uint256 initialSupply = 100 ether;
    uint256 constant ONE_ETHER = 1 ether;
    string name = "Foundry Token";
    string symbol = "FTK";

    event LogMint(address _sender, address _to, uint256 _amount);

    function setUp() public {
        initialOwner = alice;
        token = new MyToken(initialOwner, initialSupply, name, symbol);
    }

    function test_InitialOwner() public view {
        assertEq(token.owner(), initialOwner);
    }

    function test_InitialSupply() public view {
        uint256 expectedSupply = 100 ether;
        assertEq(token.totalSupply(), expectedSupply, "Token Supply Incorrect!");
        assertEq(token.balanceOf(initialOwner), expectedSupply, "Unexpected balance!");
    }

    function test_NameAndSymbol() public view {
        assertEq(token.name(), name, "Token name incorrect!");
        assertEq(token.symbol(), symbol, "Token symbol incorrect!");
    }

    function test_LogMint() public {
        vm.startPrank(alice);
        vm.expectEmit();

        // We emit the event we expect to see.
        emit LogMint(alice, alice, ONE_ETHER);

        // We perform the call.
        token.mint(alice, ONE_ETHER);
        vm.stopPrank();
    }

    function test_Mint() public {
        vm.startPrank(alice);
        token.mint(alice, ONE_ETHER);

        assertEq(token.totalSupply() + ONE_ETHER, 102 ether, "New Token Supply Incorrect!");
        vm.stopPrank();
    }

    function test_transfer() public {
        vm.startPrank(alice);
        token.transfer(bob, 2 ether);
        assertEq(token.balanceOf(bob), 2 ether, "Token balance Incorrect!");
        vm.stopPrank();
    }

    /*function testFail_Burn() public {
        test_transfer();

        vm.startPrank(bob);
        token.burn(bob, 1 ether);
        assertEq(token.balanceOf(bob), 2 ether, "Token balance Incorrect!");
        vm.stopPrank();
    } */
    /*
     [<Gas Usage>] <Contract>::<Function>(<Parameters>)
        ├─ [<Gas Usage>] <Contract>::<Function>(<Parameters>)
        │     └─ ← <Return Value>
        └─ ← <Return Value>
    */
}
