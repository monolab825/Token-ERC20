// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {SpectToken} from "../src/SpectToken.sol";

contract DeploySpectToken is Script{
    
    function run() external returns(SpectToken){

        vm.startBroadcast();
        SpectToken spectToken = new SpectToken(1000 ether, 18);
        vm.stopBroadcast();

        return spectToken;       
    }
}