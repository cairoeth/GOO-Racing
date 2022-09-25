// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import './Helpers.sol';

/**
 * @title GOO Racing contract
 * @author cairoeth
 * @dev Contract that allows to create, store and manage racing teams.
 **/
contract Teams is Helpers {
    uint256 public participationFee = 0;
    uint64 private teamCounter = 0;
    uint64 public startELO = 1200;

    struct TeamAttributes {
        uint8 Reliability;
        uint8 Pitstops;
        uint8 Speed;
        uint8 Drivers;
        uint8 Strategy;
        uint8 Cornering;
        uint8 Luck;
        uint8 Car_balance;
        uint8 Staff;
        uint8 Aerodynamics;
        address Principal;
    }

    mapping(address => uint64) public AddressToTeam;
    mapping(uint64 => TeamAttributes) public TeamToAttributes;
    mapping(uint64 => uint64) public TeamToELO;

    event TeamCreated(TeamAttributes attributes, uint64 TeamId);
    event TeamDeleted(uint64 TeamId);

    constructor() {

    }

    /**
    * @notice Creates a racing team with the given attributes,
    * @param _reliability reliability of cars,
    * @param _pitstops reliablity and speed of race pitstops,
    * @param _speed maximum top speed of cars,
    * @param _drivers drivers' skill,
    * @param _strategy tyre and pitstops strategy,
    * @param _cornering cornering grip and speed,
    * @param _luck how luck a team is,
    * @param _car_balance how balanced the car is to prevent crashes,
    * @param _staff team staff.
    * @param _aerodynamics aerodynamics of cars.
    **/
    function createTeam(uint8 _reliability, uint8 _pitstops, uint8 _speed, uint8 _drivers, uint8 _strategy, uint8 _cornering, uint8 _luck, uint8 _car_balance, uint8 _staff, uint8 _aerodynamics) public {
        // Only one team per address.
        require(AddressToTeam[msg.sender] == 0);

        TeamAttributes memory _TeamAttributes = TeamAttributes({
            Reliability: _reliability,
            Pitstops: _pitstops,
            Speed: _speed,
            Drivers: _drivers,
            Strategy: _strategy,
            Cornering: _cornering,
            Luck: _luck,
            Car_balance: _car_balance,
            Staff: _staff,
            Aerodynamics: _aerodynamics,
            Principal: msg.sender
        });

        _verifyAttributes(_TeamAttributes);

        ++teamCounter;

        TeamToELO[teamCounter] = startELO;
        AddressToTeam[msg.sender] = teamCounter;
        TeamToAttributes[teamCounter] = _TeamAttributes;

        emit TeamCreated(_TeamAttributes, teamCounter);
    }

    /**
    * @notice Deletes a racing team owned by the sender.
    * @param _TeamId Team ID
    **/
    function deleteTeam(uint64 _TeamId) public {
        require(TeamToAttributes[_TeamId].Principal == msg.sender, "Sender is not team owner");
        AddressToTeam[msg.sender] = 0;
        delete TeamToAttributes[_TeamId];
    }

    /**
    * @notice Upgrades a team's attributes by paying a mechanic fee.
    * @param _TeamId Team ID
    **/
    function upgradeTeam(uint64 _TeamId, TeamAttributes memory _attributes) public {
        // Check that team exists
        require(TeamToAttributes[_TeamId].Principal == msg.sender, "Sender is not team owner");
        _verifyAttributes(_attributes);

        TeamToAttributes[_TeamId] = _attributes;
    }

    /**
    * @notice Verify a team's attributes.
    * @param _attributes Team attributes
    **/
    function _verifyAttributes(TeamAttributes memory _attributes) internal pure {
        _checkAttribute(_attributes.Reliability);
        _checkAttribute(_attributes.Pitstops);
        _checkAttribute(_attributes.Speed);
        _checkAttribute(_attributes.Drivers);
        _checkAttribute(_attributes.Strategy);
        _checkAttribute(_attributes.Cornering);
        _checkAttribute(_attributes.Luck);
        _checkAttribute(_attributes.Car_balance);
        _checkAttribute(_attributes.Staff);
        _checkAttribute(_attributes.Aerodynamics);

        uint8 sum_of_attributes = _attributes.Reliability + _attributes.Pitstops + _attributes.Speed + _attributes.Drivers + _attributes.Strategy + _attributes.Cornering + _attributes.Luck + _attributes.Car_balance + _attributes.Staff + _attributes.Aerodynamics;
        
        if (sum_of_attributes < 10 || sum_of_attributes > 50) {
            revert("Invalid sum of attributes.");
        }
    }
}
