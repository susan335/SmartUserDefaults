# SmartUserDefaults

SmartUserDefaults provides convenient access to UserDefaults.

## Usage
For example, provide name and age properties.
```
class UserDefaultsModel {
        
    @UserDefaultsProperty(key: "name", defaultValue: "str")
    var name: String

    @UserDefaultsOptionalProperty(key: "age")
    var age: Int?
}
```

