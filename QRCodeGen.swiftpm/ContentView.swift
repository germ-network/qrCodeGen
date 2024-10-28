import SwiftUI
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    let url = "https://www.germnetwork.com/iOSAppStore"
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        VStack {
            Image(uiImage: generateQRCode(from: url))
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 400)
        }
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
