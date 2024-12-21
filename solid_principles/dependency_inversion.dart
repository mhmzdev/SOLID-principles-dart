import 'dart:async';

/// Principle: High-level modules should not depend on low-level modules.
/// Both should depend on abstractions.
/// ALSO; Abstractions should not depend on details but details should depend on abstractions.

/// Theoratical example:
/// Think of it like plugging different devices into your computer.
/// Your computer (high-level module) doesn't care if you use a USB mouse
/// or a wireless mouse (low-level modules). It just needs a pointing
/// device that adheres to the mouse interface (abstraction)

// Abstraction (Interface)
abstract class PointingDevice {
  void moveCursor(int x, int y);
  void click();
}

// Concrete Implementations
class USBMouse implements PointingDevice {
  @override
  void moveCursor(int x, int y) {
    // USB mouse specific implementation
    print('Moving cursor to ($x, $y) using USB');
  }

  @override
  void click() {
    // USB mouse specific implementation
    print('USB Mouse click');
  }
}

class WirelessMouse implements PointingDevice {
  @override
  void moveCursor(int x, int y) {
    // Wireless mouse specific implementation
    print('Moving cursor to ($x, $y) wirelessly');
  }

  @override
  void click() {
    // Wireless mouse specific implementation
    print('Wireless Mouse click');
  }
}

// High-level module
class Computer {
  final PointingDevice _pointingDevice;

  Computer(this._pointingDevice);

  void usePointer() {
    _pointingDevice.moveCursor(10, 20);
    _pointingDevice.click();
  }
}

@pragma('vm:entry-point')
void main([List<String>? args]) => runZonedGuarded<void>(
      () async {
        // Using a USB mouse
        var computer = Computer(USBMouse());
        computer.usePointer();

        // Using a wireless mouse
        computer = Computer(WirelessMouse());
        computer.usePointer();
      },
      (error, stackTrace) =>
          print('$error\n$stackTrace'), // ignore: avoid_print
    );
