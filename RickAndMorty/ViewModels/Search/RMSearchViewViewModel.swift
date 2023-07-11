//
//  RMSearchViewViewModel.swift
//  RickAndMorty
//
//  Created by Gabriel Roveri on 11/07/23.
//

import Foundation

// Responsabilities
// - show search results
// - show no results view
// - kick off api requests

final class RMSearchViewViewModel {
    let config: RMSearchViewController.Config
    
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
}
