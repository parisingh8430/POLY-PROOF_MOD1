// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


contract MetaToken is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    constructor() ERC721("Spiderman", "kh") {}

    string[] uri = [
        "https://gateway.pinata.cloud/ipfs/QmeHCszCrMJDVZ7ZSt1vfj5VyYpQBkZX8NSB64snLTsc4f",
        "https://gateway.pinata.cloud/ipfs/QmTjR5b1LVwCw21TqnVzpJMkham5zaQDnqcDbMYu1XzJee",
        "https://gateway.pinata.cloud/ipfs/QmVDzCTbMPgQPJJammZwp3cvvCuvQDjwpbsp8JuRYdoKJU",
        "https://gateway.pinata.cloud/ipfs/Qmaak5M5LCKST4dtxB1eKTopXEoZy5iVJM9rvVXs38Qkum",
        "https://gateway.pinata.cloud/ipfs/QmQTzY3ibZt9fTy2q5KCC3jEzdqo8TdFQ2fhGjVwibih8k"
    ];

    string[] prompt = [    
        "NFT1",
        "NFT2",
        "NFT3",
        "NFT4",
        "NFT5"
    ];

    function mint(address to) public onlyOwner returns(uint256 ){
                _tokenIds.increment();

        uint256 tokenId = _tokenIds.current();
 
            _safeMint(to, tokenId);
            return tokenId;
    }

    function promptDescription(uint256 tokenID) external view returns (string memory) {
        return prompt[tokenID];
    }
}
