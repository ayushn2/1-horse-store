// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract HorseStore{
    uint256 numberofHorses;

    function updateHorseNumber(uint256 newNumberOfHorses) external{
        numberofHorses = newNumberOfHorses;
    }

    function readNumberOfHorses() external view returns(uint256){
        return numberofHorses;
    }
}