import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // TODO: Create ios/Runner/Keys.plist with your API key and load it like:
    // if let path = Bundle.main.path(forResource: "Keys", ofType: "plist"),
    //    let keys = NSDictionary(contentsOfFile: path),
    //    let apiKey = keys["MAPS_API_KEY"] as? String {
    //   GMSServices.provideAPIKey(apiKey)
    // }
    GMSServices.provideAPIKey("YOUR_API_KEY_HERE")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
