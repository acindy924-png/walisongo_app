// File: kuis_quiz_page.dart
import 'package:flutter/material.dart';

class KuisQuizPage extends StatefulWidget {
  const KuisQuizPage({super.key});

  @override
  State<KuisQuizPage> createState() => _KuisQuizPageState();
}

class _KuisQuizPageState extends State<KuisQuizPage>
    with SingleTickerProviderStateMixin {
  static const Color primaryGreen = Color(0xFF1E4D2B);
  static const Color lightGreenBg = Color(0xFFEBF5EE);
  static const Color bgColor = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGray = Color(0xFF6B6B6B);
  static const Color textLight = Color(0xFF9E9E9E);
  static const Color borderColor = Color(0xFFE0E0E0);

  int _currentQuestion = 0;
  String? _selectedOption;
  bool _answered = false;
  int _score = 0; // ✅ score tracking

  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Siapakah wali yang dikenal sebagai pelopor penyebaran Islam di tanah Jawa?',
      'options': ['Sunan Gresik', 'Sunan Ampel', 'Sunan Bonang', 'Sunan Giri'],
      'correct': 'B',
      'category': 'PENGETAHUAN SEJARAH',
    },
    {
      'question': 'Siapakah nama asli dari Sunan Gunung Jati?',
      'options': ['Syarif Hidayatullah', 'Raden Said', 'Maulana Malik Ibrahim', 'Abdurrahman Wahid'],
      'correct': 'A',
      'category': 'PENGETAHUAN SEJARAH',
    },
    {
      'question': 'Sunan Kalijaga terkenal menyebarkan Islam melalui media apa?',
      'options': ['Perdagangan', 'Perang', 'Wayang dan Gamelan', 'Tulisan'],
      'correct': 'C',
      'category': 'PENGETAHUAN SEJARAH',
    },
    {
      'question': 'Di kota manakah makam Sunan Ampel berada?',
      'options': ['Gresik', 'Tuban', 'Surabaya', 'Demak'],
      'correct': 'C',
      'category': 'PENGETAHUAN LOKASI',
    },
    {
      'question': 'Sunan Bonang adalah putra dari wali siapakah?',
      'options': ['Sunan Giri', 'Sunan Ampel', 'Sunan Kalijaga', 'Sunan Kudus'],
      'correct': 'B',
      'category': 'PENGETAHUAN SEJARAH',
    },
    {
      'question': 'Masjid Menara yang terkenal dibangun oleh wali siapa?',
      'options': ['Sunan Muria', 'Sunan Kalijaga', 'Sunan Kudus', 'Sunan Drajat'],
      'correct': 'C',
      'category': 'PENGETAHUAN BUDAYA',
    },
    {
      'question': 'Nama asli Sunan Kalijaga adalah?',
      'options': ['Raden Qasim', 'Raden Paku', 'Raden Said', 'Raden Rahmat'],
      'correct': 'C',
      'category': 'PENGETAHUAN SEJARAH',
    },
    {
      'question': 'Sunan Drajat dikenal karena kepeduliannya terhadap?',
      'options': ['Seni musik', 'Arsitektur masjid', 'Kaum fakir miskin', 'Ilmu fiqih'],
      'correct': 'C',
      'category': 'PENGETAHUAN DAKWAH',
    },
    {
      'question': 'Pesantren Sunan Giri yang terkenal berada di daerah?',
      'options': ['Tuban', 'Lamongan', 'Gresik', 'Kudus'],
      'correct': 'C',
      'category': 'PENGETAHUAN LOKASI',
    },
    {
      'question': 'Walisongo menyebarkan Islam di pulau mana?',
      'options': ['Sumatera', 'Jawa', 'Kalimantan', 'Sulawesi'],
      'correct': 'B',
      'category': 'PENGETAHUAN UMUM',
    },
  ];

  final List<String> _optionLabels = ['A', 'B', 'C', 'D'];

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeIn);
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _selectOption(String label) {
    if (_answered) return;
    setState(() {
      _selectedOption = label;
      _answered = true;
      // ✅ tambah skor jika jawaban benar
      if (label == _current['correct']) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (!_answered) return;

    if (_currentQuestion < _questions.length - 1) {
      _animController.reset();
      setState(() {
        _currentQuestion++;
        _selectedOption = null;
        _answered = false;
      });
      _animController.forward();
    } else {
      _showResultDialog();
    }
  }

  void _showResultDialog() {
    final int total = _questions.length;
    final double percentage = (_score / total) * 100;

    String pesan;
    IconData icon;
    Color iconColor;

    if (percentage == 100) {
      pesan = 'Sempurna! Kamu luar biasa!';
      icon = Icons.emoji_events_rounded;
      iconColor = const Color(0xFFFFD700);
    } else if (percentage >= 70) {
      pesan = 'Bagus! Terus tingkatkan!';
      icon = Icons.thumb_up_rounded;
      iconColor = primaryGreen;
    } else {
      pesan = 'Jangan menyerah, terus belajar!';
      icon = Icons.menu_book_rounded;
      iconColor = Colors.orange;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon hasil
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 36),
              ),
              const SizedBox(height: 20),

              // Judul
              const Text(
                'Kuis Selesai!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: primaryGreen,
                ),
              ),
              const SizedBox(height: 8),

              // Pesan motivasi
              Text(
                pesan,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13.5,
                  color: textGray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),

              // Skor
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: lightGreenBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      '$_score / $total',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                        color: primaryGreen,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Jawaban Benar  •  ${percentage.toStringAsFixed(0)}%',
                      style: const TextStyle(
                        fontSize: 12,
                        color: textGray,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Tombol kembali
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // tutup dialog
                    Navigator.of(context).pop(); // kembali ke KuisPage
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Kembali ke Beranda',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Tombol ulangi
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // tutup dialog
                    setState(() {
                      _currentQuestion = 0;
                      _selectedOption = null;
                      _answered = false;
                      _score = 0;
                    });
                    _animController.reset();
                    _animController.forward();
                  },
                  child: const Text(
                    'Ulangi Kuis',
                    style: TextStyle(
                      color: primaryGreen,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> get _current => _questions[_currentQuestion];
  int get _total => _questions.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: FadeTransition(
                opacity: _fadeAnim,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProgressHeader(),
                      const SizedBox(height: 28),
                      _buildQuestionText(),
                      const SizedBox(height: 28),
                      ..._buildOptions(),
                      const SizedBox(height: 32),
                      _buildNextButton(),
                    ],
                  ),
                ),
              ),
            ),
            _buildBottomNavBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.menu, color: textDark, size: 22),
              SizedBox(width: 10),
              Text(
                'Kuis Walisongo',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryGreen,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: lightGreenBg,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.star_rounded, color: primaryGreen, size: 16),
                const SizedBox(width: 4),
                Text(
                  '$_score',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: primaryGreen,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressHeader() {
    final progress = (_currentQuestion + 1) / _total;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _current['category'] as String,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: primaryGreen,
                letterSpacing: 1.0,
              ),
            ),
            Text(
              'Pertanyaan ${_currentQuestion + 1} dari $_total',
              style: const TextStyle(
                fontSize: 12,
                color: textGray,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: const Color(0xFFE8F0EB),
            valueColor: const AlwaysStoppedAnimation<Color>(primaryGreen),
            minHeight: 4,
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionText() {
    return Text(
      _current['question'] as String,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: textDark,
        height: 1.4,
      ),
    );
  }

  List<Widget> _buildOptions() {
    final options = _current['options'] as List<String>;
    final correct = _current['correct'] as String;

    return List.generate(options.length, (i) {
      final label = _optionLabels[i];
      final isSelected = _selectedOption == label;
      final isCorrect = label == correct;

      Color borderCol = borderColor;
      Color bgCol = bgColor;
      Color textCol = textDark;
      Color circleBg = const Color(0xFFF0F0F0);
      Color circleText = textGray;
      Widget? trailingWidget;

      if (_answered) {
        if (isCorrect) {
          borderCol = primaryGreen;
          bgCol = bgColor;
          textCol = primaryGreen;
          circleBg = primaryGreen;
          circleText = Colors.white;
          trailingWidget = const Icon(Icons.check_circle_outline_rounded,
              color: primaryGreen, size: 22);
        } else if (isSelected && !isCorrect) {
          borderCol = const Color(0xFFD32F2F);
          bgCol = bgColor;
          textCol = const Color(0xFFD32F2F);
          circleBg = const Color(0xFFD32F2F);
          circleText = Colors.white;
          trailingWidget = const Icon(Icons.cancel_outlined,
              color: Color(0xFFD32F2F), size: 22);
        }
      } else if (isSelected) {
        borderCol = primaryGreen;
        bgCol = lightGreenBg;
        textCol = primaryGreen;
        circleBg = primaryGreen;
        circleText = Colors.white;
      }

      return GestureDetector(
        onTap: () => _selectOption(label),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: bgCol,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: borderCol,
              width: isSelected || (_answered && isCorrect) ? 1.8 : 1.2,
            ),
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: circleBg,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: circleText,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  options[i],
                  style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: isSelected || (_answered && isCorrect)
                        ? FontWeight.w600
                        : FontWeight.w400,
                    color: textCol,
                  ),
                ),
              ),
              if (trailingWidget != null) ...[
                const SizedBox(width: 8),
                trailingWidget,
              ],
            ],
          ),
        ),
      );
    });
  }

  Widget _buildNextButton() {
    final isLast = _currentQuestion == _total - 1;

    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: _answered ? _nextQuestion : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGreen,
          disabledBackgroundColor: const Color(0xFFB0BEC5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isLast ? 'Selesai' : 'Selanjutnya',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              isLast ? Icons.check_rounded : Icons.arrow_forward_rounded,
              color: Colors.white,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(top: BorderSide(color: borderColor)),
      ),
      child: Row(
        children: [
          _buildNavItem(icon: Icons.home_outlined, label: 'Beranda', isActive: false),
          _buildNavItem(icon: Icons.menu_book_outlined, label: 'Panduan', isActive: false),
          _buildNavItem(icon: Icons.location_on_outlined, label: 'Lokasi', isActive: false),
          _buildNavItem(icon: Icons.history_edu_rounded, label: 'Sejarah', isActive: true),
          _buildNavItem(icon: Icons.book_outlined, label: 'Yasin', isActive: false),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isActive,
  }) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isActive
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(icon, size: 20, color: Colors.white),
                )
              : Icon(icon, size: 22, color: textLight),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
              color: isActive ? primaryGreen : textLight,
            ),
          ),
        ],
      ),
    );
  }
}