import 'package:flutter/material.dart';

class SunanKudusPage extends StatelessWidget {
  const SunanKudusPage({super.key});

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
                  'assets/images/menara_kudus.jpeg', // ← Pastikan sudah ada di pubspec.yaml
                  'Filosofi Dakwah: Akulturasi Menara Kudus',
                ),
                const SizedBox(height: 16),
                _buildFilosofiSection(),
                const SizedBox(height: 24),
                _buildToleransiSection(),   
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
            // Gambar Utama Sunan Kudus
            Image.asset(
              'assets/images/sunan_kudus.jpeg', // ← Bisa disesuaikan dengan path foto Anda
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
                    'Sunan Kudus',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '"Saling menghormati keyakinan, merangkul tanpa memukul..."',
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
            'Lahir dengan nama Ja\'far Shadiq pada sekitar awal abad ke-16, beliau merupakan putra dari Sunan Ngudung (RMP Gajah Sena) dan Syarifah Dewi Rahil. Beliau memiliki garis keturunan langsung ke Nabi Muhammad SAW melalui jalur Imam Husain. Sunan Kudus dikenal luas sebagai wali yang menguasai berbagai disiplin ilmu agama (*Wali al-\'Ilmi*), mulai dari fikih, tauhid, hadis, hingga tafsir.',
            style: TextStyle(
              fontSize: 14,
              color: textGray,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Selain menjadi ulama besar, beliau pernah memegang posisi penting sebagai Panglima Perang Kesultanan Demak. Kepiawaiannya dalam memimpin pemerintahan dan strategi militer menjadikannya tokoh yang sangat disegani, sebelum akhirnya memilih fokus berdakwah dan mendirikan peradaban Islam di wilayah Kudus.',
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
        'title': 'Arsitektur Menara',
        'desc': 'Bentuk menara masjid yang menyerupai candi corak Hindu sebagai jembatan visual kedekatan budaya.',
      },
      {
        'title': 'Tembang Maskumambang',
        'desc': 'Media sastra macapat ciptaan beliau yang berisi tuntunan hidup dan kesadaran spiritual.',
      },
      {
        'title': 'Pendekatan Kultural',
        'desc': 'Mengadaptasi tradisi lama masyarakat tanpa menghilangkan esensi kemurnian syariat Islam.',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Metode dakwah Sunan Kudus menonjolkan kearifan lokal yang sangat tinggi. Beliau sangat memahami psikologi masyarakat Kudus yang saat itu mayoritas masih memeluk agama Hindu dan Buddha, sehingga dakwah dilakukan dengan cara persuasif.',
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

  Widget _buildToleransiSection() {
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
              Icons.favorite,
              color: textDark,
              size: 28,
            ),
            const SizedBox(height: 12),
            const Text(
              'Kisah Toleransi Sapi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: textDark,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Salah satu bukti toleransi monumental Sunan Kudus adalah larangan menyembelih lembu/sapi bagi pengikutnya di wilayah Kudus. Demi menghormati umat Hindu yang menyucikan sapi, beliau mengganti hewan kurban dengan kerbau. Penghormatan budaya inilah yang melunakkan hati masyarakat untuk menerima Islam dengan sukarela.',
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
        'nama': 'Masjid Menara Kudus',
        'desc': 'Masjid kuno bersejarah yang didirikan tahun 1549 M, terkenal dengan menara bata merahnya yang berarsitektur mirip Candi Jago.',
        'lokasi': 'Kauman, Kota Kudus',
        'image': 'assets/images/masjid_kudus.jpeg',
      },
      {
        'nama': 'Makam Sunan Kudus',
        'desc': 'Kompleks pemakaman yang terletak di bagian belakang Masjid Menara Kudus, menjadi salah satu pusat ziarah utama di jalur pantura.',
        'lokasi': 'Kauman, Kabupaten Kudus, Jawa Tengah',
        'image': 'assets/images/makam_kudus.jpeg',
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