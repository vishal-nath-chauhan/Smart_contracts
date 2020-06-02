pragma solidity ^0.4.19; 
contract Bank { 
    address owner; // current owner of the contract
    mapping(address => uint256) public balanceOf; // balances, indexed by addresses 
    
function Bank() public { 
    owner = msg.sender;
    } 
    
function getBalance() public view returns (uint256) { 
    return address(this).balance; 
    } 
     
function deposit(uint256 amount) public payable { 
    require(msg.value == amount); 
    balanceOf[msg.sender] += amount; // adjust the account's balance 
} 

function withdraw(uint256 amount) public {
    require(amount <= balanceOf[msg.sender]); 
    balanceOf[msg.sender] -= amount;
    msg.sender.transfer(amount); 
} 
}
