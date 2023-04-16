// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";

import "./ERC1155NFTee.sol";

contract ERC1155NFTeeFactory is ERC1155Holder, Ownable {
    ERC1155NFTee[] public nfteeCollections;

    function createCollection(string memory _uri) public returns (address) {
        ERC1155NFTee newCollection = new ERC1155NFTee(_uri);
        nfteeCollections.push(newCollection);
        return address(newCollection);
    }

    function mintToken(uint256 _collectionIndex, address _account, uint256 _id, uint256 _amount, bytes memory _data) public {
        ERC1155NFTee collection = ERC1155NFTee(address(nfteeCollections[_collectionIndex]));
        collection.mint(_account, _id, _amount, _data);
    }
}