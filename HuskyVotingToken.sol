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
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);

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

    modifier onlyOwner {
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
contract VotingToken is ERC20Interface, Owned {
    using SafeMath for uint;

    string public symbol;
    string public  name;
    uint8 public decimals;
    uint public _totalSupply;

    mapping(address => uint) balances;


    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    function FixedSupplyToken() public {
        symbol = "HUSKY";
        name = "Northeastern Crypto Voting Token";
        decimals = 0;
        _totalSupply = 0;
    }


    // ------------------------------------------------------------------------
    // Total supply
    // ------------------------------------------------------------------------
    function totalSupply() public constant returns (uint) {
        return _totalSupply;
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
    function transfer(address to, uint tokens) public returns (bool success) ownlyOwner {
        balances[to] = balances[to].add(1);
        Transfer(to);
        return true;
    }


    // ------------------------------------------------------------------------
    // Don't accept ETH
    // ------------------------------------------------------------------------
    function () public payable {
        revert();
    }
}


contract Voting is VotingToken {

  string name;
  bytes32[] public votingChoices;
  mapping (address => bool) public voted;
  mapping (bytes32 => uint) public votesReceived;
  uint public timeEnding;

  function Voting(string _name, bytes32[] _votingChoices, uint _durationHours) public onlyOwner {
    name = _name;
    votingChoices = _votingChoices;
    timeEnding = now + (_durationHours * 1 hours);
  }

  function newChoice(bytes32 choice) onlyOwner {
    votingChoices.push(choice);
  }

  function totalVotesFor(bytes32 choice) view public returns (uint) {
    return votesReceived[choice];
  }


  // Do we want to allow someone to vote on your behalf
  // if you don't want to pay the gas?
  function voteForChoice(bytes32 choice) public {
    uint index = indexOfCandidate(choice);
    require(index != uint(-1));
    require(voted[msg.sender] != true);
    voted[msg.sender] = true;
    votesRecieved[choice] += balanceOf(msg.sender);
    }

  function indexOfCandidate(bytes32 candidate) view public returns (uint) {
    for(uint i = 0; i < candidateList.length; i++) {
      if (candidateList[i] == candidate) {
        return i;
      }
    }
    return uint(-1);
  }

  function allCandidates() view public returns (bytes32[]) {
    return votingChoices;
  }
}
