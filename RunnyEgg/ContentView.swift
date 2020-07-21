import SwiftUI
import Lottie

struct ContentView: View {
    
    @State private var mainAnimProgress: CGFloat = 0
    
    @State private var dragLocation: CGFloat = 0

    let scroll = InvisibleScroll()
    var lottieView = LottieView(animation: .eggMain)
    
    var body: some View {
        ZStack {
 
            lottieView
                .gesture(DragGesture()
                            .onChanged{ (value) in
                                dragLocation = value.translation.width
                                
                                if dragLocation > 0 {
                                    lottieView.animationView.currentFrame > 30
                                        ? lottieView.animationView.play(fromFrame: lottieView.animationView.currentFrame, toFrame: 30)
                                        : lottieView.animationView.play(fromFrame: lottieView.animationView.currentFrame, toFrame: 20)
                                } else {
                                    lottieView.animationView.currentFrame < 30
                                        ? lottieView.animationView.play(fromFrame: lottieView.animationView.currentFrame, toFrame: 30)
                                        : lottieView.animationView.play(fromFrame: lottieView.animationView.currentFrame, toFrame: 38)
                                }
                            }
                            .onEnded { _ in
//                                if dragLocation > 0 {
//                                    lottieView.animationView.currentFrame > 30
//                                        ? lottieView.animationView.play(fromFrame: lottieView.animationView.currentFrame, toFrame: 30)
//                                        : lottieView.animationView.play(fromFrame: lottieView.animationView.currentFrame, toFrame: 20)
//                                } else {
//                                    lottieView.animationView.currentFrame < 30
//                                        ? lottieView.animationView.play(fromFrame: lottieView.animationView.currentFrame, toFrame: 30)
//                                        : lottieView.animationView.play(fromFrame: lottieView.animationView.currentFrame, toFrame: 38)
//                                }
                            }
                )
        }
    }
}

struct InvisibleScroll: View {
    
    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Color.red
                .tag(1)
            Color.purple
                .tag(2)
            Color.orange
                .tag(3)
        }
        .opacity(0.2)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
