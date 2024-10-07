import SwiftUI

struct OverlayImageView: View {
    var backgroundImageName: String
    var overlayImageName: String

    var body: some View {
        ZStack {
            // Background image
            Image(backgroundImageName)
                .resizable()
                // Covers the entire screen and crops if the image overflows
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView: View {
    @State private var offsetY: CGFloat = 0
    var body: some View {
        ZStack {
            // Background image
            OverlayImageView(backgroundImageName: "galaxia", overlayImageName: "Image")

            VStack {
                // Space to push the content up
                Spacer()

                // Image at the bottom
                Image("exoplanet")
                    .resizable()
                    .scaledToFit()
                    // Layout adjustment
                    .frame(height: 900)
                    .padding(.bottom, -450)
                    .offset(y: offsetY)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: offsetY)

                Spacer()
            }

            // Overlay image on top of the bottom image
            Image("Image")
                .resizable()
                .scaledToFit()
                // Layout adjustment
                .frame(width: 700, height: 700)
                .padding(.top, -350)
        }
        // Black background for the entire view
        .background(Color.black.ignoresSafeArea())
        .onAppear {
            // Animation
            offsetY = 20
        }
    }
}

#Preview {
    ContentView()
}
