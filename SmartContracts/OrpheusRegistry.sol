// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrpheusRegistry {
    struct Discovery {
        string title;
        string description;
        uint timestamp;
        address author;
    }

    mapping(bytes32 => Discovery) public discoveries;

    event DiscoveryRegistered(bytes32 indexed id, string title, address author, uint timestamp);

    function registerDiscovery(string memory _title, string memory _description) public {
        bytes32 id = keccak256(abi.encodePacked(_title, msg.sender, block.timestamp));
        discoveries[id] = Discovery(_title, _description, block.timestamp, msg.sender);
        emit DiscoveryRegistered(id, _title, msg.sender, block.timestamp);
    }

    function getDiscovery(bytes32 _id) public view returns (string memory, string memory, uint, address) {
        Discovery memory d = discoveries[_id];
        return (d.title, d.description, d.timestamp, d.author);
    }
}
