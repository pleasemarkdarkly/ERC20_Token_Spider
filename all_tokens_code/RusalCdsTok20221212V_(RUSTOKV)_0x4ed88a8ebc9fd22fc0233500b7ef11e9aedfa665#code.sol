//token_name	RusalCdsTok20221212V_(RUSTOKV)
//token_url	https://etherscan.io//address/0x4ed88a8ebc9fd22fc0233500b7ef11e9aedfa665#code
//spider_time	2018/07/08 12:00:22
//token_Transactions	2 txns
//token_price	

pragma solidity 		^0.4.21	;						
									
contract	RusalCdsTok20221212V				{				
									
	mapping (address => uint256) public balanceOf;								
									
	string	public		name =	"	RusalCdsTok20221212V		"	;
	string	public		symbol =	"	RUSTOKV		"	;
	uint8	public		decimals =		18			;
									
	uint256 public totalSupply =		289393720156273000000000000					;	
									
	event Transfer(address indexed from, address indexed to, uint256 value);								
									
	function SimpleERC20Token() public {								
		balanceOf[msg.sender] = totalSupply;							
		emit Transfer(address(0), msg.sender, totalSupply);							
	}								
									
	function transfer(address to, uint256 value) public returns (bool success) {								
		require(balanceOf[msg.sender] >= value);							
									
		balanceOf[msg.sender] -= value;  // deduct from sender's balance							
		balanceOf[to] += value;          // add to recipient's balance							
		emit Transfer(msg.sender, to, value);							
		return true;							
	}								
									
	event Approval(address indexed owner, address indexed spender, uint256 value);								
									
	mapping(address => mapping(address => uint256)) public allowance;								
									
	function approve(address spender, uint256 value)								
		public							
		returns (bool success)							
	{								
		allowance[msg.sender][spender] = value;							
		emit Approval(msg.sender, spender, value);							
		return true;							
	}								
									
	function transferFrom(address from, address to, uint256 value)								
		public							
		returns (bool success)							
	{								
		require(value <= balanceOf[from]);							
		require(value <= allowance[from][msg.sender]);							
									
		balanceOf[from] -= value;							
		balanceOf[to] += value;							
		allowance[from][msg.sender] -= value;							
		emit Transfer(from, to, value);							
		return true;							
	}								
}