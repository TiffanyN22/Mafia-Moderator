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
        
        alivePlayerList.remove(at: index)
    }
    
    static func checkGameEnded() -> Bool{
        return (numOfMafia == 0 || (numOfMafia > numOfCivilian))
    }
}

