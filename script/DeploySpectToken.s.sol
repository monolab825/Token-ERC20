// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {SpectToken} from "../src/SpectToken.sol";
import {console} from "forge-std/console.sol";

contract DeploySpectToken is Script{
    
    function run() external returns(SpectToken){

        vm.startBroadcast();

        // for debugginf purpose -
        // console.log("script");
        // console.log(msg.sender);
        // console.log(address(this));
        // console.log("/script");
        SpectToken spectToken = new SpectToken(1000 ether, 18);
        vm.stopBroadcast();

        return spectToken;       
    }
}