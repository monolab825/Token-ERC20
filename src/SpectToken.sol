// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

contract SpectToken{

    uint256 private s_totalTokens;
    uint8 private s_decimals;

    constructor(uint256 totalTokens, uint8 totalDecimals){
        s_totalTokens=totalTokens;
        s_decimals = totalDecimals;
    }

    function name() public pure returns (string memory){
        return "SpectToken";
    }

    function symbol() public pure returns (string memory){
        return "SPT";
    }

    function decimals() public view returns (uint8){
        return s_decimals;
    }
    
    function totalSupply() public view returns (uint256){
        return s_totalTokens;
    }

    function balanceOf(address _owner) public view returns (uint256 balance){

    }

    function transfer(address _to, uint256 _value) public returns (bool success){

    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){

    }

    function approve(address _spender, uint256 _value) public returns (bool success){

    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining){

    }

}