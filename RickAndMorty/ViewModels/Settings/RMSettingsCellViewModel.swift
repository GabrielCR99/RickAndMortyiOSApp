//
//  RMSettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by Gabriel Roveri on 09/07/23.
//

import UIKit

struct RMSettingsCellViewModel: Identifiable {
    
    // MARK: - Init
    
    init(type: RMSettingsOption, onTapHandler: @escaping (RMSettingsOption) -> Void) {
        self.type = type
        self.onTapHandler = onTapHandler
    }
    
    // MARK: - Public
    
    public let id = UUID()
    public let onTapHandler: (RMSettingsOption) -> Void
    public let type: RMSettingsOption
    
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
