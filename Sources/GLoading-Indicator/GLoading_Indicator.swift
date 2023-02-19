public struct GLoading_Indicator {
    //public private(set) var text = "Hello, World!"
    
    static var instance = GLoading_Indicator()
    
    public var indicatorView = Global_Indicator()
    
    public init() {
        
    }
    
    func show() {
        indicatorView.showIndicator()
    }
    
    func hide() {
        indicatorView.hideIndicator()
    }
}
