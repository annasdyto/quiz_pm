// Model Mahasiswa
class Mahasiswa {
  final String nama;
  final String nim;
  final String prodi;
  final String fakultas;
  final String tahunAkademik;
  final int semester;
  final String status;
  final int totalSks;
  final double ipk;
  final String email;
  final String noHp;
  final String? fotoProfil;

  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.fakultas,
    required this.tahunAkademik,
    required this.semester,
    required this.status,
    required this.totalSks,
    required this.ipk,
    required this.email,
    required this.noHp,
    this.fotoProfil,
  });

  factory Mahasiswa.fromJson(Map<String, dynamic> json) {
    return Mahasiswa(
      nama: json['nama'],
      nim: json['nim'],
      prodi: json['prodi'],
      fakultas: json['fakultas'],
      tahunAkademik: json['tahunAkademik'],
      semester: json['semester'],
      status: json['status'],
      totalSks: json['totalSks'],
      ipk: json['ipk'],
      email: json['email'],
      noHp: json['noHp'],
      fotoProfil: json['fotoProfil'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'nim': nim,
      'prodi': prodi,
      'fakultas': fakultas,
      'tahunAkademik': tahunAkademik,
      'semester': semester,
      'status': status,
      'totalSks': totalSks,
      'ipk': ipk,
      'email': email,
      'noHp': noHp,
      'fotoProfil': fotoProfil,
    };
  }
}

// Data dummy mahasiswa
final mahasiswaDummy = Mahasiswa(
  nama: 'Safira Saputri Septian',
  nim: '21892669008',
  prodi: 'Teknik Informatika',
  fakultas: 'SAINS DAN TEKNOLOGI',
  tahunAkademik: '2022 - 2026',
  semester: 7,
  status: 'Aktif',
  totalSks: 125,
  ipk: 3.86,
  email: 'safira.septian@gmail.umsida.ac.id',
  noHp: '081234567890',
  fotoProfil: 'https://api.dicebear.com/7.x/avataaars/svg?seed=Safira',
);