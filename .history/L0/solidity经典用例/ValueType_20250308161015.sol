// 值类型
// 布尔类型
// 整形
// 定长浮点型
// 定长字节数组
// 有理数合整型常亮
// 字符串常量
// 枚举
// 函数类型
// 地址类型
// 地址常量

// 引用类型
// SPDX-License-dentifier: MIT
pragma solidity 0.8.20;

contract ValueType {

    bool public isActive = true;

    function toggleActive () public {
        isActive = !isActive;
    }
    int8 signedInt = 32;
    uint uInt = 32;
    //定长浮点型
    int256 fixedByle = 0x12;

    // 有理数常亮
    uint256 integer = 1234;
     uint256  rationalLiteral = 1.5 * 1e15; // 1.5  以太

    //  字符常量
    string greeting = "hello";

    // 枚举
    // enum Status {Pengding, Shipped}

    // Status public currentStatus;

    // function setStatus(Status _status){
    //     currentStatus = _status;
    // }

    // 地址类型
    address owner = msg.sender;

    // 地址常量

    // address constant fixedAddress = 

    int8 a = -1;
    int16 b = 2;
    uint32 c = 10;
    uint8 d = 16;
    function add(uint x, uint y) public pure returns(uint z){
        return z = x + y;
    }
    function divide(uint x, uint y) public pure returns(uint z){
        z = x / y;
    } 

    function shiftLeft(int x, uint y) public pure returns(int z){
        z = x << y;
    }
     function shiftRight(int x, uint y) public pure returns(int z){
        z = x >> y;
    }

}