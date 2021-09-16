// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

contract Donate {
  uint totalDonations;
  address payable owner;

  constructor() {
    owner = payable(msg.sender);
  }

  function getTotalDonations() view public returns(uint) {
    return totalDonations;
  }

  function donate() public payable {
    (bool success,) = owner.call{value: msg.value}("");
    require(success, "Failed to send money");
  }

}
