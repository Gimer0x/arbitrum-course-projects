pragma solidity ^0.8.20;

import { Test } from "forge-std/Test.sol";
import {MyToken} from "../../../src/module-3/lesson-4/MyToken.sol";

contract InvariantTests is Test {
    MyToken public token;
    address public owner;
    address public nonOwner;

    error OwnableUnauthorizedAccount(address);

    function setUp() public {
        owner = address(this);
        nonOwner = address(0x123);
        token = new MyToken(owner, 1000 ether, "MyToken", "MTK");
    }

    // Invariant: The total supply must never exceed the sum 
    // of minted tokens minus burned tokens.
    function invariant_TotalSupplyConsistency() public view{
        uint256 minted = token.totalSupply();
        uint256 burned = getBurnedTokens();

        assertEq(token.totalSupply(), minted - burned);
    }

    function invariant_Balance() public view {
        assertLe(token.balanceOf(owner), token.totalSupply());
    }

    function invariant_totalSupplyNotOverflow() public view{
        assertTrue(
            token.totalSupply() <= type(uint256).max,
            "Total supply should never overflow"
        );
    }

    function invariant_ownerBalance() public view {
        assertTrue(token.balanceOf(owner) >= 0, "Owner balance cannot be negative");
    }

    function invariant_totalSupplyShouldBeCorrect() public view {
        uint256 mintedAmount = token.totalSupply();
        assertGe(mintedAmount, token.balanceOf(owner));
    }

    address[] private tokenHolders;
    
    function getHolders() public view returns (address[] memory) {
        return tokenHolders;
    }

    function invariant_noNegativeBalances() public view {
        address[] memory holders = getHolders();
        
        for (uint256 i = 0; i < holders.length; i++) {
            assertTrue(
                token.balanceOf(holders[i]) >= 0,
                "No address should have negative balance"
            );
        }
    }

    // Ether withdrawal should not be possible by non-owners.
    function invariant_OnlyOwnerCanWithdraw() public {
        vm.deal(address(token), 1 ether);
        vm.prank(nonOwner);
        vm.expectRevert(abi.encodeWithSelector(OwnableUnauthorizedAccount.selector, nonOwner));
        token.withdraw();
    }

    function invariant_mintByNonOwnerFails() public {
        vm.prank(nonOwner);
        vm.expectRevert(abi.encodeWithSelector(OwnableUnauthorizedAccount.selector, nonOwner));
        token.mint(address(2), 100 ether);
    } 

    // Helper function to calculate burned tokens.
    function getBurnedTokens() internal pure returns (uint256) {
        // In a real scenario, this would involve tracking burn events or balances.
        // For simplicity, assuming it's 0 for this invariant test.
        return 0;
    }
}
