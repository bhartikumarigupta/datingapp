import 'package:datingapp/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ProfileEditorApp());
}

class ProfileEditorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileEditorPage(),
    );
  }
}
