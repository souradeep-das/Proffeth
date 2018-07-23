pragma solidity ^0.4.10;

contract education {

  struct user{
    address user_add;
    string name;
    string email;
    string password;
  }

 struct coursereq{
   bytes32 courseId;
   string name;
   string details;
   uint fees;
   address user_add;
   bool accepted;
   address teacher_add;
 }

 struct bid{
   bytes32 courseid;
   uint amount;
   address bidder;
   bool accepted;
 }

  mapping(address => user) usermapping;
  mapping(address => coursereq) coursemapping;
  mapping(bytes32 => coursereq) idtocoursemapping;
  mapping(bytes32 => address[]) coursetobid;
  mapping(address => bid) addresstobid;
  mapping (bytes32 => string[]) coursetovid;

  /*
  function register_user(string name,string email,string password) {
    usermapping[msg.sender]=user(msg.sender,name,email,password);
  }
  */

  bytes32[] requestedcourses;
  function request_course(string name,string details) payable {
    bytes32 id =keccak256(name,msg.sender);
    coursemapping[msg.sender]=coursereq(id,name,details,msg.value,msg.sender,false,0);
    idtocoursemapping[id]=coursereq(id,name,details,msg.value,msg.sender,false,0);
    requestedcourses.push(id);
    coursetobid[id]=[0];
    coursetovid[id]=["0"];

  }

  function viewcourserequests() constant returns(bytes32[]) {
    return requestedcourses;
  }

  function viewcourserequestswithdetails(bytes32 id) constant returns (bytes32,string,string,uint,address,bool,address) {
     return (idtocoursemapping[id].courseId,idtocoursemapping[id].name,idtocoursemapping[id].details,idtocoursemapping[id].fees,idtocoursemapping[id].user_add,idtocoursemapping[id].accepted,idtocoursemapping[id].teacher_add);
  }

  function acceptcoursereq(bytes32 id) {
    idtocoursemapping[id].accepted=true;
    idtocoursemapping[id].teacher_add=msg.sender;

  }

  function  bidforcourse(bytes32 id,uint amount) {
    addresstobid[msg.sender]=bid(id,amount,msg.sender,false);
    coursetobid[id].push(msg.sender);
  }

  function showbid(bytes32 id) constant returns(address[]){
      return coursetobid[id];
  }

  function  showbiddetails(address bidder) constant returns(uint,address,bool) {
    return (addresstobid[bidder].amount,addresstobid[bidder].bidder,addresstobid[bidder].accepted);
  }

  function acceptbid(address bidder) {
    addresstobid[bidder].accepted=true;
    idtocoursemapping[addresstobid[bidder].courseid].accepted=true;
    idtocoursemapping[addresstobid[bidder].courseid].teacher_add=bidder;

  }


  function addvideo(bytes32 reqid,string vidhash) {
    require(idtocoursemapping[reqid].teacher_add==msg.sender);
    coursetovid[reqid].push(vidhash);
  }

  function showvideos(bytes32 id,uint i) constant returns(string) {
    return coursetovid[id][i];
  }




  function() payable {

  }
}
