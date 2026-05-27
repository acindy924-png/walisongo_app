import 'package:flutter/material.dart';
import 'main_container_page.dart';

// ─── Main Wrapper / Runner untuk Melihat Frame ──────────────────────────────
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Color(0xFF1E1E24), // Latar belakang luar HP (gelap/aesthetic)
      body: Center(
        child: SmartphoneFrame(
          child: OnboardingScreen(),
        ),
      ),
    ),
  ));
}

// ─── Bingkai HP (Smartphone Mockup Frame) ────────────────────────────────────
class SmartphoneFrame extends StatelessWidget {
  final Widget child;

  const SmartphoneFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Ukuran standar HP modern (aspek rasio 9:19.5)
    const double frameWidth = 375;
    const double frameHeight = 812;
    const double cornerRadius = 40;

    return Container(
      width: frameWidth,
      height: frameHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        border: Border.all(color: const Color(0xFF2C2C2C), width: 12), // Bezel fisik HP
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 30,
            offset: const Offset(0, 15), // Efek bayangan HP melayang
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(cornerRadius - 12), // Potong konten pas di dalam bezel
        child: Stack(
          children: [
            // Konten Aplikasi Utama
            child,

            // Simulasi Dynamic Island / Notch Kamera Atas
            Positioned(
              top: 12,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 110,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            // Simulasi Garis Navigasi Bawah (Home Indicator)
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 130,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Data Model ───────────────────────────────────────────────────────────────
class OnboardingData {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingData({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

// ─── Onboarding Screen ────────────────────────────────────────────────────────
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  final List<OnboardingData> _pages = const [
    OnboardingData(
      imagePath: 'assets/images/menara_kudus.jpeg',
      title: 'Selamat Datang',
      description:
          'Temukan cara baru untuk tetap berziarah dengan mudah dan menarik',
    ),
    OnboardingData(
      imagePath: 'assets/images/masjid_demak.jpeg',
      title: 'Walisongo Aplikasi',
      description:
          'Menghubungkan ilmu, nilai islami, dan teknologi untuk pengalaman yang lebih mudah dan nyaman',
    ),
    OnboardingData(
      imagePath: 'assets/images/makam_wali.jpeg',
      title: 'Walisongo Aplikasi',
      description:
          'Hadir untuk memberikan akses berisi informasi, pembelajaran, dan layanan yang praktis serta bermanfaat',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() => _currentPage = index);
    _fadeController.reset();
    _fadeController.forward();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    } else {
      _navigateToHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Gambar
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return Image.asset(
                _pages[index].imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),

          // Gradasi Atas
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 140,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Konten UI (Padding bottom dihapus agar _BottomCard menyentuh dasar frame HP)
          Padding(
            padding: const EdgeInsets.only(top: 45), 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Tombol Skip
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: _navigateToHome,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Card Bawah (Sekarang mentok ke bawah)
                _BottomCard(
                  data: _pages[_currentPage],
                  fadeAnimation: _fadeAnimation,
                  onNext: _nextPage,
                  currentPage: _currentPage,
                  totalPages: _pages.length,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainContainerPage()),
    );
  }
}

// ─── Bottom Card ──────────────────────────────────────────────────────────────
class _BottomCard extends StatelessWidget {
  final OnboardingData data;
  final Animation<double> fadeAnimation;
  final VoidCallback onNext;
  final int currentPage;
  final int totalPages;

  const _BottomCard({
    required this.data,
    required this.fadeAnimation,
    required this.onNext,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        // Diubah menjadi BorderRadius.only agar sudut bawah flat / lurus mentok frame
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      // Padding bawah diatur ke 36 agar memberikan space yang cukup di area home indicator HP
      padding: const EdgeInsets.fromLTRB(28, 32, 28, 36),
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _DotIndicator(currentPage: currentPage, totalPages: totalPages),
            const SizedBox(height: 24),
            Text(
              data.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1B6B3A),
                height: 1.2,
              ),
            ),
            const SizedBox(height: 14),
            Flexible(
              child: Text(
                data.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.5,
                  color: Colors.grey[600],
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 32),
            _NextButton(
              onTap: onNext,
              isLast: currentPage == totalPages - 1,
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Dot Indicator ────────────────────────────────────────────────────────────
class _DotIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const _DotIndicator({required this.currentPage, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        final isActive = index == currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF1B6B3A) : const Color(0xFF1B6B3A).withOpacity(0.25),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

// ─── Next Button ──────────────────────────────────────────────────────────────
class _NextButton extends StatefulWidget {
  final VoidCallback onTap;
  final bool isLast;

  const _NextButton({required this.onTap, required this.isLast});

  @override
  State<_NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<_NextButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        transform: Matrix4.identity()..scale(_isPressed ? 0.97 : 1.0),
        width: double.infinity,
        height: 54,
        decoration: BoxDecoration(
          color: _isPressed ? const Color(0xFF155230) : const Color(0xFF1B6B3A),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1B6B3A).withOpacity(0.35),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.isLast ? 'Mulai' : 'Lanjut',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              widget.isLast ? Icons.check_rounded : Icons.arrow_forward_rounded,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}