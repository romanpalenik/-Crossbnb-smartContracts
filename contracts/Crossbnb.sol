// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Crossbnb {
  address public owner = msg.sender;
  uint public last_completed_migration;

  function sendMessage() public view returns(string memory) {
    return "toto sa ti vratilo z contract";
  }
}
