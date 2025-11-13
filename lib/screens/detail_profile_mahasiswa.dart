import 'package:flutter/material.dart';
import '../widgets/detail_section_card.dart';
import '../widgets/detail_row_widget.dart';
import '../widgets/stat_card_widget.dart';

class DetailProfileMahasiswa extends StatelessWidget {
  final String name;
  final String nim;
  final String program;
  final String avatarUrl;

  const DetailProfileMahasiswa({
    Key? key,
    required this.name,
    required this.nim,
    required this.program,
    required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFEBF4FF), Color(0xFFE0E7FF), Color(0xFFF3E8FF)],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              SliverAppBar(
                expandedHeight: 200,
                floating: false,
                pinned: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF6366F1),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF1E3A8A),
                              Color(0xFF1E3A8A),
                              Color(0xFF1E3A8A),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Hero(
                            tag: 'avatar_$nim',
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 15,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 58,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(avatarUrl),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Content
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),

                      // Name & Status Badge
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4ADE80).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFF4ADE80),
                            width: 1.5,
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.circle,
                              color: Color(0xFF4ADE80),
                              size: 12,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Mahasiswa Aktif',
                              style: TextStyle(
                                color: Color(0xFF059669),
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Informasi Akademik
                      DetailSectionCard(
                        title: 'Informasi Akademik',
                        icon: Icons.school,
                        children: [
                          const SizedBox(height: 16),
                          DetailRowWidget(
                            icon: Icons.menu_book,
                            iconColor: const Color(0xFF9333EA),
                            label: 'Program Studi',
                            value: program,
                          ),
                          const SizedBox(height: 16),
                          const DetailRowWidget(
                            icon: Icons.apartment,
                            iconColor: Color(0xFFEC4899),
                            label: 'Fakultas',
                            value: 'Teknik',
                          ),
                          const SizedBox(height: 16),
                          const DetailRowWidget(
                            icon: Icons.calendar_today,
                            iconColor: Color(0xFF14B8A6),
                            label: 'Tahun Masuk',
                            value: '2022',
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Informasi Kontak
                      const DetailSectionCard(
                        title: 'Informasi Kontak',
                        icon: Icons.contact_mail,
                        children: [
                          DetailRowWidget(
                            icon: Icons.email,
                            iconColor: Color(0xFFEF4444),
                            label: 'Email',
                            value: 'annasdyto82@gmail.com',
                          ),
                          SizedBox(height: 16),
                          DetailRowWidget(
                            icon: Icons.phone,
                            iconColor: Color(0xFF10B981),
                            label: 'No. Telepon',
                            value: '+62 812-3456-7890',
                          ),
                          SizedBox(height: 16),
                          DetailRowWidget(
                            icon: Icons.location_on,
                            iconColor: Color(0xFFF59E0B),
                            label: 'Alamat',
                            value:
                                'Jl. Raya Gelam No.250, Pagerwaja, Gelam, Kec. Candi, Kabupaten Sidoarjo, Jawa Timur 61271',
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Status Akademik
                      const DetailSectionCard(
                        title: 'Status Akademik',
                        icon: Icons.insights,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: StatCardWidget(
                                  label: 'IPK',
                                  value: '3.80',
                                  icon: Icons.star,
                                  color: Color(0xFFEAB308),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: StatCardWidget(
                                  label: 'SKS',
                                  value: '120',
                                  icon: Icons.book,
                                  color: Color(0xFF6366F1),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: StatCardWidget(
                                  label: 'Semester',
                                  value: '7',
                                  icon: Icons.school,
                                  color: Color(0xFF9333EA),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: StatCardWidget(
                                  label: 'Prestasi',
                                  value: '0',
                                  icon: Icons.emoji_events,
                                  color: Color(0xFFEC4899),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Menghubungi mahasiswa...'),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              },
                              icon: const Icon(Icons.message),
                              label: const Text('Hubungi'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: const Color(0xFF6366F1),
                                side: const BorderSide(
                                  color: Color(0xFF6366F1),
                                  width: 2,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Membagikan profil...'),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              },
                              icon: const Icon(Icons.share),
                              label: const Text('Bagikan'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6366F1),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
