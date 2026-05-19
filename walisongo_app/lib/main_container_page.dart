import 'package:flutter/material.dart';
import 'beranda_page.dart';
import 'panduanziarahpage.dart';
import 'sejarahwalisongopage.dart';
import 'yasin_page.dart';
import 'lokasipage.dart';

class MainContainerPage extends StatefulWidget {
  const MainContainerPage({super.key});

  @override
  State<MainContainerPage> createState() => _MainContainerPageState();
}

class _MainContainerPageState extends State<MainContainerPage> {
  int _currentIndex = 0;

  late final List<Widget> _pages = [
    const BerandaPage(),
    const PanduanZiarahPage(),
    const LokusiPage(),   // ← sesuaikan dengan nama class di lokasipage.dart
    const SejarahWalisongoPage(),
    const YasinPage(),
  ];

  void ubahTab(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2D6A4F),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: 'Panduan'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label: 'Lokasi'),
          BottomNavigationBarItem(icon: Icon(Icons.history_edu_outlined), label: 'Sejarah'),
          BottomNavigationBarItem(icon: Icon(Icons.auto_stories_outlined), label: 'Yasin'),
        ],
      ),
    );
  }
}