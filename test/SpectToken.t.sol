// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeploySpectToken} from "../script/DeploySpectToken.s.sol";
import {SpectToken} from "../src/SpectToken.sol";

contract SpectTokenTest is Test{
    SpectToken spectToken;

    function setUp() external{
        
        vm.startBroadcast();
        DeploySpectToken deploy = new DeploySpectToken();
        spectToken = deploy.run();
        vm.stopBroadcast();

    }
}