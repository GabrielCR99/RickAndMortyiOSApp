//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Gabriel Roveri on 06/07/23.
//

import UIKit

/// VC that shows detail about a single episode
final class RMEpisodeDetailViewController: UIViewController {
    private let url: URL?
    
    // MARK: - Init
    init(url: URL?) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.backgroundColor = .systemGreen
    }
}
