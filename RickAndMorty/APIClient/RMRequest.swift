//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Gabriel Roveri on 02/07/23.
//

import Foundation

/// Object that representes a single api call
final class RMRequest {
    /// API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoint
    private let endpoint: RMEndpoint
    
    /// Path Components for API (if any)
    private let pathComponents: [String]
    
    /// Query Parameters for API (if any)
    private let queryParameters: [URLQueryItem]
    
    /// Constructed URL for the API request in String format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach {
                string += "/\($0)"
            }
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    /// Computed & constructed API
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired HTTP Method
    public let httpMethod = "GET"
    
    //MARK: - Public
    
    /// Construct Request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of path components
    ///   - queryParameters: Collection of query parameters
    public init(
        endpoint: RMEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

extension RMRequest {
    static let charactersRequestList = RMRequest(endpoint: .character)
}
