import 'package:flutter/material.dart';
import 'beranda_page.dart';
import 'SunanKalijagaPage.dart';
import 'kuispage.dart';
import 'sunan_ampel_page.dart';
import 'sunanbonangpage.dart';
import 'sunandrajat_page.dart';
import 'sunangresik_page.dart';
import 'sunanmuria_page.dart';
import 'sunangunungjati_page.dart';
import 'sunankudus_page.dart';
import 'sunangiri_page.dart'; // pastikan file ini ada

class SejarahWalisongoPage extends StatefulWidget {
  const SejarahWalisongoPage({super.key});

  @override
  State<SejarahWalisongoPage> createState() => _SejarahWalisongoPageState();
}

class _SejarahWalisongoPageState extends State<SejarahWalisongoPage> {
  static const Color primaryGreen = Color(0xFF2D6A4F);
  static const Color darkGreen = Color(0xFF1B4332);
  static const Color lightGreen = Color(0xFF52B788);
  static const Color bgColor = Color(0xFFF8F6F2);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGray = Color(0xFF6B6B6B);

  String? _expandedWali;

  final List<Map<String, dynamic>> _walisongoList = [
    {
      'name': 'Sunan Kalijaga',
      'realName': 'Raden Said',
      'region': 'DEMAK',
      'shortDesc': 'Pendakwah melalui seni dan budaya yang menjunjung kearifan lokal.',
      'fullDesc': 'Sunan Kalijaga adalah salah satu wali paling berpengaruh di Jawa. Beliau lahir dengan nama Raden Said. Melalui pendekatan budaya seperti wayang, gamelan, dan tembang, beliau berhasil menyebarkan Islam dengan damai.',
      'tahun': '1450 – 1513 M',
      'highlighted': true,
      'icon': Icons.auto_stories_rounded,
    },
    {
      'name': 'Sunan Ampel',
      'realName': 'Raden Rahmat',
      'region': 'SURABAYA',
      'shortDesc': 'Pelopor dakwah Islam di tanah Jawa dan pendiri pesantren tertua.',
      'fullDesc': 'Sunan Ampel mendirikan pesantren di Ampel Denta, Surabaya. Beliau dikenal sebagai "Bapak Para Wali" karena murid-muridnya banyak yang menjadi wali besar.',
      'tahun': '1401 – 1481 M',
      'highlighted': false,
      'icon': Icons.menu_book_rounded,
    },
    {
      'name': 'Sunan Bonang',
      'realName': 'Raden Makdum Ibrahim',
      'region': 'TUBAN',
      'shortDesc': 'Seniman dakwah yang menggunakan gamelan bonang sebagai media syiar.',
      'fullDesc': 'Putra Sunan Ampel yang menciptakan tembang Tombo Ati dan menggunakan alat musik bonang untuk menarik minat masyarakat.',
      'tahun': '1465 – 1525 M',
      'highlighted': false,
      'icon': Icons.music_note_rounded,
    },
    {
      'name': 'Sunan Giri',
      'realName': 'Raden Paku',
      'region': 'GRESIK',
      'shortDesc': 'Pusat pendidikan Islam yang menjadi kiblat ilmu agama hingga ke Maluku.',
      'fullDesc': 'Mendirikan Pesantren Giri di Gresik. Pengaruh dakwahnya mencapai wilayah nusantara bagian timur.',
      'tahun': '1442 – 1506 M',
      'highlighted': false,
      'icon': Icons.school_rounded,
    },
    {
      'name': 'Sunan Gresik',
      'realName': 'Maulana Malik Ibrahim',
      'region': 'GRESIK',
      'shortDesc': 'Wali pertama yang datang ke Jawa, membuka jalan dakwah di Nusantara.',
      'fullDesc': 'Dikenal sebagai kakek para wali. Beliau berdakwah melalui perdagangan dan pengobatan gratis kepada masyarakat.',
      'tahun': '1350 – 1419 M',
      'highlighted': false,
      'icon': Icons.sailing_rounded,
    },
    {
      'name': 'Sunan Drajat',
      'realName': 'Raden Qasim',
      'region': 'LAMONGAN',
      'shortDesc': 'Wali sosialis yang sangat peduli terhadap fakir miskin dan dhuafa.',
      'fullDesc': 'Terkenal dengan ajaran catur piwulang yang menekankan pada kesejahteraan dan bantuan sosial kepada sesama.',
      'tahun': '1470 – 1522 M',
      'highlighted': false,
      'icon': Icons.volunteer_activism_rounded,
    },
    {
      'name': 'Sunan Kudus',
      'realName': 'Ja\'far Shadiq',
      'region': 'KUDUS',
      'shortDesc': 'Arsitek dakwah yang membangun simbol toleransi beragama.',
      'fullDesc': 'Membangun Menara Kudus dengan arsitektur Hindu-Islam dan melarang penyembelihan sapi sebagai bentuk penghormatan budaya.',
      'tahun': '1500 – 1550 M',
      'highlighted': false,
      'icon': Icons.account_balance_rounded,
    },
    {
      'name': 'Sunan Muria',
      'realName': 'Raden Umar Said',
      'region': 'KUDUS',
      'shortDesc': 'Pendakwah gunung yang memilih mendekati rakyat jelata di pedesaan.',
      'fullDesc': 'Putra Sunan Kalijaga yang berdakwah di lereng Gunung Muria. Menggunakan kursus-kursus bagi petani dan nelayan.',
      'tahun': '1450 – 1551 M',
      'highlighted': false,
      'icon': Icons.terrain_rounded,
    },
    {
      'name': 'Sunan Gunung Jati',
      'realName': 'Syarif Hidayatullah',
      'region': 'CIREBON',
      'shortDesc': 'Sultan dan ulama besar yang menyebarkan Islam di Jawa Barat.',
      'fullDesc': 'Satu-satunya wali yang memimpin pemerintahan sekaligus menyebarkan agama di wilayah Cirebon dan Banten.',
      'tahun': '1448 – 1568 M',
      'highlighted': false,
      'icon': Icons.castle_rounded,
    },
  ];

  // Map nama wali → halaman tujuan
  Widget? _getDetailPage(String name) {
    switch (name) {
      case 'Sunan Kalijaga':
        return const SunanKalijagaPage();
      case 'Sunan Ampel':
        return const SunanAmpelPage();
      case 'Sunan Bonang':
        return const SunanBonangPage();
      case 'Sunan Giri':
        return const SunanGiriPage();
      case 'Sunan Gresik':
        return const SunanGresikPage();
      case 'Sunan Drajat':
        return const SunanDrajatPage();
      case 'Sunan Kudus':
        return const SunanKudusPage();
      case 'Sunan Muria':
        return const SunanMuriaPage();
      case 'Sunan Gunung Jati':
        return const SunanGunungJatiPage();
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(child: _buildIntroSection()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildWaliCard(_walisongoList[index]),
              childCount: _walisongoList.length,
            ),
          ),
          SliverToBoxAdapter(child: _buildQuoteFooter()),
          SliverToBoxAdapter(child: _buildMulaiKuisSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 220,
      pinned: true,
      backgroundColor: darkGreen,
      automaticallyImplyLeading: true, 
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.black.withOpacity(0.3), // Background transparan melingkar agar ikon terlihat jelas di atas gambar
          child: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
            onPressed: () {
              // Berpindah ke halaman Beranda dan menghapus semua history halaman sebelumnya
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const BerandaPage()), // <-- Ganti BerandaPage() dengan nama kelas Beranda Anda
                (route) => false, // Menghapus semua rute sebelumnya
              );
            },
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/walisongo.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black54,
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            Positioned(
              right: -40, top: -40,
              child: _buildCircleDeco(200, 0.06),
            ),
            Positioned(
              left: -20, bottom: -30,
              child: _buildCircleDeco(140, 0.05),
            ),
            Positioned(
              left: 20, right: 20, bottom: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildHeaderBadge(),
                  const SizedBox(height: 10),
                  const Text(
                    'Jejak Cahaya\nSembilan Wali',
                    style: TextStyle(
                      fontSize: 26, fontWeight: FontWeight.w800,
                      color: Colors.white, height: 1.2,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 2),
                          blurRadius: 4.0,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Mengenal para penyebar Islam di tanah Jawa',
                    style: TextStyle(
                      fontSize: 13, color: Colors.white.withOpacity(0.85),
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 1),
                          blurRadius: 2.0,
                          color: Colors.black54,
                        ),
                      ],
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

  Widget _buildCircleDeco(double size, double opacity) {
    return Container(
      width: size, height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(opacity), width: 30,
        ),
      ),
    );
  }

  Widget _buildHeaderBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: lightGreen.withOpacity(0.25),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: lightGreen.withOpacity(0.4)),
      ),
      child: Text(
        'SEJARAH & BIOGRAFI',
        style: TextStyle(
          fontSize: 10, color: Colors.white.withOpacity(0.9),
          fontWeight: FontWeight.w600, letterSpacing: 1.4,
        ),
      ),
    );
  }

  Widget _buildIntroSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primaryGreen.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: primaryGreen.withOpacity(0.15)),
      ),
      child: const Row(
        children: [
          Icon(Icons.info_outline_rounded, color: primaryGreen, size: 24),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Walisongo adalah 9 ulama besar yang menyebarkan Islam di Nusantara dengan kearifan budaya.',
              style: TextStyle(
                fontSize: 13, color: darkGreen,
                height: 1.5, fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaliCard(Map<String, dynamic> wali) {
    final bool isExpanded = _expandedWali == wali['name'];
    final bool isHighlighted = wali['highlighted'] as bool;
    final Widget? detailPage = _getDetailPage(wali['name'] as String);

    return GestureDetector(
      onTap: () {
        setState(() {
          _expandedWali = isExpanded ? null : wali['name'] as String;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: isHighlighted ? darkGreen : cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isExpanded ? primaryGreen : Colors.grey.shade200,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8, offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isHighlighted
                      ? Colors.white24
                      : primaryGreen.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  wali['icon'] as IconData,
                  color: isHighlighted ? Colors.white : primaryGreen,
                ),
              ),
              title: Text(
                wali['name'] as String,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isHighlighted ? Colors.white : textDark,
                ),
              ),
              subtitle: Text(
                wali['region'] as String,
                style: TextStyle(
                  fontSize: 12,
                  color: isHighlighted ? Colors.white70 : textGray,
                ),
              ),
              trailing: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: isHighlighted ? Colors.white : textGray,
              ),
            ),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wali['fullDesc'] as String,
                      style: TextStyle(
                        color: isHighlighted ? Colors.white : textDark,
                        fontSize: 13, height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Tombol hanya muncul jika halaman detail tersedia
                    if (detailPage != null)
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => detailPage),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: isHighlighted ? Colors.white : primaryGreen,
                            ),
                            foregroundColor:
                                isHighlighted ? Colors.white : primaryGreen,
                          ),
                          child: const Text('PELAJARI SELENGKAPNYA'),
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

  Widget _buildQuoteFooter() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: darkGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text(
        'Islam masuk ke Nusantara bukan dengan pedang, melainkan dengan kearifan budaya.',
        style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
      ),
    );
  }

  Widget _buildMulaiKuisSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const KuisPage()),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: darkGreen,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text('Mulai Kuis', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}