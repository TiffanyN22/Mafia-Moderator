//
//  Player.swift
//  Mafia-Moderator
//
//  Created by Tiffany Nguyen on 12/12/22.
//

import UIKit

class Player: NSObject {
    var name: String?
    var role: String? //Mafia, Nurse, Detective, or Civilian
    var teamMafia: Bool? //true = mafia team, false = civilian team
    var alive: Bool?
}

class gameSetting: NSObject {
    static var numOfCivilian: Int?
    static var numOfMafia: Int?
    static var numOfDetective: Int?
    static var numOfNurse: Int?
    static var numOnTeamTown: Int?
    static var numOfPlayers: Int?
}

