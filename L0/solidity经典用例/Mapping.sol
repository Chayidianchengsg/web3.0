// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingExample {
    mapping(uint256 => string) idName;
    mapping(address => uint256) public balances;
    mapping(address => uint256) public userLevel;

    // mapping(address => uint256) public balances;

    // function update(uint256 newBalance) public {
    //     balances[msg.sender] = newBalance;
    // }

    function update(uint256 newBalance) public {
        balances[msg.sender] = newBalance;
    }
}

contract MappingUser {
    function f() public returns (uint256) {
        MappingExample m = new MappingExample();
        m.update(100);
        return m.balances(address(this));
    }
}

contract PointsSystem {
    mapping(address => uint256) public points;
    address[] public users;

    function addUsers(address _user) public {
        require(points[_user] == 0, "User already exists");
        users.push(_user);
        points[_user] = 100;
    }

    function TransferPoint(address _to, uint256 _amount) public {
        require(points[msg.sender] > _amount, "Insufficient points");
        points[msg.sender] -= _amount;
        points[_to] += _amount;
    }

    function getAllUser() public view returns (address[] memory) {
        return users;
    }
}
