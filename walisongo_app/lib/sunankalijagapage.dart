import 'package:flutter/material.dart';

class SunanKalijagaPage extends StatelessWidget {
  const SunanKalijagaPage({super.key});

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
                  'assets/images/wayang_kalijaga.jpg',
                  'Filosofi Dakwah: Wayang & Seni',
                ),
                const SizedBox(height: 16),
                _buildFilosofiSection(),
                const SizedBox(height: 24),
                _buildIlirIlirSection(),   // ← tambahkan ini
                const SizedBox(height: 24),
                _buildTempatSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
            color: Colors.black26,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Background gradient (ganti dengan Image.asset jika ada foto)
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF2C3E2D),
                    Color(0xFF1B4332),
                  ],
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.white24,
                ),
              ),
            ),
            // Overlay gradient bawah
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 160,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xFF1B4332),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Teks nama
            Positioned(
              bottom: 24,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sunan Kalijaga',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '"Mangesthi Sing Temenan, Kanggo Kaslamétaning..."',
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
                  borderRadius: BorderRadius.circular(2),
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
          Text(
            'Lahir dengan nama Raden Syahid pada sekitar tahun 1450 M, beliau merupakan putra dari Tumenggung Wilatikta, Bupati Tuban. Perjalanan spiritualnya dimulai dari kegelisahan nurani melihat ketimpangan sosial, yang membawanya pada pertemuan legendaris dengan Sunan Bonang.',
            style: TextStyle(
              fontSize: 14,
              color: textGray,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Kisah "Penjaga Kali" (Kalijaga) yang mashyur menggambarkan kekuatan hati beliau dalam menjalani laku prihatin dan meditasi di pinggir sungai sebagai bagian dari ujian spiritual sebelum akhirnya menjadi anggota Walisongo yang paling berpengaruh di tanah Jawa.',
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

  Widget _buildImageSection(String imagePath, String caption) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 220,
          color: const Color(0xFF2C3E2D),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Ganti dengan Image.asset(imagePath, fit: BoxFit.cover) jika ada gambar
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1B4332), Color(0xFF4A6741)],
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 60, color: Colors.white24),
                ),
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
                        Colors.black.withOpacity(0.7),
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
      ],
    );
  }

  Widget _buildFilosofiSection() {
    final items = [
      {
        'title': 'Pewayangan',
        'desc': 'Metafora perjalanan jiwa menuju Sang Khalik.',
      },
      {
        'title': 'Tembang Ilir-Ilir',
        'desc': 'Pesan spiritual untuk bangkit dari kegelapan.',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Berbeda dengan metode dakwah konvensional, Sunan Kalijaga menggunakan pendekatan Akulturasi Budaya. Beliau memodifikasi Wayang Kulit yang semula bernilai dengan epik Hindu-Buddha menjadi media syiar Islam.',
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
                      child: Icon(Icons.star, color: primaryGreen, size: 14),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
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

  Widget _buildTempatSection() {
    final tempat = [
      {
        'nama': 'Masjid Agung Demak',
        'desc':
            'Terkenal dengan "Soko Tatal", tiang utama yang terbuat dari serpihan kayu karya Sunan Kalijaga.',
        'lokasi': 'Demak, Jawa Tengah',
        'icon': Icons.mosque_outlined,
      },
      {
        'nama': 'Makam Sunan Kalijaga',
        'desc':
            'Tempat peristirahatan terakhir beliau, yang menjadi pusat peziarahan dan kajian budaya.',
        'lokasi': 'Kadilangu, Demak',
        'icon': Icons.location_city_outlined,
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

  Widget _buildTempatCard(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade100),
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
          // Image placeholder
          Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF2C3E2D),
                  const Color(0xFF4A6741),
                ],
              ),
            ),
            child: Center(
              child: Icon(
                item['icon'] as IconData,
                size: 48,
                color: Colors.white24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['nama'] as String,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: textDark,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item['desc'] as String,
                  style: TextStyle(
                    fontSize: 13,
                    color: textGray,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        color: primaryGreen, size: 15),
                    const SizedBox(width: 4),
                    Text(
                      item['lokasi'] as String,
                      style: TextStyle(
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

Widget _buildIlirIlirSection() {
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
          // Ikon musik
          const Icon(
            Icons.music_note,
            color: textDark,
            size: 28,
          ),
          const SizedBox(height: 12),
          // Judul / lirik pembuka
          const Text(
            'Lir-ilir, lir-ilir, tandure wus sumilir...',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: textDark,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),
          // Terjemahan / makna
          Text(
            '"Bangunlah, bangunlah! Tanaman sudah bersemi, demikian indahnya dan menghijau, bagaikan pengantin baru..."',
            style: TextStyle(
              fontSize: 14,
              color: textGray,
              height: 1.65,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
}