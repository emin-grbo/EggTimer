import SwiftUI

struct Menu: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isBaseIcon = true
    @State private var isCoffeeIcon = false
    @State private var isBeerIcon = false
    @State private var iconTag = 1
    
    var coffeeAnim: LottieView = {
        var anim = LottieView(animation: .coffee)
        anim.animationView.loopMode = .loop
        return anim
    }()
    
    var beerAnim: LottieView = {
        var anim = LottieView(animation: .beer)
        anim.animationView.loopMode = .loop
        return anim
    }()
    
    var body: some View {
        ZStack {
            Color.RBpurple
            ScrollView {
            VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle")
                        .font(.title)
                }
                .buttonStyle(RBButton(shape: RoundedRectangle(cornerRadius: 20)))
                .aspectRatio(1, contentMode: .fit)
                .padding(16)
                Spacer()
            }
                Text(
                    """
                    Hi! Thank you SO MUCH for downloading the app!

                    You rock! 🤘
                            
                    If you want to send me some ♥️, do so below. In return, i will provide you with a new app Icon!
                    """
                )
                .multilineTextAlignment(.center)
                .font(Font.system(size: 14, weight: .semibold, design: .monospaced))
                .foregroundColor(.white)
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.RBpurpleDarkShadow, lineWidth: 4)
                        .background(Color.RBpurpleDarkShadow)
                )
                .padding(.horizontal, 24)
                .padding(.vertical, 32)
                Spacer()
                
                // MARK: Default ---------------------------------
                HStack {
                    Image("defaultIcon")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .cornerRadius(12)
                        .frame(width: 60)
                        .background(
                            NeuMorph(isHighlighted: false, shape: RoundedRectangle(cornerRadius: 12)))
                    VStack {
                        Text("defaultiated")
                            .font(Font.system(.caption, design: .monospaced))
                            .foregroundColor(.white)
                    }
                    .padding(16)
                    Spacer()
                    Toggle(iconTag == 1 ?  "🥚" : " ", isOn: $isBaseIcon)
                        .frame(width: 80)
                        .toggleStyle(RBToggle(shape: Capsule()))
                        .onTapGesture {
                            selectIcon(selectTag: 1)
                        }
                        
                        
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 8)
                //-------------------------------------------------------
                
                // MARK: Coffee ---------------------------------
                HStack {
                    Image("coffeeIcon")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .cornerRadius(12)
                        .frame(width: 60)
                        .background(
                            NeuMorph(isHighlighted: false, shape: RoundedRectangle(cornerRadius: 12)))
                    VStack {
                        Text("coffienated")
                            .font(Font.system(.caption, design: .monospaced))
                            .foregroundColor(.white)
                    }
                    .padding(16)
                    Spacer()
                    Toggle(iconTag == 2 ?  "🥚" : " ", isOn: $isCoffeeIcon)
                       .frame(width: 80)
                    .toggleStyle(RBToggle(shape: Capsule()))
                        .onTapGesture {
                            selectIcon(selectTag: 2)
                        }
                        
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 8)
                //-------------------------------------------------------
                
                // MARK: Beer ---------------------------------
                HStack {
                    Image("beerIcon")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .cornerRadius(12)
                        .frame(width: 60)
                        .background(
                            NeuMorph(isHighlighted: false, shape: RoundedRectangle(cornerRadius: 12)))
                    VStack {
                        Text("beernated")
                            .font(Font.system(.caption, design: .monospaced))
                            .foregroundColor(.white)
                    }
                    .padding(16)
                    Spacer()
                    Toggle(iconTag == 3 ?  "🥚" : " ", isOn: $isBeerIcon)
                       .frame(width: 80)
                    .toggleStyle(RBToggle(shape: Capsule()))
                        .onTapGesture {
                            selectIcon(selectTag: 3)
                        }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 8)
                //-------------------------------------------------------
                
                Button(action: {
                    print("get coffee")
                }) {
                    HStack {
                        coffeeAnim
                            .frame(height: 40)
                            .aspectRatio(1, contentMode: .fit)
                        Spacer()
                        Text("coffee's on me!")
                        Spacer()
                    }
                }
                .buttonStyle(RBButton(shape: Capsule()))
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
                .padding(.top, 32)
                
                
                Button(action: {
                    print("get coffee")
                }) {
                    HStack {
                        beerAnim
                            .frame(height: 40)
                            .aspectRatio(1, contentMode: .fit)
                        Spacer()
                        Text("one beer on me!")
                        Spacer()
                    }
                }
                .buttonStyle(RBButton(shape: Capsule()))
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
                
            }
        }
        }
        .onAppear {
            coffeeAnim.animationView.play()
            beerAnim.animationView.play()
        }
        .statusBar(hidden: true)
    }
    
    private func selectIcon(selectTag: Int) {
        switch selectTag {
        case 1:
            iconTag = 1
            isBaseIcon = true
            isCoffeeIcon = false
            isBeerIcon = false
        case 2:
            iconTag = 2
            isBaseIcon = false
            isCoffeeIcon = true
            isBeerIcon = false
        case 3:
            iconTag = 3
            isBaseIcon = false
            isCoffeeIcon = false
            isBeerIcon = true
        default:
            return
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
