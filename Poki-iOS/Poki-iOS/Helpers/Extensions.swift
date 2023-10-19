//
//  Extensions.swift
//  Poki-iOS
//
//  Created by Insu on 10/15/23.
//

import UIKit

// MARK: - UIView

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
    
    static func createSeparatorLine() -> UIView {
        let separator = UIView()
        separator.backgroundColor = .systemGray5
        return separator
    }
}

// MARK: - UIStackView

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {addArrangedSubview(view)}
    }
}

// MARK: - UINavgationController

extension UINavigationController {
    // UINavigationBarAppearance 공통 적용을 위해 구현
    func configureAppearance() {
        let appearance = UINavigationBarAppearance().then {
            $0.configureWithOpaqueBackground()
            $0.backgroundColor = .clear
            $0.titleTextAttributes = [.foregroundColor: UIColor.black]
            $0.shadowColor = nil
        }
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
    }
    
    // 포즈 추천 페이지, 랜덤 포즈 페이지에서 사용하는 UINavigationBarAppearance
    func configureLineAppearance() {
        let appearance = UINavigationBarAppearance().then {
            $0.configureWithOpaqueBackground()
            $0.backgroundColor = .white
            $0.titleTextAttributes = [.foregroundColor: UIColor.black]
        }
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
    }
}
