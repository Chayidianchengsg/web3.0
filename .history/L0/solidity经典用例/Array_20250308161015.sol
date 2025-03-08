// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ArrayTask {
    //  静态数组  长度固定，数组的大小在定义时确定，之后无法改变。
    uint256[2] tens;
    uint256[3] public adaArr = [1, 15, 20];

    // 动态数组  长度可变，可以根据需要动态调整
    uint256[] many;
    uint256[] public m = [1, 2, 3, 4, 5, 67, 8];

    // 动态数组可以使用 new 关键字在内存中创建，大小基于运行时确定。
    // new uint[6];
    // new string[4];
    // 数据的内存（memory）与存储（storage）
    // 存储
    // uint [] public storaArray = [1,2,3,6];
    // storaArray.push(5);
    // 内存
    function manipulateArray() public returns (uint256[] memory) {
        uint256[] memory temArray = new uint256[](3);
        temArray[0] = 10;
        return temArray;
    }
}
