import 'package:ecnictech_fnb_ui/app/app.dart';
import 'package:ecnictech_fnb_ui/app/initialize_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await initialzeContainer();

  runApp(const App());
}
