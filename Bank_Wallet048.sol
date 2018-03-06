import "./Operation3.sol";
pragma solidity ^0.4.0;
contract Test

{
 function totalSupply(uint256 _totalsupply)public returns(uint256);
 function Transfer(address to,uint256 transamount)public returns(uint256,uint256);
 function BalanceOf(address a)public constant returns(uint256);
 function Approve(address spender,uint256 spendersamount)public returns(string,uint256);
 function Allowance(address spender)public constant returns(uint256);
 function TransferFrom(address spender,address to,uint256 amount)public returns(uint256);
 }
contract Tokens is Test
{
    using Operations for uint256;
   
   mapping(address=>bool)status;
    mapping(address=>uint256)key_1;
    mapping(address=>mapping(address=>uint))key_2; 
    
    function totalSupply(uint256 _totalsupply)public returns(uint256)
    {
        require(status[msg.sender]==false);
        key_1[msg.sender]=_totalsupply;
        status[msg.sender]=true;
        return key_1[msg.sender];
    }
    function Transfer(address to,uint256 transamount)public returns(uint256,uint256)
    {
        require(transamount<=key_1[msg.sender]);
        key_1[msg.sender]=key_1[msg.sender].sub(transamount);
        key_1[to]=key_1[to].add(transamount);
        return (key_1[msg.sender],key_1[to]);
       
    }
    function BalanceOf(address a)public constant returns(uint256)
    {
         return key_1[a];
    }
    function Approve(address spender,uint256 spendersamount)public returns(string,uint256)
    {
        require(spendersamount<=key_1[msg.sender]);
        key_2[msg.sender][spender]+=key_2[msg.sender][spender].add(spendersamount);
        return ("Approved Amount",key_2[msg.sender][spender]);
    }
    function Allowance(address spender)public constant returns(uint256)
    {
        return key_2[msg.sender][spender];
    }
    function TransferFrom(address spender,address to,uint256 amount)public returns(uint256)
    {
        require(amount<=key_1[msg.sender]&&amount<=key_2[msg.sender][spender]);
        
        key_1[msg.sender]=key_1[msg.sender].sub(amount);
        key_2[msg.sender][spender]=key_2[msg.sender][spender].sub(amount);
        key_1[to]=key_1[to].add(amount);
        return key_2[msg.sender][spender];
    }
}
