pragma solidity ^0.4.10;

/** @title Education Platform */
contract education {

//The user struct to hold his address,name,email id and password
  struct user{
    address user_add;
    string name;
    string email;
    string password;
  }

/** The course request struct to hold the course request -id,name of course,course details,
 * fees,requester address,accepted status and the teacher who accepted the request
 */
 struct coursereq{
   bytes32 courseId;
   string name;
   string details;
   uint fees;
   address user_add;
   bool accepted;
   address teacher_add;
 }

// The bid for price of course struct which has the course request id, bid amount, bidder address and acceptance status
 struct bid{
   bytes32 courseid;
   uint amount;
   address bidder;
   bool accepted;
 }

// Course struct which has -course id,course name,course details, course fees and address of teacher
 struct course{
   bytes32 courseid;
   string name;
   string details;
   uint fees;
   address trainer;
 }

  //mapping of course id to course
  mapping (bytes32 => course) courseadding;
  //mapping address to user struct
  mapping(address => user) usermapping;
  //mapping user address to course request
  mapping(address => coursereq) coursemapping;
  //mapping course request id to course request
  mapping(bytes32 => coursereq) idtocoursemapping;
  //mapping course id to the bidders address
  mapping(bytes32 => address[]) coursetobid;
  //mapping address of user to his bid
  mapping(address => bid) addresstobid;
  //mapping course id to videos
  mapping (bytes32 => string[]) coursetovid;
  //mapping user added to courses he has taken
  mapping (address => bytes32[]) usertocourse;
  //mapping course id to course struct
  mapping (bytes32 => course) coursedetailmapping;
  //mapping users address to his name
  mapping (address => string) addresstoname;
  //mapping users address to the courses he created
  mapping (address => bytes32[]) usertocreated;
  //mapping user to his course request id's
  mapping (address => bytes32[]) usertoreq;


// array to store requested courses
  bytes32[] requestedcourses;
  /** @dev Request for a course
    * @param reqname Name of the user
    * @param name Name of the course
    * @param details Course details
    */
  function request_course(string reqname,string name,string details) payable {
    bytes32 id =keccak256(name,msg.sender);
    coursemapping[msg.sender]=coursereq(id,name,details,msg.value,msg.sender,false,0);
    idtocoursemapping[id]=coursereq(id,name,details,msg.value,msg.sender,false,0);
    requestedcourses.push(id);
    coursetobid[id]=[0];
    coursetovid[id]=["0"];
    addresstoname[msg.sender]=reqname;
    usertoreq[msg.sender].push(id);
  }

  /** @dev View course Requests
    * @return array of course reqeuest id's
    */
  function viewcourserequests() constant returns(bytes32[]) {
    return requestedcourses;
  }

  /** @dev View course Requests
    * @param Course Request id
    * @return course id
    * @return course name
    * @return course details
    * @return course fees
    * @return address of the learner
    * @return course accepted by someone
    * @return address of the teacher
    */
  function viewcourserequestswithdetails(bytes32 id) constant returns (bytes32,string,string,uint,address,bool,address) {
     return (idtocoursemapping[id].courseId,idtocoursemapping[id].name,idtocoursemapping[id].details,idtocoursemapping[id].fees,idtocoursemapping[id].user_add,idtocoursemapping[id].accepted,idtocoursemapping[id].teacher_add);
  }

/** @dev Accept Course Request
  * @param Courseid
  */
  function acceptcoursereq(bytes32 id) {
    idtocoursemapping[id].accepted=true;
    idtocoursemapping[id].teacher_add=msg.sender;
    usertocreated[msg.sender].push(id);

  }

  /** @dev Show course ids of courses the user is teaching
    * @return array of course id's
    */
  function showcreatedcourse() constant returns(bytes32[]) {
    return usertocreated[msg.sender];
  }

  /** @dev Show course ids of courses the user is learning
    * @return array of course id's
    */
  function showmycourses() constant returns(bytes32[]){
    return usertocourse[msg.sender];
  }


  /** @dev Show course ids of courses the user requested
    * @return array of course request id's
    */
 function showmycoursereq() constant returns(bytes32[]) {
   return usertoreq[msg.sender];
 }

 /** @dev Remove course requests
   * @param id The id of course request to remove
   */
 function removereq(bytes32 id) {
   idtocoursemapping[id].accepted=true;
 }

 /** @dev Add video to course request
   * @param reqid Course request id
   * @param vidhash The ipfs video hash
   */
  function addvideo(bytes32 reqid,string vidhash) {
    require(idtocoursemapping[reqid].teacher_add==msg.sender);
    coursetovid[reqid].push(vidhash);
  }

  /** @dev Show course video by number
    * @param id Course id
    * @param i The link number
    */
  function showvideos(bytes32 id,uint i) constant returns(string) {
    for(var j=0;j<usertocourse[msg.sender].length;j++)
    {
      if(usertocourse[msg.sender][j]==id)
      {
        return coursetovid[id][i];
      }
    }

  }

  /** @dev Show number of videos for the course
    * @param id Course id
    * @return the number of course
    */
  function showallvideos(bytes32 id) constant returns(uint) {
    return coursetovid[id].length;
  }

  /** @dev Add a course
    * @param reqname Your name
    * @param name Course name
    * @param description Some course description
    * @param fees Course fees
    */
  function newcourse(string reqname,string name,string description,uint fees) {
    bytes32 id =keccak256(name,msg.sender);
    coursetovid[id]=["0"];
    courseadding[id]=course(id,name,description,fees,msg.sender);
    allcourses.push(id);
    coursedetailmapping[id]= course(id,name,description,fees,msg.sender);
    addresstoname[msg.sender]=reqname;
    usertocreated[msg.sender].push(id);
  }

  /** @dev Add video to course
    * @param id Course id
    * @param vid The ipfs video hash
    */
  function addvideotocourse(bytes32 id,string vid) {
    coursetovid[id].push(vid);
  }

  /** @dev Buy course
    * @param id Course id
    */
  function takecourse(bytes32 id) payable {
    require(msg.value>=courseadding[id].fees);
    usertocourse[msg.sender].push(id);
  }

  //array to store all the courses
  bytes32[] allcourses;
  /** @dev Show all courses in the platform
    * @return array of course id's
    */
  function showallcourses() constant returns(bytes32[]) {
    return allcourses;
  }

  /** @dev Show all the course details
    * @param id Course id
    * @return course id
    * @return course name
    * @return course details
    * @return course fees
    * @return course teacher
    * @return course teacher name
    */
  function showcoursebyid(bytes32 id) constant returns(bytes32,string,string,uint,address,string) {
    return (coursedetailmapping[id].courseid,coursedetailmapping[id].name,coursedetailmapping[id].details,coursedetailmapping[id].fees,coursedetailmapping[id].trainer,addresstoname[coursedetailmapping[id].trainer]);
  }

//payable fallback functions
  function() payable {

  }
}
