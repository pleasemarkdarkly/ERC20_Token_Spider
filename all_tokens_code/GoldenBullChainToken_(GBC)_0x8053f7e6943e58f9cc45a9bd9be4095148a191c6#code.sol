//token_name	GoldenBullChainToken_(GBC)
//token_url	https://etherscan.io//address/0x8053f7e6943e58f9cc45a9bd9be4095148a191c6#code
//spider_time	2018/07/08 11:51:34
//token_Transactions	4 txns
//token_price	

pragma solidity ^0.4.21;

contract SafeMath {
    function safeSub(uint a, uint b) pure internal returns (uint) {
        assert(b <= a);
        return a - b;
    }

    function safeAdd(uint a, uint b) pure internal returns (uint) {
        uint c = a + b;
        assert(c >= a && c >= b);
        return c;
    }
}


contract ERC20 {
    uint public totalSupply;
    function balanceOf(address who) public constant returns (uint);
    function allowance(address owner, address spender) public constant returns (uint);
    function transfer(address toAddress, uint value) public returns (bool ok);
    function transferFrom(address fromAddress, address toAddress, uint value) public returns (bool ok);
    function approve(address spender, uint value) public returns (bool ok);
    event Transfer(address indexed fromAddress, address indexed toAddress, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}


contract StandardToken is ERC20, SafeMath {
    mapping (address => uint) balances;
    mapping (address => mapping (address => uint)) allowed;

    function transfer(address _to, uint _value) public returns (bool success) {
        balances[msg.sender] = safeSub(balances[msg.sender], _value);
        balances[_to] = safeAdd(balances[_to], _value);
        Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
        var _allowance = allowed[_from][msg.sender];

        balances[_to] = safeAdd(balances[_to], _value);
        balances[_from] = safeSub(balances[_from], _value);
        allowed[_from][msg.sender] = safeSub(_allowance, _value);
        Transfer(_from, _to, _value);
        return true;
    }

    function balanceOf(address _owner) public constant returns (uint balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public constant returns (uint remaining) {
        return allowed[_owner][_spender];
    }

}


contract GoldenBullChainToken is StandardToken {
    string public name = "GoldenBullChainToken";
    string public symbol = "GBC";
    uint public decimals = 18;
    uint public totalSupply = 120 * 1000 * 1000 ether;

    function GoldenBullChainToken() public {
        balances[msg.sender] = totalSupply;
    }
}