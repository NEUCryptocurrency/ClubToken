pragma solidity ^0.4.18;

import "./Voting.sol";

contract TestVoting is Voting {

  function testAddChoice() public {
    address voter = 0x3f5Af07E277BBAf4BFA448e29CE944968d52B8ce;
    addChoice();
  }
}
