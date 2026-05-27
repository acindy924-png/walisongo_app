import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main_container_page.dart';
import 'onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Kunci orientasi portrait saja
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light, // Diubah ke light agar terlihat di bg hitam onboarding
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
      // Di sini logika pembatas ukuran HP kita tanam
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling, // Cegah teks membesar ikut sistem
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Jika lebar layar melebihi 500px (artinya dibuka di Laptop/Web/Tablet)
              if (constraints.maxWidth > 500) {
                return Scaffold(
                  backgroundColor: const Color(0xFF1E1E24), // Warna background luar HP
                  body: Center(
                    child: Container(
                      width: 390,  // Lebar standar HP modern
                      height: 844, // Tinggi standar HP modern
                      margin: const EdgeInsets.symmetric(vertical: 24),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(40), // Lekukan sudut HP
                        border: Border.all(
                          color: const Color(0xFF2C2C2C), // Warna casing fisik HP
                          width: 12, // Tebal bezel/bingkai HP
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 30,
                            offset: const Offset(0, 15), // Bayangan estetik melayang
                          ),
                        ],
                      ),
                      // Memotong konten agar presisi mengikuti lengkungan frame HP
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: child!,
                      ),
                    ),
                  ),
                );
              }
              
              // Jika dibuka di HP asli (lebar < 500px), langsung tampilkan full screen normal
              return child!;
            },
          ),
        );
      },
      home: const OnboardingScreen(),
    );
  }
}