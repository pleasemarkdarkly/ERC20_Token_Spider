//token_name	
//token_url	https://etherscan.io//address/0x7030c996b2dbdf59677b7c037aba78417d0f6e3d#code
//spider_time	2018/07/08 11:20:45
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.22;


contract Authority {
    function canCall(
        address src,
        address dst,
        bytes4  sig
    ) public pure returns (bool) {
        require(dst == 0x03cc979C46B030c4ABd7D4063CD075cB38Cd0919);

        if (src == 0x5bAa39204292f844Fd6D76b2c199611446687906)
            return true;

        if (sig == 0xa0605792 || sig == 0xeca771a2) {
            if (src == 0x7f2b654f7D4258F2F01b105ddaA2a26F8843B18b)
                return true;
        }

        return false;
    }
}