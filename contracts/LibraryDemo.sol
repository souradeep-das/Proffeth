pragma solidity ^0.4.10;

import 'zeppelin/contracts/ownership/Ownable.sol';

contract LibraryDemo is Ownable{

  string name;
  uint regno;


  function setvalues(string _name,uint _number) onlyOwner {
    name=_name;
    regno=_number;
  }

  function getvalues() constant returns(string Name,uint Number) {
    Name=name;
    Number=regno;
  }

  function addmoney() payable{
    this.transfer(msg.value);
  }

  function withdrawmoney(uint value) onlyOwner {
    msg.sender.transfer(value);
  }

  function showWalletBalance() constant returns(uint){
    return this.balance;
  }

  function() payable{

  }
}
