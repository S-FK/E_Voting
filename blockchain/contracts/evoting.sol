pragma solidity ^0.5.1;

contract evoting {

  uint id = 0;
  address _owner;

  struct applicants {
    uint aid;
    string name;
  }

  mapping (uint => applicants) applicantmapping;
  mapping (uint => uint) noofvotes;
  mapping (address => uint) votemapping;

  constructor() public {
    _owner = msg.sender;
  }

  function get_next_id() public {
    id++;
  }

  function add_applicant(string memory _name) public {
    get_next_id();
    applicantmapping[id]=applicants(id,_name);
    noofvotes[id]=0;
  }

  function vote(uint _id) public {
    noofvotes[_id]+=1;
    votemapping[msg.sender]=_id;
  }

  function show_my_vote() public view returns(uint) {
    return votemapping[msg.sender];
  }

  function show_count_of_votes(uint _id) public view returns(uint) {
    return noofvotes[_id];
  }




}
