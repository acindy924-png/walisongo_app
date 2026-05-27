import 'package:flutter/material.dart';
import 'models/ayah.dart';

class YasinPage extends StatefulWidget {
  const YasinPage({super.key});

  @override
  State<YasinPage> createState() => _YasinPageState();
}

class _YasinPageState extends State<YasinPage> {
  static const Color primaryGreen = Color(0xFF1B4332);
  static const Color accentGreen = Color(0xFF2D6A4F);
  static const Color bgColor = Color(0xFFF8F6F2);
  static const Color textGray = Color(0xFF555555);

  int _currentPage = 1;
  final int _itemsPerPage = 4;
  
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchAyah(int totalPages) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text(
            'Cari Ayat',
            style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold),
          ),
          content: TextField(
            controller: _searchController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Masukkan nomor ayat (1 - ${SuratYasin.ayahs.length})',
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: primaryGreen),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _searchController.clear();
                Navigator.pop(context);
              },
              child: const Text('Batal', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                final int? ayahNumber = int.tryParse(_searchController.text);
                if (ayahNumber != null &&
                    ayahNumber > 0 &&
                    ayahNumber <= SuratYasin.ayahs.length) {
                  
                  final int targetPage = (ayahNumber / _itemsPerPage).ceil();
                  
                  setState(() {
                    _currentPage = targetPage;
                  });
                  
                  _searchController.clear();
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Menampilkan ayat $ayahNumber di halaman $targetPage'),
                      backgroundColor: accentGreen,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Nomor ayat tidak valid!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: primaryGreen),
              child: const Text('Cari', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final int startIndex = (_currentPage - 1) * _itemsPerPage;
    int endIndex = startIndex + _itemsPerPage;
    if (endIndex > SuratYasin.ayahs.length) {
      endIndex = SuratYasin.ayahs.length;
    }
    final currentAyahs = SuratYasin.ayahs.sublist(startIndex, endIndex);
    final int totalPages = (SuratYasin.ayahs.length / _itemsPerPage).ceil();

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(totalPages),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    _buildHeaderSurat(),
                    const SizedBox(height: 24),
                    _buildBasmalah(),
                    const SizedBox(height: 24),
                    ...currentAyahs.map((ayah) => _buildAyahCard(ayah)),
                    const SizedBox(height: 16),
                    if (_currentPage < totalPages) _buildLanjutkanButton(),
                    const SizedBox(height: 20),
                    _buildPageNavigation(totalPages),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(int totalPages) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, color: primaryGreen, size: 24),
              ),
              const SizedBox(width: 14),
              const Text(
                'Walisongo',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: primaryGreen,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => _searchAyah(totalPages),
            child: const Icon(Icons.search, color: primaryGreen, size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSurat() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: const Icon(
            Icons.mosque,
            color: primaryGreen,
            size: 40,
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          'Surat Yasin',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: primaryGreen,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          '36 : 83 Ayat • Makkiyah',
          style: TextStyle(
            fontSize: 12,
            color: textGray,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildBasmalah() {
    return const Column(
      children: [
        Text(
          'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            height: 1.5,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Dengan nama Allah Yang Maha Pengasih,\nMaha Penyayang.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: textGray,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildAyahCard(Ayah ayah) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: accentGreen,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${ayah.number}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.share_outlined, color: Colors.grey, size: 20),
                    onPressed: () {},
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                  ),
                  const SizedBox(width: 14),
                  IconButton(
                    icon: const Icon(Icons.bookmark_border_rounded, color: Colors.grey, size: 20),
                    onPressed: () {},
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            ayah.arabic,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: accentGreen,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            ayah.transliteration,
            style: const TextStyle(
              fontSize: 13,
              fontStyle: FontStyle.italic,
              color: accentGreen,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            ayah.translation,
            style: const TextStyle(
              fontSize: 12.5,
              color: textGray,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanjutkanButton() {
    final nextAyahNum = (_currentPage * _itemsPerPage) + 1;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _currentPage++;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGreen,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Lanjutkan Membaca Ayat $nextAyahNum',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildPageNavigation(int totalPages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _currentPage > 1
              ? () => setState(() => _currentPage--)
              : null,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Icon(
              Icons.arrow_back_rounded,
              color: _currentPage > 1 ? primaryGreen : Colors.grey.shade300,
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: _currentPage < totalPages
              ? () => setState(() => _currentPage++)
              : null,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Icon(
              Icons.arrow_forward_rounded,
              color: _currentPage < totalPages ? primaryGreen : Colors.grey.shade300,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}

// ==========================================
// DATA LENGKAP SURAT YASIN (AYAT 1 - 83)
// ==========================================
class SuratYasin {
  static const List<Ayah> ayahs = [
    Ayah(number: 1, arabic: 'يٰسۤ', transliteration: 'Yā Sīn', translation: 'Ya Sin.'),
    Ayah(number: 2, arabic: 'وَالْقُرْاٰنِ الْحَكِيْمِۙ', transliteration: 'Wal-qur\'ānil-ḥakīm', translation: 'Demi Al-Qur\'an yang penuh hikmah,'),
    Ayah(number: 3, arabic: 'اِنَّكَ لَمِنَ الْمُرْسَلِيْنَۙ', transliteration: 'Innaka laminal-mursalīn', translation: 'sungguh, engkau (Muhammad) adalah salah seorang dari rasul-rasul,'),
    Ayah(number: 4, arabic: 'عَلٰى صِرَاطٍ مُّسْتَقِيْمٍۗ', transliteration: '\'Alā ṣirāṭim mustaqīm', translation: '(yang berada) di atas jalan yang lurus,'),
    Ayah(number: 5, arabic: 'تَنْزِيْلَ الْعَزِيْزِ الرَّحِيْمِۙ', transliteration: 'Tanzīlal-\'azīzir-raḥīm', translation: '(sebagai wahyu) yang diturunkan oleh (Allah) Yang Mahaperkasa, Maha Penyayang,'),
    Ayah(number: 6, arabic: 'لِتُنْذِرَ قَوْمًا مَّآ اُنْذِرَ اٰبَاۤؤُهُمْ فَهُمْ غٰفِلُوْنَ', transliteration: 'Litunżira qaumam mā unżira ābā\'uhum fahum gāfilūn', translation: 'agar engkau memberi peringatan kepada suatu kaum yang nenek moyangnya belum pernah diberi peringatan, karena itu mereka lalai.'),
    Ayah(number: 7, arabic: 'لَقَدْ حَقَّ الْقَوْلُ عَلٰٓى اَكْثَرِهِمْ فَهُمْ لَا يُؤْمِنُوْنَ', transliteration: 'Laqad ḥaqqal-qawlu \'alā akṡarihim fahum lā yu\'minūn', translation: 'Sungguh, ketetapan (Allah) telah berlaku terhadap kebanyakan mereka, karena mereka tidak beriman.'),
    Ayah(number: 8, arabic: 'اِنَّا جَعَلْنَا فِيْٓ اَعْنَاقِهِمْ اَغْلٰلًا فَهِيَ اِلَى الْاَذْقَانِ فَهُمْ مُّقْمَحُوْنَ', transliteration: 'Innā ja\'alnā fī a\'nāqihim aglālan fahiya ilal-ażqāni fahum muqmaḥūn', translation: 'Sungguh, Kami telah memasang belenggu di leher mereka, lalu tangan mereka (diangkat) ke dagu, karena itu mereka tertengadah.'),
    Ayah(number: 9, arabic: 'وَجَعَلْنَا مِنْ بَيْنِ اَيْدِيْهِمْ سَدًّا وَّمِنْ خَلْفِهِمْ سَدًّا فَاَغْشَيْنٰهُمْ فَهُمْ لَا يُبْصِرُوْنَ', transliteration: 'Wa ja\'alnā mim baini aidīhim saddaw wa min khalfihim saddan fa agsyaināhum fahum lā yubṣirūn', translation: 'Dan Kami jadikan di hadapan mereka sekat (dinding) dan di belakang mereka juga sekat, dan Kami tutup (mata) mereka sehingga mereka tidak dapat melihat.'),
    Ayah(number: 10, arabic: 'وَسَوَآءٌ عَلَيْهِمْ ءَاُنْذَرْتَهُمْ اَمْ لَمْ تُنْذِرْتَهُمْ لَا يُؤْمِنُوْنَ', transliteration: 'Wa sawā\'un \'alaihim a anżartahum am lam tunżirhum lā yu\'minūn', translation: 'Dan sama saja bagi mereka, apakah engkau memberi peringatan kepada mereka atau engkau tidak memberi peringatan kepada mereka, mereka tidak akan beriman.'),
    Ayah(number: 11, arabic: 'اِنَّمَا تُنْذِرُ مَنِ اتَّبَعَ الذِّكْرَ وَخَشِيَ الرَّحْمٰنَ بِالْغَيْبِۚ فَبَشِّرْهُ بِمَغْفِرَةٍ وَّاَجْرٍ كَرِيْمٍ', transliteration: 'Innāma tunżiru manittaba\'aż-żikra wa khasyiyar-raḥmāna bil-gaīb, fabasysyirhu bimagfiratiw wa ajrin karīm', translation: 'Sesungguhnya engkau hanya memberi peringatan kepada orang-orang yang mau mengikuti peringatan dan yang takut kepada Tuhan Yang Maha Pengasih, walaupun mereka tidak melihat-Nya. Maka berilah mereka kabar gembira dengan ampunan dan pahala yang mulia.'),
    Ayah(number: 12, arabic: 'اِنَّا نَحْنُ نُحْيِ الْمَوْتٰى وَنَكْتُبُ مَا قَدَّمُوْا وَاٰثَارَهُمْۗ وَكُلَّ شَيْءٍ اَحْصَيْنٰهُ فِيْٓ اِمَامٍ مُّبِيْنٍ', transliteration: 'Innā naḥnu nuḥyil-mawtā wa naktubu mā qaddamū wa āṡārahum, wa kulla syai\'in aḥṣaināhu fī imāmim mubīn', translation: 'Sungguh, Kamilah yang menghidupkan orang-orang yang mati, dan Kamilah yang mencatat apa yang telah mereka kerjakan dan bekas-bekas yang mereka tinggalkan. Dan segala sesuatu Kami kumpulkan dalam Kitab Induk yang nyata (Lauh Mahfuz).'),
    Ayah(number: 13, arabic: 'وَاضْرِبْ لَهُمْ مَّثَلًا اَصْحٰبَ الْقَرْيَةِۘ اِذْ جَاۤءَهَا الْمُرْسَلُوْنَۚ', transliteration: 'Waḍrib lahum maṡalan aṣḥābal-qaryah, iż jā\'ahal-mursalūn', translation: 'Dan buatlah suatu perumpamaan bagi mereka, yaitu penduduk suatu negeri, ketika utusan-utusan datang kepada mereka;'),
    Ayah(number: 14, arabic: 'اِذْ اَرْسَلْنَآ اِلَيْهِمُ اثْنَيْنِ فَكَذَّبُوْهُمَا فَعَزَّزْنَا بِثَالِثٍ فَقَالُوْٓ اِنَّآ اِلَيْكُمْ مُّرْسَلُوْنَ', transliteration: 'Iż arsalnā ilaihimuṡnaini fakażżabūhumā fa \'azzaznā biṡāliṡin faqālū innā ilaikum mursalūn', translation: 'yaitu ketika Kami mengutus kepada mereka dua orang utusan, lalu mereka mendustakan keduanya; kemudian Kami kuatkan dengan (utusan) yang ketiga, maka ketiga utusan itu berkata, “Sungguh, kami adalah orang-orang yang diutus kepadamu.”'),
    Ayah(number: 15, arabic: 'قَالُوْا مَآ اَنْتُمْ اِلَّا بَشَرٌ مِّثْلُنَاۙ وَمَآ اَنْزَلَ الرَّحْمٰنُ مِنْ شَيْءٍۙ اِنْ اَنْتُمْ اِلَّا تَكْذِبُوْنَ', transliteration: 'Qālū mā antum illā basyarum miṡlunā wa mā anzalar-raḥmānu min syai\'in in antum illā takżibūn', translation: 'Mereka (penduduk negeri) menjawab, “Kamu ini tidak lain hanyalah manusia seperti kami, dan (Allah) Yang Maha Pengasih tidak menurunkan sesuatu apa pun; kamu hanyalah mendustakan belaka.”'),
    Ayah(number: 16, arabic: 'قَالُوْا رَبُّنَا يَعْلَمُ اِنَّآ اِلَيْكُمْ لَمُرْسَلُوْنَ', transliteration: 'Qālū rabbunā ya\'lamu innā ilaikum lamursalūn', translation: 'Mereka berkata, “Tuhan kami mengetahui bahwa sesungguhnya kami adalah utusan-utusan-Nya kepadamu.'),
    Ayah(number: 17, arabic: 'وَمَا عَلَيْنَآ اِلَّا الْبَلٰغُ الْمُبِيْنُ', transliteration: 'Wa mā \'alainā illal-balāgul-mubīn', translation: 'Dan kewajiban kami tidak lain hanyalah menyampaikan (perintah Allah) dengan jelas.”'),
    Ayah(number: 18, arabic: 'قَالُوْا اِنَّا تَطَيَّرْنَا بِكُمْۚ لَىِٕنْ لَّمْ تَنْتَهُوْا لَنَرْجُمَنَّكُمْ وَلَيَمَسَّنَّكُمْ مِّنَّا عَذَابٌ اَلِيْمٌ', transliteration: 'Qālū innā taṭayyarnā bikum, la\'il-lam tantahū lanarjumannakum wa layamassannakum minnā \'ażābun alīm', translation: 'Mereka menjawab, “Sesungguhnya kami bernasib malang karena kamu. Jika kamu tidak berhenti (menyeru kami), niscaya kami rajam kamu dan kamu pasti akan merasakan siksaan yang pedih dari kami.”'),
    Ayah(number: 19, arabic: 'قَالُوْا طَاۤىِٕرُكُمْ مَّعَكُمْۗ اَىِٕنْ ذُكِّرْتُمْۗ بَلْ اَنْتُمْ قَوْمٌ مُّسْرِفُوْنَ', transliteration: 'Qālū ṭā\'irukum ma\'akum, a in żukkirtum, bal antum qawmum musrifūn', translation: 'Mereka (utusan-utusan) berkata, “Kemalangan kamu itu adalah karena kamu sendiri. Apakah karena kamu diberi peringatan? Sebenarnya kamu adalah kaum yang melampaui batas.”'),
    Ayah(number: 20, arabic: 'وَجَاۤءَ مِنْ اَقْصَا الْمَدِيْنَةِ رَجُلٌ يَّسْعٰى قَالَ يٰقَوْمِ اتَّبِعُوا الْمُرْسَلُوْنَۙ', transliteration: 'Wa jā\'a min aqṣal-madīnati rajuluy yas\'ā qāla yā qawmit-tabi\'ul-mursalīn', translation: 'Dan datanglah dari ujung kota, seorang laki-laki dengan bergegas dia berkata, “Wahai kaumku! Ikutilah utusan-utusan itu.'),
    Ayah(number: 21, arabic: 'اتَّبِعُوْا مَنْ لَّا يَسْـَٔلُكُمْ اَجْرًا وَّهُمْ مُّهْتَدُوْنَ', transliteration: 'Ittabi\'ū mal-lā yas\'alukum ajraw wa hum muhtadūn', translation: 'Ikutilah orang yang tidak meminta imbalan kepadamu; dan mereka adalah orang-orang yang mendapat petunjuk.'),
    Ayah(number: 22, arabic: 'وَمَا لِيَ لَآ اَعْبُدُ الَّذِيْ فَطَرَنِيْ وَاِلَيْهِ تُرْجَعُوْنَ', transliteration: 'Wa mā liya lā a\'budul-lażī faṭaranī wa ilaihi turja\'ūn', translation: 'Dan mengapa aku tidak menyembah (Tuhan) yang telah menciptakanku dan yang hanya kepada-Nya kamu akan dikembalikan?'),
    Ayah(number: 23, arabic: 'ءَاَتَّخِذُ مِنْ دُوْنِهٖٓ اٰلِهَةً اِنْ يُّرِدْنِ الرَّحْمٰنُ بِضُرٍّ لَّا تُغْنِ عَنِّيْ شَفَاعَتُهُمْ شَيْئًا وَلَا يُنْقِذُوْنِۚ', transliteration: 'A-attakhiżu min dūnihī ālihatan iy yuridnir-raḥmānu biḍurril lā tugni \'annī syafa\'atuhum syai\'aw wa lā yunqiżūn', translation: 'Mengapa aku mengambil sembahan-sembahan selain-Nya? Jika (Allah) Yang Maha Pengasih menghendaki bencana terhadapku, pasti pertolongan mereka tidak sedikit pun berguna bagi diriku dan mereka tidak dapat menyelamatkanku.'),
    Ayah(number: 24, arabic: 'اِنِّيْٓ اِذًا لَّفِيْ ضَلٰلٍ مُّبِيْنٍ', transliteration: 'Innī iżal lafī ḍalālim mubīn', translation: 'Sesungguhnya jika aku (berbuat) begitu, pasti aku berada dalam kesesatan yang nyata.'),
    Ayah(number: 25, arabic: 'اِنِّيْٓ اٰمَنْتُ بِرَبِّكُمْ فَاسْمَعُوْنِۗ', transliteration: 'Innī āmantu birabbikum fasma\'ūn', translation: 'Sesungguhnya aku telah beriman kepada Tuhanmu; maka dengarkanlah (pengakuan keimanan)-ku.”'),
    Ayah(number: 26, arabic: 'قِيْلَ ادْخُلِ الْجَنَّةَۗ قَالَ يٰلَيْتَ قَوْمِيْ يَعْلَمُوْنَۙ', transliteration: 'Qīladkhulil-jannah, qāla yā laita qawmī ya\'lamūn', translation: 'Dikatakan (kepadanya), “Masuklah ke surga.” Dia (laki-laki itu) berkata, “Alangkah baiknya sekiranya kaumku mengetahui,'),
    Ayah(number: 27, arabic: 'بِمَا غَفَرَ لِيْ رَبِّيْ وَجَعَلَنِيْ مِنَ الْمُكْرَمِيْنَ', transliteration: 'Bimā gafara lī rabbī wa ja\'alanī minal-mukramīn', translation: 'apa yang menyebabkan Tuhanku mengampuni aku dan menjadikan aku termasuk orang-orang yang dimuliakan.”'),
    Ayah(number: 28, arabic: 'وَمَآ اَنْزَلْنَا عَلٰى قَوْمِهٖ مِنْۢ بَعْدِهٖ مِنْ جُنْدٍ مِّنَ السَّمَاۤءِ وَمَا كُنَّا مُنْزِلِيْنَ', transliteration: 'Wa mā anzalnā \'alā qawmihī mim ba\'dihī min jundim minas-samā\'i wa mā kunnā munzilīn', translation: 'Dan setelah dia (meninggal), Kami tidak menurunkan suatu pasukan pun dari langit kepada kaumnya dan Kami tidak perlu menurunkannya.'),
    Ayah(number: 29, arabic: 'اِنْ كَانَتْ اِلَّا صَيْحَةً وَاحِدَةً فَاِذَا هُمْ خٰمِدُوْنَ', transliteration: 'In kānat illā ṣaiḥataw wāḥidatan fa iżā hum khāmidūn', translation: 'Siksaan itu tidak lain hanyalah dengan satu teriakan suara keras saja; maka seketika itu mereka mati (punah).'),
    Ayah(number: 30, arabic: 'يٰحَسْرَةً عَلَى الْعِبَادِۚ مَا يَأْتِيْهِمْ مِّنْ رَّسُوْلٍ اِلَّا كَانُوْا بِهٖ يَسْتَهْزِءُوْنَ', transliteration: 'Yā ḥasratan \'alal-\'ibād, mā ya\'tīhim mir rasūlin illā kānū bihī yastahzi\'ūn', translation: 'Alangkah besarnya penyesalan terhadap hamba-hamba itu, setiap datang seorang rasul kepada mereka, mereka selalu memperolok-olokkannya.'),
    Ayah(number: 31, arabic: 'اَلَمْ يَرَوْا كَمْ اَهْلَكْنَا قَبْلَهُمْ مِّنَ الْقُرُوْنِ اَنَّهُمْ اِلَيْهِمْ لَا يَرْجَعُوْنَ', transliteration: 'Alam yaraw kam ahlaknā qblahum minal-qurūni annahum ilaihim lā yarji\'ūn', translation: 'Tidakkah mereka mengetahui berapa banyak umat-umat sebelum mereka yang telah Kami binasakan? Orang-orang (yang telah Kami binasakan) itu tidak ada yang kembali kepada mereka.'),
    Ayah(number: 32, arabic: 'وَاِنْ كُلٌّ لَّمَّا جَمِيْعٌ لَّدَيْنَا مُحْضَرُوْنَ', transliteration: 'Wa in kullul lammā jamī\'ul ladainā muḥḍarūn', translation: 'Dan setiap mereka, semuanya akan dihadapkan sebelum Kami (di akhirat).'),
    Ayah(number: 33, arabic: 'وَاٰيَةٌ لَّهُمُ الْاَرْضُ الْمَيْتَةُۖ اَحْيَيْنٰهَا وَاَخْرَجْنَا مِنْهَا حَبًّا فَمِنْهُ يَأْكُلُوْنَ', transliteration: 'Wa āyatul lahumul-arḍul-maītatu aḥyaināhā wa akhrajnā minhā ḥabban faminhu ya\'kulūn', translation: 'Dan suatu tanda (kebesaran Allah) bagi mereka adalah bumi yang mati (tandus). Kami hidupkan bumi itu dan Kami keluarkan darinya biji-bijian, maka dari biji-bijian itu mereka makan.'),
    Ayah(number: 34, arabic: 'وَجَعَلْنَا فِيْهَا جَنّٰتٍ مِّنْ نَّخِيْلٍ وَّاَعْنَابٍ وَّفَجَّرْنَا فِيْهَا مِنَ الْعُيُوْنِۙ', transliteration: 'Wa ja\'alnā fīhā jannātim min nakhīliw wa a\'nābiw wa fajjarnā fīhā minal-\'uyūn', translation: 'Dan Kami jadikan padanya di bumi itu kebun-kebun kurma dan anggur dan Kami pancarkan padanya beberapa mata air,'),
    Ayah(number: 35, arabic: 'لِيَأْكُلُوْا مِنْ ثَمَرِهٖۙ وَمَا عَمِلَتْهُ اَيْدِيْهِمْۗ اَفَلَا يَشْكُرُوْنَ', transliteration: 'Liyā\'kulū min ṡamarihī wa mā \'amilat-hu aidīhim, afalā yasykurūn', translation: 'agar mereka dapat makan dari buahnya, dan dari apa yang diusahakan oleh tangan mereka. Mengapa mereka tidak bersyukur?'),
    Ayah(number: 36, arabic: 'سُبْحٰنَ الَّذِيْ خَلَقَ الْاَزْوَاجَ كُلَّهَا مِمَّا تُنْۢبِتُ الْاَرْضُ وَمِنْ اَنْفُسِهِمْ وَمِمَّا لَا يَعْلَمُوْنَ', transliteration: 'Subḥānal-lażī khalaqal-azwāja kullahā mimmā tumbitul-arḍu wa min anfusihim wa mimmā lā ya\'lamūn', translation: 'Mahasuci (Allah) yang telah menciptakan semuanya berpasang-pasangan, baik dari apa yang ditumbuhkan oleh bumi dan dari diri mereka sendiri, maupun dari apa yang tidak mereka ketahui.'),
    Ayah(number: 37, arabic: 'وَاٰيَةٌ لَّهُمُ الَّيْلُ لَنstripedسْلَخُ مِنْهُ النَّهَارَ فَاِذَا هُمْ مُّظْلِمُوْنَۙ', transliteration: 'Wa āyatul lahumul-lailu naslakhu minhun-nahāra fa iżā hum mużlimūn', translation: 'Dan suatu tanda (kebesaran Allah) bagi mereka adalah malam; Kami tanggalkan siang dari (malam) itu, maka seketika itu mereka berada dalam kegelapan,'),
    Ayah(number: 38, arabic: 'وَالشَّمْسُ تَجْرِيْ لِمُسْتَقَرٍّ لَّهَاۗ ذٰلِكَ تَقْدِيْرُ الْعَزِيْزِ الْعَلِيْمِۗ', transliteration: 'Wasy-syamsu tajrī limustaqarril lahā, żālika taqdīrul-\'azīzil-\'alīm', translation: 'dan matahari berjalan di tempat peredarannya. Demikianlah ketetapan (Allah) Yang Mahaperkasa, Maha Mengetahui.'),
    Ayah(number: 39, arabic: 'وَالْقَمَرَ قَدَّرْنٰهُ مَنَازِلَ حَتَّىٰ عَادَ كَالْعُرْجُوْنِ الْقَدِيْمِ', transliteration: 'Wal-qamara qaddarnāhu manāzila ḥattā \'āda kal-\'urjūnil-qadīm', translation: 'Dan telah Kami tetapkan tempat peredaran bagi bulan, sehingga (setelah ia sampai ke tempat peredaran yang terakhir) kembalilah ia seperti bentuk tandan yang tua.'),
    Ayah(number: 40, arabic: 'لَا الشَّمْسُ يَنْۢبَغِيْ لَهَآ اَنْ تُدْرِكَ الْقَمَرَ وَلَا الَّيْلُ سَابِقُ النَّهَارِۗ وَكُلٌّ فِيْ فَلَكٍ يَّسْبَحُوْنَ', transliteration: 'Lasj-syamsu yambagī lahā an tudrikal-qamara wa lal-lailu sābiqun-nahār, wa kullun fī falakiy yasbaḥūn', translation: 'Tidaklah mungkin bagi matahari mengejar bulan dan malam pun tidak dapat mendahului siang. Masing-masing beredar pada garis edarnya.'),
    Ayah(number: 41, arabic: 'وَاٰيَةٌ لَّهُمْ اَنَّا حَمَلْنَا ذُرِّيَّتَهُمْ فِي الْفُلْكِ الْمَشْحُوْنِۙ', transliteration: 'Wa āyatul lahum annā ḥamalnā żurriyyatahum fil-fulkil-masyḥūn', translation: 'Dan suatu tanda bagi mereka adalah bahwa Kami angkut keturunan mereka dalam kapal yang penuh muatan,'),
    Ayah(number: 42, arabic: 'وَخَلَقْنَا لَهُمْ مِّنْ مِّثْلِهٖ مَا يَرْكَبُوْنَ', transliteration: 'Wa khalaqnā lahum mi mmiṡlihī mā yarkabūn', translation: 'dan Kami ciptakan (juga) untuk mereka (angkutan lain) seperti apa yang mereka kendarai.'),
    Ayah(number: 43, arabic: 'وَاِنْ نَّشَأْ نُغْرِقْهُمْ فَلَا صَرِيْخَ لَهُمْ وَلَا هُمْ يُنْقَذُوْنَۙ', transliteration: 'Wa in nasya\' nugriqhum falā ṣarīkha lahum wa lā hum yunqażūn', translation: 'Dan jika Kami menghendaki, Kami tenggelamkan mereka. Maka tidak ada penolong bagi mereka dan tidak (pula) mereka diselamatkan,'),
    Ayah(number: 44, arabic: 'اِلَّا رَحْمَةً مِّنَّا وَمَتَاعًا اِلٰى حِيْنٍ', transliteration: 'Illā raḥmatam minnā wa matā\'an ilā ḥīn', translation: 'melainkan (Kami selamatkan) karena rahmat yang besar dari Kami dan untuk memberikan kesenangan hidup sampai waktu tertentu.'),
    Ayah(number: 45, arabic: 'وَاِذَا قِيْلَ لَهُمُ اتَّقُوْا مَا بَيْنَ اَيْدِيْكُمْ وَمَا خَلْفَكُمْ لَعَلَّكُمْ تُرْحَمُوْنَ', transliteration: 'Wa iżā qīla lahumuttaqū mā baina aidīkum wa mā khalfakum la\'allakum turḥamūn', translation: 'Dan apabila dikatakan kepada mereka, “Takutlah kamu akan siksaan yang berada di hadapanmu (di dunia) dan siksaan yang akan datang (di akhirat) agar kamu mendapat rahmat.”'),
    Ayah(number: 46, arabic: 'وَمَا تَأْتِيْهِمْ مِّنْ اٰيَةٍ مِّنْ اٰيٰتِ رَبِّهِمْ اِلَّا كَانُوْا عَنْهَا مُعْرِضِيْنَ', transliteration: 'Wa mā ta\'tīhim min āyatim min āyāti rabbihim illā kānū \'anhā mu\'riḍīn', translation: 'Dan setiap kali suatu tanda dari tanda-tanda (kebesaran) Tuhan datang kepada mereka, mereka selalu berpaling darinya.'),
    Ayah(number: 47, arabic: 'وَاِذَا قِيْلَ لَهُمْ اَنْفِقُوْا مِمَّا رَزَقَكُمُ اللّٰهُۙ قَالَ الَّذِيْنَ كَفَرُوْا لِلَّذِيْنَ اٰمَنُوْٓا اَنُطْعِمُ مَنْ لَّوْ يَشَاۤءُ اللّٰهُ اَطْعَمَهٗٓ اِنْ اَنْتُمْ اِلَّا فِيْ ضَلٰلٍ مُّبِيْنٍ', transliteration: 'Wa iżā qīla lahum anfiqū mimmā razaqakumullāhu qālal-lażīna kafarū lillażīna āmanū anuṭ\'imu mal lau yasya\'ullāhu aṭ\'amahū in antum illā fī ḍalālim mubīn', translation: 'Dan apabila dikatakan kepada mereka, “Infaqkanlah sebagian rezeki yang diberikan Allah kepadamu,” orang-orang yang kafir itu berkata kepada orang-orang yang beriman, “Apakah pantas kami memberi makan kepada orang-orang yang jika Allah menghendaki Dia akan memberinya makan? Kamu benar-benar dalam kesesatan yang nyata.”'),
    Ayah(number: 48, arabic: 'وَيَقُوْلُوْنَ مَتٰى هٰذَا الْوَعْدُ اِنْ كُنْتُمْ صٰدِقِيْنَ', transliteration: 'Wa yaqūlūna matā hāżal-wa\'du in kuntum ṣādiqīn', translation: 'Dan mereka (orang-orang kafir) berkata, “Kapan janji (hari berbangkit) ini (terjadi) jika kamu orang-orang yang benar?”'),
    Ayah(number: 49, arabic: 'مَا يَنْظُرُوْنَ اِلَّا صَيْحَةً وَاحِدَةً تَأْخُذُهُمْ وَهُمْ يَخِصِّمُوْنَ', transliteration: 'Mā yanẓurūna illā ṣaiḥataw wāḥidatan ta\'khużuhum wa hum yakhiṣṣimūn', translation: 'Mereka hanya menunggu satu teriakan saja yang akan membinasakan mereka ketika mereka sedang bertengkar.'),
    Ayah(number: 50, arabic: 'فَلَا يَسْتَطِيْعُوْنَ تَوْصِيَةً وَّلَآ اِلٰٓى اَهْلِهِمْ يَرْجَعُوْنَ', transliteration: 'Falā yastaṭī\'ūna tawṣiyataw wa lā ilā ahlihim yarji\'ūn', translation: 'Sehingga mereka tidak mampu membuat suatu wasiat dan tidak dapat kembali kepada keluarganya.'),
    Ayah(number: 51, arabic: 'وَنُفِخَ فِي الصُّوْرِ فَاِذَا هُمْ مِّنَ الْاَجْدَاثِ اِلٰى رَبِّهِمْ يَنْسِلُوْنَ', transliteration: 'Wa nufikha fiṣ-ṣūri fa iżā hum minal-ajdāṡi ilā rabbihim yansilūn', translation: 'Lalu ditiuplah sangkakala, maka seketika itu mereka keluar dari kuburnya (dalam keadaan hidup), bergegas menuju kepada Tuhannya.'),
    Ayah(number: 52, arabic: 'قَالُوْا يٰوَيْلَنَا مَنْۢ بَعَثَنَا مِنْ مَّرْقَدِنَاۜؗ هٰذَا مَا وَعَدَ الرَّحْمٰنُ وَصَدَقَ الْمُرْسَلُوْنَ', transliteration: 'Qālū yā wailanā mam ba\'aṡanā mim marqadinā, hāżā mā wa\'adar-raḥmānu wa ṣadaqal-mursalūn', translation: 'Mereka berkata, “Celakalah kami! Siapakah yang membangkitkan kami dari tempat tidur kami (kubur)?” (Lalu dikatakan kepada mereka), “Inilah yang dijanjikan (Allah) Yang Maha Pengasih dan benarlah rasul-rasul(-Nya).”'),
    Ayah(number: 53, arabic: 'اِنْ كَانَتْ اِلَّا صَيْحَةً وَاحِدَةً فَاِذَا هُمْ جَمِيْعٌ لَّدَيْنَا مُحْضَرُوْنَ', transliteration: 'In kānat illā ṣaiḥataw wāḥidatan fa iżā hum jamī\'ul ladainā muḥḍarūn', translation: 'Teriakan itu hanya sekali saja, maka seketika itu mereka semua dihadapkan kepada Kami.'),
    Ayah(number: 54, arabic: 'فَالْيَوْمَ لَا تُظْلَمُ نَفْسٌ شَيْئًا وَلَا تُجْزَوْنَ اِلَّا مَا كُنْتُمْ تَعْمَلُوْنَ', transliteration: 'Fal-yauma lā tuẓlamu nafsun syai\'aw wa lā tujzauna illā mā kuntum ta\'malūn', translation: 'Maka pada hari itu seseorang tidak akan dirugikan sedikit pun dan kamu tidak akan diberi balasan, kecuali sesuai dengan apa yang telah kamu kerjakan.'),
    Ayah(number: 55, arabic: 'اِنَّ اَصْحٰبَ الْجَنَّةِ الْيَوْمَ فِيْ شُغُلٍ فٰكِهُوْنَۚ', transliteration: 'Inna aṣḥābal-jannatil-yauma fī syugulin fākihūn', translation: 'Sesungguhnya penghuni surga pada hari itu bersenang-senang dalam kesibukan (mereka).'),
    Ayah(number: 56, arabic: 'هُمْ وَاَزْوَاجُهُمْ فِيْ ظِلٰلٍ عَلَى الْاَرَائِكِ مُتَّكِـُٔوْنَ', transliteration: 'Hum wa azwājuhum fī ẓilālin \'alal-arā\'iki muttaki\'ūn', translation: 'Mereka dan pasangan-pasangannya berada dalam tempat yang teduh, bersandar di atas dipan-dipan.'),
    Ayah(number: 57, arabic: 'لَهُمْ فِيْهَا فَاكِهَةٌ وَّلَهُمْ مَّا يَدَّعُوْنَۚ', transliteration: 'Lahum fīhā fākihataw wa lahum mā yadda\'ūn', translation: 'Di surga itu mereka memperoleh buah-buahan dan memperoleh apa saja yang mereka inginkan.'),
    Ayah(number: 58, arabic: 'سَلٰمٌ قَوْلًا مِّنْ رَّبٍّ رَّحِيْمٍ', transliteration: 'Salāmun qaulam mir rabbir raḥīm', translation: '(Kepada mereka dikatakan), “Salam,” sebagai ucapan selamat dari Tuhan Yang Maha Penyayang.'),
    Ayah(number: 59, arabic: 'وَامْتَازُوا الْيَوْمَ اَيُّهَا الْمُجْرِمُوْنَ', transliteration: 'Wamtāzul-yauma ayyuhal-mujrimūn', translation: 'Dan (dikatakan kepada orang-orang kafir), “Terpisahlah kamu (dari orang-orang mukmin) pada hari ini, wahai orang-orang yang durhaka!”'),
    Ayah(number: 60, arabic: 'اَلَمْ اَعْهَدْ اِلَيْكُمْ يٰبَنِيْٓ اٰدَمَ اَنْ لَّا تَعْبُدُوا الشَّيْطٰنَۚ اِنَّهٗ لَكُمْ عَدُوٌّ مُّبِيْنٌ', transliteration: 'Alam a\'had ilaikum yā banī ādama al lā ta\'budusj-syaiṭān, innahū lakum \'aduwwum mubīn', translation: 'Bukankah Aku telah memerintahkan kepadamu wahai anak cucu Adam agar kamu tidak menyembah setan? Sungguh, setan itu musuh yang nyata bagi kamu,”'),
    Ayah(number: 61, arabic: 'وَاَنِ اعْبُدُوْنِيْۗ هٰذَا صِرَاطٌ مُّسْتَقِيْمٌ', transliteration: 'Wa ani\'budūnī, hāżā ṣirāṭum mustaqīm', translation: 'dan (Aku memerintahkan), “Sembahlah Aku. Inilah jalan yang lurus.”'),
    Ayah(number: 62, arabic: 'وَلَقَدْ اَضَلَّ مِنْكُمْ جِبِلًّا كَثِيْرًاۗ اَفَلَمْ تَكُوْنُوْا تَعْقِلُوْنَ', transliteration: 'Wa laqad aḍalla minkum jibillan kaṡīrā, afalam takūnū ta\'qilūn', translation: 'Dan sungguh, ia (setan) telah menyesatkan sebagian besar di antara kamu. Maka apakah kamu tidak mengerti?'),
    Ayah(number: 63, arabic: 'هٰذِهٖ جَهَنَّمُ الَّتِيْ كُنْتُمْ تُوْعَدُوْنَ', transliteration: 'Hāżihī jahannamul-latī kuntum tū\'adūn', translation: 'Inilah (neraka) Jahanam yang dahulu telah dijanjikan (diancamkan) kepadamu.'),
    Ayah(number: 64, arabic: 'اِصْلَوْهَا الْيَوْمَ بِمَا كُنْتُمْ تَكْفُرُوْنَ', transliteration: 'Iṣlauhal-yauma bimā kuntum takfurūn', translation: 'Masuklah ke dalamnya pada hari ini karena dahulu kamu mengingkarinya.”'),
    Ayah(number: 65, arabic: 'اَلْيَوْمَ نَخْتِمُ عَلٰٓى اَفْوَاهِهِمْ وَتُكَلِّمُنَآ اَيْدِيْهِمْ وَتَشْهَدُ اَرْجُلُهُمْ بِمَا كَانُوْا يَكْسِبُوْنَ', transliteration: 'Al-yauma nakhtimu \'alā afwāhihim wa tukallimunā aidīhim wa tasyhadu arjuluhum bimā kānū yaksibūn', translation: 'Pada hari ini Kami tutup mulut mereka; tangan mereka akan berkata kepada Kami dan kaki mereka akan memberi kesaksian terhadap apa yang dahulu mereka kerjakan.'),
    Ayah(number: 66, arabic: 'وَلَوْ نَشَاۤءُ لَطَمَسْنَا عَلٰٓى اَعْيُنِهِمْ فَاسْتَبَقُوا الصِّرَاطَ فَاَنّٰى يُبْصِرُوْنَ', transliteration: 'Walau nasya\'u laṭamasnā \'alā a\'yunihim fastabaquṣ-ṣirāṭa fa annā yubṣirūn', translation: 'Dan jika Kami menghendaki, pastilah Kami hapuskan penglihatan mata mereka; lalu mereka berlomba-lomba (mencari) jalan. Maka bagaimana mungkin mereka dapat melihat?'),
    Ayah(number: 67, arabic: 'وَلَوْ نَشَاۤءُ لَمَسَخْنٰهُمْ عَلٰى مَكَانَتِهِمْ فَمَا اسْتَطَاعُوْا مُضِيًّا وَلَا يَرْجَعُوْنَ', transliteration: 'Walau nasya\'u lamasakhnāhum \'alā makānatihim famastaṭā\'ū muḍiyyaw wa lā yarji\'ūn', translation: 'Dan jika Kami menghendaki, pastilah Kami ubah bentuk mereka di tempat mereka berada; sehingga mereka tidak sanggup berjalan lagi dan juga tidak sanggup kembali.'),
    Ayah(number: 68, arabic: 'وَمَنْ نُّعَمِّرْهُ نُنَكِّسْهُ فِي الْخَلْقِۗ اَفَلَا يَعْقِلُوْنَ', transliteration: 'Wa man nu\'ammirhu nunakkis-hu fil-khalq, afalā ya\'qilūn', translation: 'Dan barangsiapa yang Kami panjangkan umurnya niscaya Kami kembalikan dia kepada kejadian(nya) (kembali lemah). Maka apakah mereka tidak mengerti?'),
    Ayah(number: 69, arabic: 'وَمَا عَلَّمْنٰهُ الشِّعْرَ وَمَا يَنْۢبَغِيْ لَهٗۗ اِنْ هُوَ اِلَّا ذِكْرٌ وَّقُرْاٰنٌ مُّبِيْنٌۙ', transliteration: 'Wa mā \'allamnāhusj-syi\'ra wa mā yambagī lah, in huwa illā żikruw wa qur\'ānum mubīn', translation: 'Dan Kami tidak mengajarkan syair kepadanya (Muhammad) dan bersyair itu tidaklah pantas baginya. Al-Qur\'an itu tidak lain hanyalah pelajaran dan Kitab yang jelas,'),
    Ayah(number: 70, arabic: 'لِّيُنْذِرَ مَنْ كَانَ حَيًّا وَّيَحِقَّ الْقَوْلُ عَلَى الْكٰفِرِيْنَ', transliteration: 'Liyunżira man kāna ḥayyaw wa yaḥiqqal-qawlu \'alal-kāfirīn', translation: 'agar dia (Muhammad) memberi peringatan kepada orang-orang yang hidup (hatinya) dan agar ketetapan azab pasti terhadap orang-orang kafir.'),
    Ayah(number: 71, arabic: 'اَوَلَمْ يَرَوْا اَنَّا خَلَقْنَا لَهُمْ مِّمَّا عَمِلَتْ اَيْدِيْنَآ اَنْعَامًا فَهُمْ لَهَا مَالِكُوْنَ', transliteration: 'A-wa lam yaraw annā khalaqnā lahum mimmā \'amilat aidīnā an\'āman fahum lahā mālikūn', translation: 'Tidakkah mereka melihat bahwa Kami telah menciptakan hewan ternak untuk mereka dari sebagian apa yang telah Kami ciptakan dengan kekuasaan Kami, lalu mereka menjadi pemiliknya?'),
    Ayah(number: 72, arabic: 'وَذَلَّلْنٰهَا لَهُمْ فَمِنْهَا رَكُوْبُهُمْ وَمِنْهَا يَأْكُلُوْنَ', transliteration: 'Wa żallalnāhā lahum faminhā rakūbuhum wa minhā ya\'kulūn', translation: 'Dan Kami menundukkannya (hewan-hewan itu) untuk mereka; lalu sebagiannya menjadi tunggangan mereka dan sebagiannya mereka makan.'),
    Ayah(number: 73, arabic: 'وَلَهُمْ فِيْهَا مَنَافِعُ وَمَشَارِبُۗ اَفَلَا يَشْكُرُوْنَ', transliteration: 'Wa lahum fīhā manāfi\'u wa masjārib, afalā yasykurūn', translation: 'Dan mereka memperoleh berbagai manfaat dan minuman padanya. Maka mengapa mereka tidak bersyukur?'),
    Ayah(number: 74, arabic: 'وَاتَّخَذُوْا مِنْ دُوْنِ اللّٰهِ اٰلِهَةً لَّعَلَّهُمْ يُنْصَرُوْنَۗ', transliteration: 'Wattakhażū min dūnillāhi ālihatal la\'allahum yunṣarūn', translation: 'Mereka mengambil sembahan-sembahan selain Allah agar mereka mendapat pertolongan.'),
    Ayah(number: 75, arabic: 'لَا يَسْتَطِيْعُوْنَ نَصْرَهُمْۙ وَهُمْ لَهُمْ جُنْدٌ مُّحْضَرُوْنَ', transliteration: 'Lā yastaṭī\'ūna naṣrahum wa hum lahum jundum muḥḍarūn', translation: 'Sembahan-sembahan itu tidak dapat menolong mereka; padahal sembahan itu menjadi tentara yang dihadirkan untuk menjaga mereka (di neraka).'),
    Ayah(number: 76, arabic: 'فَلَا يَحْزُنْكَ قَوْلُهُمْۘ اِنَّا نَعْلَمُ مَا يُسِرُّوْنَ وَمَا يُعْلِنُوْنَ', transliteration: 'Falā yaḥzunka qawluhum, innā na\'lamu mā yusirrūna wa mā yu\'linūn', translation: 'Maka jangan sampai ucapan mereka membuat engkau (Muhammad) bersedih hati. Sungguh, Kami mengetahui apa yang mereka rahasiakan dan apa yang mereka nyatakan.'),
    Ayah(number: 77, arabic: 'اَوَلَمْ يَرَ الْاِنْسَانُ اَنَّا خَلَقْنٰهُ مِنْ نُّطْفَةٍ فَاِذَا هُوَ خَصِيْمٌ مُّبِيْنٌ', transliteration: 'A-wa lam yaral-insānu annā khalaqnāhu min nuṭfatin fa iżā huwa khaṣīmum mubīn', translation: 'Dan tidakkah manusia memperhatikan bahwa Kami menciptakannya dari setitik air mani, lalu tiba-tiba dia menjadi musuh yang nyata?'),
    Ayah(number: 78, arabic: 'وَضَرَبَ لَنَا مَثَلًا وَّنَسِيَ خَلْقَهٗۗ قَالَ مَنْ يُّحْيِ الْعِظَامَ وَهِيَ رَمِيْمٌ', transliteration: 'Wa ḍaraba lanā maṡalaw wa nasiya khalqah, qāla mai yuḥyil-\'iẓāma wa hiya ramīm', translation: 'Dan dia membuat perumpamaan bagi Kami dan melupakan asal kejadiannya; dia berkata, “Siapakah yang dapat menghidupkan tulang-belulang yang telah hancur luluh?”'),
    Ayah(number: 79, arabic: 'قُلْ يُحْيِيْهَا الَّذِيْٓ اَنْشَاَهَآ اَوَّلَ مَرَّةٍۗ وَهُوَ بِكُلِّ خَلْقٍ عَلِيْمٌۙ', transliteration: 'Qul yuḥyīhal-lażī ansja\'ahā awwala marrah, wa huwa bikulli khalqin \'alīm', translation: 'Katakanlah (Muhammad), “Yang akan menghidupkannya ialah (Allah) yang menciptakannya pertama kali. Dan Dia Maha Mengetahui tentang segala makhluk,”'),
    Ayah(number: 80, arabic: 'الَّذِيْ جَعَلَ لَكُمْ مِّنَ الشَّجَرِ الْاَخْضَرِ نَارًا فَاِذَآ اَنْتُمْ مِّنْهُ تُوْقِدُوْنَ', transliteration: 'Allażī ja\'ala lakum minasj-syajaril-akhḍari nāran fa iżā antum minhu tūqidūn', translation: 'yaitu (Allah) yang menjadikan api untukmu dari kayu yang hijau, maka seketika itu kamu nyalakan (api) dari kayu itu.”'),
    Ayah(number: 81, arabic: 'اَوَلَيْسَ الَّذِيْ خَلَقَ السَّمٰوٰتِ وَالْاَرْضَ بِقٰدِرٍ عَلٰٓى اَنْ يَّخْلُقَ مِثْلَهُمْۗ بَلٰى وَهُوَ الْخَلّٰقُ الْعَلِيْمُ', transliteration: 'A-wa laisal-lażī khalaqas-samāwāti wal-arḍa biqādirin \'alā ay yakhluqa miṡlahum, balā wa huwal-khallāqul-\'alīm', translation: 'Dan bukankah (Allah) yang menciptakan langit dan bumi, mampu menciptakan kembali yang serupa dengan mereka itu? Benar, Dan Dia Maha Pencipta, Maha Mengetahui.'),
    Ayah(number: 82, arabic: 'اِنَّمَآ اَمْرُهٗٓ اِذَآ اَرَادَ شَيْـًٔا اَنْ يَّقُوْلَ لَهٗ كُنْ فَيَكُوْنُ', transliteration: 'Innamā amruhū iżā arāda syai\'an ay yaqūla lahū kun fa yakūn', translation: 'Sesungguhnya urusan-Nya apabila Dia menghendaki sesuatu hanyalah berkata kepadanya, “Jadilah!” Maka jadilah ia.'),
    Ayah(number: 83, arabic: 'فَسُبْحٰنَ الَّذِيْ بِيَدِهٖ مَلَكُوْتُ كُلِّ شَيْءٍ وَّاِلَيْهِ تُرْجَعُوْنَ', transliteration: 'Fa subḥānal-lażī biyadihī malakūtu kulli syai\'iw wa ilaihi turja\'ūn', translation: 'Maka Mahasuci (Allah) yang di tangan-Nya kekuasaan atas segala sesuatu dan kepada-Nyalah kamu dikembalikan.'),
  ];
}