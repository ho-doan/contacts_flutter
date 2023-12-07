# Protobuf code generation

## Install the newest `protoc`. It can be done via `brew`

```sh
brew install protobuf
```

### For Swift code generation install

```sh
brew install swift-protobuf
```

### If you don't have Dart SDK on your computer please install it

```sh
brew install dart
```

### Run `pub global activate protoc_plugin`

### OPTIONAL Add plugin path to `PATH` environment variable

### Run the following command from the "protos" directory

```sh
protoc --dart_out=../lib/src/generated ./contacts_sdk.proto
protoc --swift_out=../ios/Classes/ContactsSdk ./contacts_sdk.proto
```

NOTE: If directory `../lib/generated` or `./ios/Classes/ContactsSdk` does not exist please create it.

## For develop

### Flutter Source

```sh
flutter pub add protobuf
```

### Android Source

- add dependencies

```gradle
buildscript {
    ...
    dependencies {
        ...
        classpath 'com.google.protobuf:protobuf-gradle-plugin:0.8.17'
    }
}
```

- add protobuf

```gradle
android {
    ...
}
protobuf {
    protoc {
        artifact = 'com.google.protobuf:protoc:3.18.1'
    }

    generateProtoTasks {
        all().each { task ->
            task.builtins {
                java {
                    option "lite"
                }
            }
        }
    }
}
```

- add proguard, sourceSets

```gradle
android {
    ...
    sourceSets {
        ...
        main {
            proto {
                srcDir '../protos/'
            }
        }
    }

    defaultConfig {
        ...
        consumerProguardFiles 'proguard-rules.txt'
    }
}

```

- android/proguard-rules.txt

```txt
-keep class com.hodoan.contacts_flutter.** { *; }
```

- add apply plugin

```gradle
apply plugin: 'com.google.protobuf'
```

- add dependencies

```gradle
android{
    ...
}
dependencies {
    ...
    implementation 'com.google.protobuf:protobuf-javalite:3.18.1'
}
```

- make rebuild

### Ios Source

- add plugin

```podspect
s.dependency 'Protobuf', '~> 3.5'
s.dependency 'SwiftProtobuf', '~> 1.0'
```
