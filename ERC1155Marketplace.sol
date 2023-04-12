// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract ERC1155Marketplace is ERC1155 {
    constructor() ERC1155("") {}
}