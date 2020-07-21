import SwiftUI

extension Color {
    static var secondarySystemBackground: Color {
        Color(UIColor.secondarySystemBackground)
    }
}

struct ChordView: View {
    
    @State private var fontSize: CGFloat = 28
    
    let name: String
    let interval: String
    
    var body: some View {
        ZStack {
            Color.secondarySystemBackground
                .cornerRadius(10)
            VStack {
                Text(name)
                    .font(Font.system(size: fontSize, weight: .bold))
                    .padding(.all, 4)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                Text(interval)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }.aspectRatio(1, contentMode: .fill)
        }
    }
}

struct MainView: View {
    var body: some View {
        
        let gridItems = [
            GridItem(),
            GridItem(),
            GridItem()
        ]
        
        LazyVGrid(columns: gridItems) {
            ChordView(name: "Cm", interval: "iii")
            ChordView(name: "Dm7b5", interval: "vii")
            ChordView(name: "Gb", interval: "II")
                .frame(height: 100)
        }
        .padding(.all, 8)
    }
}

struct Main_Previvew: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
