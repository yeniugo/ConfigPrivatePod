//
//  ViewController.swift
//
//  Created by casa on 2020/2/21.
//  Copyright © 2020 casa. All rights reserved.
//

import UIKit
import CTMediator

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        button.sizeToFit()
        button.center = view.center
    }
    
    @objc func didTappedButton() {
        guard let viewController = CTMediator.sharedInstance()?.__ProjectName___demo(name: "world", callback: { (resultString) in
            print(resultString)
        }) else { return }
        print(viewController)
    }
    
    private lazy var button:UIButton = {
        let _button = UIButton(type: .system)
        _button.setTitle("show demo view controller", for: .normal)
        _button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        return _button
    }()
}

