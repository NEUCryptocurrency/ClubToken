pragma solidity ^0.4.18;

contract ERC721Interface {
   // ERC20 compatible functions
   function totalSupplyERC721() constant returns (uint256 totalSupply);
   function balanceOfERC721(address _owner) constant returns (uint balance);
   function approveERC721(address _to, uint256 _tokenId);
   function transferERC721(address _to, uint256 _tokenId);
   function tokenOfOwnerByIndexERC721(address _owner, uint256 _index) constant returns (uint tokenId);
   // Token metadata
   function tokenMetadataERC721(uint256 _tokenId) constant returns (string infoUrl);
   // Events
   event TransferERC721(address indexed _from, address indexed _to, uint256 _tokenId);
   event ApprovalERC721(address indexed _owner, address indexed _approved, uint256 _tokenId);
}

// ----------------------------------------------------------------------------
// SafeMath Library
// ----------------------------------------------------------------------------
/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
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
// ERC721 Token, with the addition of symbol, name and decimals and an
// initial fixed supply
// ----------------------------------------------------------------------------
contract HuskyToken is ERC721Interface, Owned {
    //using SafeMath for uint;

    // Global Variables
    string public symbol;
    string public name;
    uint private totalSupply;

    // ERC721 Specific Global Variables
    mapping(address => uint) private blanaces;
    mapping(address => mapping (address => uint256)) private allowed;

    // Events
    event Transfer(address indexed _from, address indexed _to, uint256 amount);
    event Approval(address indexed _owner, address indexed _approved, uint256 amount);

    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    function HuskyToken() public {
        symbol = "HUSKY";
        name = "Northeastern Husky Token";
        totalSupply = 1000;
        balances[owner] = totalSupply;
        TransferERC721(address(0), owner, totalSupplyERC721);
    }


    // ------------------------------------------------------------------------
    // Total supply
    // ------------------------------------------------------------------------

    function totalSupply() constant returns (uint256 supply){
        return totalSupply;
      }


    // ---------------------------------------------------------------------
    // Get the token balance for account `tokenOwner`
    // ---------------------------------------------------------------------

    function balanceOf(address _owner) constant returns (uint balance)
      {
        return balances[_owner];
      }


  // ---------------------------------------------------------------------
  // Transfers tokens from one address to another
  // ---------------------------------------------------------------------

    function transfer(address _to, uint256 amount) onlyOwner {
    address currentOwner = msg.sender;
    address newOwner = _to;
    require(blanaces[currentOwner] >= amount);
    require(currentOwner != newOwner);
    require(newOwner != address(0));
    balances[current] -= amount;
    balances[newOwner] += amount;
    Transfer(oldOwner, newOwner, amount);
  }
}
