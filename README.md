# StanwoodUITestingCore

[![Swift Version](https://img.shields.io/badge/Swift-4.0.x-orange.svg)]()
[![iOS 10+](https://img.shields.io/badge/iOS-10+-EB7943.svg)]()
[![MIT](https://img.shields.io/packagist/l/doctrine/orm.svg)]()
[![Build Status](https://travis-ci.org/stanwood/StanwoodUITestingCore_iOS.svg?branch=master)](https://travis-ci.org/stanwood/StanwoodUITestingCore_iOS)

## Table of contents

- [Author](#author)
- [Installation](#installation)
- [Usage](#usage)
- [Licence](#licence)


## Author

Tal Zion tal.zion@stanwood.io

## Installation

```ruby
platform :ios, '10.0'

pod 'StanwoodUITestingCore', :configurations => ['Debug']
```

>Note: Make sure StanwoodUITestingCore is only added to Debug configurations.

## Update

```
$ pod update StanwoodCore
```

## Usage

#### Importing frameworks

```swift
#if DEBUG
    import StanwoodUITestingCore
#endif
```
#### Add a listener instance of `UITestingCoreListener`

```swift
#if DEBUG
    private var listener: UITestingCoreListener!
#endif
```
#### Listen for events and update Firebase live database instance

```swift
#if DEBUG
listener = UITestingCoreListener()
        
// Auth anonymously
// Note: Make sure this option is enabled on Firebsae, and only runs on the Debug instance
Auth.auth().signInAnonymously { (user, error) in
            
   DispatchQueue.global(qos: .background).async {
                
     // Listening to view events
     self.listener.listen { (item) in
                    
     // Setting a Database instance
     let dataBase = Database.database()
     var ref = dataBase.reference()
     ref = ref.child("uitesting_hierarchy_ios")
                    
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
}
#endif
```

#### ON/OFF switch

If you want to disable the listener, call: 

```swift
listener.shouldListen = false
```

## Licence

StanwoodUITestingCore is under MIT licence. See the [LICENSE](https://github.com/stanwood/StanwoodUITestingCore_iOS/blob/master/LICENSE) file for more info.

