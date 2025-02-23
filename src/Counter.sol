// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;
    address public owner;
    
    event NumberSet(uint256 oldValue, uint256 newValue);
    event NumberIncremented(uint256 newValue);
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    function setNumber(uint256 newNumber) public onlyOwner {
        uint256 oldValue = number;
        number = newNumber;
        emit NumberSet(oldValue, newNumber);
    }

    function increment() public {
        number++;
        emit NumberIncremented(number);
    }
    
    function decrement() public {
        require(number > 0, "Cannot decrement below zero");
        number--;
        emit NumberIncremented(number);
    }
    
    function getNumber() public view returns (uint256) {
        return number;
    }
}