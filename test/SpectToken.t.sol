// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeploySpectToken} from "../script/DeploySpectToken.s.sol";
import {SpectToken} from "../src/SpectToken.sol";

contract SpectTokenTest is Test{
    SpectToken public spectToken;
    DeploySpectToken public deploy;

    address public Eph = makeAddr("eph");
    address public Soph = makeAddr("soph");

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

    function testBalanceOfOwner() public{

        // address owner = vm.addr(deploy.deployerKey());

        // uint256 balance = spectToken.balanceOf(owner);
        
        // for debugging purpose -
        // console.log("test");
        // console.log(address(spectToken));
        // console.log(address(deploy));
        // console.log(address(this));
        // console.log(msg.sender);
        // console.log(spectToken.balanceOf(address(deploy)));
        // console.log("/test");
        uint256 balance = spectToken.balanceOf(msg.sender);
        assertEq(balance, 1000 ether);

    }

    function testRevertWhenBalanceIsLessThanTransferAmount() public{

        uint256 balanceOfEph = 0;
        vm.prank(Eph);
        vm.expectRevert(abi.encodeWithSelector(
            SpectToken.notEnoughBalance.selector,
            balanceOfEph
        ));
        spectToken.transfer(Soph, 100 ether);
    }
}