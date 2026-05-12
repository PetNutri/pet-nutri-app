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
  int _step = 0; // 0 = welcome, 1 = select type, 2 = enter name
  PetType _selectedType = PetType.dog;
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_done', true);

    // Sacuvaj ljubimca ako je uneo ime
    final name = _nameController.text.trim();
    if (name.isNotEmpty) {
      final profile = PetProfile(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        type: _selectedType,
      );
      await PetProfileService.saveProfile(profile);
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
                // Select pet type
                Text(
                  lang == 'en' ? 'What kind of pet do you have?' : 'Kakvu zivotinju imas?',
                  style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(duration: 400.ms),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 12, runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: PetType.values.map((type) => GestureDetector(
                    onTap: () => setState(() => _selectedType = type),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 90, height: 90,
                      decoration: BoxDecoration(
                        color: _selectedType == type ? AppColors.primary.withOpacity(0.12) : AppColors.card,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: _selectedType == type ? AppColors.primary : AppColors.glassBorder,
                          width: _selectedType == type ? 2 : 1,
                        ),
                      ),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text(_petEmoji(type), style: const TextStyle(fontSize: 30)),
                        const SizedBox(height: 4),
                        Text(_petLabel(type), style: GoogleFonts.inter(fontSize: 11,
                          color: _selectedType == type ? AppColors.primary : AppColors.textMuted,
                          fontWeight: _selectedType == type ? FontWeight.w600 : FontWeight.w400)),
                      ]),
                    ),
                  )).toList(),
                ).animate().fadeIn(delay: 100.ms, duration: 400.ms),
                const SizedBox(height: 32),
                _buildButton(lang == 'en' ? 'Next' : 'Dalje', () => setState(() => _step = 2)),
              ] else ...[
                // Enter name
                Text(
                  lang == 'en' ? 'What\'s your pet\'s name?' : 'Kako se zove tvoj ljubimac?',
                  style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(duration: 400.ms),
                const SizedBox(height: 8),
                Text(
                  lang == 'en' ? 'Optional — you can add this later' : 'Opciono — mozes dodati i kasnije',
                  style: GoogleFonts.inter(fontSize: 14, color: AppColors.textMuted),
                ),
                const SizedBox(height: 32),
                Text(_petEmoji(_selectedType), style: const TextStyle(fontSize: 56)),
                const SizedBox(height: 24),
                TextField(
                  controller: _nameController,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                  decoration: InputDecoration(
                    hintText: lang == 'en' ? 'Name' : 'Ime',
                    hintStyle: GoogleFonts.inter(fontSize: 20, color: AppColors.textMuted),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: AppColors.primary, width: 2)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  ),
                ).animate().fadeIn(delay: 100.ms, duration: 400.ms),
                const SizedBox(height: 32),
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
