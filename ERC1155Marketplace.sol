// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./ERC1155NFTeeFactory.sol";

contract ERC1155Marketplace is ERC1155Holder, Ownable {
    ERC1155NFTeeFactory private nfteeFactory;

    uint256 listingPrice = 0.047 ether;

    mapping(uint256 => MarketListing) private idToMarketListing;

    constructor () {
        nfteeFactory = new ERC1155NFTeeFactory();
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

    function createNewCollection() external {
        nfteeFactory.createERC1155Collection();
    }

    function createNewERC1155() external {
        ERC1155NFTee newContract = new ERC1155NFTee();
        newContract.mint(msg.sender, 0, 999, "");
    }
}