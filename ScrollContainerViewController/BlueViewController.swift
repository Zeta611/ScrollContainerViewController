//
//  BlueViewController.swift
//  ScrollContainerViewController
//
//  Created by Jaeho Lee on 28/08/2019.
//  Copyright © 2019 Jay Lee. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
  
  weak var delegate: SwapViewControllerDelegate?

  override func loadView() {
    let view = UIView()
    view.backgroundColor = .blue
    self.view = view
  }


  override func viewDidLoad() {
    super.viewDidLoad()

    let button = UIButton()
    button.setTitle("Swap Me!", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = .boldSystemFont(ofSize: 50)
    button.addTarget(
      self,
      action: #selector(swapButtonWasTouched),
      for: .touchUpInside)

    view.addSubview(button)

    // Put button at the center of the view
    button.translatesAutoresizingMaskIntoConstraints = false
    button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }

  @objc private func swapButtonWasTouched(_ sender: UIButton) {
    delegate?.swap()
  }
}
