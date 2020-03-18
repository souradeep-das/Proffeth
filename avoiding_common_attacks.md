# Avoiding Common Attacks

## Tx.origin avoided
Tx.origin has been avoided and msg.sender m has been used in the contract. Contracts that authorise users using the tx.origin variable can be vulnerable to phishing attacks. Because tx.origin and msg.sender are not the same thing. So throughout the contract tx.origin has been avoided. 

![txorigin avoided](https://github.com/souradeep-das/Proffeth/blob/master/images/msgsender.png)

## Reentrancy attack
The use of call.value has been avoided in the contract. So the contract is not vulnerable to reentrancy or race conditions.

## Unchecked call return values taken care of
The contract has use of transfer instead of the send function. The send function does not revert if the external call fails. Rather It simply returns false. There is a pitfall in the contract if the send function is used. So keeping this in mind transfer function has been used everywhere in the contract.

## Pull payments
The contract uses pull payments instead of push payments where the trainer can request to get his money from the contract and the contract does not send etheres on its own. Push payment design pattern would have brought vulnerability to DOS and reentrancy attacks

![pull](https://github.com/souradeep-das/Proffeth/blob/master/images/pull.png)

## Floating point precision and logic
All the algorithmic calculation are taking wei in factors. So no float values have been used in the calculation. Values are taken in wei and stored as such.So there is no possibility of miscalculation in the contract. 

## Integer Overflow and Underflow 
The possibilty of integers overflowing is minute for the contract as math operation are not performed, and there is no logic in the contract for a possible underflow. However, For the integer overflow and underflow problem the zeppelins safemath library can be used.

## Exposed contract
The contract uses no internal functions and all the functions are public but they have a check on who can access them.

## Miner Vulnerabilities
The contract has no logic which uses the block hash for generating a random number. There is also has been no requirement of the timestamp in the contract logic.The block hash can be manipulated by the miner and if the contract is dependent on the timestamp with short time logic, it is also vulnerable to the miner
