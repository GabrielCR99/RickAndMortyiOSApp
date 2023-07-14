//
//  RMSearchResultViewModel.swift
//  RickAndMorty
//
//  Created by Gabriel Roveri on 14/07/23.
//

import Foundation

enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
