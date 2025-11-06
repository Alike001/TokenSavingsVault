// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract TokenSavingsVault{
    address owner;
    uint balance;
mapping( address=> uint) public balances;
function deposit() public payable {
    require(msg.value > 0, "Must send ETH to deposit");
        balances[msg.sender] += msg.value;
}
function getbalances() public view returns (uint){
    return balances[msg.sender];
}
function withdraw(uint amount) public{
    require(balances[msg.sender] >= amount, "Insufficient funds");
    balances[msg.sender] -= amount;
    (bool success,) = msg.sender.call{value:amount}("");
    require(success, "Withdrawal failed");
}
}