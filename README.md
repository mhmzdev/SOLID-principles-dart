# SOLID Principles

- S - Single Responsibility (It's very simple this is why didn't write any example for it)
- O - [Open/Close](/solid_principles/open_close.dart)
- L - [Liskov Substitute](/solid_principles/liskov_substitute.dart)
- I - [Interface segregation](/solid_principles/interface_segregation.dart)
- D - [Dependency Inversion](/solid_principles/dependency_inversion.dart)

These are set of principles that are widely applicable in OOP. Since, flutter is powered with dart so it means these can play very vital role in writing efficient code, maintaining and keeping the code clean

## 🔑 Key Points
Not going to write them in depth, you can use google/GPT. I've mentioned few key points that causes few confusion when it comes to dart sepecifically

### Abstract vs Interface
#### 📝 Other Languages
- `abstract` keyword is use to define classes for which you need to write abstract methods and to avail partial data hiding concept.
- `interface` keyword is use to achieve complete data hiding concept, and you cannot have any implementation in any interface.
- You can `extends` an abstract class and `implements` an interface

For example:
```java
abstract class MyClass {
    /// Methods are defined with implementation
    void someFunc() {};
    void anotherFunc() {}
}

interface MyInterface {
    /// Methods are defined, implementation is not allowed in interface
    void myMethod();
    void anotherMethod();
}
```
#### 🎯 Dart
- It uses `abstract` classes to achieve the goals as of stand alone `abstract` and `interface`
- You can define abstract and concrete methods in `abstract` class in dart which is not the case in Java as in above example.

For example:
```dart
abstract class DartAbstractClass {
    void concreteMethod() {} // abstract method
    void abstractMethod(); // interface method --> Not allowed in Java
    // Hence, this abstract class is playing role of abstract classes and that of
    // interface simultaneously in dart
}

// Don't need interface in dart explicitly, bcz this can be achieved
// using abstract classes.
interface class DartInterfaceClass {
    // NOTE: This is opposite of Java, bcz in dart this represents
    // that if you are using interface the it must provide a concrete
    // implementation of each method in this class.

    void concreteMethod() {} // Not allowed in Java
    void anotherConcrete() {} // Not allowed in Java
}
```
❗️ Important note:
```dart
// This doesn't exits in dart, it has to be a `class` keyword following it.
interface DartInterface {}
```

### 👀 `extends` vs `implements`
Both of these works the same as in other languages i.e.
- `extends` the child class doesn't have to provide concrete implementation of each method from parent class.
    - Generally used for extensions via `abstract`
- `implements` the child class should provide concrete implementation of each method from parent class.
    - Generally used for extensions via `interface`

In dart terms, an `abstract` can be `extends` or `implements`:
```dart
abstract class DartClass {
  void abstractMethod();
  void conreteMethod() {}
}

/// implements, it means we have to provide concrete implementation of
/// [concreteMethod] and [conreteMethod]
class DartClassImplements implements DartClass {
  @override
  void abstractMethod() {
    print('Concrete method');
  }

  @override
  void conreteMethod() {
    print('Another concrete method');
  }
}

/// extends, it means we can `override` anyone of the parent's class methods
class DartClassExtends extends DartClass {
  @override
  void concreteMethod() {
    print('Concrete method');
  }
}
```

### 🥤 Mix use of `abstract` and `interface`
Consider an example below:
```dart
abstract interface class DartClass {
  void abstractMethod();
  void concreteMethod() {}
}
```
Dart allows this because it offers flexibility in how you define and use abstract classes and interfaces.

- `abstract` Keyword: Indicates that DartClass cannot be instantiated directly. It serves as a blueprint for other classes.
- `interface` Keyword: Explicitly marks DartClass as an interface, further emphasizing its role as a contract.

#### Method Definitions:
- `void concreteMethod();`: A purely abstract method. Implementing classes must provide the implementation.
- `void anotherConcrete() {}`: An abstract method with an empty body. While it has a body, it still needs to be overridden in implementing classes because of the interface and abstract keywords.
