import 'package:flutter/material.dart';
import 'fasilitaspage.dart';

class LokusiPage extends StatefulWidget {
  const LokusiPage({super.key});

  @override
  State<LokusiPage> createState() => _LokusiPageState();
}

class _LokusiPageState extends State<LokusiPage> {
  static const Color primaryGreen = Color(0xFF2D6A4F);
  static const Color lightGreenBg = Color(0xFFEBF5EE);
  static const Color bgColor = Color(0xFFFFFFFF);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGray = Color(0xFF6B6B6B);

  int _selectedFilter = 0;
  final List<String> _filters = ['Jawa Barat', 'Jawa Timur', 'Jawa Tengah'];

  // 1. KITA TAMBAHKAN DATA MASJID, JARAK, & STATUS SECARA OTOMATIS DI SINI
  final List<Map<String, dynamic>> _lokasiList = [
    {
      'tag': 'CIREBON',
      'nama': 'Sunan Gunung Jati',
      'desc': 'Sunan Gunung Jati memiliki nama asli yaitu Syarif Hidayatullah adalah putra dari Raja Abdullah (Syarif Abdullah).',
      'wilayah': 'Jawa Barat',
      'imagePath': 'assets/images/sunan_gunung_jati.jpeg',
      'masjid': 'Masjid Jami Sunan Gunung Jati',
      'jarak': '120m dari titik Anda',
      'status': 'Terbuka',
    },
    {
      'tag': 'SURABAYA',
      'nama': 'Sunan Ampel',
      'desc': 'Sunan Ampel memiliki nama asli Raden Mohammad Ali Rahmatullah yang merupakan putra dari Sunan Gresik.',
      'wilayah': 'Jawa Timur',
      'imagePath': null,
      'masjid': 'Masjid Agung Sunan Ampel',
      'jarak': '400m dari titik Anda',
      'status': 'Ramai',
    },
    {
      'tag': 'GRESIK',
      'nama': 'Sunan Giri',
      'desc': 'Sunan Giri merupakan putra dari Maulana Ishaq dengan Dewi Sekardadu, dengan nama asli Joko Samudro.',
      'wilayah': 'Jawa Timur',
      'imagePath': null,
      'masjid': 'Masjid Ainul Yaqin Sunan Giri',
      'jarak': '250m dari titik Anda',
      'status': 'Terbuka',
    },
    {
      'tag': 'GRESIK',
      'nama': 'Sunan Gresik',
      'desc': 'Maulana Malik Ibrahim atau Sunan Gresik merupakan wali pertama di tanah Jawa.',
      'wilayah': 'Jawa Timur',
      'imagePath': null,
      'masjid': 'Masjid Jami Maulana Malik Ibrahim',
      'jarak': '180m dari titik Anda',
      'status': 'Terbuka',
    },
    {
      'tag': 'TUBAN',
      'nama': 'Sunan Bonang',
      'desc': 'Sunan Bonang memiliki nama asli Raden Makdum Ibrahim yang lahir pada tahun 1465 M di Surabaya.',
      'wilayah': 'Jawa Timur',
      'imagePath': null,
      'masjid': 'Masjid Agung Tuban (Sunan Bonang)',
      'jarak': '300m dari titik Anda',
      'status': 'Terbuka',
    },
    {
      'tag': 'LAMONGAN',
      'nama': 'Sunan Drajat',
      'desc': 'Sunan Drajat yang memiliki nama asli Raden Syarifudin atau Raden Qasim adalah anak dari Sunan Ampel.',
      'wilayah': 'Jawa Timur',
      'imagePath': null,
      'masjid': 'Masjid Sunan Drajat Lamongan',
      'jarak': '350m dari titik Anda',
      'status': 'Terbuka',
    },
    {
      'tag': 'KUDUS',
      'nama': 'Sunan Kudus',
      'desc': 'Sunan Kudus atau Ja’far Shadiq merupakan putra dari Raden Usman Haji atau Sunan Ngudung.',
      'wilayah': 'Jawa Tengah',
      'imagePath': null,
      'masjid': 'Masjid Menara Kudus',
      'jarak': '150m dari titik Anda',
      'status': 'Ramai',
    },
    {
      'tag': 'DEMAK',
      'nama': 'Sunan Kalijaga',
      'desc': 'Sunan Kalijaga atau Raden Said adalah anak dari Bupati Tuban bernama Tumenggung Wilatikta',
      'wilayah': 'Jawa Tengah',
      'imagePath': null,
      'masjid': 'Masjid Agung Demak Kadilangu',
      'jarak': '200m dari titik Anda',
      'status': 'Terbuka',
    },
    {
      'tag': 'KUDUS',
      'nama': 'Sunan Muria',
      'desc': 'Sunan Muria atau Raden Umar Said ialah wali termuda yang menyebarkan agama Islam.',
      'wilayah': 'Jawa Tengah',
      'imagePath': null,
      'masjid': 'Masjid Sunan Muria Colo',
      'jarak': '500m (Akses Tangga)',
      'status': 'Terbuka',
    },
  ];

  List<Map<String, dynamic>> get _filteredList =>
      _lokasiList.where((item) => item['wilayah'] == _filters[_selectedFilter]).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 20),
                    _buildFilterChips(),
                    const SizedBox(height: 20),
                    ..._filteredList.map((item) => _buildLokasiCard(item)),
                    if (_filteredList.isEmpty) _buildEmpty(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [                          // <-- const dihapus
        Row(
          children: const [
            Icon(Icons.menu, color: Color(0xFF1A1A1A), size: 22),
            SizedBox(width: 10),
            Text(
              'Walisongo',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryGreen,
              ),
            ),
          ],
        ),
        const Icon(Icons.search, color: primaryGreen, size: 24),
      ],
    ),
  );
}

Widget _buildEmpty() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 60),
    child: Center(
      child: Column(
        children: [
          const Icon(Icons.mosque_outlined, size: 48, color: Colors.grey),
          const SizedBox(height: 12),
          Text(
            'Belum ada lokasi di wilayah ini.',
            style: TextStyle(fontSize: 14, color: textGray),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Lokasi Ziarah',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: primaryGreen,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Temukan jejak dakwah sembilan wali di tanah Jawa melalui panduan lokasi makam yang sakral dan penuh sejarah.',
            style: TextStyle(
              fontSize: 13.5,
              color: textGray,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }

Widget _buildFilterChips() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      children: List.generate(_filters.length, (i) {
        final isSelected = _selectedFilter == i;
        return GestureDetector(
          onTap: () => setState(() => _selectedFilter = i),
          child: AnimatedContainer(           // <-- child ada DI DALAM GestureDetector
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? primaryGreen : Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: isSelected ? primaryGreen : Colors.grey.shade300,
              ),
            ),
            child: Text(
              _filters[i],
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : textGray,
              ),
            ),
          ),
        );
      }),
    ),
  );
}
  Widget _buildLokasiCard(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: item['imagePath'] != null
                ? Image.asset(
                    item['imagePath'],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _buildImagePlaceholder(),
                  )
                : _buildImagePlaceholder(),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: lightGreenBg,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        item['tag'],
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: primaryGreen,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        item['nama'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: textDark,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  item['desc'],
                  style: TextStyle(
                    fontSize: 13.5,
                    color: textGray,
                    height: 1.55,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildButton(
                        label: 'Fasilitas',
                        icon: Icons.apartment_outlined,
                        onTap: () {
                          // 2. KUNCI PERBAIKAN: Mengirim data item card aktif ke FasilitasPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => FasilitasPage(
                                namaMasjid: item['masjid'] ?? 'Masjid Sekitar',
                                jarakMasjid: item['jarak'] ?? 'Jarak tidak diketahui',
                                statusMasjid: item['status'] ?? 'Terbuka',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildButton(
                        label: 'Buka Peta',
                        icon: Icons.map_outlined,
                        onTap: () {
                          // Aksi Google Maps
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2C3E2D), Color(0xFF4A6741)],
        ),
      ),
      child: const Center(
        child: Icon(Icons.mosque_outlined, size: 56, color: Colors.white24),
      ),
    );
  }

  // 3. MENYESUAIKAN REUSABLE BUTTON AGAR MENERIMA VOIDCALLBACK DARI CARD
  Widget _buildButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap, // Sudah fix dari VoidColorCallback ke VoidCallback
  }) {
    return GestureDetector(
      onTap: onTap, // Cukup dipanggil sekali di sini!
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: primaryGreen,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 6),
            Icon(icon, color: Colors.white, size: 15),
          ],
        ),
      ),
    );
  }
}