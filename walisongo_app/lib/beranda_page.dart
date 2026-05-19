import 'package:flutter/material.dart';
import 'panduanziarahpage.dart';
import 'sejarahwalisongopage.dart';
import 'yasin_page.dart';
import 'lokasipage.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  static const Color _green = Color(0xFF2E7D32);
  static const Color _greenLight = Color(0xFFE8F5E9);
  static const Color _accent = Color(0xFF4CAF50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildAppBar(),
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

  SliverAppBar _buildAppBar() {
  return SliverAppBar(
    floating: true,
    backgroundColor: Colors.white,
    elevation: 0,
    titleSpacing: 16,
    title: Row(
      children: const [
        Icon(Icons.menu, color: Colors.black87, size: 22),
        SizedBox(width: 10),
        Text(
          'Walisongo',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ],
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.search, color: Colors.black87),
        onPressed: () {},
      ),
    ],
  );
}

  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'SELAMAT DATANG',
            style: TextStyle(
              color: const Color.fromARGB(255, 23, 139, 91),
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Center(
          child: Text(
            'Temukan Kedamaian\ndi Jejak Para Wali',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              height: 1.2,
              color: Color(0xFF1A1A1A),
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const YasinPage()),
          );
        },
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
                child: const Icon(
                  Icons.menu_book,
                  color: Colors.white,
                  size: 28,
                ),
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
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
                size: 16,
              ),
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PanduanZiarahPage()),
              );
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildMenuCard(
            icon: Icons.location_on_outlined,
            label: 'LOKASI',
            subtitle: 'Rute Ziarah',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LokusiPage()),
              );
            },
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SejarahWalisongoPage()),
            );
          },
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
            color: Color(0xFF1A1A1A),
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
        nama: 'Makam Sunan Ampel',
        jam: 'Buka 24 Jam',
        warna: const Color(0xFF2E7D32),
      ),
      _ZiarahItem(
        kota: 'DEMAK',
        nama: 'Makam Sunan Kalijaga',
        jam: 'Buka 06.00 – 21.00',
        warna: const Color(0xFF1565C0),
      ),
      _ZiarahItem(
        kota: 'KUDUS',
        nama: 'Makam Sunan Kudus',
        jam: 'Buka 24 Jam',
        warna: const Color(0xFF6A1B9A),
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

class _ZiarahItem {
  final String kota;
  final String nama;
  final String jam;
  final Color warna;

  _ZiarahItem({
    required this.kota,
    required this.nama,
    required this.jam,
    required this.warna,
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
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            item.warna,
            item.warna.withOpacity(0.75),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: item.warna.withOpacity(0.35),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Arahkan ke halaman detail makam/ziarah
          },
          child: Stack(
            children: [
              Positioned(
                right: -20,
                top: -20,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.08),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                bottom: -30,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.06),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(6),
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
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.white70,
                          size: 13,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          item.jam,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}