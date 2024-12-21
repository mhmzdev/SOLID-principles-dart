import 'dart:async';

/// Principle: Subtypes must be substitutable for their base types
/// without altering the correctness of the program.
///
/// KEYPOINT:
/// The keypoint is [extends] keyword is used here. Which means you have to
/// override the methods in the parent class but [not] all the methods.

/// The parent class has two methods, [eat] and [sleep].
abstract class Animal {
  String get name;

  void eat() {
    print('Eating');
  }

  void sleep() {
    print('Sleeping');
  }
}

/// The child class [Dog] has its own method [eat].
class Dog extends Animal {
  /// NOTE: that we have not overridden the [sleep] method.
  /// So, it means its not compulsory to override all the methods in the parent class.
  /// Refer to [line] 6
  void eat() {
    print('Dog eating');
  }

  @override
  String get name => 'Dog';
}

/// The child class [Cat] has its own method [sleep].
class Cat extends Animal {
  /// NOTE: that we have not overridden the [eat] method.
  void sleep() {
    print('class sleeping');
  }

  @override
  String get name => 'Cat';
}

@pragma('vm:entry-point')
void main([List<String>? args]) => runZonedGuarded<void>(
      () async {
        Animal dog = Dog();
        Animal cat = Cat();

        dog.eat();
        cat.sleep();

        print(dog.name);
        print(cat.name);
      },
      (error, stackTrace) =>
          print('$error\n$stackTrace'), // ignore: avoid_print
    );

//// NOTES:
/// It's not about inheriting all attributes, but rather about how those attributes behave.
///
/// Another example would be:
/// Imagine a parent class Bird with a method fly().  Now, a child class Penguin inherits from Bird.
/// Penguins are birds, but they can't fly! If Penguin simply inherits fly() without
/// overriding it, you'd have a penguin flying, which violates the Liskov Substitution Principle.
/// Look at the [Bird] class.

abstract class Bird {
  void fly() {
    print('Flying');
  }
}

class Penguin extends Bird {
  /// The behavior of the [fly] method is overridden.
  /// But it still replaces the parent class method.
  @override
  void fly() {
    print('Penguin can\'t fly, but it can swim');
  }
}
