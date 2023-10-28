//
//  ColorPaletteVC.swift
//  project
//
//  Created by user on 10/28/23.
//

import UIKit

import UIKit

class ColorPaletteVC: UIViewController {

    weak var homePageVC: HomePageVC?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
        // Create the labels
        let label1 = createLabel(withText: "Change The Buttons Background Color")
        let label2 = createLabel(withText: "Change The Background Color")

        // Create the buttons
        let buttonColors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple]
        let buttonStack1 = createButtonStack(forColors: buttonColors, action: #selector(changeHomeButtonsColor(_:)))
        let buttonStack2 = createButtonStack(forColors: buttonColors, action: #selector(changeHomeBackgroundColor(_:)))

        // Create the stack view
        let stackView = createVerticalStackView(withSubviews: [label1, buttonStack1, label2, buttonStack2])

        // Add the stack view to the view
        view.addSubview(stackView)

        // Set up auto layout constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 250),
            stackView.heightAnchor.constraint(equalToConstant: 240)
        ])
    }

    @objc func changeHomeButtonsColor(_ sender: UIButton) {
        homePageVC?.changeButtonsColor(sender.backgroundColor ?? .white)
        self.navigationController?.popViewController(animated: true)
    }

    @objc func changeHomeBackgroundColor(_ sender: UIButton) {
        homePageVC?.changeBackgroundColor(sender.backgroundColor ?? .white)
        self.navigationController?.popViewController(animated: true)
    }

    private func createLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        return label
    }

    private func createButtonStack(forColors colors: [UIColor], action: Selector) -> UIStackView {
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 10

        for color in colors {
            let button = createButton(withBackgroundColor: color, action: action)
            buttonStack.addArrangedSubview(button)
        }

        return buttonStack
    }

    private func createButton(withBackgroundColor color: UIColor, action: Selector) -> UIButton {
        let button = UIButton()
        button.backgroundColor = color
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    private func createVerticalStackView(withSubviews subviews: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: subviews)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }
}

