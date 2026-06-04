import 'package:flutter/material.dart';

class FasilitasPage extends StatelessWidget {
  final String namaMasjid;
  final String jarakMasjid;
  final String statusMasjid;
  final String imageMasjid;
  final String imageToko;

  const FasilitasPage({
    super.key,
    required this.namaMasjid,
    required this.jarakMasjid,
    required this.statusMasjid,
    required this.imageMasjid,
    required this.imageToko,
  });

  static const Color primaryGreen = Color(0xFF2D6A4F);
  static const Color lightGreenBg = Color(0xFFEBF5EE);
  static const Color bgColor = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGray = Color(0xFF6B6B6B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 24),
                    _buildMasjidSection(),
                    const SizedBox(height: 24),
                    _buildToiletSection(),
                    const SizedBox(height: 24),
                    _buildKulinerSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, color: primaryGreen, size: 22),
              ),
              const SizedBox(width: 14),
              const Text(
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

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Fasilitas Sekitar',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: primaryGreen,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Menyediakan kemudahan bagi para peziarah selama kunjungan di kawasan religi.',
            style: TextStyle(fontSize: 13.5, color: textGray, height: 1.55),
          ),
        ],
      ),
    );
  }

  Widget _buildMasjidSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Masjid & Mushola',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: primaryGreen),
          ),
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                imageMasjid.isNotEmpty
                    ? Image.asset(
                        imageMasjid,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _buildMasjidFallback(),
                      )
                    : _buildMasjidFallback(),
                Positioned(
                  bottom: 0, left: 0, right: 0,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.75),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 14, left: 16, right: 16,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              namaMasjid,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.location_on,
                                    color: Colors.white70, size: 13),
                                const SizedBox(width: 3),
                                Text(
                                  jarakMasjid,
                                  style: const TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: primaryGreen,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          statusMasjid.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMasjidFallback() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1B4332), Color(0xFF2D6A4F)],
        ),
      ),
      child: const Center(
        child: Icon(Icons.mosque_outlined, size: 64, color: Colors.white24),
      ),
    );
  }

  Widget _buildToiletSection() {
    final items = [
      {
        'icon': Icons.water_drop_outlined,
        'nama': 'Toilet & Wudhu Pria',
        'jarak': '50m',
        'status': 'Terbuka untuk Umum',
      },
      {
        'icon': Icons.wc_outlined,
        'nama': 'Toilet & Wudhu Wanita',
        'jarak': '85m',
        'status': 'Sangat Bersih',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Toilet & Area Wudhu',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: primaryGreen),
          ),
        ),
        const SizedBox(height: 14),
        ...items.map((item) => _buildFasilitasListItem(item)),
      ],
    );
  }

  Widget _buildFasilitasListItem(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: lightGreenBg,
                borderRadius: BorderRadius.circular(10)),
            child:
                Icon(item['icon'] as IconData, color: primaryGreen, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['nama'],
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: textDark),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined,
                        color: textGray, size: 13),
                    const SizedBox(width: 3),
                    Text(
                      '${item['jarak']} • ${item['status']}',
                      style:
                          const TextStyle(fontSize: 12, color: textGray),
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

  Widget _buildKulinerSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Area Kuliner & Oleh-oleh',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: primaryGreen),
          ),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Stack(
                    children: [
                      // ← FOTO DINAMIS TOKO
                      imageToko.isNotEmpty
                          ? Image.asset(
                              imageToko,
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  _buildTokoFallback(),
                            )
                          : _buildTokoFallback(),
                      Positioned(
                        bottom: 0, left: 0, right: 0,
                        child: Container(
                          height: 80,
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
                        ),
                      ),
                      const Positioned(
                        bottom: 12, left: 12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pusat\nOleh-Oleh',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  height: 1.2),
                            ),
                            SizedBox(height: 4),
                            Text('120m • Buka',
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white70)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  children: [
                    _buildKulinerSmallCard(
                      icon: Icons.restaurant_outlined,
                      nama: 'Tempat Makan',
                      jarak: '200m dari sini',
                      bgColor: lightGreenBg,
                      iconColor: primaryGreen,
                      textColor: primaryGreen,
                    ),
                    const SizedBox(height: 10),
                    _buildKulinerSmallCard(
                      icon: Icons.coffee_outlined,
                      nama: 'Kedai Kopi',
                      jarak: '300m • Tersedia Wifi',
                      bgColor: const Color(0xFFF5F5F5),
                      iconColor: textGray,
                      textColor: textDark,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTokoFallback() {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF3E2723), Color(0xFF6D4C41)],
        ),
      ),
      child: const Center(
        child: Icon(Icons.store_outlined, size: 48, color: Colors.white24),
      ),
    );
  }

  Widget _buildKulinerSmallCard({
    required IconData icon,
    required String nama,
    required String jarak,
    required Color bgColor,
    required Color iconColor,
    required Color textColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 22),
          const SizedBox(height: 8),
          Text(nama,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: textColor)),
          const SizedBox(height: 4),
          Text(jarak,
              style: TextStyle(
                  fontSize: 11, color: iconColor.withOpacity(0.75))),
        ],
      ),
    );
  }
}