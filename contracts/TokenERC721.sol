pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract NFTCollectible is ERC721Enumerable {
    struct TokenMetaData{
        string name;
        string description;
        string image;
    }

    mapping(uint => TokenMetaData) tokenData;

    using SafeMath for uint256;
    using Counters for Counters.Counter;
    
    Counters.Counter private _tokenIds;
    
    constructor() ERC721("NFT Collectible", "NFTC") {
 
    }

    function mint(string memory name, string memory description, string memory image) public {
        _tokenIds.increment();
        uint256 tokenId = _tokenIds.current();
        TokenMetaData memory newTokenData = TokenMetaData(name, image, description);
        tokenData[tokenId] = newTokenData;
    }
}