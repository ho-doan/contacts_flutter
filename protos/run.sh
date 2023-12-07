dart pub global activate protoc_plugin
export PATH="$PATH":"$HOME/.pub-cache/bin"
protoc --dart_out=../lib/src/generated ./contacts_sdk.proto
protoc --swift_out=../ios/Classes/ContactsSdk ./contacts_sdk.proto