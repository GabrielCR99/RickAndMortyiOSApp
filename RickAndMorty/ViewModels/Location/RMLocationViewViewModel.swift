//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Gabriel Roveri on 10/07/23.
//

import Foundation

final class RMLocationViewViewModel {
    
    private var locations: [RMLocation] = []
    
    // Location response info
    // Will containt next URL, if presente
    
    private var cellViewModel: [String] = []
    
    init() {}
    
    public func fetchLocations() {
        let request = RMService.shared.execute(.listLocatiosRequest, expecting: String.self) { result in
            switch result {
            case .success(let success):
                break
            case .failure(let failure):
                dump(failure)
                break
            }
        }
    }
    
    private var hasMoreData: Bool {
        return false
    }
    
}
