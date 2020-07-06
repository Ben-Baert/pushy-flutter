import Flutter
import UIKit
import Pushy

public class PushyFlutter: NSObject, FlutterPlugin, FlutterStreamHandler {
    var pushy: Pushy?
    var eventSink: FlutterEventSink?
    var hasStartupNotification = false
    var startupNotification: [AnyHashable : Any]?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        // Register a method channel that the Flutter app may invoke
        let channel = FlutterMethodChannel(name: PushyChannels.methodChannel, binaryMessenger: registrar.messenger())
        
        // Instantiate Pushy plugin
        let instance = PushyFlutter()
        
        // Set up method channnel delegate
        registrar.addMethodCallDelegate(instance, channel: channel)
        
        // Create event channel for sending notifications to Flutter app
        let stream = FlutterEventChannel(name: PushyChannels.eventChannel, binaryMessenger: registrar.messenger())
        
        // Registers the plugin as a receiver of UIApplicationDelegate calls
        registrar.addApplicationDelegate(instance)
        
        // Handle stream events in this class
        stream.setStreamHandler(instance)
    }
    
    public func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) -> Bool {
        // It seems this method declaration is necessary for handling notification tap while app is killed
        return true
    }    
}
