// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokengatedCommunity is Ownable {
    IERC20 public fanToken;
    uint256 public entryTokenAmount;

    mapping(address => bool) public members;

    bool public isConcertLive;

    event MemberJoined(address indexed member);

    constructor(address _fanToken, uint256 _entryTokenAmount) {
        fanToken = IERC20(_fanToken);
        entryTokenAmount = _entryTokenAmount;
    }

    function joinCommunity() external {
        require(!members[msg.sender], "Already a member");
        require(fanToken.balanceOf(msg.sender) >= entryTokenAmount, "Insufficient token balance");

        members[msg.sender] = true;
        emit MemberJoined(msg.sender);
    }

    function setConcertStatus(bool _isConcertLive) external onlyOwner {
    isConcertLive = _isConcertLive;
    }


    function setEntryTokenAmount(uint256 _newEntryTokenAmount) external onlyOwner {
        entryTokenAmount = _newEntryTokenAmount;
    }

    function isMember(address _user) external view returns (bool) {
        return members[_user];
    }
}