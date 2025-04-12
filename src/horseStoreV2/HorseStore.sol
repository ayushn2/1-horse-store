// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.29;

import {ERC721Enumerable, ERC721} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import {IHorseStore} from "./IHorseStore.sol";

contract HorseStore is IHorseStore, ERC721Enumerable{
    string constant NFT_NAME = "Horse";
    string constant NFT_SYMBOL = "HRS";
    uint256 public constant HORSE_HAPPY_IF_FED_WITHIN = 1 days;

    mapping(uint256 id => uint256 lastFedTimeStamp) public horseIdToFedTimeStamp;

    constructor() ERC721(NFT_NAME, NFT_SYMBOL) {}

    function mintHorse() external{
        _safeMint(msg.sender, totalSupply());
    }

    function feedHorse(uint256 horseId) external{
        horseIdToFedTimeStamp[horseId] = block.timestamp;
    }

    function isHorseHappy(uint256 horseId) external view returns (bool){
        return horseIdToFedTimeStamp[horseId] + HORSE_HAPPY_IF_FED_WITHIN >= block.timestamp;
    }

}
