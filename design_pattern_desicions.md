# Design Patterns

## Circuit breaker - The Emergency Stop
Implemented circuit breaker so that the contract can be paused by some authorized person, which will stop ether inflow yt to the contract. When the emergency is triggered by the authorized, functions like request course, buy course will not work, in order to reject ether flow to the contract. On the same time, the trainers can withdraw their payment without any issues. The contract works normally again when the authorized calls the function resumeContract

![circuit breaker](https://github.com/souradeep-das/Proffeth/blob/master/images/circuit%20breaker.png)

## Restricting Access
Used restricting access to limit everyone for calling a function. The access restriction was used in function removereq() which is used to remove the course request. Here only the person who requested the course is allowed to revoke the request. In the function which adds video link to the course also has a check to allow only the course creator to add the video link. 

![restricting access](https://github.com/souradeep-das/Proffeth/blob/master/images/restricting%20access.png)

## Fail Early(Use of Require over if condition)
Require is used instead of if condition for checking any condition. To avoid failing a function without throwing is avoided by using the require statement. The require statement will check for the condition and throw if the condition is not met. This has been used in function paytrainer where a nested if condition is replaced with require statements.

## Oracle 
An oracle service - Oraclize has been used to get the price of eth in usd. It uses Wolfram Alpha to convert the amount of eth to USD on that specific time.

![oraclize](https://github.com/souradeep-das/Proffeth/blob/master/images/oraclize.png)

## Pull over push payments
The function paytrainer is designed to be a pull payment, where the trainer calls the function to get his payment. There could also have been a push payment implementation but that could have brought problems like re-entrancy and DOS attacks.

![pull](https://github.com/souradeep-das/Proffeth/blob/master/images/pull.png)

## Auto depreciation - not required 
Because the contract should not expire after any certain amount of time. The contract is created to keep records of all the course, course requests, the students who take this course along with the course ipfs links. The contract has no requirement to terminate after a certain period of time so the auto depreciation design pattern has not been used.

## Mortal - not used
Not providing the access of the contract creator to kill the contract and take all the ethers with him, but the project includes design patterns like circuit breaker
