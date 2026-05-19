import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main_container_page.dart'; // Import file penampung baru

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const WalisongoApp());
}

class WalisongoApp extends StatelessWidget {
  const WalisongoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Walisongo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2D6A4F)),
        useMaterial3: true,
      ),
      home: const MainContainerPage(), // Menuju kontainer utama
    );
  }
}