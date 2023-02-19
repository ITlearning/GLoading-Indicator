//
//  Global_Indicator.swift
//  
//
//  Created by Tabber on 2023/02/19.
//

import UIKit

public class Global_Indicator: UIView {

    private let indicator: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(frame: .zero)
        
        indicatorView.style = .gray
        indicatorView.color = .gray
        return indicatorView
    }()
    
    private let indicatorView: UIView = {
        let indicatorView = UIView()
        let blurEffect = UIBlurEffect(style: .dark)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = .zero
        indicatorView.addSubview(visualEffectView)
        
        return indicatorView
    }()
    
    private let indicatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "로딩중.."
        label.font = .systemFont(ofSize: 15)
        
        return label
    }()
    
    
    public init() {
        super.init(frame: UIScreen.main.bounds)
        self.setIndicatorUI()
    }
    
    func setIndicatorUI() {
        indicatorView.addSubview(indicator)
        indicatorView.addSubview(indicatorLabel)
        self.addSubview(indicatorView)
        
        indicator.startAnimating()
        
        indicatorView.layer.masksToBounds = true
        indicatorView.layer.cornerRadius = 5
        indicatorView.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        indicatorView.clipsToBounds = true
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicatorLabel.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        // Indicator AutoLayout
        NSLayoutConstraint.activate([
            indicator.topAnchor.constraint(equalTo: indicatorView.topAnchor, constant: 10),
            indicator.centerXAnchor.constraint(equalTo: indicator.centerXAnchor),
            indicator.widthAnchor.constraint(equalToConstant: 50),
            indicator.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Indicator Label AutoLayout
        NSLayoutConstraint.activate([
            indicatorLabel.topAnchor.constraint(equalTo: indicator.bottomAnchor, constant: 10),
            indicatorLabel.centerXAnchor.constraint(equalTo: indicatorView.centerXAnchor)
        ])
        
        // Indicator View AutoLayout
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            indicatorView.widthAnchor.constraint(equalToConstant: 180),
            indicatorView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func showIndicator() {
        TMainAsync {
            self.keyWindow()?.addSubview(self)
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                self.indicatorView.alpha = 1.0
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
