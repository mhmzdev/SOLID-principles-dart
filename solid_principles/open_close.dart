import 'dart:async';

/// Principle: Software entities (classes, modules, functions, etc.) should be open for extension
/// but closed for modification.
/// 
/// KEYPOINT:
/// The keypoint is [abstract] keyword is used here. Which clearly means that we are not going to
/// modify the parent class. We are going to extend it.
/// 
/// Which means the parent class will be an [abstract] class to make sure we are not
/// going to modify the parent class.
abstract class Shape {
  void draw();
  void erase() {
    print('Erasing shape');
  }
}

/// Circle has its own radius property and implements the draw method.
/// Square implements the draw method.
///
/// So, it means that if we want to add a new shape, we can do it without modifying
class Circle extends Shape {
  double radius = 0;

  set setRadius(double radius) {
    this.radius = radius;
  }

  get getRadius => radius;

  @override
  void draw() {
    print('Drawing circle');
  }

  @override
  void erase() {
    print('Erasing circle');
  }
}

/// Square implements the draw method.
/// Square has its own side property.
/// 
/// But, this doesn't override the erase method from the Shape class.
class Square extends Shape {
  int side = 0;

  set setSide(int side) {
    this.side = side;
  }

  get getSide => side;

  @override
  void draw() {
    print('Drawing square');
  }
}

@pragma('vm:entry-point')
void main([List<String>? args]) => runZonedGuarded<void>(
      () async {
        final circle = Circle();
        final square = Square();

        circle.draw();
        circle.erase();

        square.draw();
        square.erase();
      },
      (error, stackTrace) =>
          print('$error\n$stackTrace'), // ignore: avoid_print
    );
