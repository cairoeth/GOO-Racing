// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

/**
 * @title GOO Racing helper contract
 * @author cairoeth
 * @dev Helpers functions to verify integrity.
 **/
contract Helpers {
    function _checkAttribute(uint8 _attribute) internal pure {
        if (_attribute < 1 || _attribute > 10) {
            revert("Invalid attribute.");
        }
    }
}
