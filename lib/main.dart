//import 'package:blood_donation/homepage.dart';
//import 'package:blood_donation/homepage.dart';
//import 'dart:async';

import 'package:blood_donation/homepage.dart';
import 'package:blood_donation/maps.dart';
import 'package:blood_donation/tools/bottom_navigation_bar.dart';

import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}
