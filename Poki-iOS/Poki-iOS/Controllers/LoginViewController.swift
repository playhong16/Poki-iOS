//
//  LoginViewController.swift
//  Poki-iOS
//
//  Created by playhong on 2023/10/18.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
    
    // MARK: - Components
    private let headerView = UIView().then {
        $0.backgroundColor = .black
    }
    
    private let logoLabel = UILabel().then {
        $0.font = UIFont(name: Constants.fontHeavy, size: 46)
        $0.text = "POKI"
        $0.textColor = .white
    }
    
    private let commentLabel = UILabel().then {
        $0.font = UIFont(name: Constants.font, size: 14)
        $0.numberOfLines = 2
        $0.text = """
                    내가 찍은 인생네컷
                    이쁘게 보관할 수 있는 플랫폼
                    """
        $0.textColor = .white
        $0.setLineSpacing(spacing: 3)
    }
    
    private let emailTitleLabel = UILabel().then {
        $0.font = UIFont(name: Constants.fontBold, size: 16)
        $0.text = "이메일"
        $0.textColor = .black
    }
    
    private let emailTextField = UITextField().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 8
    }
    
    private let emailStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .fill
        $0.spacing = 5
    }
    
    private let passwordTitleLabel = UILabel().then {
        $0.font = UIFont(name: Constants.fontBold, size: 16)
        $0.text = "비밀번호"
        $0.textColor = .black
    }
    
    private let passwordTextField = UITextField().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 8
    }
    
    private let passwordStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .fill
        $0.spacing = 5
    }
    
    private lazy var emailSaveButton = UIButton().then {
        $0.contentHorizontalAlignment = .left
        let imageConfigure = UIImage.SymbolConfiguration(pointSize: 22)
        $0.tintColor = .lightGray
        $0.setImage(UIImage(systemName: "square", withConfiguration: imageConfigure), for: .normal)
        $0.addTarget(self, action: #selector(emailSaveButtonTapped), for: .touchUpInside)
    }
    
    private let emailSaveTextLabel = UILabel().then {
        $0.font = UIFont(name: Constants.fontMedium, size: 14)
        $0.text = "이메일 / 아이디 저장"
        $0.textColor = .black
    }
    
    private lazy var emailSaveStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .fill
        $0.spacing = 5
    }
    
    private let bodyStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .fill
        $0.spacing = 30
    }
    
    private lazy var loginButton = UIButton().then {
        $0.backgroundColor = .black
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name: Constants.fontBold, size: 16)
        $0.layer.cornerRadius = 30
        $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    private lazy var signUpButton = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(name: Constants.fontBold, size: 16)
        $0.layer.cornerRadius = 30
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    private let bottomStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .fill
        $0.spacing = 10
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Helpers
    
    private func addSubviews() {
        headerView.addSubviews(logoLabel, commentLabel)
        emailStackView.addArrangedSubviews(emailTitleLabel, emailTextField)
        passwordStackView.addArrangedSubviews(passwordTitleLabel, passwordTextField)
        emailSaveStackView.addArrangedSubviews(emailSaveButton, emailSaveTextLabel)
        bodyStackView.addArrangedSubviews(emailStackView, passwordStackView, emailSaveStackView)
        bottomStackView.addArrangedSubviews(loginButton, signUpButton)
        view.addSubviews(headerView, bodyStackView, bottomStackView)
    }
    
    private func setupLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(250)
        }
        logoLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(60)
            $0.leading.equalToSuperview().inset(20)
        }
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(20)
        }
        emailTextField.snp.makeConstraints {
            $0.height.equalTo(55)
        }
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(55)
        }
        emailSaveButton.snp.makeConstraints {
            $0.width.equalTo(25)
            $0.height.equalTo(25)
        }
        bodyStackView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(60)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        loginButton.snp.makeConstraints {
            $0.height.equalTo(55)
        }
        signUpButton.snp.makeConstraints {
            $0.height.equalTo(55)
        }
        bottomStackView.snp.makeConstraints {
            $0.top.equalTo(emailSaveTextLabel.snp.bottom).offset(110)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    
    // MARK: - Actions
    
    @objc private func emailSaveButtonTapped(_ sender: UIButton) {
        print("세이브 버튼 눌렀어염따")
    }
    
    @objc private func loginButtonTapped(_ sender: UIButton) {
        print("로그인 버튼 누름")
    }
    
    @objc private func signUpButtonTapped(_ sender: UIButton) {
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
}
