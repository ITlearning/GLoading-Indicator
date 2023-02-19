import UIKit
import SwiftUI

public struct Global_IndicatorSwiftUI: UIViewRepresentable {
        
    static var shared = Global_IndicatorSwiftUI()
    
    var view = Global_Indicator()
    
    func show() {
        view.showIndicator()
    }
    
    func hide() {
        view.hideIndicator()
    }
    
//
//    func showButton() {
//        view.showButton()
//    }
    
    public func makeUIView(context: Context) -> some UIView {
        return view
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

@available(iOS 13.0.0, *)
public struct GLoading_Indicator {
    //public private(set) var text = "Hello, World!"
    
    static var instance = GLoading_Indicator()
    
    public var indicatorView = Global_IndicatorSwiftUI()
    
    public init() {
        
    }
    
    func show() {
        indicatorView.show()
    }
    
    func hide() {
        indicatorView.hide()
    }
}
