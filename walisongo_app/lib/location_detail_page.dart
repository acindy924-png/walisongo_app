import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationDetailPage extends StatefulWidget {
  final Map<String, dynamic> lokasi;

  const LocationDetailPage({super.key, required this.lokasi});

  @override
  State<LocationDetailPage> createState() => _LocationDetailPageState();
}

class _LocationDetailPageState extends State<LocationDetailPage> {
  static const Color primaryGreen = Color(0xFF2D6A4F);
  static const Color lightGreenBg = Color(0xFFEBF5EE);

  bool _isSaved = false;

  // Koordinat GPS masing-masing Sunan
  double get _latitude => widget.lokasi['lat'] ?? -7.0;
  double get _longitude => widget.lokasi['lng'] ?? 110.0;
  String get _namaLokasi => widget.lokasi['nama'] ?? 'Lokasi Wali';

  Future<void> _openGoogleMaps() async {
    final Uri appUri = Uri.parse(
      'comgooglemaps://?q=$_latitude,$_longitude&zoom=17',
    );
    final Uri browserUri = Uri.parse(
      'https://www.google.com/maps/search/${Uri.encodeComponent(_namaLokasi)}/@$_latitude,$_longitude,17z',
    );

    if (await canLaunchUrl(appUri)) {
      await launchUrl(appUri);
    } else {
      await launchUrl(browserUri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _openDirections() async {
    final Uri uri = Uri.parse(
      'https://www.google.com/maps/dir/?api=1'
      '&destination=$_latitude,$_longitude'
      '&destination_place_name=${Uri.encodeComponent(_namaLokasi)}'
      '&travelmode=driving',
    );
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  void _toggleSave() {
    setState(() => _isSaved = !_isSaved);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isSaved ? 'Lokasi disimpan!' : 'Lokasi dihapus dari simpanan'),
        backgroundColor: primaryGreen,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildMapSection(),
          Expanded(
            child: SingleChildScrollView(
              child: _buildDetailContent(),
            ),
          ),
        ],
      ),
    );
  }

  // ── MAP SECTION ─────────────────────────────────────────────────
  Widget _buildMapSection() {
    return Stack(
      children: [
        GestureDetector(
          onTap: _openGoogleMaps,
          child: Container(
            height: 220,
            width: double.infinity,
            color: const Color(0xFFB8D4C0),
            child: Stack(
              children: [
                CustomPaint(
                  size: const Size(double.infinity, 220),
                  painter: _MapTexturePainter(),
                ),
                // Tap hint
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 6)],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.open_in_new, size: 13, color: Color(0xFF2D6A4F)),
                        SizedBox(width: 4),
                        Text('Buka di Maps', style: TextStyle(fontSize: 11, color: Color(0xFF2D6A4F), fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
                // Pin
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8)],
                        ),
                        child: Text(
                          widget.lokasi['nama'] ?? '',
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF1A3A2A)),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: 36, height: 36,
                        decoration: BoxDecoration(
                          color: primaryGreen,
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(color: primaryGreen.withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 4))],
                        ),
                        child: const Icon(Icons.location_on, color: Colors.white, size: 20),
                      ),
                      Container(
                        width: 10, height: 4,
                        decoration: BoxDecoration(color: Colors.black.withOpacity(0.2), borderRadius: BorderRadius.circular(2)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // AppBar overlay
        Positioned(
          top: 0, left: 0, right: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  _mapIconBtn(Icons.arrow_back, () => Navigator.pop(context)),
                  const Spacer(),
                  const Text(
                    'Walisongo',
                    style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,
                      shadows: [Shadow(color: Colors.black45, blurRadius: 6)],
                    ),
                  ),
                  const Spacer(),
                  _mapIconBtn(Icons.share_outlined, () {}),
                ],
              ),
            ),
          ),
        ),
        // Zoom controls
        Positioned(
          right: 12, top: 70,
          child: Column(
            children: [
              _zoomBtn(Icons.add),
              const SizedBox(height: 4),
              _zoomBtn(Icons.remove),
              const SizedBox(height: 4),
              _zoomBtn(Icons.my_location, onTap: _openGoogleMaps),
            ],
          ),
        ),
      ],
    );
  }

  Widget _mapIconBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36, height: 36,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 6)],
        ),
        child: Icon(icon, size: 18, color: const Color(0xFF1A3A2A)),
      ),
    );
  }

  Widget _zoomBtn(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: 32, height: 32,
        decoration: BoxDecoration(
          color: primaryGreen,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4)],
        ),
        child: Icon(icon, size: 18, color: Colors.white),
      ),
    );
  }

  // ── DETAIL CONTENT ──────────────────────────────────────────────
  Widget _buildDetailContent() {
    final item = widget.lokasi;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 40, height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
            ),
          ),

          // Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: lightGreenBg,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: primaryGreen),
            ),
            child: const Text('Situs Bersejarah', style: TextStyle(fontSize: 12, color: primaryGreen, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 10),

          // Judul
          Text(
            'Makam ${item['nama']}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF1A1A1A), height: 1.2),
          ),
          const SizedBox(height: 16),

          // Alamat
          GestureDetector(
            onTap: _openGoogleMaps,
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(12)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on_outlined, color: primaryGreen, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Alamat Lengkap', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 2),
                        Text(
                          item['alamat'] ?? 'Lihat di Google Maps',
                          style: const TextStyle(fontSize: 13, color: Color(0xFF1A1A1A), height: 1.5),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: Colors.grey, size: 18),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),

          // Action buttons row
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _openDirections,
                  icon: const Icon(Icons.directions, size: 18),
                  label: const Text('Petunjuk Arah', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen, foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _toggleSave,
                  icon: Icon(_isSaved ? Icons.bookmark : Icons.bookmark_border, size: 18,
                      color: _isSaved ? primaryGreen : const Color(0xFF1A1A1A)),
                  label: Text(_isSaved ? 'Tersimpan' : 'Simpan Lokasi',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,
                          color: _isSaved ? primaryGreen : const Color(0xFF1A1A1A))),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: _isSaved ? primaryGreen : Colors.grey.shade300),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Google Maps button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: _openGoogleMaps,
              icon: const Icon(Icons.map, size: 18, color: Color(0xFF4285F4)),
              label: const Text('Lihat di Google Maps',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF4285F4))),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: const BorderSide(color: Color(0xFF4285F4)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Tentang Lokasi
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: lightGreenBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFD0E8D9)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Tentang Lokasi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF1A1A1A))),
                const SizedBox(height: 10),
                Text(
                  '"${item['desc'] ?? ''}"',
                  style: const TextStyle(fontSize: 13, color: Color(0xFF3A3A3A), height: 1.7, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // Info masjid
          if (item['masjid'] != null) ...[
            _buildInfoRow(Icons.mosque_outlined, 'Masjid Terdekat', item['masjid']),
            const SizedBox(height: 10),
          ],
          if (item['jarak'] != null) ...[
            _buildInfoRow(Icons.straighten_outlined, 'Jarak', item['jarak']),
            const SizedBox(height: 10),
          ],
          if (item['status'] != null) ...[
            _buildStatusRow(item['status']),
            const SizedBox(height: 10),
          ],

          // Koordinat
          GestureDetector(
            onTap: _openGoogleMaps,
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: primaryGreen.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.location_searching, color: primaryGreen, size: 18),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Koordinat GPS', style: TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.w500)),
                      Text(
                        '${_latitude.toStringAsFixed(4)}, ${_longitude.toStringAsFixed(4)}',
                        style: const TextStyle(fontSize: 13, color: primaryGreen, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.open_in_new, color: Colors.grey, size: 16),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Icon(icon, color: primaryGreen, size: 18),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.w500)),
              Text(value, style: const TextStyle(fontSize: 13, color: Color(0xFF1A1A1A), fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow(String status) {
    final isRamai = status == 'Ramai';
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Icon(isRamai ? Icons.people : Icons.check_circle_outline,
              color: isRamai ? Colors.orange : primaryGreen, size: 18),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Status', style: TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.w500)),
              Text(status,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,
                      color: isRamai ? Colors.orange : primaryGreen)),
            ],
          ),
        ],
      ),
    );
  }
}

// ── MAP TEXTURE PAINTER ────────────────────────────────────────────
class _MapTexturePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    paint.color = const Color(0xFFB8D4C0);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    paint
      ..color = const Color(0xFFD4E8D8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    canvas.drawPath(Path()..moveTo(0, size.height * 0.5)..lineTo(size.width, size.height * 0.5), paint);
    canvas.drawPath(Path()..moveTo(size.width * 0.5, 0)..lineTo(size.width * 0.5, size.height), paint);
    paint
      ..color = const Color(0xFF8EBFAD)
      ..style = PaintingStyle.fill;
    final wp = Path()
      ..moveTo(0, 0)..lineTo(size.width * 0.3, 0)
      ..lineTo(size.width * 0.15, size.height * 0.4)..lineTo(0, size.height * 0.3)..close();
    canvas.drawPath(wp, paint);
    paint.color = const Color(0xFF9DC8A8);
    canvas.drawRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.55, size.height * 0.55, size.width * 0.2, size.height * 0.25),
        const Radius.circular(4)), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}