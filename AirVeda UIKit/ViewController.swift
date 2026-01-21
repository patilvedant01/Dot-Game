//
//  ViewController.swift
//  AirVeda UIKit
//
//  Created by Vedant Patil on 21/01/26.
//

import UIKit

class ViewController: UIViewController {
    
    let dotView: DotView = DotView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        view.backgroundColor = .red
        
        // Make dotView fill the controller's view with Auto Layout
        dotView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dotView)
        NSLayoutConstraint.activate([
            dotView.topAnchor.constraint(equalTo: view.topAnchor),
            dotView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dotView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dotView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: dotView)
        dotView.configureDot(location: location)
    }
}

