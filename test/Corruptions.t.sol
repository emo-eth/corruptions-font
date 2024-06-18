// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {Test, console2} from "forge-std/Test.sol";
import {Corruptions} from "../src/Corruptions.sol";

contract CorruptionsTest is Test {
    function setUp() public {
        vm.createSelectFork(getChain("base").rpcUrl);
    }

    function testLoad() public view {
        string memory loaded = Corruptions.load();
        assertEq(string.concat("data:font/otf;base64,", Corruptions.CORRUPTIONS), loaded);
    }
}
