// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SelectorFunc {
    //平方
    function square(uint256 x) public pure returns (uint256) {
        return x * x;
    }

    // 翻倍
    function double(uint256 x) public pure returns (uint256) {
        return x * 2;
    }

    // 1.函数类型：在 Solidity 中，函数不仅是合约行为的基本单位，也是一种特殊的值类型。函数类型可用于变量声明、作为参数传递和返回值。
    // 然而，与其他类型不同，函数类型在某些场景下的使用受到限制，特别是在 ABI 编码时。

    //    2. 函数选择器的概念与生成
    // 函数选择器是通过对函数签名（函数名及其参数类型）进行 Keccak256 哈希计算，并截取前 4 个字节生成的唯一标识符。它用于识别和调用特定函数
    bytes4 selector = bytes4(keccak256("square(uint)"));
    // Solidity 内置获取函数选择器的方法
    bytes4 selector1 = this.square.selector;

    // 3. 函数类型变量的声明与使用
    // 声明函数类型变量：函数类型变量可以存储指向合约内函数的指针。
    // function func(uint) external returns (uint) ;

    //     函数类型作为返回值：
    // Solidity 不支持直接返回函数类型值，但可以通过返回函数选择器或利用接口实现类似效果。
    function getDoubleSelector() external pure returns (bytes4) {
        // return bytes4(keccak256("double(uint)")); // 返回函数double的选择器
        return this.double.selector;
    }

    function getSquareSelector() external pure returns (bytes4) {
        // return bytes4(keccak256("square(uint)")); // 返回函数square的选择器
        return this.square.selector;
    }

    //     注意事项：
    // 函数类型变量的传递与返回可能会受到 ABI 编码器的限制，通常使用函数选择器代替。
    // 函数类型变量不能直接作为参数进行传递和返回，通常需要配合低级 call 来实现动态调用。
    function execute(bytes4 selector, uint x) external returns (uint z) {
        (bool success, bytes memory data) = address(this).call(
            abi.encodeWithSelector(selector, x)
        );
        require(success, "Call failed");
        z = abi.decode(data, (uint256));
    }

    
}
