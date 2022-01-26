import 'package:flutter/material.dart';

class MyInheritedNotifier extends InheritedNotifier<MyNotifier> {
  const MyInheritedNotifier({
    Key? key,
    required MyNotifier myNotifier,
    required Widget child,
  }) : super(key: key, child: child, notifier: myNotifier);

  static MyInheritedNotifier of(BuildContext context) {
    final MyInheritedNotifier? result =
        context.dependOnInheritedWidgetOfExactType<MyInheritedNotifier>();
    assert(result != null, 'No MyInheritedNotifier found in context');
    return result!;
  }
}

class MyNotifier extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  set counter(int counter) {
    _counter = counter;
    notifyListeners();
  }
}
