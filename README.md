# TokenSavingsVault

A simple Solidity smart contract that allows users to deposit, check, and withdraw their ETH securely.

Features

Users can deposit ETH into the vault.

Each user’s balance is stored separately using their wallet address.

Users can withdraw their ETH anytime.

The contract ensures you can’t withdraw more than your balance.

Smart Contract

    // SPDX-License-Identifier: MIT

    pragma solidity ^0.8.0;
        
    contract TokenSavingsVault {
    
    address owner;
    
    uint balance;
    
    mapping(address => uint) public balances;

    function deposit() public payable {
        require(msg.value > 0, "Must send ETH to deposit");
        balances[msg.sender] += msg.value;
    }

    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    function withdraw(uint amount) public {
        require(balances[msg.sender] >= amount, "Insufficient funds");
        balances[msg.sender] -= amount;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Withdrawal failed");
    }
    }

How It Works

Deploy the contract on a test network (like Sepolia).

Call deposit() and send some ETH along with the transaction.

Use getBalance() to view your vault balance.

Call withdraw(amount) to take out your ETH.
