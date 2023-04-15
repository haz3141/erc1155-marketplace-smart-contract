// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./ERC1155NFTee.sol";

contract ERC1155NFTeeFactory {
    function createERC1155Collection() public returns (address) {
        ERC1155NFTee newCollection = new ERC1155NFTee();
        newCollection.transferOwnership(msg.sender);
        return address(newCollection);
    }
}