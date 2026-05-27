import 'package:flutter/material.dart';

class SunanGunungJatiPage extends StatelessWidget {
  const SunanGunungJatiPage({super.key});

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
  'assets/images/keraton_gunung.png',
  'Pusat Syiar & Pemerintahan: Kesultanan Cirebon',
),
                const SizedBox(height: 16),
                _buildFilosofiSection(),
                const SizedBox(height: 24),
                _buildPepakemSection(),   
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
            // Gambar Utama Sunan Gunung Jati
            Image.asset(
              'assets/images/sunan_gunungjati.jpg', // ← Bisa disesuaikan dengan path foto Anda
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
                    'Sunan Gunung Jati',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '"Ingsun titip tajug lan fakir miskin..."',
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
            'Lahir dengan nama Syarif Hidayatullah pada sekitar tahun 1448 M, beliau merupakan putra dari Syarif Abdullah Umdatuddin (penguasa Mesir) dan Nyai Rara Santang (putri Prabu Siliwangi dari Kerajaan Pajajaran). Garis keturunan luhur ini memberinya legitimasi kuat di tanah Pasundan sekaligus jaringan luas di Timur Tengah.',
            style: TextStyle(
              fontSize: 14,
              color: textGray,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Beliau merupakan satu-satunya anggota Walisongo yang memegang peran ganda secara resmi: sebagai ulama/pandita spiritual sekaligus kepala pemerintahan (Sultan) Kesultanan Cirebon. Di bawah kepemimpinannya, Cirebon tumbuh menjadi pusat perdagangan maritim dan mercusuar penyebaran Islam di wilayah barat pulau Jawa.',
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
        'title': 'Diplomasi & Akulturasi',
        'desc': 'Pernikahan beliau dengan Putri Ong Tien Nio melahirkan perpaduan budaya seni ukir dan keramik Tionghoa di Cirebon.',
      },
      {
        'title': 'Struktur Birokrasi',
        'desc': 'Menggunakan kekuatan sistem kesultanan untuk memperluas jaringan dakwah hingga ke Banten dan Sunda Kelapa.',
      },
      {
        'title': 'Seni Macapat',
        'desc': 'Memanfaatkan seni sastra dan gending Jawa-Sunda sebagai jembatan nilai-nilai tasawuf bagi masyarakat awam.',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pendekatan Sunan Gunung Jati sangat komprehensif, memadukan kekuasaan politik, arsitektur, dan adat istiadat setempat. Beliau berhasil mengislamkan tanah Pasundan tanpa peperangan besar, melainkan melalui metode pengayoman yang adil.',
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

  Widget _buildPepakemSection() {
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
              Icons.gavel,
              color: textDark,
              size: 28,
            ),
            const SizedBox(height: 12),
            const Text(
              'Pepakem Cirebon (Pesan Abadi)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: textDark,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              '"Ingsun titip tajug lan fakir miskin."\n\n'
              'Wasiat luhur ini bermakna: "Aku titipkan mushola/masjid (untuk dijaga aktivitas ibadahnya) dan rawatlah orang-orang miskin (sebagai wujud nyata keadilan sosial)." Dua pesan ini menjadi pilar utama kebudayaan Cirebon.',
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
        'nama': 'Keraton Kasepuhan Cirebon',
        'desc': 'Masjid Syarif Abdurachman menjadi salah satu ikon baru di area Kawasan wisata zia­rah Makan Sunan Gunung Jati di Desa Astana, Kecamatan Gunung Jati, Ka­bu­paten Cirebon.',
        'lokasi': 'Gunung Jati, Kabupaten Cirebon',
        'image': 'assets/images/masjid_gunnungjati.jpg',
      },
      {
        'nama': 'Makam Sunan Gunung Jati',
        'desc': 'Kompleks pemakaman berarsitektur sembilan tingkatan dengan hiasan piring keramik kuno dinasti Ming tertempel di dinding candi bentarnya.',
        'lokasi': 'Gunung Jati, Kabupaten Cirebon',
        'image': 'assets/images/makam_gunungjati.jpeg',
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