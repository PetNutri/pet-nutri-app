import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/vet_directory.dart';
import '../main.dart';
import '../theme/app_theme.dart';
import '../utils/url_helper.dart';

class VetDirectoryScreen extends StatefulWidget {
  const VetDirectoryScreen({super.key});
  @override
  State<VetDirectoryScreen> createState() => _VetDirectoryScreenState();
}

class _VetDirectoryScreenState extends State<VetDirectoryScreen> {
  String? _selectedCity;

  @override
  Widget build(BuildContext context) {
    final lang = localeProvider.locale.languageCode;
    final cities = getVetCities();
    final vets = _selectedCity != null ? getVetsInCity(_selectedCity!) : vetDirectory;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      ClipRRect(borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/images/logo.png', width: 32, height: 32)),
                      const SizedBox(width: 8),
                      Text('PetNutri', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                    ]),
                  ),
                ),
                const SizedBox(height: 8),
                Row(children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: GlassCard(padding: const EdgeInsets.all(10), borderRadius: 14,
                      child: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textSecondary, size: 18))),
                  const SizedBox(width: 12),
                  Text(
                    lang == 'en' ? 'Vet Directory' : 'Veterinari u Srbiji',
                    style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                  ),
                ]),
              ]),
            ),
            const SizedBox(height: 8),
            // City filter
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _CityChip(
                    label: lang == 'en' ? 'All' : 'Svi',
                    isSelected: _selectedCity == null,
                    onTap: () => setState(() => _selectedCity = null),
                  ),
                  const SizedBox(width: 8),
                  ...cities.map((city) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _CityChip(
                      label: city,
                      isSelected: _selectedCity == city,
                      onTap: () => setState(() => _selectedCity = city),
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Vet list
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: vets.length,
                itemBuilder: (context, index) {
                  final vet = vets[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      onTap: () => openUrl('https://www.google.com/maps/search/${Uri.encodeComponent("${vet.name} ${vet.city}")}'),
                      child: GlassCard(
                        padding: const EdgeInsets.all(16),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Row(children: [
                            Container(
                              width: 42, height: 42,
                              decoration: BoxDecoration(
                                color: AppColors.success.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.local_hospital_rounded, color: AppColors.success, size: 22),
                            ),
                            const SizedBox(width: 12),
                            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text(vet.name, style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                              Text(vet.city, style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
                            ])),
                            const Icon(Icons.map_rounded, color: AppColors.textMuted, size: 18),
                          ]),
                          const SizedBox(height: 10),
                          Row(children: [
                            const Icon(Icons.location_on_rounded, color: AppColors.textMuted, size: 14),
                            const SizedBox(width: 6),
                            Expanded(child: Text(vet.address, style: GoogleFonts.inter(fontSize: 12, color: AppColors.textSecondary))),
                          ]),
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: () => openUrl('tel:${vet.phone}'),
                            child: Row(children: [
                              const Icon(Icons.phone_rounded, color: AppColors.primary, size: 14),
                              const SizedBox(width: 6),
                              Text(vet.phone, style: GoogleFonts.inter(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w500)),
                            ]),
                          ),
                          if (vet.specialization != null) ...[
                            const SizedBox(height: 6),
                            Row(children: [
                              const Icon(Icons.medical_services_rounded, color: AppColors.textMuted, size: 14),
                              const SizedBox(width: 6),
                              Expanded(child: Text(vet.specialization!, style: GoogleFonts.inter(fontSize: 11, color: AppColors.textMuted))),
                            ]),
                          ],
                        ]),
                      ),
                    ),
                  ).animate().fadeIn(delay: Duration(milliseconds: index * 50), duration: 300.ms);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CityChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const _CityChip({required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? AppColors.primary : AppColors.glassBorder),
        ),
        child: Text(label, style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w500,
          color: isSelected ? Colors.white : AppColors.textSecondary)),
      ),
    );
  }
}
