//
//  RMSettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by Gabriel Roveri on 09/07/23.
//

import UIKit

struct RMSettingsCellViewModel: Identifiable, Hashable {
    
    // MARK: - Private
    
    private let type: RMSettingsOption
    
    // MARK: - Init
    
    init(type: RMSettingsOption) {
        self.type = type
    }
    
    // MARK: - Public
    
    public let id = UUID()
    
    public var image: UIImage? {
        return type.iconImage
    }
    public var title: String {
        return type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
}
