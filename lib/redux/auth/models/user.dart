import 'package:flutter/material.dart';

class User {
  final String firstname;
  final String lastname;
  final String email;

  User({required this.firstname, required this.lastname, required this.email});

  @override
  bool operator ==(Object other) =>
      other is User &&
      other.firstname == firstname &&
      other.lastname == lastname &&
      other.email == email;

  @override
  int get hashCode => hashValues(firstname, lastname, email);
}
