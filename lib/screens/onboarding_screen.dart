import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/conditions_database.dart';
import '../main.dart';
import '../services/pet_profile_service.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';

/// Onboarding ekran koji se prikazuje samo pri prvom pokretanju
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _step = 0; // 0 = welcome, 1 = select types, 2 = enter names
  final Set<PetType> _selectedTypes = {PetType.dog};
  final Map<PetType, TextEditingController> _nameControllers = {};

  @override
  void dispose() {
    for (final c in _nameControllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  void _goToNames() {
    // Kreiraj kontrolere za svaki izabrani tip
    _nameControllers.clear();
    for (final type in _selectedTypes) {
      _nameControllers[type] = TextEditingController();
    }
    setState(() => _step = 2);
  }

  Future<void> _finish() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_done', true);

    // Sacuvaj ljubimce za svaki tip koji ima ime
    for (final type in _selectedTypes) {
      final name = _nameControllers[type]?.text.trim() ?? '';
      if (name.isNotEmpty) {
        final profile = PetProfile(
          id: DateTime.now().millisecondsSinceEpoch.toString() + type.index.toString(),
          name: name,
          type: type,
        );
        await PetProfileService.saveProfile(profile);
      }
    }

    if (mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    }
  }

  void _skip() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_done', true);
    if (mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    }
  }

  String _petEmoji(PetType type) {
    switch (type) {
      case PetType.dog: return '🐕';
      case PetType.cat: return '🐈';
      case PetType.rabbit: return '🐇';
      case PetType.rodent: return '🐹';
      case PetType.bird: return '🐦';
      case PetType.terrarium: return '🦎';
      case PetType.aquarium: return '🐟';
    }
  }

  String _petLabel(PetType type) {
    final lang = localeProvider.locale.languageCode;
    if (lang == 'en') {
      switch (type) {
        case PetType.dog: return 'Dog';
        case PetType.cat: return 'Cat';
        case PetType.rabbit: return 'Rabbit';
        case PetType.rodent: return 'Rodent';
        case PetType.bird: return 'Bird';
        case PetType.terrarium: return 'Reptile';
        case PetType.aquarium: return 'Fish';
      }
    }
    switch (type) {
      case PetType.dog: return 'Pas';
      case PetType.cat: return 'Macka';
      case PetType.rabbit: return 'Zec';
      case PetType.rodent: return 'Glodar';
      case PetType.bird: return 'Ptica';
      case PetType.terrarium: return 'Gmizavac';
      case PetType.aquarium: return 'Riba';
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = localeProvider.locale.languageCode;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              // Skip button
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: _skip,
                  child: Text(
                    lang == 'en' ? 'Skip' : 'Preskoci',
                    style: GoogleFonts.inter(fontSize: 14, color: AppColors.textMuted, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const Spacer(),

              if (_step == 0) ...[
                // Welcome
                const Text('🐾', style: TextStyle(fontSize: 72)).animate().scale(duration: 600.ms, curve: Curves.elasticOut),
                const SizedBox(height: 24),
                Text(
                  'PetNutri',
                  style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w800, color: AppColors.textPrimary),
                ).animate().fadeIn(delay: 200.ms, duration: 500.ms),
                const SizedBox(height: 12),
                Text(
                  lang == 'en'
                      ? 'Find the best nutrition for your pet\'s health condition'
                      : 'Pronadji najbolju ishranu za zdravstveno stanje tvog ljubimca',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(fontSize: 16, color: AppColors.textSecondary, height: 1.5),
                ).animate().fadeIn(delay: 400.ms, duration: 500.ms),
                const SizedBox(height: 40),
                _buildButton(lang == 'en' ? 'Get Started' : 'Pocni', () => setState(() => _step = 1)),
              ] else if (_step == 1) ...[
                // Select pet types (multiple)
                Text(
                  lang == 'en' ? 'What pets do you have?' : 'Kakve zivotinje imas?',
                  style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(duration: 400.ms),
                const SizedBox(height: 8),
                Text(
                  lang == 'en' ? 'Select all that apply' : 'Izaberi sve koje imas',
                  style: GoogleFonts.inter(fontSize: 14, color: AppColors.textMuted),
                ),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 12, runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: PetType.values.map((type) {
                    final isSelected = _selectedTypes.contains(type);
                    return GestureDetector(
                      onTap: () => setState(() {
                        if (isSelected && _selectedTypes.length > 1) {
                          _selectedTypes.remove(type);
                        } else {
                          _selectedTypes.add(type);
                        }
                      }),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 90, height: 90,
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primary.withOpacity(0.12) : AppColors.card,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected ? AppColors.primary : AppColors.glassBorder,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Stack(children: [
                          Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text(_petEmoji(type), style: const TextStyle(fontSize: 30)),
                            const SizedBox(height: 4),
                            Text(_petLabel(type), style: GoogleFonts.inter(fontSize: 11,
                              color: isSelected ? AppColors.primary : AppColors.textMuted,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400)),
                          ])),
                          if (isSelected)
                            Positioned(top: 6, right: 6,
                              child: Container(
                                width: 20, height: 20,
                                decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                                child: const Icon(Icons.check_rounded, color: Colors.white, size: 14),
                              ),
                            ),
                        ]),
                      ),
                    );
                  }).toList(),
                ).animate().fadeIn(delay: 100.ms, duration: 400.ms),
                const SizedBox(height: 32),
                _buildButton(lang == 'en' ? 'Next' : 'Dalje', _goToNames),
              ] else ...[
                // Enter names for each selected type
                Text(
                  lang == 'en' ? 'Name your pets' : 'Imenuj svoje ljubimce',
                  style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(duration: 400.ms),
                const SizedBox(height: 8),
                Text(
                  lang == 'en' ? 'Optional — you can add this later' : 'Opciono — mozes dodati i kasnije',
                  style: GoogleFonts.inter(fontSize: 14, color: AppColors.textMuted),
                ),
                const SizedBox(height: 24),
                ..._selectedTypes.map((type) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(children: [
                    Text(_petEmoji(type), style: const TextStyle(fontSize: 32)),
                    const SizedBox(width: 14),
                    Expanded(
                      child: TextField(
                        controller: _nameControllers[type],
                        style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
                        decoration: InputDecoration(
                          hintText: '${lang == 'en' ? 'Name for' : 'Ime za'} ${_petLabel(type).toLowerCase()}',
                          hintStyle: GoogleFonts.inter(fontSize: 14, color: AppColors.textMuted),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColors.primary, width: 2)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                      ),
                    ),
                  ]),
                )).toList(),
                const SizedBox(height: 16),
                _buildButton(lang == 'en' ? 'Done' : 'Gotovo', _finish),
              ],

              const Spacer(),

              // Step indicator
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                _StepDot(active: _step == 0),
                const SizedBox(width: 8),
                _StepDot(active: _step == 1),
                const SizedBox(width: 8),
                _StepDot(active: _step == 2),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String label, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
        ),
        child: Text(label, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    ).animate().fadeIn(delay: 200.ms, duration: 400.ms);
  }
}

class _StepDot extends StatelessWidget {
  final bool active;
  const _StepDot({required this.active});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: active ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? AppColors.primary : AppColors.textMuted.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
