// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SelectorTask {
    bytes4 public storedSelector;

    function double(uint256 x) public pure returns (uint256) {
        return x * 2;
    }

    function square(uint256 x) public pure returns (uint256) {
        return x * x;
    }

    function getDoubleSelector() external pure returns (bytes4) {
        return this.double.selector;
    }

    function getSquareSelector() external pure returns (bytes4) {
        return this.square.selector;
    }

    function executeFunction(bytes4 selector, uint256 x)
        public
        returns (uint256)
    {
        (bool success, bytes memory data) = address(this).call(
            abi.encodeWithSelector(selector, x)
        );
        require(success, "Function call failed");
        return abi.decode(data, (uint256));
    }

    function storeSelector(bytes4 selector) public {
        storedSelector = selector;
    }

    function executeStoredFunction(uint256 x) public returns (uint256) {
        require(storedSelector != bytes4(0), "Selector not set");
        (bool success, bytes memory data) = address(this).call(
            abi.encodeWithSelector(storedSelector, x)
        );
        require(success, "Function call failed");
        return abi.decode(data, (uint256));
    }
}
