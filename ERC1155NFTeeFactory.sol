// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./ERC1155NFTee.sol";

contract ERC1155NFTeeFactory {
    function createERC1155Collection(address _collectionOwner) public returns (address) {
        ERC1155NFTee newCollection = new ERC1155NFTee();
        newCollection.transferOwnership(_collectionOwner);
        return address(newCollection);
    }
}