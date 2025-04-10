// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract HorseStoreYul {
    uint256 numberofHorses;

    function updateHorseNumber(uint256 newNumberOfHorses) external {
        // numberofHorses = newNumberOfHorses;
        assembly {
            sstore(numberofHorses.slot, newNumberOfHorses)
        }
    }

    function readNumberOfHorses() external view returns (uint256) {
        // return numberofHorses;
        assembly {
            let num := sload(numberofHorses.slot)
            mstore(0, num)
            return(0, 0x20)
        }
    }
}
