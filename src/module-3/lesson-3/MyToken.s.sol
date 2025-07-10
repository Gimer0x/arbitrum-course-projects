pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MyToken} from "./MyToken.sol";

contract MyScript is Script {
    MyToken myToken;

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        myToken = new MyToken(msg.sender,1000,"MyToken","MTK");

        vm.stopBroadcast();
    }
}

//forge script --chain sepolia script/MyToken.s.sol:MyScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv