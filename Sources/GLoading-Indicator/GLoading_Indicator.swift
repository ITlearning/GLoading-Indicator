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
    
    @available(iOS 13.0.0, *)
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
    
    public init() {
        
    }
    
    public static func show() {
        Global_IndicatorSwiftUI.shared.show()
    }
    
    public static func hide() {
        Global_IndicatorSwiftUI.shared.hide()
    }
}
