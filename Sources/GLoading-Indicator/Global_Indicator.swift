//
//  Global_Indicator.swift
//  
//
//  Created by Tabber on 2023/02/19.
//

import UIKit

internal class Global_Indicator: UIView {

    private let indicator: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(frame: .zero)
        
        indicatorView.style = .gray
        indicatorView.color = .gray
        return indicatorView
    }()
    
    private let indicatorView: UIView = {
        let indicatorView = UIView()
        return indicatorView
    }()
    
    private let indicatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "로딩중.."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        
        return label
    }()
    
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("닫기", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    public init() {
        super.init(frame: UIScreen.main.bounds)
        self.setIndicatorUI()
    }
    
    func setIndicatorUI(text: String = "") {
        
        let effect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: effect)
        
        effectView.frame = CGRect(x: 0, y: 0, width: 180, height: 100)
        
        indicatorView.layer.masksToBounds = true
        indicatorView.layer.cornerRadius = 5
        indicatorView.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        indicatorView.clipsToBounds = true
        
        indicatorView.addSubview(effectView)
        indicatorView.addSubview(indicator)
        indicatorView.addSubview(indicatorLabel)
        
        self.addSubview(indicatorView)
        self.addSubview(closeButton)
        self.backgroundColor = .black.withAlphaComponent(0.7)
        
        closeButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicatorLabel.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        // Indicator AutoLayout
        indicator.startAnimating()
        
        NSLayoutConstraint.activate([
            indicator.topAnchor.constraint(equalTo: indicatorView.topAnchor, constant: 30),
            indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        // Indicator Label AutoLayout
        NSLayoutConstraint.activate([
            indicatorLabel.topAnchor.constraint(equalTo: indicator.bottomAnchor, constant: 15),
            indicatorLabel.centerXAnchor.constraint(equalTo: indicatorView.centerXAnchor)
        ])
        
        // Indicator View AutoLayout
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            indicatorView.widthAnchor.constraint(equalToConstant: 180),
            indicatorView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: indicatorView.bottomAnchor, constant: 20),
            closeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 50),
            closeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func showIndicator(text: String = "") {
        TMainAsync {
            
            let localeId = Locale.preferredLanguages.first
            let deviceLocal = (Locale(identifier:localeId!).languageCode)!
            
            let loadingText = deviceLocal == "ko" ? "로딩중..." : "Loading..."
            let closeButtonText = deviceLocal == "ko" ? "닫기" : "Close"
            
            self.indicatorLabel.text = text == "" ? loadingText : text
            self.indicatorLabel.sizeToFit()
            
            self.closeButton.setTitle(closeButtonText, for: .normal)
            
            self.keyWindow()?.addSubview(self)
            self.alpha = 0.0
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                self.alpha = 1.0
                
            })
        }
    }
    
    public func hideIndicator() {
        TMainAsync {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                self.alpha = 0.0
            }) { _ in
                self.removeFromSuperview()
            }
        }
    }
    
    @objc private func dismissAction() {
        hideIndicator()
    }
}

extension Global_Indicator {
    private func keyWindow() -> UIWindow? {
        return UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    }
    
    func TMainAsync(after: TimeInterval = 0, handler: @escaping (() -> Void)) {
        if after > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + after) {
                handler()
            }
        } else {
            DispatchQueue.main.async {
                handler()
            }
        }
    }
}
