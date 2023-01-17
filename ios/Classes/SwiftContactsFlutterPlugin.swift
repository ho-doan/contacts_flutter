import Flutter
import UIKit
import ContactsUI

public class SwiftContactsFlutterPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "contacts_flutter", binaryMessenger: registrar.messenger())
        let instance = SwiftContactsFlutterPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method{
        case "getContacts":getContacts(result)
        case "checkPermission" : checkPermissionPlugin(result)
        case "requestPermission" : requestPermissionPlugin(result)
        default: result(FlutterMethodNotImplemented)
        }
    }
    
    private func checkPermissionPlugin(_ result: @escaping FlutterResult){
        switch CNContactStore.authorizationStatus(for: .contacts){
        case .denied,.notDetermined,.restricted: result(false)
        case .authorized: result(true)
        @unknown default:
            result(false)
        }
    }
    
    
    private func requestPermissionPlugin(_ result: @escaping FlutterResult){
        CNContactStore().requestAccess(for: .contacts, completionHandler: {(ok,_)->Void in if ok{
            result(true)
        } else {
            result(false)
        }
        })
    }
    
    
    private func getContacts(_ result: @escaping FlutterResult){
        let contactStore = CNContactStore()
        let keysToFetch = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactPhoneNumbersKey,
        ] as [Any]
        var allContainers :[CNContainer] = []
        do{
            allContainers = try contactStore.containers(matching: nil)
        }catch{
            print("error \(error)")
        }
        var resultContact :[CNContact] = []
        for container in allContainers{
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            do{
                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                resultContact.append(contentsOf: containerResults)
            }catch{
                print("error: \(error)")
            }
        }
        var contacts:[Dictionary<String,String>] = []
        for contact in resultContact {
            var _contact :Dictionary<String,String> = Dictionary()
            _contact["name"] = "\(contact.givenName) \(contact.familyName)"
            _contact["number"] = contact.phoneNumbers.map({$0.value.stringValue}).joined(separator:", ")
            contacts.append(_contact)
        }
        result(contacts)
    }
}
