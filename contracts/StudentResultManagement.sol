// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;
contract StudentResultManagement{
    struct student{
        string name;
        uint class;
        string gender;
        uint age;
        uint marks;
    }
    mapping(address => student)  setData;
    mapping(uint =>student) getDetails;
    address public admin;
    uint [] studentMarks;
    student [] students;
    // mapping(uint =>)
    
    constructor(){
        admin=msg.sender;
    }
    modifier adminOnly(){
        require(msg.sender==admin,"You are not Admin");
        _;
    }

    function enterData(address _adr,string memory _name,uint _class,string memory _gender, uint _age, uint _marks) public adminOnly  {
         setData[_adr].name=_name;
         setData[_adr].class=_class;
         setData[_adr].gender=_gender;
         setData[_adr].age=_age;
         setData[_adr].marks=_marks;
         getDetails[_marks].name=_name;
         getDetails[_marks].class=_class;
         getDetails[_marks].gender=_gender;
         getDetails[_marks].age=_age;
         getDetails[_marks].marks=_marks;
         
    }
    
    function retriveData(address _adr) public view returns (string memory,uint ,string memory , uint , uint)    {
        return (setData[_adr].name, setData[_adr].class,setData[_adr].gender,setData[_adr].age,setData[_adr].marks);
    
    } 
    
  
   function HighestMarks() public view returns (string memory name,uint class,uint age,string memory gender,uint marks){
       uint mks=0;
       for (uint i=0;i<studentMarks.length; i++){
           if(studentMarks[i]>=mks){
               mks=studentMarks[i];
           }
       }

     uint highestMarks=mks; 
     for(uint i=0;i<=studentMarks.length; i++ ){
     if(highestMarks==getDetails[highestMarks].marks){
         return (getDetails[highestMarks].name,getDetails[highestMarks].class,getDetails[highestMarks].age,getDetails[highestMarks].gender,getDetails[highestMarks].marks);
     }
     }
    }
   function LowestestMarks() public view returns (string memory name,uint class,uint age,string memory gender,uint marks){
       uint mks=1100;
       
       for (uint i=0;i<studentMarks.length; i++){
           if(studentMarks[i]<=mks){
               mks=studentMarks[i];
           }
       }
      uint highestMarks=mks;
      for(uint i=0;i<=studentMarks.length; i++ ){
     if(highestMarks==getDetails[highestMarks].marks){
         return (getDetails[highestMarks].name,getDetails[highestMarks].class,getDetails[highestMarks].age,getDetails[highestMarks].gender,getDetails[highestMarks].marks);
     }
    }

   }
    

}
