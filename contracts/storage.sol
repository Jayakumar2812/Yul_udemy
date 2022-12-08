// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

// Uncomment this line to use console.log
import "hardhat/console.sol";

// var.slot determined at compile time 
contract yul {

    uint256 x;
    uint128 a=1;
    uint128 b =2;

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

    // function testing() public view {
    //     console.log(getx(0));
    // }


}