//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Gabriel Roveri on 10/07/23.
//

import Foundation

protocol RMLocationViewViewModelDelegate: AnyObject {
    func didFetchInitialLocations()
}

final class RMLocationViewViewModel {
    
    weak var delegate: (any RMLocationViewViewModelDelegate)?
    
    private var locations: [RMLocation] = [] {
        didSet {
            for location in locations {
                let cellViewModel = RMLocationTableViewCellViewModel(location: location)
                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)
                }
            }
        }
    }
    
    // Location response info
    // Will containt next URL, if presente
    private var apiInfo: RMGetAllLocationsResponse.Info?
    
    public private(set) var cellViewModels: [RMLocationTableViewCellViewModel] = []
    
    public var shouldShowLoadMoreIndicator: Bool {
        return apiInfo?.next != nil
    }
    
    public var isLoadingMoreLocations = false
    
    private var didFinishPagination: (() -> Void)?
    
    // MARK: - Init
    
    init() {}
    
    public func registerDidFinishPaginationBlock(_ block: @escaping () -> Void) {
        self.didFinishPagination = block
    }
    
    /// Paginate if additional locations are needed
    public func fetchAdditionalLocations() {
        guard !isLoadingMoreLocations else { return }
        
        guard let nextUrlString = apiInfo?.next,
              let url = URL(string: nextUrlString) else { return }
        
        isLoadingMoreLocations = true
        
        guard let request = RMRequest(url: url) else {
            isLoadingMoreLocations = false
            
            return
        }
        
        RMService.shared.execute(request, expecting: RMGetAllLocationsResponse.self) { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let responseModel):
                let moreResults = responseModel.results
                let info = responseModel.info
                strongSelf.apiInfo = info
                strongSelf.cellViewModels.append(contentsOf: moreResults.compactMap({ return .init(location: $0)}))
                
                DispatchQueue.main.async {
                    strongSelf.isLoadingMoreLocations = false
                    // Notify via callback
                    strongSelf.didFinishPagination?()
                }
            case .failure(let failure):
                self?.isLoadingMoreLocations = false
                dump(failure)
            }
        }
    }
        
    public func location(at index: Int) -> RMLocationTableViewCellViewModel? {
        guard index < cellViewModels.count - 1, index >= 0 else { return nil }
        
        return self.cellViewModels[index]
    }
    
    public func fetchLocations() {
        RMService.shared.execute(.listLocatiosRequest, expecting: RMGetAllLocationsResponse.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.apiInfo = model.info
                self?.locations = model.results
                DispatchQueue.main.async {
                    self?.delegate?.didFetchInitialLocations()
                }
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
