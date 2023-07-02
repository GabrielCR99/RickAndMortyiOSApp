//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by Gabriel Roveri on 02/07/23.
//

import Foundation

struct RMCharacter: Codable {
    let id: Int
    let name: String
    let status: RMCharacterStatus
    let species: String
    let type: String
    let gender: RMCharacterGender
    let origin: RMOrigin
    let singleLocation: RMSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
