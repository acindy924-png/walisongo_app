import 'package:flutter/material.dart';

void main() {
  runApp(const WalisongoApp());
}

class WalisongoApp extends StatelessWidget {
  const WalisongoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Walisongo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B6B3A)),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
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

  // Ganti imagePath dengan asset gambar kamu, misal 'assets/images/masjid1.jpg'
  final List<OnboardingData> _pages = const [
    OnboardingData(
      imagePath: 'assets/images/menara_kudus.jpg',
      title: 'Selamat Datang',
      description:
          'Temukan cara baru untuk tetap berziarah dengan mudah dan menarik',
    ),
    OnboardingData(
      imagePath: 'assets/images/masjid_demak.jpg',
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

  void _skip() => _navigateToHome();

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // ── Page View ──────────────────────────────────────────────────────
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _OnboardingPage(
                data: _pages[index],
                isActive: index == _currentPage,
                fadeAnimation: _fadeAnimation,
                onNext: _nextPage,
                onSkip: _skip,
                currentPage: _currentPage,
                totalPages: _pages.length,
              );
            },
          ),
        ],
      ),
    );
  }
}

// ─── Single Onboarding Page ───────────────────────────────────────────────────

class _OnboardingPage extends StatelessWidget {
  final OnboardingData data;
  final bool isActive;
  final Animation<double> fadeAnimation;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final int currentPage;
  final int totalPages;

  const _OnboardingPage({
    required this.data,
    required this.isActive,
    required this.fadeAnimation,
    required this.onNext,
    required this.onSkip,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {

    return Stack(
      fit: StackFit.expand,
      children: [
        // ── Background Image ─────────────────────────────────────────────────
        _BackgroundImage(imagePath: data.imagePath),

        // ── Top gradient (for Skip button readability) ────────────────────
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 120,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.45),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        // ── Bottom card ───────────────────────────────────────────────────
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _BottomCard(
            data: data,
            fadeAnimation: fadeAnimation,
            onNext: onNext,
            currentPage: currentPage,
            totalPages: totalPages,
          ),
        ),

        // ── Skip button ──────────────────────────────────────────────────
        Positioned(
          top: MediaQuery.of(context).padding.top + 16,
          right: 20,
          child: GestureDetector(
            onTap: onSkip,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.25),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Background Image ─────────────────────────────────────────────────────────

class _BackgroundImage extends StatelessWidget {
  final String imagePath;

  const _BackgroundImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Gunakan Image.asset jika sudah ada asset gambar nyata
        // Image.asset(imagePath, fit: BoxFit.cover)
        // Placeholder warna hijau gelap untuk demo:
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF2D5016),
                const Color(0xFF1A3A0A),
                const Color(0xFF0D2005),
              ],
            ),
          ),
        ),
        // Simulasi foto dengan overlay pattern (hapus jika pakai gambar asli)
        Opacity(
          opacity: 0.12,
          child: CustomPaint(
          ),
        ),
      ],
    );
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
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(28, 32, 28, 48),
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Dot Indicators ─────────────────────────────────────────────
            _DotIndicator(currentPage: currentPage, totalPages: totalPages),
            const SizedBox(height: 24),

            // ── Title ───────────────────────────────────────────────────────
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

            // ── Description ─────────────────────────────────────────────────
            Text(
              data.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.5,
                color: Colors.grey[600],
                height: 1.6,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 36),

            // ── Next Button ─────────────────────────────────────────────────
            _NextButton(onTap: onNext),
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
            color: isActive
                ? const Color(0xFF1B6B3A)
                : const Color(0xFF1B6B3A).withOpacity(0.25),
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

  const _NextButton({required this.onTap});

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
          color: _isPressed
              ? const Color(0xFF155230)
              : const Color(0xFF1B6B3A),
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
          children: const [
            Text(
              'Lanjut',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Home Page (Placeholder) ──────────────────────────────────────────────────

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B6B3A),
        title: const Text(
          'Walisongo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Selamat Datang di\nWalisongo Aplikasi 🕌',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1B6B3A),
          ),
        ),
      ),
    );
  }
}