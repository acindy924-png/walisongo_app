import 'package:flutter/material.dart';
import 'SunanKalijagaPage.dart';
import 'kuispage.dart';

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
      'shortDesc':
          'Yang disebut Maulana Makhdum Ibrahim, pendakwah melalui seni dan budaya yang menjunjung kearifan lokal.',
      'fullDesc':
          'Sunan Kalijaga adalah salah satu wali paling berpengaruh di Jawa. Beliau lahir dengan nama Raden Said, putra Bupati Tuban. Melalui pendekatan budaya seperti wayang, gamelan, dan tembang, beliau berhasil menyebarkan Islam tanpa menghilangkan budaya lokal. Makamnya terletak di Kadilangu, Demak.',
      'tahun': '1450 – 1513 M',
      'highlighted': true,
      'icon': Icons.auto_stories_rounded,
    },
    {
      'name': 'Sunan Ampel',
      'realName': 'Raden Rahmat',
      'region': 'SURABAYA',
      'shortDesc':
          'Pelopor dakwah Islam di tanah Jawa dan pendiri pesantren tertua, yang dikenal sebagai "Bapak Para Wali".',
      'fullDesc':
          'Sunan Ampel atau Raden Rahmat adalah salah satu dari Wali Songo yang pertama menyebarkan Islam di Jawa. Beliau mendirikan pesantren di Ampel Denta, Surabaya, yang menjadi pusat pendidikan Islam terkemuka. Murid-muridnya kelak menjadi wali-wali besar seperti Sunan Giri dan Sunan Bonang.',
      'tahun': '1401 – 1481 M',
      'highlighted': false,
      'icon': Icons.menu_book_rounded,
    },
    {
      'name': 'Sunan Bonang',
      'realName': 'Raden Makdum Ibrahim',
      'region': 'TUBAN',
      'shortDesc':
          'Seniman dakwah yang menggunakan gamelan bonang sebagai media syiar Islam di Jawa Timur.',
      'fullDesc':
          'Sunan Bonang adalah putra Sunan Ampel. Beliau dikenal karena menggunakan alat musik bonang (bagian dari gamelan) untuk menarik minat masyarakat mendengar dakwahnya. Beliau juga menciptakan tembang-tembang Jawa bernuansa Islami. Makamnya berada di Tuban, Jawa Timur.',
      'tahun': '1465 – 1525 M',
      'highlighted': false,
      'icon': Icons.music_note_rounded,
    },
    {
      'name': 'Sunan Giri',
      'realName': 'Raden Paku',
      'region': 'GRESIK',
      'shortDesc':
          'Pusat pendidikan Islam "Si Kelebu" yang menjadi kiblat ilmu agama hingga ke Maluku dan Nusa Tenggara.',
      'fullDesc':
          'Sunan Giri mendirikan pesantren di bukit Giri, Gresik, yang menjadi pusat penyebaran Islam di Indonesia Timur. Beliau juga dikenal sebagai pemimpin spiritual yang disegani. Murid-muridnya menyebarkan Islam hingga ke Maluku, Lombok, Kalimantan, dan Sulawesi.',
      'tahun': '1442 – 1506 M',
      'highlighted': false,
      'icon': Icons.school_rounded,
    },
    {
      'name': 'Sunan Gresik',
      'realName': 'Maulana Malik Ibrahim',
      'region': 'GRESIK',
      'shortDesc':
          'Wali pertama yang datang ke Jawa, membuka jalan bagi penyebaran Islam di Nusantara.',
      'fullDesc':
          'Maulana Malik Ibrahim dianggap sebagai wali pertama yang datang ke Jawa untuk menyebarkan Islam. Beliau berasal dari Asia Tengah dan mendakwahkan Islam dengan cara damai melalui perdagangan dan pendidikan. Makamnya yang bersejarah terletak di Gresik, Jawa Timur.',
      'tahun': '1350 – 1419 M',
      'highlighted': false,
      'icon': Icons.sailing_rounded,
    },
    {
      'name': 'Sunan Drajat',
      'realName': 'Raden Qasim',
      'region': 'LAMONGAN',
      'shortDesc':
          'Wali sosialis yang terkenal dengan kepeduliannya terhadap kaum fakir miskin dan dhuafa.',
      'fullDesc':
          'Sunan Drajat adalah putra Sunan Ampel yang terkenal dengan kepedulian sosialnya. Beliau mengajarkan pentingnya membantu sesama dan mengangkat harkat kaum miskin. Filosofi dakwahnya dikenal dengan "catur piwulang" yang mengutamakan kesejahteraan sosial.',
      'tahun': '1470 – 1522 M',
      'highlighted': false,
      'icon': Icons.volunteer_activism_rounded,
    },
    {
      'name': 'Sunan Kudus',
      'realName': 'Ja\'far Shadiq',
      'region': 'KUDUS',
      'shortDesc':
          'Arsitek dakwah yang membangun Masjid Kudus bergaya Hindu-Buddha sebagai simbol toleransi.',
      'fullDesc':
          'Sunan Kudus dikenal sebagai ulama besar yang menguasai ilmu fiqih, tauhid, dan tasawuf. Beliau membangun Masjid Al-Aqsha Kudus yang arsitekturnya menggabungkan unsur Hindu-Budha dengan Islam sebagai wujud toleransi. Hingga kini beliau melarang penyembelihan sapi untuk menghormati umat Hindu.',
      'tahun': '1500 – 1550 M',
      'highlighted': false,
      'icon': Icons.account_balance_rounded,
    },
    {
      'name': 'Sunan Muria',
      'realName': 'Raden Umar Said',
      'region': 'KUDUS',
      'shortDesc':
          'Pendakwah gunung yang memilih mendekati rakyat jelata, petani, dan nelayan pedesaan.',
      'fullDesc':
          'Sunan Muria adalah putra Sunan Kalijaga yang berdakwah di kalangan masyarakat pedesaan. Beliau lebih memilih tinggal di pegunungan Muria dan mendekati para petani, nelayan, dan pedagang kecil. Beliau juga dikenal sebagai pencipta tembang Sinom dan Kinanthi.',
      'tahun': '1450 – 1551 M',
      'highlighted': false,
      'icon': Icons.terrain_rounded,
    },
    {
      'name': 'Sunan Gunung Jati',
      'realName': 'Syarif Hidayatullah',
      'region': 'CIREBON',
      'shortDesc':
          'Sultan dan ulama besar Cirebon yang menyebarkan Islam di Jawa Barat dan Banten.',
      'fullDesc':
          'Sunan Gunung Jati adalah pendiri Kesultanan Cirebon dan penyebar Islam di Jawa Barat. Beliau juga berperan dalam penyebaran Islam di Banten dan Sunda. Kompleks makamnya di Gunung Sembung, Cirebon, menjadi salah satu tempat ziarah paling ramai dikunjungi.',
      'tahun': '1448 – 1568 M',
      'highlighted': false,
      'icon': Icons.castle_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      // bottomNavigationBar dihapus dari sini karena sudah ditangani oleh MainContainerPage
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

  Widget _buildMulaiKuisSection() {
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
    child: Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(          // ✅ sambungan ke KuisPage
                context,
                MaterialPageRoute(
                  builder: (_) => const KuisPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.play_circle_filled_rounded,
              color: Colors.white,
              size: 22,
            ),
            label: const Text(
              'Mulai Kuis',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(27, 67, 50, 1),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Ketuk untuk memulai sesi belajar mandiri Anda',
          style: const TextStyle(fontSize: 12.5, color: textGray),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      backgroundColor: darkGreen,
      automaticallyImplyLeading: false, // Menghilangkan tombol back default jika memakai tab container
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {},
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF1B4332), Color(0xFF2D6A4F)],
                ),
              ),
            ),
            Positioned(
              right: -40,
              top: -40,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.06),
                    width: 40,
                  ),
                ),
              ),
            ),
            Positioned(
              left: -20,
              bottom: -30,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.05),
                    width: 30,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: lightGreen.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: lightGreen.withOpacity(0.4)),
                    ),
                    child: Text(
                      'SEJARAH & BIOGRAFI',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Jejak Cahaya\nSembilan Wali',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Mengenal para penyebar Islam di tanah Jawa',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withOpacity(0.7),
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

  Widget _buildIntroSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primaryGreen.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: primaryGreen.withOpacity(0.15)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryGreen.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.info_outline_rounded,
              color: primaryGreen,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Walisongo adalah 9 ulama besar yang menyebarkan Islam di Nusantara pada abad ke-14 hingga ke-16 Masehi.',
              style: TextStyle(
                fontSize: 13,
                color: darkGreen,
                height: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaliCard(Map<String, dynamic> wali) {
    final isExpanded = _expandedWali == wali['name'];
    final isHighlighted = wali['highlighted'] as bool;

    return GestureDetector(
      onTap: () {
        setState(() {
          _expandedWali = isExpanded ? null : wali['name'] as String;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: isHighlighted ? darkGreen : cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isHighlighted
                ? Colors.transparent
                : isExpanded
                    ? primaryGreen.withOpacity(0.4)
                    : Colors.grey.shade200,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isHighlighted
                  ? darkGreen.withOpacity(0.3)
                  : Colors.black.withOpacity(0.04),
              blurRadius: isHighlighted ? 16 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: isHighlighted
                          ? Colors.white.withOpacity(0.15)
                          : primaryGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      wali['icon'] as IconData,
                      color: isHighlighted ? Colors.white : primaryGreen,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              wali['region'] as String,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: isHighlighted ? Colors.white60 : textGray,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(width: 6),
                            if (isHighlighted)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: lightGreen.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  'POPULER',
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          wali['name'] as String,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: isHighlighted ? Colors.white : textDark,
                          ),
                        ),
                        Text(
                          wali['realName'] as String,
                          style: TextStyle(
                            fontSize: 12,
                            color: isHighlighted ? Colors.white60 : textGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: isHighlighted ? Colors.white70 : textGray,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            if (!isExpanded)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Text(
                  wali['shortDesc'] as String,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: isHighlighted
                        ? Colors.white.withOpacity(0.75)
                        : textGray,
                    height: 1.5,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            if (isExpanded) ...[
              Divider(
                height: 1,
                color: isHighlighted
                    ? Colors.white.withOpacity(0.1)
                    : Colors.grey.shade200,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wali['fullDesc'] as String,
                      style: TextStyle(
                        fontSize: 13,
                        color: isHighlighted
                            ? Colors.white.withOpacity(0.85)
                            : textDark,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isHighlighted
                            ? Colors.white.withOpacity(0.1)
                            : primaryGreen.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_today_rounded,
                            size: 13,
                            color: isHighlighted ? Colors.white70 : primaryGreen,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            wali['tahun'] as String,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: isHighlighted
                                  ? Colors.white70
                                  : primaryGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    if (wali['name'] == 'Sunan Kalijaga')
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SunanKalijagaPage(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: BorderSide(
                              color: Colors.white.withOpacity(0.4),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'PELAJARI SELENGKAPNYA',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.8,
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(Icons.arrow_forward_rounded, size: 14),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildQuoteFooter() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1B4332), Color(0xFF2D6A4F)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '"',
            style: TextStyle(
              fontSize: 60,
              color: Colors.white.withOpacity(0.15),
              height: 0.6,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Islam masuk ke Nusantara bukan dengan pedang, melainkan dengan kearifan budaya dan keluhuran budi pekerti.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              height: 1.6,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(width: 24, height: 2, color: lightGreen),
              const SizedBox(width: 8),
              const Text(
                'Para Ulama Walisongo',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF52B788),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}