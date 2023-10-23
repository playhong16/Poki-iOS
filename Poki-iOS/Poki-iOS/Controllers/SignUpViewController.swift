//
//  SignUpViewController.swift
//  Poki-iOS
//
//  Created by playhong on 2023/10/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - Properties
    
    private let emailTitleLabel = UILabel().then {
        $0.text = "이메일"
        $0.font = UIFont(name: Constants.fontBold, size: 16)
        $0.textColor = .lightGray
    }
    
    private lazy var emailTextField = UITextField().then {
        $0.keyboardType = .emailAddress
    }
    
    private lazy var emailTextFieldView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let passwordTitleLabel = UILabel().then {
        $0.text = "비밀번호"
        $0.font = UIFont(name: Constants.fontBold, size: 16)
        $0.textColor = .lightGray
    }
    
    private lazy var passwordTextField = UITextField().then {
        $0.isSecureTextEntry = true
    }
    
    private lazy var passwordTextFieldView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private lazy var passwordCheckTextField = UITextField().then {
        $0.isSecureTextEntry = true
        $0.placeholder = "비밀번호를 확인해주세요."
    }
    
    private lazy var signUpButton = UIButton().then {
        $0.backgroundColor = .black
        $0.setTitle("가입하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name: Constants.fontBold, size: 16)
        $0.layer.cornerRadius = 25
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addSubviews()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        drawUnderline(emailTextFieldView)
        drawUnderline(passwordTextFieldView)
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        view.backgroundColor = .white
        configureNav()
        configure(emailTextField)
        configure(passwordTextField)
        configure(passwordCheckTextField)
    }
    
    private func configureNav() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        navigationItem.title = "회원가입"
    }
    
    private func configure(_ textField: UITextField) {
        textField.backgroundColor = .clear
        textField.textColor = .black
        textField.tintColor = .black
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.delegate = self
        textField.layer.masksToBounds = true
        textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    private func addSubviews() {
        emailTextFieldView.addSubviews(emailTextField, emailTitleLabel)
        passwordTextFieldView.addSubviews(passwordTextField, passwordTitleLabel)
        view.addSubviews(emailTextFieldView, passwordTextFieldView, passwordCheckTextField, signUpButton)
    }
    
    private func setupLayout() {
        emailTextFieldView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(8)
            $0.trailing.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview()
        }
        emailTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(8)
            $0.trailing.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
        }
        passwordTextFieldView.snp.makeConstraints {
            $0.top.equalTo(emailTextFieldView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(8)
            $0.trailing.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview()
        }
        passwordTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(8)
            $0.trailing.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
        }
        passwordCheckTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(55)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(44)
        }
        signUpButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(25)
            $0.height.equalTo(50)
        }
    }
    
    private func drawUnderline(_ view: UIView) {
        let underline = CALayer()
        let borderWidth: CGFloat = 1
        underline.borderColor = UIColor.lightGray.cgColor
        underline.frame = CGRect(origin: CGPoint(x: 0, y : view.frame.size.height - borderWidth),
                              size: CGSize(width: view.frame.size.width, height: view.frame.size.height))
        underline.borderWidth = borderWidth
        view.layer.addSublayer(underline)
        view.layer.masksToBounds = true
    }
    
    // MARK: - Actions
    
    @objc private func textDidChange(_ textField: UITextField) {
        
    }
}

extension SignUpViewController: UITextFieldDelegate {
    
}
