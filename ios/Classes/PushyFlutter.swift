import Flutter
import UIKit
import Pushy

public class PushyFlutter: NSObject, FlutterPlugin, FlutterStreamHandler {
    var pushy: Pushy?
    var eventSink: FlutterEventSink?
    var hasStartupNotification = false
    var startupNotification: [AnyHashable : Any]?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
    }
}
