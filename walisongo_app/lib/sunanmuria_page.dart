import 'package:flutter/material.dart';

class SunanMuriaPage extends StatelessWidget {
  const SunanMuriaPage({super.key});

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
                  'assets/images/gunung_muria.png', // ← Pastikan sudah ada di pubspec.yaml
                  'Filosofi Dakwah: Merangkul Rakyat Jelata di Gunung',
                ),
                const SizedBox(height: 16),
                _buildFilosofiSection(),
                const SizedBox(height: 24),
                _buildTradisiSection(),   
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
            // Gambar Utama Sunan Muria
            Image.asset(
              'assets/images/sunan_muria.jpeg', // ← Bisa disesuaikan dengan path foto Anda
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
                    'Sunan Muria',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '"Pager mangkok luwih becik tinimbang pager tembok..."',
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
            'Lahir dengan nama Raden Umar Said (atau Raden Prawoto), beliau merupakan putra dari Sunan Kalijaga dan Dewi Soejinah (adik Sunan Kudus). Mewarisi jiwa seni dan pendekatan kultural yang kuat dari ayahnya, Sunan Muria memilih jalan dakwah yang unik dengan menjauh dari hiruk-pikuk pusat kekuasaan.',
            style: TextStyle(
              fontSize: 14,
              color: textGray,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Beliau mendirikan pesantren dan tinggal di puncak Gunung Muria, sebuah wilayah terpencil yang dikelilingi lereng gunung lebat. Dari sana, beliau menyebarkan Islam kepada masyarakat jelata, termasuk para petani, nelayan, pedagang, dan pelaut, dengan metode yang sangat merakyat dan penuh empati.',
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
        'title': 'Tembang Sinom & Kinanthi',
        'desc': 'Mengubah lirik puisi macapat tradisional menjadi media pengajaran akhlak dan ketuhanan.',
      },
      {
        'title': 'Kursus Keterampilan',
        'desc': 'Mengajarkan langsung teknik bertani, bercocok tanam, serta berdagang untuk meningkatkan taraf hidup warga lereng gunung.',
      },
      {
        'title': 'Topografi Menyendiri',
        'desc': 'Memilih berdakwah di tempat-tempat sunyi, terpencil, dan pedalaman guna menyentuh lapisan masyarakat yang tidak terjangkau.',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gaya dakwah Sunan Muria sering disebut sebagai "Dakwah Ambyah", yaitu menyusup ke dalam tradisi rakyat kecil lalu mewarnainya dengan napas Islam. Beliau dikenal sangat toleran dan mempertahankan tradisi lama yang tidak syirik dengan mengubah fungsinya menjadi sarana bersyukur.',
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

  Widget _buildTradisiSection() {
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
              Icons.volunteer_activism,
              color: textDark,
              size: 28,
            ),
            const SizedBox(height: 12),
            const Text(
              'Filosofi Pager Mangkok',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: textDark,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              '"Pager mangkok luwih becik tinimbang pager tembok."\n\n'
              'Ajaran ini memiliki makna filosofis sosial yang mendalam: "Membentengi rumah dengan mangkok (saling berbagi makanan/bersedekah kepada tetangga) jauh lebih aman dan menyelamatkan daripada membentenginya dengan tembok yang tinggi (bersikap individualis)." Kesalehan sosial adalah benteng keamanan yang sejati.',
              style: TextStyle(
                fontSize: 13,
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
        'nama': 'Pasar Sunan Muria',
        'desc': 'Pasar tradisional yang menjadi pusat aktivitas ekonomi dan sosial di sekitar lereng Gunung Muria, tempat Sunan Muria tinggal dan mengajar masyarakat',
        'lokasi': 'Colo, Dawe, Kudus',
        'image': 'assets/images/pasar_muria.png',
      },
      {
        'nama': 'Makam Sunan Muria',
        'desc': 'Berada tepat di belakang bangunan Masjid Muria di puncak bukit. Untuk mencapainya, peziarah biasanya melewati ribuan anak tangga yang asri.',
        'lokasi': 'Puncak Gunung Muria, Kudus, Jawa Tengah',
        'image': 'assets/images/makam_muria.png',
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