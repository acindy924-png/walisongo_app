import 'package:flutter/material.dart';

class SunanAmpelPage extends StatelessWidget {
  const SunanAmpelPage({super.key});

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
                  'assets/images/masjid_ampel.jpeg',
                  'Masjid Ampel — Pusat Dakwah Islam Nusantara',
                ),
                const SizedBox(height: 16),
                _buildDakwahSection(),
                const SizedBox(height: 24),
                _buildMohLimoSection(),
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

  // ─── 1. SLIVER APP BAR ───────────────────────────────────────────────────────
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
            // Foto utama Sunan Ampel
            Image.asset(
              'assets/images/sunan _ampel.jpeg',
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
            // Overlay gradasi gelap bawah
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
            // Teks nama & kutipan
            Positioned(
              bottom: 24,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sunan Ampel',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '"Moh Limo — Lima Pantangan sebagai Pondasi Akhlak Islam"',
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

  // ─── 2. BIOGRAFI ─────────────────────────────────────────────────────────────
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
          const Text(
            'Sayyid Ali Rahmatullah, yang dikenal dengan nama Sunan Ampel, adalah salah satu tokoh utama penyebaran agama Islam di Tanah Jawa. Lahir pada tahun 1401 di Kerajaan Jeumpa, Sunan Ampel adalah putra dari Syekh Ibrahim As-Samarqandi dengan Dewi Condrowulan. Sunan Ampel juga merupakan keponakan Raja Majapahit, Prabu Kertawijaya, yang kemudian masuk Islam.',
            style: TextStyle(
              fontSize: 14,
              color: textGray,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Pada tahun 1443, Sunan Ampel mendirikan Masjid Agung Demak. Dan yang menjadi penerus untuk melanjutkan perjuangan dakwahnya di tanah Jawa adalah Raden Qasim alias Sunan Drajat, dan juga beliau merupakan putra dari diri sendiri Karimah.',
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

  // ─── 3. FOTO SEKSI ───────────────────────────────────────────────────────────
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
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

  // ─── 4. METODE DAKWAH ────────────────────────────────────────────────────────
  Widget _buildDakwahSection() {
    final items = [
      {
        'title': 'Pesantren Ampeldenta',
        'desc':
            'Mendirikan pesantren pertama di Jawa sebagai pusat pendidikan Islam.',
      },
      {
        'title': 'Pendekatan Budaya',
        'desc':
            'Memadukan nilai Islam dengan tradisi lokal tanpa meninggalkan syariat.',
      },
      {
        'title': 'Jaringan Dakwah',
        'desc':
            'Melahirkan murid-murid besar seperti Sunan Drajat dan Sunan Bonang.',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                'Peninggalan Sejarah',
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
            'Sunan Ampel dikenal dengan metode dakwah yang tegas namun penuh kasih sayang. Beliau membangun fondasi Islam di Nusantara melalui pendidikan, keluarga, dan keteladanan akhlak.',
            style: TextStyle(
              fontSize: 14,
              color: textGray,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 16),
          ...items.map(
            (item) => Padding(
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
                    child:
                        const Icon(Icons.star, color: primaryGreen, size: 14),
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
            ),
          ),
        ],
      ),
    );
  }

  // ─── 5. MOH LIMO SECTION (pengganti Ilir-Ilir) ──────────────────────────────
  Widget _buildMohLimoSection() {
    final limoItems = [
      {'no': '1.', 'text': 'Moh Madon: tidak mau main judi, togel, taruhan dan sejenisnya.'},
      {'no': '2.', 'text': 'Moh Mabuk: tidak mau minum minuman keras, khamr dan sejenisnya.'},
      {'no': '3.', 'text': 'Moh Madon: tidak mau berbuat zina, hamawis, lesbian dan sejenisnya.'},
      {'no': '4.', 'text': 'Moh Madat: tidak mau mengonsumsi narkoba dan sejenisnya.'},
      {'no': '5.', 'text': 'Moh Maling: tidak mau mencuri, korupsi, merampok dan sejenisnya.'},
    ];

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
              Icons.format_list_numbered,
              color: textDark,
              size: 28,
            ),
            const SizedBox(height: 12),
            const Text(
              'Ajaran Sunan Ampel',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: textDark,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Moh Limo — Lima hal yang harus dihindari',
              style: TextStyle(
                fontSize: 13,
                color: primaryGreen,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ...limoItems.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['no']!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: primaryGreen,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        item['text']!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: textGray,
                          height: 1.55,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── 6. TEMPAT ZIARAH ────────────────────────────────────────────────────────
  Widget _buildTempatSection() {
    final tempat = [
      {
        'nama': 'Masjid Agung Ampel',
        'desc':
            'Dibangun pada abad ke-15 Masehi, masjid yang didirikan Sunan Ampel ini punya keindahan dan gaya arsitektur yang khas dengan "Bentuk Sinkretisme Islam-Jawa" di Masjid Agung Surabaya.',
        'lokasi': 'Ampel, Surabaya',
        'image': 'assets/images/masjid_ampel.jpeg',
      },
      {
        'nama': 'Makam Sunan Ampel',
        'desc':
            'Kompleks makam yang dikelilingi gerbang gaya Eropa dan berada di kawasan kampung arab yang mempertahankan gaya timur tengah.',
        'lokasi': 'Ampel, Surabaya',
        'image': 'assets/images/makam_wali.jpeg',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                'Tempat Ziarah',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
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
          SizedBox(
            height: 160,
            width: double.infinity,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(14)),
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
                      child:
                          Icon(Icons.landscape, size: 48, color: Colors.white24),
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
                    const Icon(Icons.location_on_outlined,
                        color: primaryGreen, size: 15),
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