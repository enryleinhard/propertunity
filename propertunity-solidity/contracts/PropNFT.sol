// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PropNFT is ERC721URIStorage, Ownable {
    constructor() ERC721("Propertunity NFT", "PNFT") {}

    function mintProperty(address _to, uint256  _tokenId, string calldata _uri) external onlyOwner {
        _safeMint(_to, _tokenId);
        _setTokenURI(_tokenId, _uri);
    }
}
