// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

// Uncomment this line to use console.log
import "hardhat/console.sol";

// var.slot determined at compile time 
contract yul {

    uint256 x;
    uint128 a=1;
    uint128 b =2; 

    uint128 c = 3;
    uint96 d = 4;
    uint16 e = 5;
    uint8 f = 6;


    function getx(uint256 slot) public view returns(bytes32 _x) {
        assembly {
            _x := sload(slot)
        }
    }
    // if slot 1 is queired then 0x0......2000....1 is returned
    function setx(uint256 slot,uint256 val)public  {
        assembly {
            sstore(slot,val)
        }
    }

    function getslotb() public pure returns(uint256 _slot){
        assembly {
            _slot := b.slot 
        }
    }

    function readingPackedvar() public view returns(uint256 ret1 ) {
        assembly{

            let slot := e.slot // 3
            let offset := e.offset // 28

            let unshifted_val := sload(slot) // 0x0006000005000000..4....3

            let right_shifted_val := shr(mul(offset,8),unshifted_val) // 0x00000000......00000060005

            ret1 := and(0xffff,right_shifted_val) // 00000......600005 -> 0x....0ffff = 0x00....005
        }
    }

    function writing_to_tightly_packedvar(uint16 newE) public returns(uint256 final_val) {

        assembly{

            let slot := e.slot // 3
            let offset := e.offset // 28

            let cleared_e := and(sload(slot),0xffff0000ffffffff) // need to fill upto 256bits of ff
            let shiftednew_e := shl(mul(offset,8),newE)
            final_val := or(shiftednew_e,cleared_e)

            sstore(slot,final_val) 

        }

    }


    // function testing() public view {
    //     console.log(getx(0));
    // }


}