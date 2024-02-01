// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

contract SpectToken{

    // ERRORS
    error notEnoughBalance(uint256 senderBalance);
    error notEnoughAllowance(uint256 allowanceBalance);

    // EVENTS
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed value
    );
    event Approval(
        address indexed owner,
        address indexed hasAllowance,
        uint256 indexed allowance
    );

    // STATE VARIABLES
    uint256 private s_totalTokens;
    uint8 private s_decimals;

    // MAPPINGS
    mapping(address => uint256) private s_balance;
    mapping(address => mapping(address => uint256)) private s_allowances; // address(tokens owner) => address(jiske pass un tokens ka access hai as allowance)

    // CONSTRUCTOR
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

    function balanceOf(address owner) public view returns (uint256 balance){
        return s_balance[owner];
    }

    function transfer(address to, uint256 value) public returns (bool success){

        if(balanceOf(msg.sender) < value){
            revert notEnoughBalance(
                balanceOf(msg.sender)
            );
        }
        
        uint256 senderBalance = balanceOf(msg.sender);
        uint256 recieverBalance = balanceOf(to);
        
        s_balance[msg.sender] -= value;
        s_balance[to] += value;

        if(senderBalance == (balanceOf(msg.sender) - value) && recieverBalance == (balanceOf(to) + value)){
            return true;
        }
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool success){
        if(s_allowances[from][msg.sender] < value){
            revert notEnoughAllowance(s_allowances[from][msg.sender]);
        }

        if(balanceOf(from) < value){
            revert notEnoughBalance(
                balanceOf(from)
            );
        }

        s_allowances[from][msg.sender] -= value;
        s_balance[from] -= value;
        s_balance[to] += value;

        emit Transfer(from, to, value);
        return true;

    }

    function approve(address spender, uint256 value) public returns (bool success){
        s_allowances[msg.sender][spender] = 0;
        s_allowances[msg.sender][spender] = value;

        emit Approval(msg.sender, spender, value);
        return true;
    }

    function allowance(address owner, address spender) public view returns (uint256){
        return s_allowances[spender][owner];
    }

}