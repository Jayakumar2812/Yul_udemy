// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

// Uncomment this line to use console.log
import "hardhat/console.sol";

// var.slot determined at compile time 
contract yul {
    struct Test {
        uint256 test1;
        uint256 test2;

    }
    function getFMP() public {
        uint256 X40;

        assembly {
            X40 := mload(0x40)
        }
        console.log(X40);
        Test memory t = Test({
            test1:1,
            test2:2
        });
        assembly {
            X40 := mload(0x40)
        }
        console.log(X40);
    }



}