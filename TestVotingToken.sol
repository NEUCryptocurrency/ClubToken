pragma solidity ^0.4.18;

import "./VotingToken.sol";

contract TestVotingToken is VotingToken {

  function testTotalSupply() public {
    totalSupply = 0;
    assert(VotingToken.totalSupply() == 0);
    totalSupply = 5;
    assert(VotingToken.totalSupply() == 5);
  }

  function testTransfer() public {
    uint initialTotalSupply = VotingToken.totalSupply();
    uint initialBalance = VotingToken.balanceOf(0x3f5Af07E277BBAf4BFA448e29CE944968d52B8ce);
    VotingToken.transfer(0x3f5Af07E277BBAf4BFA448e29CE944968d52B8ce);
    assert(VotingToken.balanceOf(0x3f5Af07E277BBAf4BFA448e29CE944968d52B8ce) == initialBalance + 1);
    assert(VotingToken.totalSupply() == initialTotalSupply + 1);
  }

  function testClear() public {
    totalSupply = 0;
    balances[0x3f5Af07E277BBAf4BFA448e29CE944968d52B8ce] = 0;
    VotingToken.transfer(0x3f5Af07E277BBAf4BFA448e29CE944968d52B8ce);
    assert(VotingToken.totalSupply() == 1);
    assert(VotingToken.balanceOf(0x3f5Af07E277BBAf4BFA448e29CE944968d52B8ce) == 1);
    balances[0x3f5Af07E277BBAf4BFA448e29CE944968d52B8ce] = 0;
    VotingToken.transfer(0xca35b7d915458ef540ade6068dfe2f44e8fa733c);
    assert(VotingToken.totalSupply() == 2);
    assert(VotingToken.balanceOf(0xca35b7d915458ef540ade6068dfe2f44e8fa733c) == 1);
    clear();
    assert(VotingToken.totalSupply() == 0);
    assert(VotingToken.balanceOf(0x3f5Af07E277BBAf4BFA448e29CE944968d52B8ce) == 0);
    assert(VotingToken.balanceOf(0xca35b7d915458ef540ade6068dfe2f44e8fa733c) == 0);
  }
}
