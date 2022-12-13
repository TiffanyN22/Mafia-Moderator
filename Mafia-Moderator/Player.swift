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
}

