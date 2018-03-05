# StanwoodUITestingCore

[![Swift Version](https://img.shields.io/badge/Swift-4.0.x-orange.svg)]()
[![iOS 8+](https://img.shields.io/badge/iOS-9+-EB7943.svg)]()

## Table of contents

- [Author](#author)
- [Installation](#installation)
- [Usage](#usage)
- [Licence](#licence)


## Author

Tal Zion tal.zion@stanwood.io

## Installation

```ruby
source 'git@github.com:CocoaPods/Specs.git'
source 'git@github.com:stanwood/Cocoa_Pods_Specs.git'

pod 'StanwoodUITestingCore', :configurations => ['Debug']
```

>Note: Make sure StanwoodUITestingCore is only added to Debug configurations.

## Update

```
$ pod update StanwoodCore
```

## Usage

### Importing frameworks

```swift
#if DEBUG
    import StanwoodUITestingCore
#endif
```
### Add a listener instance of `UITestingCoreListener`

```swift
#if DEBUG
    private var listener: UITestingCoreListener!
#endif
```
### Listen for events and update Firebase live database instance

```swift
#if DEBUG
listener = UITestingCoreListener()

DispatchQueue.global(qos: .background).async {

    // Listening to view events
    self.listener.listen { (item) in

        // Setting a Database instance
        let dataBase = Database.database()
        var ref = dataBase.reference()
        ref = ref.child("uitesting_hierarchy")

        // Observing previous core versions
        ref.observeSingleEvent(of: .value, with: { (snapshot) in

            // Checking if the version exists
            guard let value = snapshot.value as? [String: Any],
                let data = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)  else {
                    let currentItems = UITestingCoreItems(versions: [item])
                    if let payload = currentItems.payload() {
                        ref.setValue(payload)
                    }
                    return
            }

            // Updating the current version
            if var currentItems = try? JSONDecoder().decode(UITestingCoreItems.self, from: data) {
                currentItems.append(item)

                if let payload = currentItems.payload() {
                    ref.setValue(payload)
                }
            }
        })
    }
}
#endif
```
## Licence

StanwoodUITestingCore is a private library. See the [LICENSE](https://github.com/stanwood/StanwoodUITestingCore_iOS/blob/master/LICENSE) file for more info.

