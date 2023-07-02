//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Gabriel Roveri on 02/07/23.
//

import Foundation

/// Represents unique API endpoints
@frozen enum RMEndpoint: String {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location ingo
    case location
    /// Endpoint to get episode ingo
    case episode
}
