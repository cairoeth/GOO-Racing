// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;                     

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
contract Racing {

    /*//////////////////////////////////////////////////////////////
                                 EVENTS
    //////////////////////////////////////////////////////////////*/

    event TeamCreated(TeamAttributes attributes, uint64 TeamId);

    event TeamDeleted(uint64 TeamId);

    event JoinedRace(uint64 TeamId, uint256 bet);

    event StartedRace(uint64[] racers, uint256[] bets);

    event FinishedRace(uint64[] leaderboard);

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
                             CIRCUIT STORAGE
    //////////////////////////////////////////////////////////////*/

    struct ExternalFactors {
        uint8 Weather;  // Precipitation level as how many days it rains per year (0, 33: Low | 33, 66: Medimum | 66, 100: High)
        uint8 Crashes;  // Safest level (0, 33: Low | 33, 66: Medimum | 66, 100: High)
        uint16 Full_Throttle;  // Full throttle in % (0, 33: Low | 33, 66: Medimum | 66, 100: High)
        uint8 Downforce;  // Downforce level (33: Low | 66: Medimum | 100: High)
        uint16 Top_Speed;  // Top Speed in km/h
    }

    ExternalFactors[] public circuits;

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
    
    uint64[] racers;

    uint256[] bets;

    constructor() {
        // Data from https://www.racefans.net

        // Bahrain = 0
        circuits.push(ExternalFactors(2, 8, 72, 66, 330));

        // Saudi Arabia = 1
        circuits.push(ExternalFactors(1, 66, 79, 66, 330));

        // Australia = 2
        circuits.push(ExternalFactors(25, 5, 70, 80, 310));

        // China = 3
        circuits.push(ExternalFactors(33, 25, 54, 90, 348));

        // Azerbaijan = 4
        circuits.push(ExternalFactors(13, 70, 75, 66, 337));

        // Miami = 5
        circuits.push(ExternalFactors(39, 40, 70, 70, 296));

        // Emilia Romagna = 6
        circuits.push(ExternalFactors(21, 60, 79, 40, 296));

        // Monaco = 7
        circuits.push(ExternalFactors(17, 66, 59, 90, 290));

        // Spain = 8
        circuits.push(ExternalFactors(15, 30, 70, 66, 322));

        // Canada = 9
        circuits.push(ExternalFactors(45, 35, 76, 66, 316));

        // Austria = 10
        circuits.push(ExternalFactors(26, 15, 79, 40, 327));

        // United Kingdom = 11
        circuits.push(ExternalFactors(32, 60, 70, 70, 330));

        // Hungary = 12
        circuits.push(ExternalFactors(21, 15, 50, 80, 315));

        // Belgium = 13
        circuits.push(ExternalFactors(58, 50, 70, 50, 320));

        // Netherlands = 14
        circuits.push(ExternalFactors(36, 20, 70, 50, 309));

        // Italy = 15
        circuits.push(ExternalFactors(33, 50, 84, 30, 350));

        // Signapore = 16
        circuits.push(ExternalFactors(46, 75, 50, 66, 323));

        // Japan = 17
        circuits.push(ExternalFactors(31, 55, 66, 85, 328));

        // Qatar = 18
        circuits.push(ExternalFactors(2, 30, 68, 60, 321));

        // USA (Austin) = 19
        circuits.push(ExternalFactors(24, 15, 59, 50, 325));

        // Mexico = 20
        circuits.push(ExternalFactors(34, 45, 45, 40, 349));

        // Brazil = 21
        circuits.push(ExternalFactors(29, 70, 64, 80, 331));

        // Las Vegas = 22 (predicted)
        circuits.push(ExternalFactors(7, 50, 70, 66, 335));

        // Abu Dhabi = 23
        circuits.push(ExternalFactors(0, 25, 63, 80, 339));
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
                                RACES
    //////////////////////////////////////////////////////////////*/

    function joinRace(uint256 bet) public onlyPrincipal onlyWhenWaiting {
        uint64 team = AddressToTeam[msg.sender]; 

        // Add team ID to the list of current racers.
        racers.push(team);

        // Store bet amount
        bets.push(bet);

        emit JoinedRace(team, bet);

        // Run race when it is full.
        if (racers.length == 5) {
            runRace();
        }
    }

    function runRace() internal {
        emit StartedRace(racers, bets);
        // START RACE


    }

    /*//////////////////////////////////////////////////////////////
                                HELPERS
    //////////////////////////////////////////////////////////////*/

    modifier onlyPrincipal() {
        require(AddressToTeam[msg.sender] != 0, "NOT_A_PRINCIAPL");

        _;
    }

     modifier onlyWhenWaiting() {
        require(state == State.WAITING, "RACE_IS_ACTIVE");

        _;
    }

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

    function _checkAttribute(uint8 _attribute) internal pure {
        if (_attribute < 1 || _attribute > 10) {
            revert("Invalid attribute.");
        }
    }
    
}
