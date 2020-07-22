import SwiftUI
import Lottie

struct ContentView: View {
    
//    init(){
//        UINavigationBar.appearance().backgroundColor = UIColor(.RBpurple)
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
//        UINavigationBar.appearance().shadowImage = UIImage()
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//        //For other NavigationBar changes, look here:(https://stackoverflow.com/a/57509555/5623035)
//    }
    
    @State private var mainAnimProgress: CGFloat = 0
    
    @State private var dragLocation: CGFloat = 0

    var lottieView = LottieView(animation: .eggMain)
    
    var body: some View {
        
//        NavigationView {
        ZStack {
            Color.RBpurple
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
                )
            VStack {
            HStack(alignment: .top) {
                Image(systemName: "rotate.left.fill")
                Text("00:00")
                Image(systemName: "rotate.right.fill")
            }
                Spacer()
                Button {
                    print("tapped")
                } label: {
                    Text("Tap me")
                }
                .buttonStyle(RBButton())
            }
        }
        .statusBar(hidden: true)
//        .navigationBarTitle("Test", displayMode: .inline)
//        .navigationBarColor(.RBpurple)
//        }
    }
    
}

struct RBButton: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(
                Group {
                    Capsule()
                        .fill(Color.RBpurple)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                })
            .foregroundColor(.white)
            .frame(height: 60)
            
            
    }
}


