//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Gabriel Roveri on 06/07/23.
//

import UIKit

final class RMEpisodeDetailViewViewModel {
    private let endpointUrl: URL?
    
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
        fetchEpisodeData()
    }
    
    private func fetchEpisodeData() {
        guard let url = endpointUrl, let request = RMRequest(url: url) else { return }
        
        RMService.shared.execute(request, expecting: RMEpisode.self) { result in
            switch result {
            case .success(let success):
                dump(success)
            case .failure(let failure):
                dump(failure)
                break
            }
        }
    }

}
