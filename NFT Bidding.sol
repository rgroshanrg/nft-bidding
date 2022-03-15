// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

contract NFTBidding {
    struct NFT {
        uint id;
        string name;
        address owner;
        uint price;
    }
    uint idCounter = 1;
    mapping(uint => NFT) nftMap;

    function mint(string memory _name, uint _price) public {
        require(nftMap[idCounter].id == 0, "NFT with same id already exists");
        NFT memory newNFT = NFT(idCounter, _name, msg.sender, _price);
        nftMap[idCounter] = newNFT;
        idCounter++;
    }

}
