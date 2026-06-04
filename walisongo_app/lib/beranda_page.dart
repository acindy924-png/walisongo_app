import 'package:flutter/material.dart';

// Menghubungkan ke file halaman asli sesuai struktur lib Anda
import 'panduanziarahpage.dart';
import 'lokasipage.dart';
import 'sejarahwalisongopage.dart';
import 'yasin_page.dart';

class BerandaPage extends StatelessWidget {
  final Function(int)? onTabChange; // ← ini harus ada
  const BerandaPage({super.key, this.onTabChange}); // ← ini juga

  static const Color _green = Color(0xFF2E7D32);
  static const Color _greenLight = Color(0xFFE8F5E9);
  static const Color _accent = Color(0xFF4CAF50);

  // Data menu terpusat yang langsung mengarah ke Class Halaman Anda
  static const List<Map<String, dynamic>> _menuItems = [
    {
      'title': 'Panduan Ziarah',
      'subtitle': 'Adab & Tata Cara Berziarah',
      'icon': Icons.menu_book_outlined,
      'page': PanduanZiarahPage(), // Sesuai class di panduanziarahpage.dart
    },
    {
      'title': 'Lokasi',
      'subtitle': 'Rute & Peta Ziarah Walisongo',
      'icon': Icons.location_on_outlined,
      'page': LokusiPage(), // Sesuai class di lokasipage.dart
    },
    {
      'title': 'Sejarah Walisongo',
      'subtitle': 'Kisah & Perjalanan Para Wali',
      'icon': Icons.history_edu_outlined,
      'page': SejarahWalisongoPage(), // Sesuai class di sejarahwalisongopage.dart
    },
    {
      'title': 'Yasin',
      'subtitle': 'Bacaan Surat Yasin',
      'icon': Icons.auto_stories_outlined,
      'page': YasinPage(), // Sesuai class di yasin_page.dart
    },
  ];

  // Fungsi navigasi universal menggunakan Navigator.push bawaan Flutter
  void _pindahHalaman(BuildContext context, Widget halamanTujuan) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => halamanTujuan),
    );
  }

  void _showSearch(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _SearchSheet(
        menuItems: _menuItems,
        onPageSelected: (halaman) => _pindahHalaman(context, halaman),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildAppBar(context),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    _buildHeroSection(),
                    const SizedBox(height: 24),
                    _buildYasinCard(context),
                    const SizedBox(height: 16),
                    _buildMenuGrid(context),
                    const SizedBox(height: 16),
                    _buildSejarahBanner(context),
                    const SizedBox(height: 20),
                    _buildMutiaraHikmah(),
                    const SizedBox(height: 24),
                    _buildZiarahHeader(),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            _buildZiarahList(),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: Colors.white,
      elevation: 0,
      titleSpacing: 16,
      title: const Row(
        children: [
          SizedBox(width: 10),
          Text(
            'Walisongo',
            style: TextStyle(
              color: Color.fromRGBO(45, 106, 79, 1),
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Color.fromRGBO(45, 106, 79, 1)),
          onPressed: () => _showSearch(context),
        ),
      ],
    );
  }

  Widget _buildHeroSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmall = MediaQuery.of(context).size.width < 360;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'SELAMAT DATANG',
                style: TextStyle(
                  color: const Color.fromARGB(255, 23, 139, 91),
                  fontSize: isSmall ? 14 : 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Temukan Kedamaian\ndi Jejak Para Wali',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isSmall ? 22 : 28,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                  color: const Color.fromRGBO(45, 106, 79, 1),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Center(
              child: Text(
                'Mari melangkah dalam perjalanan\nspiritual yang menyejukkan hati dan jiwa.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildYasinCard(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(27, 67, 50, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _pindahHalaman(context, const YasinPage()),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.menu_book, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    'Yasin',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildMenuCard(
            icon: Icons.menu_book_outlined,
            label: 'PANDUAN',
            subtitle: 'Adab & Tata Cara',
            onTap: () => _pindahHalaman(context, const PanduanZiarahPage()),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildMenuCard(
            icon: Icons.location_on_outlined,
            label: 'LOKASI',
            subtitle: 'Rute Ziarah',
            onTap: () => _pindahHalaman(context, const LokusiPage()),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String label,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: _green, size: 24),
                const SizedBox(height: 10),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSejarahBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: _greenLight,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _green.withOpacity(0.3)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () => _pindahHalaman(context, const SejarahWalisongoPage()),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _green.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.history_edu, color: _green, size: 22),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PELAJARI',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: _accent,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const Text(
                      'Sejarah Walisongo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios, color: _green, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMutiaraHikmah() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 3,
                height: 14,
                decoration: BoxDecoration(
                  color: _green,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'MUTIARA HIKMAH',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Text(
            '"Sapa kang temen, tinemu. Barang siapa yang bersungguh-sungguh, akan mendapatkan."',
            style: TextStyle(
              fontSize: 15,
              fontStyle: FontStyle.italic,
              height: 1.6,
              color: Color(0xFF2C2C2C),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '— Sunan Kalijaga',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: _green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildZiarahHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Ziarah Hari Ini',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(45, 106, 79, 1),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'LIHAT SEMUA',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: _green,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ],
    );
  }

  SliverList _buildZiarahList() {
    final ziarahItems = [
      _ZiarahItem(
        kota: 'SURABAYA',
        nama: 'Makam Sunan Kudus',
        jam: 'Buka 24 Jam',
        imagePath: 'assets/images/menara_kudus.jpeg',
      ),
      _ZiarahItem(
        kota: 'DEMAK',
        nama: 'Makam Sunan Kalijaga',
        jam: 'Buka 06.00 – 21.00',
        imagePath: 'assets/images/masjid_demak.jpeg',
      ),
      _ZiarahItem(
        kota: 'KUDUS',
        nama: 'Makam Sunan Ampel',
        jam: 'Buka 24 Jam',
        imagePath: 'assets/images/makam_wali.jpeg',
      ),
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final item = ziarahItems[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: _ZiarahCard(item: item),
          );
        },
        childCount: ziarahItems.length,
      ),
    );
  }
}

// ─── SEARCH BOTTOM SHEET ──────────────────────────────────────────────────────
class _SearchSheet extends StatefulWidget {
  final List<Map<String, dynamic>> menuItems;
  final Function(Widget) onPageSelected;

  const _SearchSheet({required this.menuItems, required this.onPageSelected});

  @override
  State<_SearchSheet> createState() => _SearchSheetState();
}

class _SearchSheetState extends State<_SearchSheet> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _filtered = [];

  static const Color _green = Color(0xFF2E7D32);
  static const Color _greenLight = Color(0xFFE8F5E9);

  @override
  void initState() {
    super.initState();
    _filtered = widget.menuItems;
  }

  void _onSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _filtered = widget.menuItems;
      } else {
        _filtered = widget.menuItems.where((item) {
          final title = (item['title'] as String).toLowerCase();
          final subtitle = (item['subtitle'] as String).toLowerCase();
          return title.contains(query.toLowerCase()) ||
              subtitle.contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _controller,
              autofocus: true,
              onChanged: _onSearch,
              decoration: InputDecoration(
                hintText: 'Cari halaman...',
                prefixIcon: const Icon(Icons.search, color: _green),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, size: 18),
                        onPressed: () {
                          _controller.clear();
                          _onSearch('');
                        },
                      )
                    : null,
                filled: true,
                fillColor: _greenLight,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _controller.text.isEmpty ? 'Semua Halaman' : 'Hasil Pencarian',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          Expanded(
            child: _filtered.isEmpty
                ? const Center(
                    child: Text(
                      'Halaman tidak ditemukan',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _filtered.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final item = _filtered[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 4),
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: _greenLight,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            item['icon'] as IconData,
                            color: _green,
                            size: 22,
                          ),
                        ),
                        title: Text(
                          item['title'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        subtitle: Text(
                          item['subtitle'] as String,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            size: 14, color: Colors.grey),
                        onTap: () {
                          Navigator.pop(context); // 1. Tutup bottom sheet pencarian
                          widget.onPageSelected(item['page'] as Widget); // 2. Langsung eksekusi buka halaman tujuan
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _ZiarahItem {
  final String kota;
  final String nama;
  final String jam;
  final String imagePath;

  _ZiarahItem({
    required this.kota,
    required this.nama,
    required this.jam,
    required this.imagePath,
  });
}

class _ZiarahCard extends StatelessWidget {
  final _ZiarahItem item;
  const _ZiarahCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Image.asset(
              item.imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFF2E7D32),
                  child: const Center(
                    child: Icon(Icons.image_not_supported,
                        color: Colors.white30, size: 40),
                  ),
                );
              },
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.75),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      item.kota,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.nama,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.access_time,
                          color: Colors.white70, size: 13),
                      const SizedBox(width: 4),
                      Text(
                        item.jam,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(onTap: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}