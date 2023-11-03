//
//  SignUpViewController.swift
//  Poki-iOS
//
//  Created by playhong on 2023/10/23.
//

import UIKit
import SnapKit
import Then


final class SignUpVC: UIViewController {
    
    // MARK: - Properties
    private var email: String?
    private var password: String?
    private var nickname: String?
    private var isAgree: Bool?
    
    private let authManager = AuthManager.shared
    private let firestoreManager = FirestoreManager.shared
    
    // MARK: - Validation
    private var isSignUpFormValid: Bool? {
        self.isValidEmail == true &&
        self.isValidPassword == true &&
        self.isValidNickname == true &&
        self.isAgree == true
    }
    private var isValidEmail: Bool? {
        self.email?.isEmpty == false &&
        authManager.isValid(form: self.email, regex: Constants.emailRegex)
    }
    private var isValidPassword: Bool? {
        self.password?.isEmpty == false &&
        authManager.isValid(form: self.password, regex: Constants.passwordRegex)
    }
    private var isValidNickname: Bool? {
        self.nickname?.isEmpty == false &&
        authManager.isValid(form: self.nickname, regex: Constants.nicknameRegex)
    }
    private var signUpButtonColor: UIColor {
        isSignUpFormValid == true ? Constants.appBlackColor : UIColor.lightGray
    }
    
    // MARK: - Size
    private var toastSize: CGRect {
        let width = view.frame.size.width - 120
        let frame = CGRect(x: 60, y: 710, width: width, height: Constants.toastHeight)
        return frame
    }

    // MARK: - Life Cycle
    let signUpView = SignUpView()
    override func loadView() {
        self.view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupButtonAction()
        setupTextField()
        updateSignUpButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        view.backgroundColor = .white
        configureNav()
    }
    
    private func configureNav() {
        navigationItem.title = "회원가입"
        navigationController?.configureBasicAppearance()
    }
    
    private func setupButtonAction() {
        self.signUpView.eyeButton.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
        self.signUpView.agreeToTermsOfServiceButton.addTarget(self, action: #selector(agreeToTermsOfServiceButtonTapped), for: .touchUpInside)
        self.signUpView.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    private func setupTextField() {
        self.signUpView.emailTextField.delegate = self
        self.signUpView.emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
        self.signUpView.passwordTextField.delegate = self
        self.signUpView.passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
        self.signUpView.nicknameTextField.delegate = self
        self.signUpView.nicknameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    private func verifyingDuplicationAlert(text: String) {
        let alert = UIAlertController(title: "중복된 이메일", message: "\(text)는 이미 존재하는 이메일입니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "종료", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func showAlert(title: String?, message: String?, completion: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in completion?() }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Update UI

    private func updateSignUpButton() {
        if isSignUpFormValid == true {
            self.signUpView.signUpButton.isEnabled = true
        }
        if isSignUpFormValid == false {
            self.signUpView.signUpButton.isEnabled = false
        }
        self.signUpView.signUpButton.backgroundColor = self.signUpButtonColor
    }
    
    // MARK: - Actions
    
    @objc private func textDidChange(_ sender: UITextField) {
        if sender == self.signUpView.emailTextField {
            self.email = sender.text
        }
        if sender == self.signUpView.passwordTextField {
            self.password = sender.text
        }
        if sender == self.signUpView.nicknameTextField {
            self.nickname = sender.text
        }
        self.updateSignUpButton()
    }
    
    @objc private func eyeButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true {
            self.signUpView.passwordTextField.isSecureTextEntry = false
        }
        if sender.isSelected == false {
            self.signUpView.passwordTextField.isSecureTextEntry = true
        }
    }
    
    @objc func agreeToTermsOfServiceButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected == true {
            sender.tintColor = Constants.appBlackColor
            self.signUpView.agreeToTermsOfServiceLabel.textColor = .black
            self.isAgree = true
        }
        if sender.isSelected == false {
            sender.tintColor = .lightGray
            self.signUpView.agreeToTermsOfServiceLabel.textColor = .lightGray
            self.isAgree = false
        }
        self.updateSignUpButton()
    }
    
    @objc private func signUpButtonTapped() {
        guard let email = self.email, let password = self.password else { return }
        self.showLoadingIndicator()
        authManager.signUpUser(email: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            if let error = error {
                let code = (error as NSError).code
                switch code {
                case 17007:
                    self.verifyingDuplicationAlert(text: email)
                default:
                    print("계정 생성 오류 : \(error.localizedDescription)")
                }
                self.hideLoadingIndicator()
                return
            }
            firestoreManager.userCreate(name: signUpView.nicknameTextField.text!, image: "")
            firestoreManager.makePoseData()
            self.hideLoadingIndicator()
            self.showToast(message: "회원가입이 완료되었습니다.", frame: self.toastSize) {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    // MARK: - Keyboard
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: - UITextFieldDelegate
extension SignUpVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.signUpView.emailTextField {
            updateLayout(self.signUpView.emailPlaceholder, textField: textField)
        }
        if textField == self.signUpView.passwordTextField {
            updateLayout(self.signUpView.passwordPlaceholder, textField: textField)
        }
        if textField == self.signUpView.nicknameTextField {
            updateLayout(self.signUpView.nicknamePlaceholder, textField: textField)
        }
    }
    
    func updateLayout(_ placeholder: UILabel, textField: UITextField) {
        placeholder.snp.updateConstraints {
            $0.centerY.equalTo(textField).offset(-20)
        }
        UIView.animate(withDuration: 0.5) {
            placeholder.font = UIFont(name: Constants.fontRegular, size: 12)
            placeholder.superview?.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.signUpView.emailTextField, textField.text == "" {
            resetLayout(self.signUpView.emailPlaceholder, textField: textField)
        }
        if textField == self.signUpView.passwordTextField, textField.text == "" {
            resetLayout(self.signUpView.passwordPlaceholder, textField: textField)
        }
        if textField == self.signUpView.nicknameTextField, textField.text == "" {
            resetLayout(self.signUpView.nicknamePlaceholder, textField: textField)
        }
    }
    
    func resetLayout(_ placeholder: UILabel, textField: UITextField) {
        placeholder.snp.updateConstraints {
            $0.centerY.equalTo(textField)
        }
        UIView.animate(withDuration: 0.5) {
            placeholder.font = UIFont(name: Constants.fontRegular, size: 16)
            placeholder.superview?.layoutIfNeeded()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.signUpView.emailTextField {
            self.signUpView.passwordTextField.becomeFirstResponder()
        }
        if textField == self.signUpView.passwordTextField {
            self.signUpView.nicknameTextField.becomeFirstResponder()
        }
        if textField == self.signUpView.nicknameTextField {
            self.signUpView.nicknameTextField.resignFirstResponder()
        }
        return false
    }
}
