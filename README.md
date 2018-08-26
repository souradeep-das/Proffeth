# Proffeth
  Proffeth is a decentralized learning platform which uses some unique methods to ensure a safe and happy learning environment in a trustless environment.
  
  [Link to Design Patterns](https://github.com/souradeep-das/Proffeth/blob/master/design_pattern_desicions.md)
  
  [Link to Avoiding Common Attacks](https://github.com/souradeep-das/Proffeth/blob/master/avoiding_common_attacks.md)
  
  [Link to Deployed Address](https://github.com/souradeep-das/Proffeth/blob/master/deployed_addresses.txt)
  
# Contents
- [The Problem](#the-problem)
- [The Platform - Proffeth](#the-platform---proffeth)
- [The Unique feature](#the-unique-feature)
- [How Blockchain can help](#how-blockchain-can-help)
- [Impacts](#impacts)
- [Using Truffle to test contracts](#using-truffle-to-test-contracts)
- [Information on the tests](#information-on-the-tests)
- [Running the Application](#running-the-application)
- [Screenshots](#screenshots)
- [Integration with additional services](#integration-with-additional-services)
- [Tech Stack](#tech-stack)


  ## The problem
  Education platforms which exists currently are limited to teachers or courses from reputed universities. There should be a wider range of courses available to people. After all even small things need to be learnt and can help gain some important skill.There also is a need of a platform for normal people to share courses within themselves.Everyone has something to teach and what better way than earning some money for it. Combining these two factors, there exists a dire need of a new kind of skill sharing platform.
  ## The Platform - Proffeth
  The platform connects people from all over the world and enables them to share skills within them.People using the platform are of usually two types- the learner and the teacher.A person can be both a teacher and a learner in the same time. A learner can use the platform for buying a course at a nominal cost or can request a course he wants to learn.
  #### Adding a course
  The teacher/trainer can add a course to the platform.The trainer fills up a form of the course related information including the course fee and is good to go!
  #### Buying a course
  The course already added by the trainers are visible and the learner can browse through the courses and can buy the course he wants to.As this is a platform open to everyone and the fact that anybody can add a course also brings in the possibility of defrauding people by putting in fake courses.So, Proffeth has this unique algorithm which pays out the trainer catiously in accordance with combining the values of individual and total user progress. So buying a course transfers the money to the contract and later gradually gives away the money to the trainers calculating the students progress.
  #### Requesting a course
  People can come in to the platform and request to teach them any skill they wish to learn.They can opt for quoting the fee they wish to pay for the course.People can even request for help with certain projects or help. The course requests are sent in with the course fee paid to the contract and are open for acquiring trainers.The course fee paid to the contract provides a security measure for the trainers that the learners can not back out afterwads. The learner has the option to revoke the request anytime he/she wants and get the fee paid back instantly.
  #### Accepting a course request
  The trainer also has the option to see and accept any course request. After the course request is accepted the platform considers it as a course and gets paid gradually in the same way.
  ### The Unique feature
  The platform ensures a proper trust free secure method for skill sharing.In a platform where we dont have any special requirements for a person to be a teacher,the platform needs to be fraud proof.Proffeth has this unique algorithm which pays out the trainer catiously in accordance with combining the values of individual and total user progress.So, buying a course will not transfer the money to the trainer instantly.This removes the necessity to trust the trainer.The platform uses a unique Pay-as-you-learn feature, where the smart contract automatically allocates fund for the trainer as the learner moves ahead with the course.
  The course requests also needs the course fee to be paid to the contract, so that the learner cannot back out after the course has been accepted.However, the learner can revoke the course request anytime until it has been accepted. 
  
  
  ### How Blockchain can help
  Blockchain provides with a great way to remove the trust factor between the parties.The smart contract acts for the security of payments in exchange of the course resources.The automation of payouts with the exchange of content provides with a unique Pay-as-you-learn feature.The algorithm also creates a condition where a more active course, with learners actively moving forward in the course will mean a faster payout to the trainer.
  ### Impacts
  | Problems in an open Education Platform | How the project solves them |
  | --- | --- |
  | Fraudulent Course | Unique pay-while-you-learn method |
  | Low Quality of content | The algorithm ensures faster payouts for active courses |
  | Low number of small-scale courses | The platform allows any type of skill-sharing activity|


# Using Truffle to test contracts
**Dependencies** 
   1. Install [Truffle](https://truffleframework.com/truffle)
   2. Install [Ganache](https://truffleframework.com/ganache)
   
**Clone the repository**
  ```sh
  git clone https://github.com/souradeep-das/Proffeth.git
  cd Proffeth/
  ```
   
**Steps to run the Tests**

   First run ganache
   ```sh
   ganache-cli
   ```
   Compile the contracts
   ```sh
   truffle compile
   ```
   Run the tests
   ```sh
   truffle test
   ```
## Information on the tests
   
   **Note- education.sol is the main smart contract. LibraryDemo.sol is the implementation of ETHpm and is not related to the main smart contract. OraclizeAPI is the contract for the usage of oraclize as a service in the main smart contract.**
   
    Deploy the smart contract
   
      Catch an instance of the contract- This shows contract has been successfully deployed
      
    Check Course Requests
   
      Call function request_course- Checking the proper creation of a request
      
      Check number of course requests- Checking this with number of course requests
      
      Check course name- Verifying the course name
      
    Check Add Course
   
      Call function newcourse- Checking the creation of a course 
      
      Check number of courses- Checking this with number of courses in the contract
      
      Check course name- Verifying the course name
      
    Take the course
   
      Take the course-Javascript-paying less, should fail- Checking if someone can take the course paying less than the fees
      
      Take the course-Javascript-paying actual amount- Checking if someone can take the course paying the correct fees 
      
    Acceptance of course requests
   
      Accept course request- Checking the acceptance of course requests
      
      Course variables updated- Checking if the attributes of a course has been udated
      
    Add video to course
   
      Other person than the acceptor trying to add a video-should fail- Checking if a person is able to add content to other peoples course 
      
      Course acceptor adding a video- Checking if the trainer of a course is able to add video
      
    Get Video links of a course
   
      Any other person gets the video links of the course-should not allow- Checking if only the student is able to get the course content information
   
# Running the Application  
**Dependencies** 
   1. Install [npm](https://www.npmjs.com/get-npm)
   2. Install [MetaMask](https://metamask.io/)
   
**Note: Make sure you have a internet connection and switch to Rinkeby Testnet in Metamask.Make sure you have test-ethers in Rinkeby.Request from the [Rinkeby faucet](https://www.rinkeby.io/#faucet) if you dont.** 
   
**Clone the repository**
  ```sh
  git clone https://github.com/souradeep-das/Proffeth.git
  cd Proffeth/front-end/
  ```
**Run the lite-server**
```sh
npm run dev
```
The website can be used now and make sure you are using Metamask and it is on the Rinkeby Testnet.

![Notice](https://github.com/souradeep-das/Proffeth/blob/master/images/Screenshot%20from%202018-08-27%2002-50-43.png)

### Running thorugh the website
  If you choose to be a teacher, you can add a course which will show in the 'course' tab under students.It will also show in your dashboard under the courses you teach.Clicking on the course will allow you to add contect to the course.
  
  If you choose to be a student, you can buy and requeset a course. Your requested course shows up in the 'Course Requests' tab under teacher. If you buy a course it will show in your dashboard. You will be able to view the course contents by clicking on the course in your dashboard.
  
## Screenshots

#### Home Page
![home](https://github.com/souradeep-das/Proffeth/blob/master/images/Screenshot%20from%202018-08-27%2003-03-36.png)

#### Course Explorer
![courses](https://github.com/souradeep-das/Proffeth/blob/master/images/Screenshot%20from%202018-08-27%2003-07-23.png)

#### Buy Course Page
![course buy page](https://github.com/souradeep-das/Proffeth/blob/master/images/Screenshot%20from%202018-08-27%2003-08-11.png)

##### Teacher Dashboard
![dashboard teacher](https://github.com/souradeep-das/Proffeth/blob/master/images/Screenshot%20from%202018-08-27%2003-08-45.png)

## Integration with additional services
### Oraclize
Oraclize has been integrated with the product to get the real time conversion values of Ethers to USD. When the conversion function is triggered, Oraclize uses Wolfram Alpha's API to get the current conversion rate and sends it through a transaction to the contract.
### IPFS
IPFS has been used to store the content of a specefic course. IPFS provides with a distributed file storage capability and easily fits into the platform. However, a non-IPFS based course content is also allowed in the platform.

## Tech Stack

**Frameworks/Tools**
  1. Truffle
  2. Ganache
  3. Metamask
  4. Web3.js
  5. Oraclize
  6. npm
  7. Git
  
  
**Programming Languages**  
  1. Solidity
  2. Javascript
  3. HTML
  4. CSS


