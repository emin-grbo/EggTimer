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
    @State private var timerValue: Int = 65
    
    @State private var eggState: EggState = .runny
    @State private var isRunning: Bool = false
    
    @State private var isShowingInfo = false
    @State private var isShowingMenu = false

    let timer = Timer.publish(every: 1, on: .main, in: .common)

    var lottieView = LottieView(animation: .eggMain)
    
    var body: some View {

        ZStack {
            Color.RBpurple
            Group {
            lottieView
                .padding(.all, 80)
            }
            .contentShape(Rectangle())
            .gesture(DragGesture()
                        .onChanged{ (value) in
                            dragLocation = value.translation.width
                            
                            if dragLocation > 0 {
                                lottieView.animationView.currentFrame > 30
                                    ? stateChanged(state: .medium)
                                    : stateChanged(state: .runny)
                            } else {
                                lottieView.animationView.currentFrame < 30
                                    ? stateChanged(state: .medium)
                                    : stateChanged(state: .hard)
                            }
                        }
            )
            VStack {
                HStack(alignment: .top) {
                    
                    Button(action: {
                        isShowingMenu = true
                    }) {
                        Image(systemName: "menubar.dock.rectangle")
                            .font(.title)
                    }

                    .buttonStyle(RBButton(shape: RoundedRectangle(cornerRadius: 20)))
                    .aspectRatio(1, contentMode: .fit)
                    .padding(16)
                    
                    Spacer()
                    Text(timerValue.toTime())
                        .font(Font.system(size: 34, weight: .semibold, design: .monospaced))
                        .padding(.all, 24)
                        .onReceive(timer) { _ in
                            timerValue -= 1
                        }
                    
                    Spacer()
                    
                    Button(action: {
                        isShowingInfo = true
                    }) {
                        Image(systemName: "info.circle")
                            .font(.title)
                    }
                    .buttonStyle(RBButton(shape: RoundedRectangle(cornerRadius: 20)))
                    .aspectRatio(1, contentMode: .fit)
                    .padding(16)
                }
                .foregroundColor(.white)
                .padding(.top, 24)
            .frame(maxWidth: .infinity, maxHeight: 60)
                Spacer()
                Toggle("start", isOn: $isRunning)
                .toggleStyle(RBToggle(shape: Capsule()))
                    .onTapGesture {
                        isRunning.toggle()
                    }
                    .padding(.all, 24)
            }
            
        }
        .statusBar(hidden: true)
        .navigationBarHidden(true)
        .preferredColorScheme(.dark)

        // MARK: Popovers
        .sheet(isPresented: $isShowingInfo) {
            InfoView()
        }
        .sheet(isPresented: $isShowingMenu) {
            Menu()
        }

    }
    
    func stateChanged(state: EggState) {
        switch state {
        case .runny:
            lottieView.animationView.play(fromFrame: lottieView.animationView.currentFrame, toFrame: 20)
        case .medium:
            lottieView.animationView.play(fromFrame: lottieView.animationView.currentFrame, toFrame: 30)
        case .hard:
            lottieView.animationView.play(fromFrame: lottieView.animationView.currentFrame, toFrame: 38)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum EggState {
    case runny
    case medium
    case hard
}

