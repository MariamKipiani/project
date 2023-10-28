//
//  ViewController.swift
//  project
//
//  Created by user on 10/28/23.
//

import UIKit

class ViewController: UIViewController {
    
    let enterEmail = UITextField()
    let enterPassword = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createUI()
    }
    
    func createUI() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 20
        
        let logoImageView = UIImageView(image: UIImage(named: "avatar"))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        stackView.addArrangedSubview(logoImageView)
        
        let titleLabel = UILabel()
        titleLabel.text = "Sign In"
        titleLabel.font = UIFont(name: "Inter-Regular_Bold", size: 28)
        stackView.addArrangedSubview(titleLabel)
        
        enterEmail.placeholder = "Email"
        enterEmail.addTextFieldStyle()
        stackView.addArrangedSubview(enterEmail)
        
        enterPassword.placeholder = "Password"
        enterPassword.addTextFieldStyle()
        enterPassword.isSecureTextEntry = true
        stackView.addArrangedSubview(enterPassword)
        
        let forgotPasswordBtn = UIButton()
        forgotPasswordBtn.setTitle("Did you forget your password?", for: .normal)
        forgotPasswordBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        forgotPasswordBtn.setTitleColor(UIColor(red: 95/255, green: 95/255, blue: 95/255, alpha: 1), for: .normal)
        forgotPasswordBtn.contentHorizontalAlignment = .right
        stackView.addArrangedSubview(forgotPasswordBtn)
        
        let signInButton = UIButton()
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.addRoundedButtonStyle()
        signInButton.addTarget(self, action: #selector(signInBtnTapped), for: .touchUpInside)
        stackView.addArrangedSubview(signInButton)
        
        let orDivider = createOrDivider()
        stackView.addArrangedSubview(orDivider)
        
        let socialMediaIcons = createSocialMediaIcons()
        stackView.addArrangedSubview(socialMediaIcons)
        
        let createAccountLabel = UILabel()
        createAccountLabel.text = "Don't have an account? Sign Up"
        createAccountLabel.textAlignment = .center
        createAccountLabel.textColor = UIColor(red: 95/255, green: 95/255, blue: 95/255, alpha: 1)
        stackView.addArrangedSubview(createAccountLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func createOrDivider() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        
        let line1 = createDividerLine()
        let orLabel = UILabel()
        orLabel.text = "Or"
        orLabel.textColor = .gray
        let line2 = createDividerLine()
        
        stackView.addArrangedSubview(line1)
        stackView.addArrangedSubview(orLabel)
        stackView.addArrangedSubview(line2)
        
        return stackView
    }
    
    func createDividerLine() -> UIView {
        let line = UIView()
        line.backgroundColor = .gray
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return line
    }
    
    func createSocialMediaIcons() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 20
        
        let iconNames = ["FaceBook", "Google", "LinkedIn"]
        
        for iconName in iconNames {
            let icon = createSocialMediaIcon(named: iconName)
            stackView.addArrangedSubview(icon)
        }
        
        return stackView
    }
    
    func createSocialMediaIcon(named: String) -> UIImageView {
        let icon = UIImageView(image: UIImage(named: named))
        icon.contentMode = .scaleAspectFit
        icon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return icon
    }
    
    @objc func signInBtnTapped() {
        guard let email = enterEmail.text, !email.isEmpty,
              let password = enterPassword.text, !password.isEmpty else {
            let alert = UIAlertController(title: "Error", message: "You must enter both email and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
    }
}

extension UITextField {
    func addTextFieldStyle() {
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 178/255, green: 178/255, blue: 178/255, alpha: 64/255).cgColor
        self.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 53)
        ])
    }
    
}

extension UIButton {
    func addRoundedButtonStyle() {
        self.layer.cornerRadius = 16
        self.backgroundColor = UIColor(red: 34/255.0, green: 87/255.0, blue: 122/255.0, alpha: 1.0)
        self.titleLabel?.font = UIFont(name: "Inter-Regular_Medium", size: 15)
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}

