//
//  HomePageVC.swift
//  project
//
//  Created by user on 10/28/23.
//

import UIKit

class HomePageVC: UIViewController {

    lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present Color Palette Page", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(presentColorPalettePage), for: .touchUpInside)
        return button
    }()

    lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("Push Color Palette Page", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(pushColorPalettePage), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }

    func setupButtons() {
        let stackView = UIStackView(arrangedSubviews: [presentButton, pushButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20

        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 250),
            stackView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }

    @objc func presentColorPalettePage() {
        let colorPaletteVC = ColorPaletteVC()
        colorPaletteVC.homePageVC = self
        self.present(colorPaletteVC, animated: true, completion: nil)
    }

    @objc func pushColorPalettePage() {
        let colorPaletteVC = ColorPaletteVC()
        colorPaletteVC.homePageVC = self
        self.navigationController?.pushViewController(colorPaletteVC, animated: true)
    }

    func changeButtonsColor(_ color: UIColor) {
        presentButton.backgroundColor = color
        pushButton.backgroundColor = color
    }

    func changeBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
