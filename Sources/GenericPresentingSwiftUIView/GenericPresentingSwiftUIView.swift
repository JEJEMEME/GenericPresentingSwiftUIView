
import SwiftUI

@available(iOS 13.0, *)
class GenericHostingController<T: View>: UIHostingController<T> {
    override init(rootView: T) {
        super.init(rootView: rootView)
    }

    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


@available(iOS 13.0, *)
struct GenericPresentingSwiftUIView<T: View>: UIViewRepresentable {
    
    private var view: GenericHostingController<AnyView>?

    func makeUIView(context: Context) -> UIView {
        return UIView()
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // 아무 업데이트가 필요하지 않을 때는 비워둡니다.
    }
    
    public mutating func show(content: T) {
        self.view = GenericHostingController(rootView: AnyView(content))
        
        guard let view = view else { return }
        
        view.view.alpha = 0.0
        view.view.backgroundColor = .clear
        
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        window.addSubview(view.view)
        
        view.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.view.leadingAnchor.constraint(equalTo: window.leadingAnchor),
            view.view.trailingAnchor.constraint(equalTo: window.trailingAnchor),
            view.view.topAnchor.constraint(equalTo: window.topAnchor),
            view.view.bottomAnchor.constraint(equalTo: window.bottomAnchor)
        ])
        
        
        presentAnimate(dismiss: false)
    }
    
    private func presentAnimate(dismiss: Bool = true, delay: CGFloat = 0.0) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            UIView.animate(withDuration: 0.0, animations: {
                self.view?.view.alpha = 1.0
            })
            
            if dismiss {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    self.hide()
                })
            }
        }
    }
    
    public func hide(delay: CGFloat = 0.3) {
        UIView.animate(withDuration: delay, animations: {
            self.view?.view.alpha = 0.0
        }, completion: { _ in
            self.view?.view.removeFromSuperview()
        })
    }
}

