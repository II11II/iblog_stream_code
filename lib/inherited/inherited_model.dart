import 'package:flutter/material.dart';

class MyInheritedModel extends InheritedModel<UserModel> {
  const MyInheritedModel({required this.model, required Widget child, Key? key})
      : super(child: child, key: key);
  final UserModel model;

  @override
  bool updateShouldNotify(covariant MyInheritedModel oldWidget) {
    return oldWidget != this;
  }

  @override
  bool updateShouldNotifyDependent(covariant MyInheritedModel oldWidget, Set<UserModel> dependencies) {
   return dependencies.contains(model);
  }
  static MyInheritedModel of(BuildContext context, {required MyInheritedModel aspect}) {
    return InheritedModel.inheritFrom<MyInheritedModel>(context, aspect: aspect)!;
  }
}

class UserModel {
  final String name;
  final String surname;
  final String id;

  UserModel({this.name = '', this.surname = '', required this.id});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          surname == other.surname &&
          id == other.id;

  @override
  int get hashCode => name.hashCode ^ surname.hashCode ^ id.hashCode;
}
