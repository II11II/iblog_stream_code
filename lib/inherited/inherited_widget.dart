import 'package:flutter/material.dart';

import 'inherited_model.dart';

class MyInheritedWidget extends InheritedWidget {
  const MyInheritedWidget(this.model, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);
  final UserModel model;

  static MyInheritedWidget of(BuildContext context) {
    final MyInheritedWidget? result = context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
    assert(result != null, 'No MyInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget old) {
    return old.model!=model;
  }
}
