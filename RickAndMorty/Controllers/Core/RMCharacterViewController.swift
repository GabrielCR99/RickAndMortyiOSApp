//
//  RMViewController.swift
//  RickAndMorty
//
//  Created by Gabriel Roveri on 02/07/23.
//

import UIKit

/// Controller to show and search for Characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characetrs"
        
        let request = RMRequest(endpoint: .character,pathComponents: ["1"], queryParameters: [URLQueryItem(name: "name", value: "rick"), URLQueryItem(name: "status", value: "alive")])
        debugPrint(request.url)
    }
}
