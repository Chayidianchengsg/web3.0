// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.26;



contract AddressTest {
    // address 是一个 20 字节（160 位）的值，代表以太坊区块链上的一个账户地址
    address myAddress1 = 0x1234567890123456789012345678901234567890;
    address myAddress2 = msg.sender;  // 当前合约调用者的地址

    //address 属性
    // 1.balance  获取地址的以太坊余额（单位为 wei）。

    uint256 balance = myAddress2.balance; // 获取地址余额（单位：wei）

    // 2.transfer()  将以太币转移到另一个地址，推荐使用这种方法。
    address payable recipient = payable(0x1234567890123456789012345678901234567890);
    recipient.transfer(1 ether);  // 转移 1 ETH

    // 3.send() 方法转移以太币，返回布尔值表示转移是否成功。由于没有自动回退机制，不推荐使用。
    bool success = recipient.send(1 ether);
    require(success, "Transfer failed.");


    // 4.call() 进行低级别调用，讨论其安全性问题以及与 send() 和 transfer() 的区别。
    (bool success,) = recipient.call{value:1 ether}("")
    require(success, "Transfer failed.")

    // address 和 address payable 的区别:
    // address payable 是可以接收以太币的地址类型。address 类型不能直接发送以太币，必须显式转换为 address payable。

    address myAddress3 = 0x1234567890123456789012345678901234567890;
    address payable payableAddress = payable(myAddress3);

    // 白名单
    mapping (address => bool) whitelist;

    function addToWhiteList(address _address)  returns (bool) {
        return whitelist[_address] = true;
    }

    function isWhiteList(address _address) public view returns (bool) {
        return isWhiteList[_address];
    }

    // 授权支付合约
    function pay( address payable recipient) public payable {
        recipient.transfer(msg.value);
    }


    //安全性考虑:处理 address 时的安全问题，如避免重入攻击。

    function withdraw(uint256 amount) public{
        require(balance[msg.sender] > amount, "Insufficient balance.");
        //更新余额
        balance[msg.sender] -= amount;

        //转账
        (bool success,) = msg.sender.call{value: amount}("")
        require(success,"Transfer failed.")
    }

    //存款和取款合约
    contract SimpleWallet {
        mapping(address => uint256) public balance;

        function deposit() public payable{
             balance[msg.sender] += msg.value;
        }

        function withdraw(uint256 amount) public {
            require(balance[msg.sender] > amount, "Insufficient balance.");
            balance[msg.sender] += amount;
            payable(msg.sender).transfer(amount);
        }

        function checkBalance() public returns(uint256){
            return balance[msg.sender];
        }
    }

}