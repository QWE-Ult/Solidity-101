// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Team {

    int[16] public teamPlayers;

    function initializeTeam() public {
        for (uint i = 0; i < teamPlayers.length; i++) {
            teamPlayers[i] = -1;
        }
    }

    function getTeamPlayers() public view returns (int[16] memory) {
      return teamPlayers;
    }

    function selectJerseyNumber(uint jerseyNumber) public view returns (int) {
        require (jerseyNumber<16,"invalid Jersey Number");
        return teamPlayers[jerseyNumber];
     }

     function addPlayer(int playerAddress, uint jerseyNumber) public {
        require (jerseyNumber<16,"invalid Jersey Number");
        require(teamPlayers[jerseyNumber] == -1, "Jersey number already taken.");
    teamPlayers[jerseyNumber] = playerAddress;
    }

     function removePlayer(uint jerseyNumber) public {
         require(jerseyNumber < 16, "Invalid jersey number.");
    require(teamPlayers[jerseyNumber] != -1, "No player in this jersey number.");
     teamPlayers[jerseyNumber] = -1;
     }

     function updatePlayerAddress(int newAddress, uint jerseyNumber) public {
          require(jerseyNumber < 16, "Invalid jersey number.");
           require(teamPlayers[jerseyNumber] != -1, "No player to update.");
    teamPlayers[jerseyNumber] = newAddress; 
     }
}

