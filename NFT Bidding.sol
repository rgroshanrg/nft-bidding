// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

contract NFTBidding {


    //**************************** NFT ********************************


    // Structure body for NFT (details)
    struct NFT {
        uint id;
        string name;
        address owner;
        uint price;
    }

    // For maintaing uniqueness of NFT, each time new id will be generated
    uint public nftCounter = 0;
    
    // For mapping id of each nft to its Structure Instance
    mapping(uint => NFT) public nftMap;

    // Function modifier for checking if modifier of NFT is owner or not
    modifier restrictedToOwner(uint _id) {
        require(nftMap[_id].owner == msg.sender, "You are not owner of this NFT, you cannot burn it."); // Check the owner of NFT is same as burner
        _;
    }

    // Function Modifier for checking, NFT Exists or not
    modifier nftExists(uint _id) {
        require(nftMap[_id].id > 0, "NFT does not exists");   // Checks if NFT of given id exists or not
        _;
    }

    // Function for minting nft 
    function mint(uint _id, string memory _name, uint _price) public {
        require(_id > 0, "id of NFT cannot be less than 1");
        require(nftMap[_id].id == 0, "NFT with same id already exists");  // checks if there already exist nft of same id
        NFT memory newNFT = NFT(_id, _name, msg.sender, _price);  // creates new NFT using passes parameters and msg.sender
        nftMap[_id] = newNFT;     // adds newly created NFT into nftMap
        nftCounter++;           // Increments idCounter for maintaining uniqueness
    }

    // Function for burning nft
    function burn(uint _id) public nftExists(_id) restrictedToOwner(_id) {
        delete nftMap[_id];     // Removes from the Map
        nftCounter--;
    }


    // Function for transfering NFT to another owner
    function transfer(uint _id, address receiver) public nftExists(_id) restrictedToOwner(_id)  {
        nftMap[_id].owner = receiver;
    }


}
