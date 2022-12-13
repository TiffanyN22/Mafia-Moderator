//
//  File Name: Player.swift
//  Project: Mafia-Moderator
//  Description: Classes for each player and static game settings
//  Author: Tiffany Nguyen
//  Creation Date: 12/12/22.
//

import UIKit

class Player: NSObject {
    var name: String?
    var role: String? //Mafia, Nurse, Detective, or Civilian
    var teamMafia: Bool? //true = mafia team, false = civilian team
    var alive: Bool?
    
    init(name: String){
        self.name = name
    }
}

class gameSetting: NSObject {
    static var numOfCivilian: Int?
    static var numOfMafia: Int?
    static var numOfDetective: Int?
    static var numOfNurse: Int?
    static var numOnTeamTown: Int?
    static var numOfPlayers: Int?
    
    static var playerList: [Player]=[]
}

