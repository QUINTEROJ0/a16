import 'dart:io';
import 'package:provider/provider.dart';                 // Add this import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';   // Add this import
import 'package:window_size/window_size.dart';
import 'assets.dart';                                    // Add this import

import 'title_screen/title_screen.dart';

void main() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowMinSize(const Size(800, 500));
  }
  Animate.restartOnHotReload = true;
  runApp(                                                // Edit from here...
    FutureProvider<Shaders?>(
      create: (context) => loadShaders(),
      initialData: null,
      child: const NextGenApp(),
    ),
  );                                                     // to here.
}

class NextGenApp extends StatelessWidget {
  const NextGenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: const TitleScreen(),
    );
  }
}