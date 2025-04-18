// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

import {HorseStore} from "../../src/horseStoreV1/HorseStore.sol";
import {IHorseStore} from "../../src/horseStoreV1/IHorseStore.sol";
import {Test, console2} from "forge-std/Test.sol";

abstract contract Base_TestV1 is Test {
    IHorseStore public horseStore;

    function setUp() public virtual {
        horseStore = IHorseStore(address(new HorseStore()));
    }

    function testReadValue() public view {
        uint256 initialValue = horseStore.readNumberOfHorses();
        assertEq(initialValue, 0);
    }

    function testWriteValue(uint256 numberOfHorses) public{
        horseStore.updateHorseNumber(numberOfHorses);
        uint256 updatedValue = horseStore.readNumberOfHorses();
        assertEq(updatedValue, numberOfHorses);
    }
}
