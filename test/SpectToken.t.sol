// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeploySpectToken} from "../script/DeploySpectToken.s.sol";
import {SpectToken} from "../src/SpectToken.sol";

contract SpectTokenTest is Test{
    SpectToken public spectToken;
    DeploySpectToken public deploy;

    function setUp() external{
        
        deploy = new DeploySpectToken();
        spectToken = deploy.run();
        
    }

    function testNameOfToken() public{

        assertEq(spectToken.name(), "SpectToken");
    }

    function testSymbolOfToken() public{

        assertEq(spectToken.symbol(), "SPT");
    }

    function testDecimalsOfToken() public{

        assertEq(spectToken.decimals(), 18);
    }

    function testTotalSupplyOfToken() public{
        assertEq(spectToken.totalSupply(), 1000 ether);
    }

}