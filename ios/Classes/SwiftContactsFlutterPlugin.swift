import Flutter
import UIKit
import ContactsUI

public class SwiftContactsFlutterPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "contacts_flutter", binaryMessenger: registrar.messenger())
        let instance = SwiftContactsFlutterPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    // MARK: - handle
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method{
        case "getContacts":getContacts(result)
        case "checkPermission" : checkPermissionPlugin(result)
        case "requestPermission" : requestPermissionPlugin(result)
        default: result(FlutterMethodNotImplemented)
        }
    }
    
    // MARK: - checkPermissionPlugin
    private func checkPermissionPlugin(_ result: @escaping FlutterResult){
        switch CNContactStore.authorizationStatus(for: .contacts){
        case .denied,.notDetermined,.restricted: result(false)
        case .authorized: result(true)
        @unknown default:
            result(false)
        }
    }
    
    // MARK: - requestPermissionPlugin
    private func requestPermissionPlugin(_ result: @escaping FlutterResult){
        CNContactStore().requestAccess(for: .contacts, completionHandler: {(ok,_)->Void in if ok{
            result(true)
        } else {
            result(false)
        }
        })
    }
    
    // MARK: - getContacts
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
            let fetchPredicate = CNContact
                .predicateForContactsInContainer(withIdentifier: container.identifier)
            do{
                let containerResults = try contactStore
                    .unifiedContacts(matching: fetchPredicate, 
                                     keysToFetch: keysToFetch as! [CNKeyDescriptor])
                resultContact.append(contentsOf: containerResults)
            }catch{
                print("error: \(error)")
            }
        }
        var cts:[ContactModel] = []
        for contact in resultContact {
            var _c:ContactModel = ContactModel()
            _c.name = "\(contact.givenName) \(contact.familyName)"
            _c.phones = contact.phoneNumbers.map({$0.value.stringValue})
            cts.append(_c)
        }
        var ctsList: ContactListModel = ContactListModel()
        ctsList.contacts = cts
        DispatchQueue.global(qos: .userInteractive).async {
            result(try? ctsList.serializedData())
        }
    }
}
