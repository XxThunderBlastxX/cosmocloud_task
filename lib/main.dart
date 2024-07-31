import 'package:flutter/material.dart';

import 'src/app/app.dart';
import 'src/app/service/service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();
  runApp(const MyApp());
}
