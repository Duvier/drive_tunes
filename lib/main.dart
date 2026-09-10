import 'package:flutter/material.dart';

import 'package:drive_tunes/app/app.dart';
import 'package:drive_tunes/app/initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await const AppInitializer().initialize();
  runApp(const DriveTunesApp());
}
