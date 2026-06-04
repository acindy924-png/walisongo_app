class DetailFasilitas {
  final String namaMasjid;
  final String jarakMasjid;
  final String statusMasjid;
  final List<Map<String, dynamic>> toiletFasilitas;
  final String namaPasar;
  final String jarakPasar;
  final String imageMasjid; // ← tambah

  const DetailFasilitas({
    required this.namaMasjid,
    required this.jarakMasjid,
    required this.statusMasjid,
    required this.toiletFasilitas,
    required this.namaPasar,
    required this.jarakPasar,
    required this.imageMasjid, // ← tambah
  });
}