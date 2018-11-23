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
// Voting Token Interface
// ----------------------------------------------------------------------------
contract VotingTokenInterface {
    function totalSupply() public view returns (uint);
    function balanceOf(address tokenOwner) public view returns (uint balance);
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
// Voting contract
// ----------------------------------------------------------------------------
contract Voting is Owned {

  // Struct representing a voting choice
  struct Choice {
        uint id;
        string description;
        uint voteCount;
    }

  // Name or title of the vote being held
  string public name;
  // Mapping containing all the voting choices
  mapping (uint => Choice) public votingChoices;
  // Stores the number of choices
  uint public choicesCount;
  // Keeps track to see if a given address has already voted
  mapping (address => bool) public voted;
  // The time left to vote in seconds
  uint public timeEnding;
  // Contract for the VotingToken
  VotingTokenInterface huskyVotingContract;

  //// Constructor without voting choices ////
  function Voting(string _name, uint _durationHours, address tokenContract) public {
    name = _name;
    choicesCount = 0;
    timeEnding = now + (_durationHours * 1 hours);
    huskyVotingContract = VotingTokenInterface(tokenContract);
  }

  //// Allows owner to add a voting choice ////
  function addChoice(string _description) public onlyOwner() returns (bool success) {
    votingChoices[choicesCount] = Choice(choicesCount, _description, 0);
    choicesCount ++;
  }

  //// Gets total votes of a given choice ////
  function totalVotesFor(uint index) view public returns (uint votes) {
    return votingChoices[index].voteCount;
  }

  //// Votes for a given choice ////
  function voteForChoice(uint index) public returns (bool success) {
    require(index >= 0 && index < choicesCount);
    require(now < timeEnding);
    if (!(voted[msg.sender])) {
      votingChoices[index].voteCount += huskyVotingContract.balanceOf(msg.sender); // Query's the balances of the Voting token
      }
      voted[msg.sender] = true;
  }
}
