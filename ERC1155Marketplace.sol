// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./ERC1155NFTee.sol";

contract ERC1155Marketplace is ERC1155Holder, Ownable {
    ERC1155NFTee t;

    uint256 listingPrice = 0.047 ether;

    mapping(uint256 => MarketListing) private idToMarketListing;

    constructor () {
        t = new ERC1155NFTee();
    }

    struct MarketListing {
        uint256 tokenId;
        address payable seller;
        address payable owner;
        uint256 price;
        bool sold;
    }

    event MarketListingCreated (
        uint indexed tokenId,
        address seller,
        address owner,
        uint256 price,
        bool sold
    );

    function mintNFTee() external {
        t.mint(msg.sender, 0, 999, "");
    }
}