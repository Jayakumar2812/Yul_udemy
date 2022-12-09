// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

// Uncomment this line to use console.log
import "hardhat/console.sol";

// var.slot determined at compile time 
contract yul {

    function externalwithNoargs(address _a) external view {

    assembly{
        mstore(0,0x9a884bde) // 0x00.........9a884bde
        //                      0            28    32 
        let success := staticcall(gas(),_a,28,32,0x0,0x20) 

        if iszero(success) {
            revert(0x0,0x20)
        }
        return(0x0,0x20)
    }

    }


}


contract test {

    // 9a884bde - func selc of "get21()"
    function get21() external pure returns(uint256) {
        return 21;
    }

} 