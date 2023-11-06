import SwiftUI
import GoogleMobileAds

struct BannerContentView: View {
    let navigationTitle: String
    @State private var bannerTapped = false // Banner tıklanabilir olduğunda bannerTapped değişkenini ileteceğiz

    var body: some View {
        NavigationView {
            VStack {
                Text("Banner Content Goes Here") // Banner içeriğini burada gösterebilirsiniz.
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding()
                
                Spacer()
                
                BannerViewControllerWrapper(bannerTapped: $bannerTapped)
                    .navigationBarTitle(navigationTitle, displayMode: .inline)
            }
        }
    }
}

struct BannerContentView_Previews: PreviewProvider {
    static var previews: some View {
        BannerContentView(navigationTitle: "Banner")
    }
}

private struct BannerViewControllerWrapper: UIViewControllerRepresentable {
    @Binding var bannerTapped: Bool

    func makeUIViewController(context: Context) -> BannerViewController {
        let viewController = BannerViewController(bannerTapped: $bannerTapped)
        return viewController
    }

    func updateUIViewController(_ uiViewController: BannerViewController, context: Context) {
        // Gerekirse burada güncelleme işlemleri yapabilirsiniz
    }
}

class BannerViewController: UIViewController, GADBannerViewDelegate {
    @Binding var bannerTapped: Bool
    private let bannerView = GADBannerView()
    private let adUnitID = "ca-app-pub-4017977826036850/6699105524"

    init(bannerTapped: Binding<Bool>) {
        self._bannerTapped = bannerTapped
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = self
        bannerView.delegate = self
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        
        NSLayoutConstraint.activate([
            bannerView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        bannerView.load(GADRequest())
    }

    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
        if !bannerTapped {
            print("DID RECEIVE AD")
        }
    }

    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
        if !bannerTapped {
            print("DID NOT RECEIVE AD: \(error.localizedDescription)")
        }
    }
}

