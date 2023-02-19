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
    
    func setIndicatorUI() {
        let effect = UIBlurEffect(style: .extraLight)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = indicatorView.bounds
        indicatorView.addSubview(effectView)
        indicatorView.alpha = 0.0
        indicatorView.addSubview(indicator)
        indicatorView.addSubview(indicatorLabel)
        
        self.addSubview(indicatorView)
        self.addSubview(closeButton)
        
        closeButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        
        indicatorView.layer.masksToBounds = true
        indicatorView.layer.cornerRadius = 5
        indicatorView.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        indicatorView.clipsToBounds = true
        
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
            indicatorLabel.topAnchor.constraint(equalTo: indicator.bottomAnchor, constant: 30),
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
    
    
    public func showIndicator() {
        TMainAsync {
            self.keyWindow()?.addSubview(self)
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                self.backgroundColor = .black.withAlphaComponent(0.7)
                self.indicatorView.alpha = 1.0
            })
        }
    }
    
    public func hideIndicator() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.backgroundColor = .black.withAlphaComponent(0.0)
            self.alpha = 0.0
        })
        
        TMainAsync(after: 0.4, handler: {
            //self.removeFromSuperview()
        })
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
