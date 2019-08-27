//
//  ContainerViewController.swift
//  ScrollContainerViewController
//
//  Created by Jaeho Lee on 28/08/2019.
//  Copyright © 2019 Jay Lee. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

  let redVC = RedViewController()
  let greenVC = GreenViewController()
  let blueVC = BlueViewController()

  private lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.bounces = false
    scrollView.isPagingEnabled = true
    return scrollView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupScrollView()
    setupChildViewControllers()
  }

  private func setupScrollView() {
    view.addSubview(scrollView)
    let views = ["scrollView": scrollView]
    [
      NSLayoutConstraint.constraints(
        withVisualFormat: "H:|[scrollView]|",
        metrics: nil,
        views: views),
      NSLayoutConstraint.constraints(
        withVisualFormat: "V:|[scrollView]|",
        metrics: nil,
        views: views),
      ]
      .forEach { NSLayoutConstraint.activate($0) }
  }

  private func setupChildViewControllers() {
    [redVC, greenVC, blueVC].forEach { addChild($0) }

    let views = [
      "redVC": redVC.view!,
      "greenVC": greenVC.view!,
      "blueVC": blueVC.view!,
    ]
    views.values.forEach {
      scrollView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
      $0.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }

    [
      NSLayoutConstraint.constraints(
        withVisualFormat: "H:|[redVC][greenVC]|",
        options: .alignAllTop,
        metrics: nil,
        views: views),
      NSLayoutConstraint.constraints(
        withVisualFormat: "H:|[redVC][blueVC]|",
        options: .alignAllTop,
        metrics: nil,
        views: views),
      NSLayoutConstraint.constraints(
        withVisualFormat: "V:|[redVC(==greenVC,==blueVC)]|",
        metrics: nil,
        views: views),
      ]
      .forEach { NSLayoutConstraint.activate($0) }

    [redVC, greenVC, blueVC].forEach { $0.didMove(toParent: self) }

    greenVC.view.isHidden = true

    greenVC.delegate = self
    blueVC.delegate = self
  }
}

extension ContainerViewController: SwapViewControllerDelegate {

  func swap() {
    greenVC.view.isHidden.toggle()
    blueVC.view.isHidden.toggle()
  }
}
