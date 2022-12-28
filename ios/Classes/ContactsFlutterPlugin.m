#import "ContactsFlutterPlugin.h"
#if __has_include(<contacts_flutter/contacts_flutter-Swift.h>)
#import <contacts_flutter/contacts_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "contacts_flutter-Swift.h"
#endif

@implementation ContactsFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftContactsFlutterPlugin registerWithRegistrar:registrar];
}
@end
