pragma solidity 0.8.30;

import {Test} from "forge-std/Test.sol";
import {MyToken} from "../../../src/module-3/lesson-4/MyToken.sol";

contract FuzzTest is Test {
    MyToken token;
    address initialOwner;
    address alice = vm.addr(0x1);
    address bob = vm.addr(0x2);
    uint256 initialSupply = 100 ether;
    uint256 constant ONE_ETHER = 1 ether;
    uint256 constant TEN_ETHER = 10 ether;
    string name = "Foundry Token";
    string symbol = "FTK";

    // Needed so the test contract itself can receive ether
    // when withdrawing
    receive() external payable {}

    function setUp() public {
        initialOwner = alice;
        token = new MyToken(initialOwner, initialSupply, name, symbol);
    }

    function test_Withdraw() public {
        payable(address(token)).transfer(ONE_ETHER);
        uint256 preBalance = address(this).balance;
        token.withdraw();
        uint256 postBalance = address(this).balance;
        assertEq(preBalance + ONE_ETHER, postBalance);
    }

    /*function testFuzz_Withdraw_1(uint256 amount) public {
        payable(address(token)).transfer(amount);
        uint256 preBalance = address(this).balance;
        token.withdraw();
        uint256 postBalance = address(this).balance;
        assertEq(preBalance + amount, postBalance);
    } */

    function testFuzz_Withdraw_2(uint96 amount) public {
        vm.assume(amount > 0.1 ether);
        payable(address(token)).transfer(amount);
        uint256 preBalance = address(this).balance;
        token.withdraw();
        uint256 postBalance = address(this).balance;
        assertEq(preBalance + amount, postBalance);
    }
}
