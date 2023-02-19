import UIKit
import SwiftUI

@available(iOS 13.0.0, *)
public struct GLoading_Indicator: UIViewRepresentable {
    
    static var instance = GLoading_Indicator()
    
    var view = Global_Indicator()
    
    func show() {
        view.showIndicator()
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
