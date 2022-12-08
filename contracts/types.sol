// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

// Uncomment this line to use console.log
import "hardhat/console.sol";

contract yul {
    
    function getvar() public pure returns(uint256) {
        uint256 x;

        assembly {
            x:= 42
        }
        return x;
    }
    function getHex() public pure returns(uint256) {
        uint256 x;

        assembly {
            x:= 0xa
        }
        return x;    
    }

    // works only for short strings
    function getString() public pure returns(string memory){
        bytes32 test_str = "";

        assembly {
            test_str := "hello_world"
        }
        return string(abi.encode(test_str));
    }

    function bool_rep() public pure returns(bool) {
        bool b;
        assembly {
            b :=1
        }
        return b;
    }

    function representation() public pure returns(address){
        address a;
        assembly {
            a:= 1
        }
        return a;
    }

}
