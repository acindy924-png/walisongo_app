  import 'package:flutter/material.dart';

  class PanduanZiarahPage extends StatelessWidget {
    final VoidCallback? onBack; // ← tambah
    const PanduanZiarahPage({super.key, this.onBack}); // ← update

    static const Color primaryGreen = Color(0xFF2D6A4F);
    static const Color darkGreen = Color(0xFF1B4332);
    static const Color lightGreenBg = Color(0xFFEBF5EE);
    static const Color bgColor = Color.fromARGB(255, 255, 255, 255);
    static const Color cardBg = Color.fromARGB(255, 242, 255, 236);
    static const Color textDark = Color.fromRGBO(45, 106, 79, 1);
    static const Color textGray = Color(0xFF6B6B6B);

    static const List<Map<String, String>> _adabList = [
      {
        'title': 'Bersuci & Niat',
        'desc': 'Berwudhulah sebelum berziarah, berniatkan dalam hati bahwa ini adalah ibadah kepada Allah SWT untuk mengambil pelajaran.',
      },
      {
        'title': 'Memberi Salam',
        'desc': 'Ucapkan salam sesuai yang dicontohkan Rasulullah saw dan berikan hormat serta doa bagi yang berziarah.',
      },
      {
        'title': 'Membaca Doa',
        'desc': 'Berdiri beberapa saat, khusyuk, lalu membaca Al-Fatihah dan doa-doa yang diajarkan ulama sholih.',
      },
      {
        'title': 'Menjaga Ketenangan',
        'desc': 'Hindari berbicara keras, tertawa terbahak, serta melakukan hal yang mengganggu kekhusyukan.',
      },
    ];

    // Fungsi interaktif ketika ikon search ditekan
    void _showSearchInfo(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: const Row(
              children: [
                Icon(Icons.lightbulb_outline, color: primaryGreen),
                SizedBox(width: 8),
                Text('Pencarian Cepat', style: TextStyle(color: darkGreen, fontWeight: FontWeight.bold)),
              ],
            ),
            content: const Text(
              'Seluruh panduan adab, doa utama, dan tips praktis ziarah Walisongo sudah dirangkum lengkap di halaman ini. Anda bisa langsung menggulir layar ke bawah.',
              style: TextStyle(color: textDark, fontSize: 14, height: 1.4),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Mengerti', style: TextStyle(color: primaryGreen, fontWeight: FontWeight.bold)),
              ),
            ],
          );
        },
      );
    }

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
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(),
                      const SizedBox(height: 24),
                      _buildAdabSection(),
                      const SizedBox(height: 24),
                      _buildDoaUtama(),
                      const SizedBox(height: 24),
                      _buildTipsPraktis(),
                      const SizedBox(height: 24),
                      _buildPakaianInfaq(),
                      const SizedBox(height: 24),
                      _buildPersiapanTerakhir(),
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
      return Container(
        color: bgColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Mengaktifkan fitur kembali ke halaman beranda
                GestureDetector(
  onTap: () => onBack?.call(), // ← pindah ke tombol BACK
                  child: const Icon(Icons.arrow_back, color: Color.fromRGBO(45, 106, 79, 1)),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Walisongo',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color.fromRGBO(45, 106, 79, 1)),
                ),
              ],
            ),
           // ✅

GestureDetector(
  onTap: () => _showSearchInfo(context), // ← kembalikan ke fungsi search
  child: const Icon(Icons.search, color: Color.fromRGBO(45, 106, 79, 1), size: 24),
),
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
            const Text('EDUKASI SPIRITUAL', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: primaryGreen, letterSpacing: 1.5)),
            const SizedBox(height: 6),
            const Text('Panduan Ziarah', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color.fromRGBO(45, 106, 79, 1),)),
            const SizedBox(height: 8),
            const Text('Tatacara dan adab berziarah ke makam para Wali dengan penuh khidmat dan sesuai tuntunan syariat.', style: TextStyle(fontSize: 13.5, color: textGray, height: 1.5)),
          ],
        ),
      );
    }

    Widget _buildAdabSection() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text('📿', style: TextStyle(fontSize: 18)),
                SizedBox(width: 8),
                Text('Adab Berziarah', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: textDark)),
              ],
            ),
            const SizedBox(height: 14),
            ...List.generate(_adabList.length, (i) => _buildAdabItem(i + 1, _adabList[i]['title']!, _adabList[i]['desc']!)),
          ],
        ),
      );
    }

    Widget _buildAdabItem(int number, String title, String desc) {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade100),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(color: primaryGreen, borderRadius: BorderRadius.circular(8)),
              child: Center(child: Text('$number', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: textDark)),
                  const SizedBox(height: 4),
                  Text(desc, style: const TextStyle(fontSize: 12.5, color: textGray, height: 1.5)),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildDoaUtama() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text('🤲', style: TextStyle(fontSize: 18)),
                SizedBox(width: 8),
                Text('Doa-Doa Utama', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: textDark)),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(14)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(color: primaryGreen, borderRadius: BorderRadius.circular(6)),
                    child: const Text('DOA SALAM', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(height: 10),
                  const Text('Salam Kepada Ahli Kubur', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: textDark)),
                  const SizedBox(height: 16),
                  const Text(
                    'ٱالسَّلاَمُ عَلَيْكُمْ يَا أَهْلَ القُبُورِ ، يَغْفِرُ اللَّهُ لَنَا وَلَكُمْ ، أَنْتُمْ سَلَفُنَا ، وَنَحْنُ بِالأَثَرِ ',
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 20, color: darkGreen, fontWeight: FontWeight.w600, height: 1.8),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      '"Assalaamu\'alaikum ya ahlal quburi, yaghfirullahu lana wa lakum antum salafuna wa nahnu bil-atsar',
                      style: TextStyle(fontSize: 12, color: darkGreen, fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildTipsPraktis() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: primaryGreen, borderRadius: BorderRadius.circular(14)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Waktu Terbaik', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
              const SizedBox(height: 6),
              Text('Ziarah sangat dianjurkan pada hari jumat atau malam harinya untuk suasana lebih tenang.', style: TextStyle(fontSize: 12.5, color: Colors.white.withOpacity(0.85))),
            ],
          ),
        ),
      );
    }

    Widget _buildPakaianInfaq() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(child: _buildItemCard('👕', 'Pakaian', 'Gunakan pakaian yang sopan, bersih, dan menutup aurat.')),
            const SizedBox(width: 12),
            Expanded(child: _buildItemCard('💰', 'Infaq', 'Siapkan uang kecil untuk kotak amal makam.')),
          ],
        ),
      );
    }

    Widget _buildItemCard(String emoji, String title, String desc) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            Text(desc, style: const TextStyle(fontSize: 12, color: textGray)),
          ],
        ),
      );
    }

    Widget _buildPersiapanTerakhir() {
      final items = [
        'Memastikan wudhu belum batal',
        'Mematikan atau menonaktifkan suara ponsel',
        'Membawa buku panduan atau aplikasi Walisongo',
      ];

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
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
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: lightGreenBg,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.checklist_rounded,
                      color: primaryGreen,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Persiapan Terakhir',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: textDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              ...items.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.check_circle_outline_rounded,
                        color: primaryGreen,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 13,
                            color: textGray,
                            height: 1.4,
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
  }