//
//  CreatureFile.swift
//  Catch Em All
//
//  Created by Miguel on 1/2/26.
//

import Foundation

struct Creature: Codable, Hashable {
    var name: String
    var url: String // url for detail on Pokemon
}
