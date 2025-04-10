// SPDX-License-Identifier: GPL-3.0-only

pragma solidity 0.8.29;

import {Base_TestV1, IHorseStore} from "./Base_TestV1.t.sol";
import {HorseStoreYul} from "../../src/horseStoreV1/HorseStoreYul.sol";

contract HorseSolc is Base_TestV1 {
    function setUp() public override {
        // horseStore = // Solc Edition;
        horseStore = IHorseStore(address(new HorseStoreYul()));
    }
}
