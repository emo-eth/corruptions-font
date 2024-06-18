// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {File, BytecodeSlice, read} from "ethfs/File.sol";

library Corruptions {
    uint32 constant CORRUPTIONS_START = 1;
    uint32 constant CORRUPTIONS_END = 11153;
    address constant CORRUPTIONS_POINTER = 0xFD8759E231d2FAAF3281329b6ee46A11B880a164;
    uint32 constant CORRUPTIONS_SIZE = 11152;

    function load() internal view returns (string memory) {
        string memory loaded;
        BytecodeSlice memory slice =
            BytecodeSlice({pointer: CORRUPTIONS_POINTER, start: CORRUPTIONS_START, end: CORRUPTIONS_END});
        BytecodeSlice[] memory slices = new BytecodeSlice[](1);
        slices[0] = slice;
        File memory corruptions = File({size: CORRUPTIONS_SIZE, slices: slices});
        loaded = read(corruptions);
        return string.concat("data:font/otf;base64,", loaded);
    }
}
