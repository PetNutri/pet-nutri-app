import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/conditions_database.dart';
import '../main.dart';
import '../services/pet_profile_service.dart';
import '../theme/app_theme.dart';

class PetProfilesScreen extends StatefulWidget {
  const PetProfilesScreen({super.key});
  @override
  State<PetProfilesScreen> createState() => _PetProfilesScreenState();
}

class _PetProfilesScreenState extends State<PetProfilesScreen> {
  List<PetProfile> _profiles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadProfiles();
  }

  Future<void> _loadProfiles() async {
    final profiles = await PetProfileService.getProfiles();
    setState(() { _profiles = profiles; _loading = false; });
  }

  Future<void> _deleteProfile(String id) async {
    await PetProfileService.deleteProfile(id);
    _loadProfiles();
  }

  void _openAddDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _AddPetSheet(onSaved: _loadProfiles),
    );
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

  @override
  Widget build(BuildContext context) {
    final lang = localeProvider.locale.languageCode;
    final title = lang == 'en' ? 'My Pets' : 'Moji ljubimci';
    final addLabel = lang == 'en' ? 'Add pet' : 'Dodaj ljubimca';
    final emptyMsg = lang == 'en'
        ? 'Add your pet to get personalized recommendations'
        : 'Dodaj svog ljubimca za personalizovane preporuke';

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
                  Expanded(child: Text(title, style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary))),
                  GestureDetector(
                    onTap: _openAddDialog,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        const Icon(Icons.add_rounded, color: Colors.white, size: 18),
                        const SizedBox(width: 4),
                        Text(addLabel, style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white)),
                      ]),
                    ),
                  ),
                ]),
              ]),
            ),
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
                  : _profiles.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                            child: Column(mainAxisSize: MainAxisSize.min, children: [
                              const Text('🐾', style: TextStyle(fontSize: 48)),
                              const SizedBox(height: 16),
                              Text(emptyMsg, textAlign: TextAlign.center,
                                style: GoogleFonts.inter(fontSize: 15, color: AppColors.textMuted)),
                            ]),
                          ),
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          itemCount: _profiles.length,
                          itemBuilder: (context, index) {
                            final pet = _profiles[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Dismissible(
                                key: Key(pet.id),
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    color: AppColors.danger.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Icon(Icons.delete_rounded, color: AppColors.danger),
                                ),
                                onDismissed: (_) => _deleteProfile(pet.id),
                                child: GlassCard(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(children: [
                                    Container(
                                      width: 50, height: 50,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Center(child: Text(_petEmoji(pet.type), style: const TextStyle(fontSize: 26))),
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Text(pet.name, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                                      const SizedBox(height: 4),
                                      Row(children: [
                                        if (pet.ageDisplay.isNotEmpty) ...[
                                          Text(pet.ageDisplay, style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
                                          const SizedBox(width: 8),
                                        ],
                                        if (pet.weightKg != null)
                                          Text('${pet.weightKg} kg', style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
                                      ]),
                                      if (pet.conditions.isNotEmpty) ...[
                                        const SizedBox(height: 6),
                                        Wrap(spacing: 6, runSpacing: 4,
                                          children: pet.conditions.take(3).map((cId) {
                                            final condition = allConditions.where((c) => c.id == cId).firstOrNull;
                                            return Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                              decoration: BoxDecoration(
                                                color: AppColors.accent.withOpacity(0.1),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                condition?.name ?? cId,
                                                style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.accent),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ])),
                                  ]),
                                ),
                              ).animate().fadeIn(delay: Duration(milliseconds: index * 80), duration: 350.ms),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== ADD PET BOTTOM SHEET ====================

class _AddPetSheet extends StatefulWidget {
  final VoidCallback onSaved;
  const _AddPetSheet({required this.onSaved});
  @override
  State<_AddPetSheet> createState() => _AddPetSheetState();
}

class _AddPetSheetState extends State<_AddPetSheet> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  PetType _selectedType = PetType.dog;

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    final profile = PetProfile(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      type: _selectedType,
      ageMonths: int.tryParse(_ageController.text),
      weightKg: double.tryParse(_weightController.text),
    );

    await PetProfileService.saveProfile(profile);
    widget.onSaved();
    if (mounted) Navigator.pop(context);
  }

  String _petLabel(PetType type) {
    switch (type) {
      case PetType.dog: return '🐕 Pas';
      case PetType.cat: return '🐈 Macka';
      case PetType.rabbit: return '🐇 Zec';
      case PetType.rodent: return '🐹 Glodar';
      case PetType.bird: return '🐦 Ptica';
      case PetType.terrarium: return '🦎 Gmizavac';
      case PetType.aquarium: return '🐟 Riba';
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = localeProvider.locale.languageCode;
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Container(width: 40, height: 4,
              decoration: BoxDecoration(color: AppColors.textMuted.withOpacity(0.3), borderRadius: BorderRadius.circular(2))),
          ),
          const SizedBox(height: 20),
          Text(
            lang == 'en' ? 'Add Pet' : 'Dodaj ljubimca',
            style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
          ),
          const SizedBox(height: 20),

          // Name
          TextField(
            controller: _nameController,
            style: GoogleFonts.inter(color: AppColors.textPrimary),
            decoration: InputDecoration(
              labelText: lang == 'en' ? 'Name' : 'Ime',
              labelStyle: GoogleFonts.inter(color: AppColors.textMuted),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.primary)),
            ),
          ),
          const SizedBox(height: 16),

          // Pet type
          Text(lang == 'en' ? 'Type' : 'Vrsta', style: GoogleFonts.inter(fontSize: 13, color: AppColors.textMuted)),
          const SizedBox(height: 8),
          Wrap(spacing: 8, runSpacing: 8,
            children: PetType.values.map((type) => GestureDetector(
              onTap: () => setState(() => _selectedType = type),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: _selectedType == type ? AppColors.primary.withOpacity(0.15) : AppColors.card,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: _selectedType == type ? AppColors.primary : AppColors.glassBorder),
                ),
                child: Text(_petLabel(type), style: GoogleFonts.inter(fontSize: 13,
                  fontWeight: _selectedType == type ? FontWeight.w600 : FontWeight.w400,
                  color: _selectedType == type ? AppColors.primary : AppColors.textSecondary)),
              ),
            )).toList(),
          ),
          const SizedBox(height: 16),

          // Age and weight
          Row(children: [
            Expanded(
              child: TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                style: GoogleFonts.inter(color: AppColors.textPrimary),
                decoration: InputDecoration(
                  labelText: lang == 'en' ? 'Age (months)' : 'Starost (meseci)',
                  labelStyle: GoogleFonts.inter(color: AppColors.textMuted, fontSize: 12),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.primary)),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: _weightController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                style: GoogleFonts.inter(color: AppColors.textPrimary),
                decoration: InputDecoration(
                  labelText: lang == 'en' ? 'Weight (kg)' : 'Tezina (kg)',
                  labelStyle: GoogleFonts.inter(color: AppColors.textMuted, fontSize: 12),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.primary)),
                ),
              ),
            ),
          ]),
          const SizedBox(height: 24),

          // Save button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _save,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              child: Text(lang == 'en' ? 'Save' : 'Sacuvaj', style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600)),
            ),
          ),
        ]),
      ),
    );
  }
}
