//
//  File Name: Player.swift
//  Project: Mafia-Moderator
//  Description: Classes for each player and static game settings
//  Author: Tiffany Nguyen
//  Creation Date: 12/12/22.
//

import UIKit

class Player: NSObject {
    var name: String=""
    var role: String="" //Mafia, Nurse, Detective, or Civilian
    var teamMafia: Bool=false //true = mafia team, false = civilian team
    var alive: Bool=true
    
    init(name: String){
        self.name = name
    }
}

class gameSetting: NSObject {
    static var numOfCivilian: Int=0
    static var numOfMafia: Int=0
    static var numOfDetective: Int=0
    static var numOfNurse: Int=0
    static var numOnTeamTown: Int=0
    static var numOfPlayers: Int=0
    
    static var playerList: [Player]=[]
    static var alivePlayerList: [Player]=[]
    
    static var murderAttemptIndex: Int=0
    static var saveAttemptIndex: Int=0

    //TODO: remove unused playerDeath function
    //make edits for player death given player
    static func playerDeath(player: Player){
        numOfPlayers -= 1
        
        //edit number of players in each role
        if(player.role == "Mafia"){
            numOfMafia -= 1
        } else if(player.role == "Detective"){
            numOfDetective -= 1
            numOnTeamTown -= 1
        } else if(player.role == "Nurse"){
            numOfNurse -= 1
            numOnTeamTown -= 1
        } else{
            numOfCivilian -= 1
            numOnTeamTown -= 1
        }
        
        //find and remove at index
        for i in 0...(alivePlayerList.count-1){
            if (playerList[i] == player){
                playerList.remove(at: i)
            }
        }
    }
    
    //make edits for player death given index in playerList
    static func playerDeath(index: Int){
        numOfPlayers -= 1
        
        //edit number of players in each role
        if(playerList[index].role == "Mafia"){
            numOfMafia -= 1
        } else if(playerList[index].role == "Detective"){
            numOfDetective -= 1
            numOnTeamTown -= 1
        } else if(playerList[index].role == "Nurse"){
            numOfNurse -= 1
            numOnTeamTown -= 1
        } else{
            numOfCivilian -= 1
            numOnTeamTown -= 1
        }
        
//        playerList.remove(at: index)
    }
}

