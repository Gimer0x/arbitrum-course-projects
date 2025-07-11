// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";
import "../../../src/module-4/lesson-4/ContractA.sol";
import "../../../src/module-4/lesson-4/ContractB.sol";

contract UpgradesTest is Test {
    function setUp() public {}

    function test_upgrade() public {
        vm.startBroadcast();
        // Deploy a transparent proxy with ContractA as the implementation and initialize it with 10
        address uupsProxy = Upgrades.deployUUPSProxy(
            "ContractA.sol",
            abi.encodeCall(ContractA.initialize, (msg.sender, 10))
        );
        
        // Get the instance of the contract
        ContractA instance = ContractA(uupsProxy);

        assertEq(instance.value(), 10);

        // Get the implementation address of the proxy
        address implAddrV1 = Upgrades.getImplementationAddress(uupsProxy);

        assertFalse(implAddrV1 == address(0));

        // Log the initial value
        console.log("----------------------------------");
        console.log("Value before upgrade --> ", instance.value());
        console.log("----------------------------------");
        
        // Upgrade the proxy to ContractB
        Upgrades.upgradeProxy(
            uupsProxy,
            "ContractB.sol", 
            abi.encodeCall(ContractB.increaseValue, ())
        );

        // Get the new implementation address after upgrade
        address implAddrV2 = Upgrades.getImplementationAddress(uupsProxy);

        // Verify implementation address has changed
        assertFalse(implAddrV1 == implAddrV2);

        // Invoke the increaseValue function separately
        ContractB(address(instance)).increaseValue();

        // Log and verify the updated value
        console.log("----------------------------------");
        console.log("Value after upgrade --> ", instance.value());
        console.log("----------------------------------");
        assertEq(instance.value(), 30);
        vm.stopBroadcast();
    }
}