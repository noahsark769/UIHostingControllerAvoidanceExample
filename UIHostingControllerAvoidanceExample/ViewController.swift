//
//  ViewController.swift
//  UIHostingControllerAvoidanceExample
//
//  Created by Noah Gilmore on 9/15/20.
//

import UIKit

import SwiftUI
struct ContentView: View {
    var body: some View {
        Text("I want this text to stay put.")
            .ignoresSafeArea(.keyboard)
    }
}

class ViewController: UIViewController {
    override var shouldAutomaticallyForwardAppearanceMethods: Bool {
        return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let textField = UITextField(frame: CGRect(x: 10, y: 100, width: 200, height: 50))
        textField.backgroundColor = .white
        textField.placeholder = "Tap here!"
        view.addSubview(textField)
        let button = UIButton(type: .system, primaryAction: UIAction(title: "Dismiss Keyboard", handler: { _ in
            textField.resignFirstResponder()
        }))
        button.frame = CGRect(x: 220, y: 100, width: 140, height: 50)
        view.addSubview(button)
        let hostingController = UIHostingController(rootView: ContentView())
        self.addChild(hostingController)
        hostingController.view.frame = CGRect(x: 10, y: UIScreen.main.bounds.size.height - 510, width: UIScreen.main.bounds.size.width - 20, height: 500)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}
