/// Principle: Clients should not be forced to depend on interfaces they do not use.

/// IMPORTANT NOTE HERE;
/// In dart [abstract] classes can have methods with body and without body.
/// So, it means it gives the representation of both [abstract] and [interface] classes.
///
/// KEYPOINT:
/// The keypoint is [implements] keyword is used here. Which means you have to
/// implement all the methods in the interface class. So, here the abstract class
/// is playing the role of an interface.
abstract class CanRun {
  void run(); // Abstract method (interface concept)
  void runFast() {} // Concrete method (abstract class concept)
}

/// If we use [interface] keyword, it will be an [interface] class.
interface class CanSlither {
  void slither() {}
}

/// Since, snake can only slither, we implement the [CanSlither] interface.
/// and it doesn't need to implement the [CanRun] interface. Which is obvious.
class Snake implements CanSlither {
  @override
  void slither() {
    print('Slithering');
  }
}

/// The keypoint is [implements] keyword is used here. Which means you have to
/// implement all the methods in the interface class.
///
/// if you replace this with [extends] keyword, it will be an [abstract] class.
///
/// Similarly, Human can only run, so it implements the [CanRun] interface.
/// and it doesn't need to implement the [CanSlither] interface. Which is obvious that
/// humans can't slither.
class Human implements CanRun {
  @override
  void run() {
    print('Running');
  }

  @override
  void runFast() {
    print('Running fast');
  }
}
