//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Gabriel Roveri on 02/07/23.
//

import Foundation

public struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
