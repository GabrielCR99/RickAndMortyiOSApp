//
//  RMLocationViewController.swift
//  RickAndMorty
//
//  Created by Gabriel Roveri on 02/07/23.
//

import UIKit

/// Controller to show and search for Locations
final class RMLocationViewController: UIViewController {
    
    private let primaryView = RMLocationView()
    
    private let viewModel = RMLocationViewViewModel()
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Locations"
        view.backgroundColor = .systemBackground
        view.addSubview(primaryView)
        addConstraints()
        addSearchButton()
    }
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapShare))
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            primaryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            primaryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc
    private func didTapShare() {
        
    }
}
