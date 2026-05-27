import 'package:flutter/material.dart';

class SunanGiriPage extends StatelessWidget {
  const SunanGiriPage({super.key});

  static const Color primaryGreen = Color(0xFF2D6A4F);
  static const Color darkGreen = Color(0xFF1B4332);
  static const Color lightGreenBg = Color(0xFFEBF5EE);
  static const Color bgColor = Color(0xFFF8F6F2);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGray = Color(0xFF6B6B6B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBiografiSection(),
                const SizedBox(height: 24),
                _buildImageSection(
                  'assets/images/peninggalan_giri.png', // ← Pastikan sudah ada di pubspec.yaml
                  'Pusat Dakwah & Pemerintahan: Giri Kedaton',
                ),
                const SizedBox(height: 16),
                _buildFilosofiSection(),
                const SizedBox(height: 24),
                _buildPadhangBulanSection(),   
                const SizedBox(height: 24),
                _buildTempatSection(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── 1. SLIVER APP BAR DENGAN FOTO UTAMA ─────────────────────────────────────
  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 320,
      pinned: true,
      backgroundColor: darkGreen,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Gambar Utama Sunan Giri
            Image.asset(
              'assets/images/sunan_giri.jpeg', // ← Bisa disesuaikan dengan path foto Anda
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: darkGreen,
                  child: const Center(
                    child: Icon(Icons.person, size: 100, color: Colors.white24),
                  ),
                );
              },
            ),
            // Overlay gradasi gelap bawah agar teks putih terbaca jelas
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.2),
                      Colors.transparent,
                      Colors.black.withOpacity(0.85),
                    ],
                  ),
                ),
              ),
            ),
            // Teks Nama & Kutipan
            Positioned(
              bottom: 24,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sunan Giri',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '"Padhang-padhang bulan, ayo kanca dolanan..."',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withOpacity(0.75),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBiografiSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 24,
                decoration: BoxDecoration(
                  color: primaryGreen,
                  borderRadius: BorderRadius.circular(2)
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Biografi Mendalam',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Lahir dengan nama Raden Paku pada sekitar tahun 1442 M, beliau merupakan putra dari Syekh Maulana Ishak dan Dewi Sekardadu (putri Raja Blambangan). Semasa kecil, beliau hanyut di laut dan diasuh oleh Nyai Ageng Pinatih di Gresik, hingga tumbuh menjadi ulama besar bergelar Prabu Satmata.',
            style: TextStyle(
              fontSize: 14,
              color: textGray,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Sunan Giri mendirikan sebuah pesantren kedaton di perbukitan Giri, Gresik. Pengaruh spiritual dan politiknya sangat kuat, bahkan pesantren tersebut berkembang menjadi kerajaan mandiri (Giri Kedaton) yang fatwanya ditaati oleh kerajaan-kerajaan Islam di Nusantara Timur.',
            style: TextStyle(
              fontSize: 14,
              color: textGray,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }

  // ─── 2. SEKSI FOTO FILOSOFI DAKWAH ──────────────────────────────────────────
  Widget _buildImageSection(String imagePath, String caption) {
    return Container(
      width: double.infinity,
      height: 220,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFF2C3E2D),
                  child: const Center(
                    child: Icon(Icons.image, size: 50, color: Colors.white24),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Text(
                  caption,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilosofiSection() {
    final items = [
      {
        'title': 'Permainan Anak',
        'desc': 'Menciptakan Jelungan, Jamuran, dan Cublak-cublak Suweng untuk menanamkan tauhid sejak dini.',
      },
      {
        'title': 'Giri Kedaton',
        'desc': 'Pusat pendidikan yang melahirkan da\'i ke berbagai pelosok seperti Maluku dan Papua.',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sunan Giri memiliki strategi dakwah yang unik melalui pendidikan anak-anak. Beliau menyisipkan nilai kejujuran, kebersamaan, dan ketuhanan ke dalam permainan tradisional serta lagu-lagu gembira yang mudah diingat.',
            style: TextStyle(
              fontSize: 14,
              color: textGray,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 16),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: lightGreenBg,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(Icons.star, color: primaryGreen, size: 14),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14,
                            color: textGray,
                            height: 1.6,
                          ),
                          children: [
                            TextSpan(
                              text: '${item['title']}: ',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: textDark,
                              ),
                            ),
                            TextSpan(text: item['desc']),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildPadhangBulanSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: lightGreenBg,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.music_note,
              color: textDark,
              size: 28,
            ),
            const SizedBox(height: 12),
            const Text(
              'Padhang Bulan, sluku-sluku bathok...',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: textDark,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '"Terangilah bulan, mari kawan bermain di luar memanfaatkan indahnya malam, sekaligus merenungkan ciptaan Allah dan membersihkan batin..."',
              style: TextStyle(
                fontSize: 14,
                color: textGray,
                height: 1.65,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── 3. CARD LOKASI / TEMPAT ZIARAH DENGAN FOTO ASSET ──────────────────────────
  Widget _buildTempatSection() {
    final tempat = [
      {
        'nama': 'Situs Giri Kedaton',
        'desc': 'Reruntuhan istana sekaligus pusat pesantren bersejarah yang berada di atas bukat Giri.',
        'lokasi': 'Kebomas, Gresik',
        'image': 'assets/images/masjid_giri.jpg',
      },
      {
        'nama': 'Makam Sunan Giri',
        'desc': 'Kompleks makam dengan ukiran kayu jepara kuno yang sangat indah, bertempat di area perbukitan.',
        'lokasi': 'Giri, Kebomas, Gresik',
        'image': 'assets/images/makam_giri.png',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...tempat.map((item) => _buildTempatCard(item)),
        ],
      ),
    );
  }

  Widget _buildTempatCard(Map<String, String> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Render Foto di atas Card Tempat
          SizedBox(
            height: 160,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
              child: Image.asset(
                item['image']!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF2C3E2D), Color(0xFF4A6741)],
                      ),
                    ),
                    child: const Center(
                      child: Icon(Icons.landscape, size: 48, color: Colors.white24),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['nama']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: textDark,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item['desc']!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: textGray,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, color: primaryGreen, size: 15),
                    const SizedBox(width: 4),
                    Text(
                      item['lokasi']!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: primaryGreen,
                        fontWeight: FontWeight.w600,
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
}