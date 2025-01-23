
// SPDX-License-Identifier: MIT
pragma solidity >0.6.0 <= 0.9.0;

contract Storage{
    uint256 newNumber;


    function store(uint256 _newNumber) public{
        newNumber = _newNumber;
    }

}