
// SPDX-License-Identifier: MIT
pragma solidity >0.6.0 <= 0.9.0;

contract Storage{
    //This will be initialized to zero
    uint256 newNumber;
    bool newBool;

    struct People{
      uint256 newNumber;
      string name;
    }

    People[] public  people;
    mapping(string => uint256) public nameToNewNumber;


    function store(uint256 _newNumber) public{
        newNumber = _newNumber;
    }

}