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

  // Mengatur pagination (karena di gambar hanya menampilkan 4 ayat per halaman)
  int _currentPage = 1;
  final int _itemsPerPage = 4;

  @override
  Widget build(BuildContext context) {
    // Menghitung data ayat yang muncul sesuai halaman aktif
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
            _buildAppBar(),
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
                    // List Ayat
                    ...currentAyahs.map((ayah) => _buildAyahCard(ayah)),
                    const SizedBox(height: 16),
                    // Tombol Lanjutkan Membaca (Hanya muncul jika bukan halaman terakhir)
                    if (_currentPage < totalPages) _buildLanjutkanButton(),
                    const SizedBox(height: 20),
                    // Tombol Navigasi Panah Kiri & Kanan
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

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.menu, color: primaryGreen, size: 24),
              SizedBox(width: 14),
              Text(
                'Walisongo',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
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
    return Column(
      children: const [
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
          // Baris Atas: Nomor Ayat dan Aksi (Share & Bookmark)
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
          // Teks Arab
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
          // Transliterasi Latin
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
          // Arti Terjemahan
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

// --- Data SuratYasin tetap diletakkan di bawah atau file terpisah ---
class SuratYasin {
  static const List<Ayah> ayahs = [
    Ayah(
      number: 1,
      arabic: 'يٰسۤ',
      transliteration: 'Yaa-Siin',
      translation: 'Yaa Siin.',
    ),
    Ayah(
      number: 2,
      arabic: 'وَالْقُرْاٰنِ الْحَكِيْمِۙ',
      transliteration: 'Wal-qur\'aanil hakiim',
      translation: 'Demi Al-Qur\'an yang penuh hikmah,',
    ),
    Ayah(
      number: 3,
      arabic: 'اِنَّكَ لَمِنَ الْمُرْسَلِيْنَۙ',
      transliteration: 'Innaka laminal mursaliin',
      translation: 'sungguh, engkau (Muhammad) adalah salah seorang dari rasul-rasul,',
    ),
    Ayah(
      number: 4,
      arabic: 'عَلٰى صِرَاطٍ مُّسْتَقِيْمٍۗ',
      transliteration: '\'Alaa shiraathim mustaqiim',
      translation: '(yang berada) di atas jalan yang lurus,',
    ),
    Ayah(
      number: 5,
      arabic: 'تَنْزِيْلَ الْعَزِيْزِ الرَّحِيْمِۙ',
      transliteration: 'Tanziilal \'aziizir rahiim',
      translation: '(sebagai wahyu) yang diturunkan oleh Yang Mahaperkasa, Maha Penyayang,',
    ),
    Ayah(
      number: 6,
      arabic: 'لِتُنْذِرَ قَوْمًا mَّآ اُnْذِrَ اٰبَاۤؤُهُmْ fَهُmْ غٰfِlُوْنَ',
      transliteration: 'Litundzira qaumam maa undzira aabaa\'uhum fahum ghaafiluun',
      translation: 'agar engkau memberi peringatan kepada suatu kaum yang nenek moyangnya belum pernah diberi peringatan, karena itu mereka lalai.',
    ),
    Ayah(
      number: 7,
      arabic: 'لَقَدْ حَقَّ الْقَوْلُ عَلٰٓى اَكْثَرِهِمْ فَهُمْ لَا يُؤْمِنُوْنَ',
      transliteration: 'Laqad haqqal qaulu \'alaaa aksarihim fahum laa yu\'minuun',
      translation: 'Sungguh, telah pasti berlaku perkataan (ketentuan Allah) terhadap kebanyakan mereka, karena mereka tidak beriman.',
    ),
    Ayah(
      number: 8,
      arabic: 'اِنَّا جَعَلْنَا فِيْٓ اَعْنَاقِهِمْ اَغْلٰلًا فَهِيَ اِلَى الْاَذْقَانِ فَهُمْ مُّقْمَحُوْنَ',
      transliteration: 'Innaa ja\'alnaa fii a\'naaqihim aghlaalanfahiya ilal adzqaani fahum muqmahuun',
      translation: 'Sungguh, Kami telah memasang belenggu di leher mereka, lalu tangan mereka (diangkat) ke dagu, karena itu mereka tertengadah.',
    ),
    Ayah(
      number: 9,
      arabic: 'وَجَعَلْنَا مِنْۢ بَيْنِ اَيْدِيْهِمْ سَدًّا وَّمِنْ خَلْفِهِمْ سَدًّا فَاَغْشَيْنٰهُمْ فَهُمْ لَا يُبْصِرُوْنَ',
      transliteration: 'Wa ja\'alnaa mim baini aidiihim saddaw wamin khalfihim saddan fa aghsyainaahum fahum laa yubshiruun',
      translation: 'Dan Kami telah mengadakan di hadapan mereka sebuah dinding dan di belakang mereka sebuah dinding (pula), dan Kami tutup (mata) mereka sehingga mereka tidak dapat melihat.',
    ),
    Ayah(
      number: 10,
      arabic: 'وَسَوَاۤءٌ عَلَيْهِمْ ءَاَنْذَرْتَهُمْ اَمْ لَمْ تُنْذِرْهُمْ لَا يُؤْمِنُوْنَ',
      transliteration: 'Wa sawaaa\'un \'alaihim a-andzartahum am lam tundzirhum laa yu\'minuun',
      translation: 'Dan sama saja bagi mereka, apakah engkau memberi peringatan kepada mereka ataukah tidak, mereka tidak akan beriman.',
    ),
    Ayah(
      number: 11,
      arabic: 'اِنَّمَا تُنْذِرُ مَنِ اتَّبَعَ الذِّكْرَ وَخَشِيَ الرَّحْمٰنَ بِالْغَيْبِۚ فَبَشِّرْهُ بِمَغْفِرَةٍ وَّاَجْرٍ كَرِيْمٍ',
      transliteration: 'Innamaa tundziru manit taba\'adz dzikra wa khasyiyar rahmaana bil ghaib, fabasy-syirhu bimaghfiratinw wa ajrin kariim',
      translation: 'Sesungguhnya engkau hanya memberi peringatan kepada orang yang mau mengikuti peringatan dan yang takut kepada Tuhan Yang Maha Pengasih walaupun dia tidak melihat-Nya. Maka berilah mereka kabar gembira dengan ampunan dan pahala yang mulia.',
    ),
    Ayah(
      number: 12,
      arabic: 'اِنَّا نَحْنُ نُحْيِ الْمَوْتٰى وَنَكْتُبُ مَا قَدَّمُوْا وَاٰثَارَهُمْۗ وَكُلَّ شَيْءٍ اَحْصَيْنٰهُ فِيْٓ اِمَامٍ مُّبِيْنٍ',
      transliteration: 'Innaa nahnu nuhyil mawtaa wa naktubu maa qaddamuu wa aatsaarahum, wa kulla syai-in ahshainaahu fii imaamim mubiin',
      translation: 'Sungguh, Kamilah yang menghidupkan orang-orang yang mati, dan Kamilah yang mencatat apa yang telah mereka kerjakan dan bekas-bekas yang mereka tinggalkan. Dan segala sesuatu Kami kumpulkan dalam Kitab yang jelas (Lauh Mahfuzh).',
    ),
    Ayah(
      number: 13,
      arabic: 'وَاضْرِبْ لَهُمْ mَّثَلًا اَصْحٰبَ الْقَرْيَةِۘ اِذْ جَاۤءَهَا الْمُرْسَلُوْنَۚ',
      transliteration: 'Wadh-rib lahum matsalan ash-haabal qaryah, idz jaaa\'ahal mursaluun',
      translation: 'Dan buatkanlah suatu perumpamaan bagi mereka, yaitu penduduk suatu negeri, ketika para utusan datang kepada mereka.',
    ),
    Ayah(
      number: 14,
      arabic: 'اِذْ اَرْسَلْنَآ اِلَيْهِمُ اثْنَيْنِ فَكَذَّبُوْهُمَا fَعَزَّزْنَا بِثَالِثٍ fَقَالُوْٓا اِنَّآ اِلَيْكُمْ mُّرْسَلُوْنَ',
      transliteration: 'Idz arsalnaa ilaihimutsnaini fakadzdzabuuhumaa fa\'azzaznaa bitsaalitsin faqaaluuu innaa ilaikum mursaluun',
      translation: '(Yaitu) ketika Kami mengutus dua orang utusan kepada mereka, lalu mereka mendustakan keduanya; kemudian Kami kuatkan dengan (utusan) yang ketiga, maka ketiga utusan itu berkata, "Sungguh, kami adalah orang-orang yang diutus kepadamu."',
    ),
    Ayah(
      number: 15,
      arabic: 'قَالُوْا mَآ اَنْتُمْ اِلَّا بَشَرٌ mِّثْلُنَاۙ وَmَآ اَنْزَلَ الرَّحْمٰنُ mِنْ شَيْءٍۙ اِنْ اَنْتُمْ اِلَّا تَكْذِبُوْنَ',
      transliteration: 'Qaaluu maaa antum illaa basyarum mitslunaa wa maaa anzalar rahmaanu min syai-in in antum illaa takdzibuun',
      translation: 'Mereka (penduduk negeri) menjawab, "Kamu hanyalah manusia seperti kami dan Allah Yang Maha Pengasih tidak menurunkan sesuatu apa pun; kamu hanyalah pendusta belaka."',
    ),
    Ayah(
      number: 16,
      arabic: 'قَالُوْا رَبُّنَا يَعْلَمُ اِنَّآ اِلَيْكُمْ لَمُرْسَلُوْنَ',
      transliteration: 'Qaaluu rabbunaa ya\'lamu innaa ilaikum lamursaluun',
      translation: 'Mereka berkata, "Tuhan kami mengetahui bahwa sesungguhnya kami adalah orang-orang yang diutus kepada kamu."',
    ),
    Ayah(
      number: 17,
      arabic: 'وَمَا عَلَيْنَآ اِلَّا الْبَلٰغُ الْمُبِيْنُ',
      transliteration: 'Wa maa \'alainaa illal balaaghul mubiin',
      translation: 'Dan kewajiban kami hanyalah menyampaikan (perintah Allah) dengan jelas.',
    ),
    Ayah(
      number: 18,
      arabic: 'قَالُوْٓا اِنَّا تَطَيَّرْنَا بِكُمْۚ لَىِٕنْ lَّمْ تَنْتَهُوْا لَنَرْجُمَنَّكُمْ وَلَيَمَسَّنَّكُمْ mِّنَّا عَذَابٌ اَلِيْمٌ',
      transliteration: 'Qaaluuu innaa tathayyarnaa bikum, la-il lam tantahuu lanarjumannakum wa layamassannakum minnaa \'adzaabun aliim',
      translation: 'Mereka menjawab, "Sesungguhnya kami bernasib malang karena kamu. Sungguh, jika kamu tidak berhenti (menyeru kami), niscaya kami akan merajam kamu dan kamu pasti akan merasakan siksaan yang pedih dari kami."',
    ),
    Ayah(
      number: 19,
      arabic: 'قَالُوْا طَاۤىِٕرُكُمْ mَّعَكُمْۗ اَىِٕنْ ذُكِّرْتُمْۗ بَلْ اَنْتُمْ قَوْمٌ mُّسْرِفُوْنَ',
      transliteration: 'Qaaluu thaa\'irukum ma\'akum, a-in dzukkirtum, bal antum qaumum musrifuun',
      translation: 'Mereka (para utusan) berkata, "Kemalangan kamu itu adalah karena kamu sendiri. Apakah karena kamu diberi peringatan? Sebenarnya kamu adalah kaum yang melampaui batas."',
    ),
    Ayah(
      number: 20,
      arabic: 'وَجَاۤءَ mِنْ اَقْصَا الْمَدِيْنَةِ رَجُلٌ يَّسْعٰى قَالَ يٰقَوْmِ اتَّبِعُوا الْمُرْسَلِيْنَۙ',
      transliteration: 'Wa jaaa\'a min aqshal madiinati rajuluy yas\'aa qaala yaa qawmit tabi\'ul mursaliin',
      translation: 'Dan datanglah dari ujung kota, seorang laki-laki dengan bergegas-gegas ia berkata, "Hai kaumku, ikutilah utusan-utusan itu."',
    ),
    Ayah(
      number: 21,
      arabic: 'اتَّبِعُوْا mَنْ لَّا يَسْـَٔلُكُمْ اَجْرًا وَّهُمْ mُّهْتَدُوْنَ',
      transliteration: 'Ittabi\'uu mal laa yas\'alukum ajranw wa hum muhtaduun',
      translation: '"Ikutilah orang yang tidak meminta imbalan kepadamu; dan mereka adalah orang-orang yang mendapat petunjuk."',
    ),
    Ayah(
      number: 22,
      arabic: 'وَمَا لِيَ لَآ اَعْبُدُ الَّذِيْ فَطَرَنِيْ وَاِلَيْهِ تُرْجَعُوْنَ',
      transliteration: 'Wa maa liya laa a\'budulladzii fatharaniii wa ilaihi turja\'uun',
      translation: '"Dan mengapa aku tidak menyembah (Allah) yang telah menciptakanku dan yang kepada-Nya-lah kamu akan dikembalikan?"',
    ),
    Ayah(
      number: 23,
      arabic: 'ءَاَتَّخِذُ mِنْ دُوْنِهٖٓ اٰلِهَةً اِنْ يُّرِدْنِ الرَّحْمٰنُ بِضُرٍّ لَّا تُغْنِ عَنِّيْ شَفَاعَتُهُمْ شَيْـًٔا وَّلَا يُنْقِذُوْنِۚ',
      transliteration: 'A-attakhidzu min duunihiii aalihatan iy yuridnir rahmaanu bi dhurril laa tughni \'annii syafaa\'atuhum syai\'aw wa laa yunqidzuun',
      translation: '"Apakah aku akan menjadikan selain-Nya sebagai tuhan-tuhan? Jika Allah Yang Maha Pengasih menghendaki bencana terhadapku, niscaya pertolongan mereka tidak berguna sama sekali bagiku dan mereka tidak (pula) dapat menyelamatkanku."',
    ),
    Ayah(
      number: 24,
      arabic: 'اِنِّيْٓ اِذًا لَّfِيْ ضَلٰلٍ mُّبِيْنٍ',
      transliteration: 'Inniii idzan lafii dhalaalim mubiin',
      translation: '"Sungguh, jika demikian, aku benar-benar dalam kesesatan yang nyata."',
    ),
    Ayah(
      number: 25,
      arabic: 'اِنِّيْٓ اٰمَنْتُ بِرَبِّكُمْ فَاسْمَعُوْنِ',
      transliteration: 'Inniii aamantu birabbikum fasma\'uun',
      translation: '"Sesungguhnya aku telah beriman kepada Tuhanmu; maka dengarkanlah (pengakuan keimanan)ku."',
    ),
    Ayah(
      number: 26,
      arabic: 'قِيْلَ ادْخُلِ الْجَنَّةَۗ قَالَ يٰلَيْتَ قَوْmِيْ يَعْلَمُوْنَۙ',
      transliteration: 'Qiilad khulil jannah, qaala yaa laita qaumii ya\'lamuun',
      translation: 'Dikatakan (kepadanya), "Masuklah ke surga." Dia berkata, "Alangkah baiknya sekiranya kaumku mengetahui,"',
    ),
    Ayah(
      number: 27,
      arabic: 'بِمَا غَفَرَ لِيْ رَبِّيْ وَجَعَلَنِيْ mِنَ الْمُكْرَمِيْنَ',
      transliteration: 'Bimaa ghafara lii rabbii wa ja\'alanii minal mukramiin',
      translation: '"apa yang menyebabkan Tuhanku memberikan ampun kepadaku dan menjadikan aku termasuk orang-orang yang dimuliakan."',
    ),
    Ayah(
      number: 28,
      arabic: 'وَمَآ اَنْزَلْنَا عَلٰى قَوْmِهٖ mِنْۢ بَعْدِهٖ mِنْ جُنْدٍ mِّنَ السَّمَاۤءِ وَمَا كُنَّا mُنْزِلِيْنَ',
      transliteration: 'Wa maaa anzalnaa \'alaa qaumihii mim ba\'dihii min jundim minas samaaa\'i wa maa kunnaa munziliin',
      translation: 'Dan setelah dia (meninggal), Kami tidak menurunkan kepada kaumnya suatu pasukan pun dari langit dan tidak (perlu) Kami menurunkannya.',
    ),
    Ayah(
      number: 29,
      arabic: 'اِنْ كَانَتْ اِلَّا صَيْحَةً وَّاحِدَةً fَاِذَا هُمْ خٰmِدُوْنَ',
      transliteration: 'In kaanat illaa shaihataw waahidatan fa-idzaa hum khaamiduun',
      translation: 'Tidak ada siksaan atas mereka melainkan satu teriakan saja, maka seketika itu mereka mati.',
    ),
    Ayah(
      number: 30,
      arabic: 'يٰحَسْرَةً عَلَى الْعِبَادِۚ مَا يَأْتِيْهِمْ mِّنْ رَّسُوْلٍ اِلَّا كَانُوْا بِهٖ يَسْتَهْزِءُوْنَ',
      transliteration: 'Yaa hasratan \'alal \'ibaad, maa ya\'tiihim mir rasuulin illaa kaanuu bihii yastahzi\'uun',
      translation: 'Alangkah besar penyesalan terhadap hamba-hamba itu! Tidak datang seorang rasul kepada mereka melainkan mereka selalu memperolok-olokkannya.',
    ),
    // ... [Potong agar ringkas saat render, semua indeks ayat tetap utuh seperti kode Anda]
    Ayah(
      number: 83,
      arabic: 'فَسُبْحٰنَ الَّذِيْ بِيَدِهٖ مَلَكُوْتُ كُلِّ شَيْءٍ وَّاِلَيْهِ تُرْجَعُوْنَ',
      transliteration: 'Fa subhaanal ladzii biyadihii malakaatu kulli syai\'inw wa ilaihi turja\'uun',
      translation: 'Maka Mahasuci (Allah) yang di tangan-Nya kekuasaan atas segala sesuatu dan kepada-Nyalah kamu dikembalikan.',
    ),
  ];
}