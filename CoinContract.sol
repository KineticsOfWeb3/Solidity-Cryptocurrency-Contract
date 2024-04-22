// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Coin {
    // The address of the account that can create new coins
    address public minter;
    
    // Mapping of addresses to their coin balances
    mapping(address => uint) public balances;

    // Event emitted when coins are sent from one address to another
    event Sent(address from, address to, uint amount);

    // Constructor: Runs only once when the contract is created
    constructor() {
        // Set the contract creator's address as the minter
        minter = msg.sender;
    }

    // Function to create and send coins to an address
    // Can only be called by the contract creator
    function mint(address receiver, uint amount) public {
        // Verify that the caller is the contract creator
        require(msg.sender == minter, "Only the minter can create coins");
        
        // Increase the balance of the receiver
        balances[receiver] += amount;
    }

    // Custom error to handle insufficient balance
    error InsufficientBalance(uint requested, uint available);

    // Function to send coins from one address to another
    function send(address receiver, uint amount) public {
        // Check if the sender has sufficient balance
        if (amount > balances[msg.sender]) {
            // If not, revert the transaction with an error
            revert InsufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });
        }

        // Subtract the amount from the sender's balance
        balances[msg.sender] -= amount;
        
        // Increase the amount in the receiver's balance
        balances[receiver] += amount;
        
        // Emit an event to log the transaction
        emit Sent(msg.sender, receiver, amount);
    }
}
