pragma solidity 0.8.26;

contract ContractType {
    // 1.Solidity 中使用 contract 关键字定义合约，类似于其他编程语言中的类。

    function sayHello() public {
        //合约中成员
    }

    //可支付回退函数
    receive() external payable {
        //
    }

    //2.this 在合约内部可以使用 this 关键字表示当前合约，并可以将其显式转换为 address 类型。
    function getAddress() public view returns (address) {
        return address(this);
    }

    //3. selfdestruct  函数销毁合约，同时将合约中的以太币发送到指定地址。
    function destroyContract(address payable recipient) public {
        selfdestruct(recipient); // 销毁合约并发送以太币
    }

    // 5. 通过 extcodesize 操作码判断一个地址是否为合约地址。
    function isContract(address addr) public view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(addr)
        } // 获取地址的代码大小
        return size > 0; // 大于 0 说明是合约地址
    }
}

//4.Solidity 0.6 版本开始，可以通过 type(C) 获取合约的类型信息
// contract Hello {
//     function getContractInfo() public pure returns (string memory, bytes memory, bytes memory) {
//         return (type(Hello).name, type(Hello).creationCode, type(Hello).runtimeCode);
//     }
// }
// type(Hello).name: 获取合约的名字。
// type(Hello).creationCode: 获取创建合约的字节码。
// type(Hello).runtimeCode: 获取合约运行时的字节码。

// 6.在合约外部，可以使用 Web3.js 的 getCode 方法判断地址类型。
// web3.eth.getCode("0x1234567890123456789012345678901234567890").then(console.log);
