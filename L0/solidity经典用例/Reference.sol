// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract DataHandling {
    uint256[] public data; // 存储在storage中的动态数组

    // 将memory中的数组内容复制到storage中的data数组
    function updateData(uint256[] memory newData) public {
        data = newData; // 从memory到storage的赋值，创建了独立的拷贝
    }

    // 返回storage中的data数组
    function getData() public view returns (uint256[] memory) {
        return data; // 返回storage中的数据作为memory中的数组
    }

    // 修改storage中的data数组中指定索引位置的值
    function modifyStorageData(uint256 index, uint256 value) public {
        require(index < data.length, "Index out of bounds");
        data[index] = value; // 修改storage中的值，开销较大
    }

    // 尝试修改传入的memory数组，并返回修改后的数组
    function modifyMemoryData(uint256[] memory memData)
        public
        pure
        returns (uint256[] memory)
    {
        if (memData.length > 0) {
            memData[0] = 999; // 修改memory中的值，开销较小
        }
        return memData; // 返回修改后的memory数组
    }
}
