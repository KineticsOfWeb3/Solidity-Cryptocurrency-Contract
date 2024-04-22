 Solidity-Cryptocurrency-Contract
 Coin Contract

The Coin contract represents a basic cryptocurrency system implemented on the Ethereum blockchain. It allows users to create and transfer custom coins using Ethereum addresses, without the need for registering with usernames or passwords.

Features

 Minter Role: The contract designates a single account as the minter, responsible for creating new coins. This role is assigned to the account that deploys the contract.

Account Balances: Each Ethereum address has an associated balance of coins, tracked using a mapping. This allows for seamless transfer of coins between addresses.
Transaction Events: The contract emits an event called `Sent` whenever coins are successfully transferred from one address to another. This enables external systems to track and react to transactions on the blockchain.

Custom Error Handling: The contract includes a custom error message called `InsufficientBalance`, triggered when a user attempts to send more coins than they possess. This provides informative feedback to users and prevents invalid transactions.

 Contract Functions

Constructor: The constructor function initializes the minter role, assigning it to the deploying account. This ensures that only the contract deployer has the authority to create new coins.

mint: The `mint` function allows the minter to create and send a specified amount of coins to a target Ethereum address. This function enforces the principle that only the minter can initiate the creation of new coins.

send: Any Ethereum address can use the `send` function to transfer coins to another address. This function verifies that the sender possesses sufficient coins before executing the transaction. If the sender's balance is insufficient, the transaction fails and triggers the `InsufficientBalance` error.


