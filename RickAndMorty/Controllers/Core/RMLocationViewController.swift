//
//  RMLocationViewController.swift
//  RickAndMorty
//
//  Created by Gabriel Roveri on 02/07/23.
//

import UIKit

/// Controller to show and search for Locations
final class RMLocationViewController: UIViewController {

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Locations"
        addSearchButton()
    }
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapShare))
    }
    
    @objc
    private func didTapShare() {
        
    }
}
