import UIKit
import SwiftUI

private struct Global_IndicatorSwiftUI: UIViewRepresentable {
        
    static var shared = Global_IndicatorSwiftUI()
    
    var view = Global_Indicator()
    
    func show(text: String = "", completion: @escaping (() -> Void)) {
        view.showIndicator(text: text)
        
        view.closeAction = {
            completion()
        }
    }
    
    func hide() {
        view.hideIndicator()
    }
    
    @available(iOS 13.0.0, *)
    public func makeUIView(context: Context) -> some UIView {
        return view
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

@available(iOS 13.0.0, *)
public struct GLoading_Indicator {
    
    public init() {
        
    }
    
    public static func show(text: String = "", dismissAction: @escaping (() -> Void)) {
        Global_IndicatorSwiftUI.shared.show(text: text) {
            dismissAction()
        }
    }
    
    public static func hide() {
        Global_IndicatorSwiftUI.shared.hide()
    }
}
