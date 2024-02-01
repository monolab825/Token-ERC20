// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

contract SpectToken{

    error notEnoughBalance(uint256 senderBalance);

    uint256 private s_totalTokens;
    uint8 private s_decimals;

    mapping(address => uint256) private s_balance;

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
        return s_balance[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success){

        if(balanceOf(msg.sender) < _value){
            revert notEnoughBalance(
                balanceOf(msg.sender)
            );
        }
        
        uint256 senderBalance = balanceOf(msg.sender);
        uint256 recieverBalance = balanceOf(_to);
        
        s_balance[msg.sender] -= _value;
        s_balance[_to] += _value;

        if(senderBalance == (balanceOf(msg.sender) - _value) && recieverBalance == (balanceOf(_to) + _value)){
            return true;
        }
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){

    }

    function approve(address _spender, uint256 _value) public returns (bool success){

    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining){

    }

}