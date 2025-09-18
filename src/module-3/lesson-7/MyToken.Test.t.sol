// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {Test} from "forge-std/Test.sol";
import {MyToken} from "./MyToken.sol";

contract MyTokenTest is Test {
    MyToken token;
    address owner = address(0xABCD);
    address user = makeAddr("user");

    string constant NAME = "My Token";
    string constant SYMBOL = "MTK";
    uint256 constant INITIAL_SUPPLY = 1_000 ether;

    event LogTokenCreation(address _initialOwner, uint256 _initialSupply, string _name, string _symbol);
    event LogMint(address _sender, address _to, uint256 _amount);

    function setUp() public {
        vm.prank(owner);
        token = new MyToken(INITIAL_SUPPLY, NAME, SYMBOL);
        vm.stopPrank();
    }

    function testInitialSetup() public view {
        assertEq(token.name(), NAME);
        assertEq(token.symbol(), SYMBOL);
        assertEq(token.totalSupply(), INITIAL_SUPPLY);
        assertEq(token.balanceOf(owner), INITIAL_SUPPLY);
        assertEq(token.owner(), owner);
    }

    function testConstructorEmitsEvent() public {
        vm.expectEmit(true, true, false, true);
        emit LogTokenCreation(owner, INITIAL_SUPPLY, NAME, SYMBOL);

        vm.prank(owner);
        new MyToken(INITIAL_SUPPLY, NAME, SYMBOL);
        vm.stopPrank();
    }

    function testMintAsOwnerEmitsEvent() public {
        uint256 amount = 100 ether;

        vm.expectEmit();
        emit LogMint(owner, user, amount);

        vm.prank(owner);
        token.mint(user, amount);

        assertEq(token.balanceOf(user), amount);
        assertEq(token.totalSupply(), INITIAL_SUPPLY + 10);
        vm.stopPrank();
    }

    function testMintRevertsIfNotOwner() public {
        uint256 amount = 50 ether;

        vm.prank(user);
        vm.expectRevert();
        token.mint(user, amount);
        vm.stopPrank();
    }

    function testMintZeroAmount() public {
        vm.prank(owner);
        token.mint(user, 0);
        assertEq(token.balanceOf(user), 0);
        assertEq(token.totalSupply(), INITIAL_SUPPLY);
    }

    function testMintToZeroAddress() public {
        vm.prank(owner);
        vm.expectRevert();
        token.mint(address(0), 100);

        assertEq(token.balanceOf(address(0)), 0);
        assertEq(token.totalSupply(), INITIAL_SUPPLY);
        vm.stopPrank();
    }

    function testBurn() public {
        uint256 burnAmount = 200 ether;

        vm.prank(owner);
        token.burn(burnAmount);

        assertEq(token.balanceOf(owner), INITIAL_SUPPLY - burnAmount);
        assertEq(token.totalSupply(), INITIAL_SUPPLY - burnAmount);
        vm.stopPrank();
    }

    function testBurnZeroAmount() public {
        vm.prank(owner);
        token.burn(0);

        assertEq(token.balanceOf(owner), INITIAL_SUPPLY);
        assertEq(token.totalSupply(), INITIAL_SUPPLY);
    }

    function testBurnMoreThanBalanceReverts() public {
        uint256 tooMuch = INITIAL_SUPPLY + 1 ether;

        vm.prank(owner);
        vm.expectRevert(); // OpenZeppelin ERC20 will revert on _burn > balance
        token.burn(tooMuch);
        vm.stopPrank();
    }
}
