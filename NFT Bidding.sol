// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

contract NFTBidding {
    struct nft {
        uint id;
        string name;
        address owner;
        uint price;
    }
    uint idCounter = 0;
    mapping(uint => nft) nftMap;
    
}
