import SwiftUI

let numberOfSamples: Int = 1

struct BarView: View {
   // 1
    var value: CGFloat

    var body: some View {
        ZStack {
           // 2
           Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [.white.opacity(0.7), .white.opacity(0.2)]),
                                     startPoint: .top,
                                     endPoint: .bottom))
                // 3
                .frame(width: (UIScreen.main.bounds.width - CGFloat(numberOfSamples) * 4) / CGFloat(numberOfSamples), height: value)
        }
    }
}

struct WavesView: View {
    // 1
    @ObservedObject private var mic = MicrophoneMonitor(numberOfSamples: numberOfSamples)
    
    // 2
    private func normalizeSoundLevel(level: Float) -> CGFloat {
        let level = max(0.2, CGFloat(level) + 50) / 2 // between 0.1 and 25
        
        return CGFloat(level * (300 / 25)) // scaled to max at 300 (our height of our bar)
    }
    
    var body: some View {
        VStack {
             // 3
            HStack(spacing: 4) {
                 // 4
                ForEach(mic.soundSamples, id: \.self) { level in
                    BarView(value: self.normalizeSoundLevel(level: level))
                }
            }
        }
    }
}
