// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

// Uncomment this line to use console.log
import "hardhat/console.sol";

contract yul {

    function isPrime(uint256 x) public pure returns(bool) {
       bool p = true;
        assembly {
            let half_X := add(div(x,2),1)
            for {let i:=2} lt(i,half_X) {i:=add(i,1)} {
                if iszero(mod(x,i)){
                    p:=0
                    break
                }
            }
        }
        return p;
    }


    function bitflip() public pure returns(bytes32 result){
        assembly {
             result := not(2)
        }
        // returns 0xFF....d ---> reason for d is that 2 is 0010 when negated gives 1101 which is d 
    }

    function unsafeNegation() public pure returns(uint256 result) {
        result = 1 ;

        assembly {
            if  not(2) {
                result := 2
            }
        }
        // returns result as 2 since the result of not(2) is evaluated as 0xfff...d which is a truthy value
    }

}