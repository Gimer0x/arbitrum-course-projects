pragma solidity 0.8.30;

import {Script} from "forge-std/Script.sol";
import {MyToken} from "../../../src/module-3/lesson-4/MyToken.sol";

contract MyScript is Script {
    MyToken myToken;

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address user_pk = vm.envAddress("USER_PK");

        vm.startBroadcast(deployerPrivateKey);

        myToken = new MyToken(user_pk, 1000, "MyToken", "MTK");

        vm.stopBroadcast();
    }
}

//forge script --chain sepolia script/MyScript.s.sol:MyScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
