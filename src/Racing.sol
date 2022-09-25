// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import './Helpers.sol';                            

// ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣶⠶⠶⣶⣦⣄⠀⠀⠀⣀⣠⣤⣴⣶⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
// ⠀⠀⠀⠀⠀⠀⠀⣠⣶⠟⠋⠁⠀⠀⠀⠀⠀⠙⢷⣦⠟⠋⠉⠀⠀⠀⠈⠙⢿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
// ⠀⠀⠀⠀⠀⢀⣾⠋⠁⠀⢀⣤⠶⠚⠛⠛⠳⠶⣤⣙⣧⣀⠀⠀⣀⣀⣀⠀⠀⠙⢿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
// ⠀⠀⠀⠀⢠⡿⠁⠀⠀⠰⠋⠀⠀⠀⠀⣀⣠⣤⣬⣽⣿⣿⠉⠀⠀⠀⢈⣉⣉⣑⣊⣻⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
// ⠀⠀⠀⢀⡿⠁⠀⠀⠀⠀⠀⣀⣴⠶⠛⠋⠉⠀⠀⠈⠉⠉⠻⣶⠶⠞⠛⠉⠉⠉⠉⠍⠛⠻⣇⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
// ⠀⠀⡠⢋⠇⠀⠀⠀⠀⢰⠟⠋⠁⠀⠀⠀⠀⠀⣾⣿⣶⡆⠀⢻⡄⠀⠀⠀⠀⢸⣶⣶⣤⠀⠸⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
// ⣰⠞⠀⠀⠀⠀⠀⠀⠀⠸⠷⣶⣄⡀⠀⠀⠀⠀⠻⠿⠟⠀⢀⣼⠃⠀⠀⠀⠀⠘⠿⠾⠛⠀⣰⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
// ⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣽⣷⣶⣤⣤⣤⣤⣶⣾⣿⡿⠛⠓⠲⠶⠶⠶⠖⠶⠾⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
// ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⣩⣿⠟⠋⠀⠀⠰⣦⣀⣀⣀⣀⣠⣴⡟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
// ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⠛⠉⠀⠀⠀⠀⠀⠀⠈⠻⣇⠀⠀⠀⠹⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
// ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣯⣤⣤⣤⣤⣾⣿⣤⣤⣀⡀⠀⠀⢀⣀⣤⣤⣀⣀⡀⠀⠀⠀
// ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⡶⢿⡛⠛⠛⠷⠶⣤⣤⣀⣀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⡁⠀⠀⠀⠈⢻⣄⣀⡀
// ⠀⠀⠀⠀⠀⠀⠀⠀⢸⣟⣀⠘⠛⠛⠳⠶⠦⠤⣬⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠉⠉⠙
// ⡆⠀⠀⠀⠀⠀⠀⢶⣌⠛⠿⠿⠛⠻⠶⠶⣤⣾⣿⣿⣿⣿⣿⣿⣿⠟⠛⠛⠛⠋⠉⣉⣿⠟⠉⠉⣿⠿⢿⣿⡇⠀⠀⠀⠀⢀⡖⠀⠀⠀
// ⣿⣦⣀⠀⠀⠀⠀⠀⠉⠛⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⠿⠋⠁⠀⠉⠉⣉⣽⡿⠟⠋⠀⠀⠀⢠⣿⠀⢀⡿⠀⠀⠀⠀⢠⡞⠀⠀⠀⠀
// ⠈⠻⢿⣿⣿⣓⡶⠶⢤⣄⣀⣀⠀⣰⣿⣿⣿⣿⣿⡟⠁⠀⠀⣀⣤⣶⡾⠛⠁⠀⠀⠀⠀⠀⠀⠘⣿⠀⠈⠷⡀⠀⣠⠶⠋⠀⠀⠀⣠⠞
// ⠀⠀⠀⠈⠉⠛⠻⠿⠷⣶⣾⣿⣿⣿⣿⣿⣿⣿⣯⣭⣵⡶⠿⢛⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⠷⣦⣄⠉⠻⣇⠀⠀⠀⣠⠞⠀⠀
// ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⣿⣿⣿⡟⠉⠉⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡴⠟⠓⣶⠋⠁⠀⠀⣀
// ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠘⠓⠳⣾⣿⣿
// ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⠁⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⣿⣿⣿
// ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
// ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
// ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠿⠿⢿⣿⠿⠿⢿⢿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠿⠿⠿⠿⠿⠿⠿⣿⣿⣿

/**
 * @title GOO Racing: A dynamic on-chain racing game
 * @author cairoeth <cairo@gradient.city>
 * @dev Contract that allows to create, store and manage racing teams.
 **/
contract Teams is Helpers {

    /*//////////////////////////////////////////////////////////////
                                 EVENTS
    //////////////////////////////////////////////////////////////*/

    event TeamCreated(TeamAttributes attributes, uint64 TeamId);

    event TeamDeleted(uint64 TeamId);

    /*//////////////////////////////////////////////////////////////
                         MISCELLANEOUS CONSTANTS
    //////////////////////////////////////////////////////////////*/

    uint256 public participationFee = 0;

    uint64 private teamCounter = 0;

    uint64 public startELO = 1200;

    /*//////////////////////////////////////////////////////////////
                               RACE STATE
    //////////////////////////////////////////////////////////////*/

    enum State {
        WAITING,
        ACTIVE,
        DONE
    }

    State public state; // The current state of the race: waiting for players, started, done.

    uint72 public entropy; // Random data used to choose the next turn.

    /*//////////////////////////////////////////////////////////////
                             TEAMS STORAGE
    //////////////////////////////////////////////////////////////*/

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
        uint64 ELO;
    }

    mapping(address => uint64) public AddressToTeam;

    mapping(uint64 => TeamAttributes) public TeamToAttributes;

    uint64[] public teams;

    constructor() {

    }

    /*//////////////////////////////////////////////////////////////
                            TEAM MANAGEMENT
    //////////////////////////////////////////////////////////////*/

    function createTeam(uint8 _reliability, uint8 _pitstops, uint8 _speed, uint8 _drivers, uint8 _strategy, uint8 _cornering, uint8 _luck, uint8 _car_balance, uint8 _staff, uint8 _aerodynamics) external {
        // Only one team per address.
        require(AddressToTeam[msg.sender] == 0, 'ALREADY_TEAM');

        // Combine all the given team attributes.
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
            Principal: msg.sender,
            ELO: startELO
        });

        // Verify the given attributes are valid.
        _verifyAttributes(_TeamAttributes);

        // Increase team count (using as ID).
        ++teamCounter;

        // Add team ID to the list of active teams.
        teams.push(teamCounter);

        // Configure mappings with team attributes and principal address.
        AddressToTeam[msg.sender] = teamCounter;
        TeamToAttributes[teamCounter] = _TeamAttributes;

        emit TeamCreated(_TeamAttributes, teamCounter);
    }

    function upgradeTeam(TeamAttributes memory _attributes) external {
        // TODO: Add mechanic fee
        // Verify sender is the principal of a team.
        require(AddressToTeam[msg.sender] != 0, 'NO_TEAM');

        // Verify given team attributes.
        _verifyAttributes(_attributes);

        // Update team attributes.
        TeamToAttributes[AddressToTeam[msg.sender]] = _attributes;
    }

    /*//////////////////////////////////////////////////////////////
                                 HELPERS
    //////////////////////////////////////////////////////////////*/

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
