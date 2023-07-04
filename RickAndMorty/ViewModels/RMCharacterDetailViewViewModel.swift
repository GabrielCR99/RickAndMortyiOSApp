//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Gabriel Roveri on 03/07/23.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        return character.name.uppercased()
    }
}
