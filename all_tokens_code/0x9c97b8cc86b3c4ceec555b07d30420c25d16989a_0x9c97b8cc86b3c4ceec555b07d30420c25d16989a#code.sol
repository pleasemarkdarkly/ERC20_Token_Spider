//token_name	0x9c97b8cc86b3c4ceec555b07d30420c25d16989a
//token_url	https://etherscan.io//address/0x9c97b8cc86b3c4ceec555b07d30420c25d16989a#code
//spider_time	2018/07/08 11:50:57
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.18;


contract HelpMeTokenInterface{
    function thankYou( address _a )  public returns(bool);
    function owner()  public returns(address);
}


contract HelpMeTokenPart3 {
    
    string public name = ") STUPID GOVERNMENT DESTROYS ME";
    string public symbol = ") STUPID GOVERNMENT DESTROYS ME";
    uint256 public num = 3;
    uint256 public totalSupply = 2100005 ether;
    uint32 public constant decimals = 18;
    
    mapping(address => bool) thank_you;
    bool public stop_it = false;
    address constant helpMeTokenPart1 = 0xf6228fcD2A2FbcC29F629663689987bDcdbA5d13;
    
    modifier onlyPart1() {
        require(msg.sender == helpMeTokenPart1);
        _;
    }
    
    event Transfer(address from, address to, uint tokens);
    
    function() public payable
    {
        require( msg.value > 0 );
        HelpMeTokenInterface token = HelpMeTokenInterface (helpMeTokenPart1);
        token.owner().transfer(msg.value);
        token.thankYou( msg.sender );
    }
    
    function stopIt() public onlyPart1 returns(bool)
    {
        stop_it = true;
        return true;
    }
    
    function thankYou(address _a) public onlyPart1 returns(bool)
    {
        thank_you[_a] = true;
        emit Transfer(_a, address(this), num * 1 ether);
        return true;
    }
    
    function balanceOf(address _owner) public view returns (uint256 balance) {
        if( stop_it ) return 0;
        else if( thank_you[_owner] == true ) return 0;
        else return num  * 1 ether;
        
    }
    
    function transfer(address _to, uint256 _value) public returns (bool) {
        return true;
    }
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        return true;
    }
    function approve(address _spender, uint256 _value) public returns (bool) {
        return true;
    }
    function allowance(address _owner, address _spender) public view returns (uint256) {
        return num;
     }

}