pragma solidity ^0.4.18;

// ----------------------------------------------------------------------------
// Husky Voting Token
//
// Symbol       : HUSKY
// Name         : Northeastern Crypto Voting Token
// Total supply : Variable
// Decimals     : 0
//
// ----------------------------------------------------------------------------


// ----------------------------------------------------------------------------
// Safe math
// ----------------------------------------------------------------------------
library SafeMath {
    function add(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    function sub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
    function mul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function div(uint a, uint b) internal pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}


// ----------------------------------------------------------------------------
// Voting Token Interface
// ----------------------------------------------------------------------------
contract VotingTokenInterface {
    function totalSupply() public constant returns (uint);
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    function transfer(address to) public returns (bool success);

    event Transfer(address indexed to);
    event Clear();
}

// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------
contract Owned {
    address public owner;
    address public newOwner;

    event OwnershipTransferred(address indexed _from, address indexed _to);

    function Owned() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
}


// ----------------------------------------------------------------------------
// ERC20 Token, with the addition of symbol, name and decimals and an
// initial fixed supply
// ----------------------------------------------------------------------------
contract VotingToken is VotingTokenInterface, Owned {
    using SafeMath for uint;

    string public symbol;
    string public  name;
    uint8 public decimals;
    uint public totalSupply;
    address[] public addresses;

    mapping(address => uint) balances;


    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    function VotingToken() public {
        symbol = "HUSKY";
        name = "Northeastern Crypto Voting Token";
        decimals = 0;
        totalSupply = 0;
    }


    // ------------------------------------------------------------------------
    // Total supply
    // ------------------------------------------------------------------------
    function totalSupply() public constant returns (uint) {
        return totalSupply;
    }


    // ------------------------------------------------------------------------
    // Get the token balance for account `tokenOwner`
    // ------------------------------------------------------------------------
    function balanceOf(address tokenOwner) public constant returns (uint balance) {
        return balances[tokenOwner];
    }


    // ------------------------------------------------------------------------
    // Transfers a single token from token to `to` account
    // ------------------------------------------------------------------------
    function transfer(address to) public onlyOwner returns (bool success) {
        if (balances[to] == 0) {
          addresses.push(to);
        }
        balances[to] = balances[to].add(1);
        totalSupply = totalSupply.add(1);
        Transfer(to);
        return true;
    }


    // ------------------------------------------------------------------------
    // Clears all the balances to represent the start of a new semester
    // ------------------------------------------------------------------------
    function clear() public onlyOwner returns (bool success) {
      for (uint i = addresses.length ; i > 0; i--) {
        balances[addresses[i-1]] = 0;
        delete addresses[i-1];
      }
      totalSupply = 0;
      Clear();
      return true;
    }


    // ------------------------------------------------------------------------
    // Don't accept ETH
    // ------------------------------------------------------------------------
    function () public payable {
        revert();
    }
}
