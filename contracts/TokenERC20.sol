pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DevToken is ERC20{
    mapping(address => uint) public balance;
    constructor() ERC20("DevToken", "DVT"){
        _mint(msg.sender, 1000000);
    }
    
        
    function buyToken (address recipient) public payable{
    uint amount;
    amount= msg.value;

    uint tokenAmount = (amount /(10**18) ) * 1000; //token equivalent of amount
    //1000 tokens equals 1eth

    _mint(recipient, tokenAmount *(10**18));

    }

}


