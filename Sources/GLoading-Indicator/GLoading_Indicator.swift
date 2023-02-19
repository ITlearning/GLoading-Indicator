import UIKit
import SwiftUI

private struct Global_IndicatorSwiftUI: UIViewRepresentable {
        
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
    
    public static var instance = GLoading_Indicator()
    
    private var indicatorView = Global_IndicatorSwiftUI()
    
    public init() {
        
    }
    
    public func show() {
        indicatorView.show()
    }
    
    public func hide() {
        indicatorView.hide()
    }
}
