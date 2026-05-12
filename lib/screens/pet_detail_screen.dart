import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/conditions_database.dart';
import '../l10n/localized_condition.dart';
import '../main.dart';
import '../services/pet_profile_service.dart';
import '../theme/app_theme.dart';
import 'condition_screen.dart';

/// Ekran sa detaljima ljubimca i personalizovanim preporukama
class PetDetailScreen extends StatefulWidget {
  final PetProfile pet;
  const PetDetailScreen({super.key, required this.pet});
  @override
  State<PetDetailScreen> createState() => _PetDetailScreenState();
}

class _PetDetailScreenState extends State<PetDetailScreen> {
  late PetProfile pet;

  @override
  void initState() {
    super.initState();
    pet = widget.pet;
  }

  Future<void> _editPet() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _EditPetSheet(
        pet: pet,
        onSaved: (updatedPet) {
          setState(() => pet = updatedPet);
        },
      ),
    );
  }

  Future<void> _deletePet() async {
    final lang = localeProvider.locale.languageCode;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(lang == 'en' ? 'Delete pet?' : 'Obrisati ljubimca?'),
        content: Text(lang == 'en'
            ? 'Are you sure you want to delete ${pet.name}? This cannot be undone.'
            : 'Da li ste sigurni da zelite da obrisete ${pet.name}? Ovo se ne moze poništiti.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(lang == 'en' ? 'Cancel' : 'Otkazi'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: AppColors.danger),
            child: Text(lang == 'en' ? 'Delete' : 'Obrisi'),
          ),
        ],
      ),
    );
    if (confirmed == true && mounted) {
      await PetProfileService.deleteProfile(pet.id);
      Navigator.pop(context, true); // vrati true da signalizira brisanje
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

  String _petTypeName(PetType type, String lang) {
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

  /// Generise preporuke na osnovu vrste i starosti
  List<_Recommendation> _getRecommendations(String lang) {
    final recs = <_Recommendation>[];
    final isYoung = pet.ageMonths != null && pet.ageMonths! < 12;
    final isSenior = pet.ageMonths != null && pet.ageMonths! > 84; // 7+ godina
    final isOverweight = pet.weightKg != null && _isLikelyOverweight();

    // Preporuke po starosti
    if (isYoung) {
      recs.add(_Recommendation(
        icon: '🍼',
        title: lang == 'en' ? 'Young animal nutrition' : 'Ishrana mladih zivotinja',
        description: lang == 'en'
            ? 'Young animals need more protein and calories for growth. Feed age-appropriate food with higher nutrient density.'
            : 'Mlade zivotinje trebaju vise proteina i kalorija za rast. Koristite hranu prilagodjenu uzrastu sa vecom gustinom nutrijenata.',
      ));
    }
    if (isSenior) {
      recs.add(_Recommendation(
        icon: '👴',
        title: lang == 'en' ? 'Senior care' : 'Briga o starijim ljubimcima',
        description: lang == 'en'
            ? 'Senior pets benefit from joint supplements (glucosamine), easily digestible food, and regular vet checkups every 6 months.'
            : 'Stariji ljubimci imaju koristi od suplemenata za zglobove (glukozamin), lako svarljive hrane i redovnih pregleda kod veterinara svakih 6 meseci.',
      ));
    }
    if (isOverweight) {
      recs.add(_Recommendation(
        icon: '⚖️',
        title: lang == 'en' ? 'Weight management' : 'Kontrola tezine',
        description: lang == 'en'
            ? 'Your pet may be overweight. Consider a low-calorie, high-fiber diet and increase physical activity gradually.'
            : 'Vas ljubimac mozda ima visak kilograma. Razmotrite niskokalorijski rezim bogat vlaknima i postepeno povecajte fizicku aktivnost.',
      ));
    }

    // Preporuke po vrsti
    switch (pet.type) {
      case PetType.dog:
        recs.add(_Recommendation(
          icon: '🦴',
          title: lang == 'en' ? 'Dental care' : 'Nega zuba',
          description: lang == 'en'
              ? 'Over 80% of dogs over 3 years have dental disease. Brush teeth daily and provide dental chews.'
              : 'Preko 80% pasa starijih od 3 godine ima bolest zuba. Perite zube svakodnevno i obezbedite dentalne grickalice.',
        ));
        if (isSenior) {
          recs.add(_Recommendation(
            icon: '❤️',
            title: lang == 'en' ? 'Heart health' : 'Zdravlje srca',
            description: lang == 'en'
                ? 'Senior dogs are prone to heart disease. Watch for coughing, fatigue, and difficulty breathing. Annual cardiac checkup recommended.'
                : 'Stariji psi su skloni srcnim bolestima. Obratite paznju na kasalj, zamor i otezano disanje. Preporucen godisnji kardilooski pregled.',
          ));
        }
        break;
      case PetType.cat:
        recs.add(_Recommendation(
          icon: '💧',
          title: lang == 'en' ? 'Hydration' : 'Hidratacija',
          description: lang == 'en'
              ? 'Cats often don\'t drink enough water. Use a water fountain and offer wet food to prevent urinary problems.'
              : 'Macke cesto ne piju dovoljno vode. Koristite fontanu za vodu i nudite vlaznu hranu za prevenciju urinarnih problema.',
        ));
        if (isSenior) {
          recs.add(_Recommendation(
            icon: '🫘',
            title: lang == 'en' ? 'Kidney monitoring' : 'Pracenje bubrega',
            description: lang == 'en'
                ? 'Chronic kidney disease affects 30-40% of cats over 10 years. Annual blood tests (SDMA, creatinine) are essential.'
                : 'Hronicna bubrezna bolest pogadja 30-40% macaka starijih od 10 godina. Godisnje krvne analize (SDMA, kreatinin) su neophodne.',
          ));
        }
        break;
      case PetType.rabbit:
        recs.add(_Recommendation(
          icon: '🌾',
          title: lang == 'en' ? 'Hay is essential' : 'Seno je osnova',
          description: lang == 'en'
              ? '80% of a rabbit\'s diet should be hay. It keeps teeth worn down and gut moving. Unlimited timothy hay at all times.'
              : '80% ishrane zeca treba da bude seno. Odrzava zube i pokrece creva. Neograniceno timotejevo seno u svakom trenutku.',
        ));
        recs.add(_Recommendation(
          icon: '💉',
          title: lang == 'en' ? 'Vaccination' : 'Vakcinacija',
          description: lang == 'en'
              ? 'Vaccinate against Myxomatosis and RHD (RHDV1 + RHDV2) every 6-12 months. These diseases are almost always fatal without vaccination.'
              : 'Vakcinisati protiv Miksomatoze i RHD (RHDV1 + RHDV2) svakih 6-12 meseci. Ove bolesti su gotovo uvek fatalne bez vakcinacije.',
        ));
        break;
      case PetType.rodent:
        recs.add(_Recommendation(
          icon: '🍊',
          title: lang == 'en' ? 'Vitamin C (guinea pigs)' : 'Vitamin C (zamorcici)',
          description: lang == 'en'
              ? 'Guinea pigs cannot produce vitamin C. Provide fresh bell peppers, broccoli, or supplements daily (30-50mg/day).'
              : 'Zamorcici ne mogu sami proizvoditi vitamin C. Obezbedite svezu papriku, brokoli ili suplemente svakodnevno (30-50mg/dan).',
        ));
        recs.add(_Recommendation(
          icon: '🏠',
          title: lang == 'en' ? 'Clean bedding' : 'Cista prostirka',
          description: lang == 'en'
              ? 'Avoid cedar and pine shavings — they cause respiratory problems. Use paper-based bedding or fleece liners.'
              : 'Izbegavajte cedar i bor strugotine — izazivaju respiratorne probleme. Koristite papirnu prostirku ili fleece podloge.',
        ));
        break;
      case PetType.bird:
        recs.add(_Recommendation(
          icon: '🥦',
          title: lang == 'en' ? 'Diet variety' : 'Raznovrsna ishrana',
          description: lang == 'en'
              ? 'A seed-only diet causes fatty liver disease. Switch to pellets (60-70%) with fresh vegetables and limited fruit.'
              : 'Ishrana samo semenjem izaziva masnu jetru. Predjite na pelete (60-70%) sa svezim povrcem i ogranicenim vocem.',
        ));
        recs.add(_Recommendation(
          icon: '☀️',
          title: lang == 'en' ? 'Light cycle' : 'Ciklus svetlosti',
          description: lang == 'en'
              ? 'Birds need 10-12 hours of uninterrupted darkness for proper rest. Cover the cage or move to a dark room at night.'
              : 'Ptice trebaju 10-12 sati neprekidne tame za pravilan odmor. Pokrijte kavez ili premestite u tamnu sobu nocu.',
        ));
        break;
      case PetType.terrarium:
        recs.add(_Recommendation(
          icon: '☀️',
          title: lang == 'en' ? 'UVB lighting' : 'UVB osvetljenje',
          description: lang == 'en'
              ? 'Most reptiles need UVB light for vitamin D3 synthesis. Replace UVB bulbs every 6 months even if they still emit visible light.'
              : 'Vecina gmizavaca treba UVB svetlo za sintezu vitamina D3. Menjajte UVB sijalice svakih 6 meseci cak i ako jos emituju vidljivu svetlost.',
        ));
        recs.add(_Recommendation(
          icon: '🌡️',
          title: lang == 'en' ? 'Temperature gradient' : 'Temperaturni gradijent',
          description: lang == 'en'
              ? 'Provide a warm basking spot and a cooler area so your reptile can thermoregulate. Always use a thermostat.'
              : 'Obezbedite toplo mesto za suncanje i hladniji deo da gmizavac moze da regulise temperaturu. Uvek koristite termostat.',
        ));
        break;
      case PetType.aquarium:
        recs.add(_Recommendation(
          icon: '💧',
          title: lang == 'en' ? 'Water changes' : 'Promena vode',
          description: lang == 'en'
              ? 'Change 20-30% of water weekly. Test for ammonia, nitrites, and nitrates regularly. Ammonia and nitrites should always be 0.'
              : 'Menjajte 20-30% vode nedeljno. Redovno testirajte amonijak, nitrite i nitrate. Amonijak i nitriti moraju uvek biti 0.',
        ));
        recs.add(_Recommendation(
          icon: '🐟',
          title: lang == 'en' ? 'Don\'t overfeed' : 'Ne prekrmite',
          description: lang == 'en'
              ? 'Feed only what fish can eat in 2-3 minutes. Excess food decomposes and poisons the water with ammonia.'
              : 'Dajte samo onoliko koliko ribe mogu pojesti za 2-3 minuta. Visak hrane se raspada i truje vodu amonijakom.',
        ));
        break;
    }

    // Preporuke na osnovu unetih bolesti
    if (pet.conditions.isNotEmpty) {
      // Prikupi sve dijetetske smernice iz bolesti ljubimca
      final goodSet = <String>{};
      final badSet = <String>{};
      final guidelinesSummary = <String>[];

      for (final cId in pet.conditions) {
        final condition = allConditions.where((c) => c.id == cId).firstOrNull;
        if (condition == null) continue;

        goodSet.addAll(condition.goodIngredients);
        badSet.addAll(condition.badIngredients);

        for (final g in condition.guidelines) {
          final summary = '${g.nutrient}: ${g.reason}';
          if (!guidelinesSummary.contains(summary)) {
            guidelinesSummary.add(summary);
          }
        }
      }

      // Preporuka za ishranu
      if (goodSet.isNotEmpty) {
        final topGood = goodSet.take(8).join(', ');
        recs.add(_Recommendation(
          icon: '✅',
          title: lang == 'en' ? 'Recommended ingredients' : 'Preporuceni sastojci',
          description: lang == 'en'
              ? 'Based on your pet\'s conditions, look for food containing: $topGood'
              : 'Na osnovu stanja vaseg ljubimca, trazite hranu koja sadrzi: $topGood',
        ));
      }

      if (badSet.isNotEmpty) {
        final topBad = badSet.take(8).join(', ');
        recs.add(_Recommendation(
          icon: '🚫',
          title: lang == 'en' ? 'Ingredients to avoid' : 'Sastojci koje treba izbegavati',
          description: lang == 'en'
              ? 'Based on your pet\'s conditions, avoid food containing: $topBad'
              : 'Na osnovu stanja vaseg ljubimca, izbegavajte hranu koja sadrzi: $topBad',
        ));
      }

      // Kljucne dijetetske smernice
      if (guidelinesSummary.isNotEmpty) {
        final topGuidelines = guidelinesSummary.take(4).join('\n• ');
        recs.add(_Recommendation(
          icon: '📋',
          title: lang == 'en' ? 'Diet guidelines for conditions' : 'Dijetetske smernice za stanja',
          description: '• $topGuidelines',
        ));
      }
    }

    return recs;
  }

  /// Gruba procena da li je ljubimac predebeo (pojednostavljena logika)
  bool _isLikelyOverweight() {
    if (pet.weightKg == null) return false;
    switch (pet.type) {
      case PetType.cat:
        return pet.weightKg! > 6.0;
      case PetType.rabbit:
        return pet.weightKg! > 3.0;
      case PetType.rodent:
        return pet.weightKg! > 1.2; // zamorac
      default:
        return false; // za pse ne mozemo proceniti bez rase
    }
  }

  /// Bolesti na koje treba obratiti paznju za ovu vrstu i starost
  List<PetCondition> _getRelevantConditions() {
    final conditions = allConditions
        .where((c) => c.affectedSpecies.contains(pet.type))
        .toList();

    // Prioritizuj po starosti
    if (pet.ageMonths != null && pet.ageMonths! > 84) {
      // Stariji ljubimci — prioritet: srcane, bubrezne, artritis, tumori
      final seniorKeywords = ['srcana', 'bubrezna', 'artritis', 'tumor', 'dijabetes', 'hipotireoza', 'hipertireoza', 'dental'];
      conditions.sort((a, b) {
        final aScore = seniorKeywords.any((k) => a.id.contains(k) || a.name.toLowerCase().contains(k)) ? 0 : 1;
        final bScore = seniorKeywords.any((k) => b.id.contains(k) || b.name.toLowerCase().contains(k)) ? 0 : 1;
        return aScore.compareTo(bScore);
      });
    }

    return conditions.take(8).toList();
  }

  @override
  Widget build(BuildContext context) {
    final lang = localeProvider.locale.languageCode;
    final recommendations = _getRecommendations(lang);
    final relevantConditions = _getRelevantConditions();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
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
                  Expanded(child: Text('${_petEmoji(pet.type)} ${pet.name}', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary))),
                  GestureDetector(
                    onTap: _editPet,
                    child: GlassCard(padding: const EdgeInsets.all(10), borderRadius: 14,
                      child: const Icon(Icons.edit_rounded, color: AppColors.primary, size: 18))),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _deletePet,
                    child: GlassCard(padding: const EdgeInsets.all(10), borderRadius: 14,
                      child: const Icon(Icons.delete_rounded, color: AppColors.danger, size: 18))),
                ]),
              ]),
            ),
            // Content
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const SizedBox(height: 8),

                  // Pet info card
                  GlassCard(
                    padding: const EdgeInsets.all(20),
                    child: Row(children: [
                      Container(
                        width: 64, height: 64,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Center(child: Text(_petEmoji(pet.type), style: const TextStyle(fontSize: 36))),
                      ),
                      const SizedBox(width: 16),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(pet.name, style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                        const SizedBox(height: 4),
                        Text(_petTypeName(pet.type, lang), style: GoogleFonts.inter(fontSize: 14, color: AppColors.textMuted)),
                        const SizedBox(height: 6),
                        Row(children: [
                          if (pet.ageDisplay.isNotEmpty) ...[
                            _InfoChip(icon: Icons.cake_rounded, label: pet.ageDisplay),
                            const SizedBox(width: 8),
                          ],
                          if (pet.weightKg != null)
                            _InfoChip(icon: Icons.monitor_weight_rounded, label: '${pet.weightKg} kg'),
                        ]),
                      ])),
                    ]),
                  ).animate().fadeIn(duration: 400.ms),

                  // Pet's conditions
                  if (pet.conditions.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    GlassCard(
                      padding: const EdgeInsets.all(16),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(
                          lang == 'en' ? '🩺 Health conditions' : '🩺 Zdravstvena stanja',
                          style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                        ),
                        const SizedBox(height: 10),
                        Wrap(spacing: 8, runSpacing: 8,
                          children: pet.conditions.map((cId) {
                            final condition = allConditions.where((c) => c.id == cId).firstOrNull;
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: AppColors.accent.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.accent.withOpacity(0.2)),
                              ),
                              child: Row(mainAxisSize: MainAxisSize.min, children: [
                                Text(condition?.icon ?? '🩺', style: const TextStyle(fontSize: 14)),
                                const SizedBox(width: 6),
                                Text(condition?.name ?? cId, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.accent)),
                              ]),
                            );
                          }).toList(),
                        ),
                      ]),
                    ).animate().fadeIn(delay: 50.ms, duration: 400.ms),
                  ],

                  const SizedBox(height: 24),

                  // Recommendations section
                  Text(
                    lang == 'en' ? '💡 Recommendations' : '💡 Preporuke',
                    style: GoogleFonts.inter(fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                  ).animate().fadeIn(delay: 100.ms, duration: 400.ms),
                  const SizedBox(height: 12),

                  ...recommendations.asMap().entries.map((entry) {
                    final rec = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GlassCard(
                        padding: const EdgeInsets.all(16),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(rec.icon, style: const TextStyle(fontSize: 24)),
                          const SizedBox(width: 14),
                          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(rec.title, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                            const SizedBox(height: 4),
                            Text(rec.description, style: GoogleFonts.inter(fontSize: 13, color: AppColors.textSecondary, height: 1.4)),
                          ])),
                        ]),
                      ),
                    ).animate().fadeIn(delay: Duration(milliseconds: 150 + entry.key * 80), duration: 400.ms);
                  }),

                  const SizedBox(height: 24),

                  // Relevant conditions
                  Text(
                    lang == 'en' ? '🩺 Common conditions for this species' : '🩺 Cesta stanja za ovu vrstu',
                    style: GoogleFonts.inter(fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                  ).animate().fadeIn(delay: 300.ms, duration: 400.ms),
                  const SizedBox(height: 6),
                  Text(
                    lang == 'en' ? 'Tap to learn about prevention and diet' : 'Klikni za prevenciju i dijetu',
                    style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted),
                  ),
                  const SizedBox(height: 12),

                  ...relevantConditions.asMap().entries.map((entry) {
                    final condition = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ConditionScreen(condition: condition))),
                        child: GlassCard(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          child: Row(children: [
                            Text(condition.icon, style: const TextStyle(fontSize: 22)),
                            const SizedBox(width: 12),
                            Expanded(child: Text(
                              localizedName(condition, lang),
                              style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
                            )),
                            const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.textMuted, size: 14),
                          ]),
                        ),
                      ),
                    ).animate().fadeIn(delay: Duration(milliseconds: 350 + entry.key * 60), duration: 350.ms);
                  }),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 14, color: AppColors.primary),
        const SizedBox(width: 4),
        Text(label, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.primary)),
      ]),
    );
  }
}

class _Recommendation {
  final String icon;
  final String title;
  final String description;
  const _Recommendation({required this.icon, required this.title, required this.description});
}

// ==================== EDIT PET SHEET ====================

class _EditPetSheet extends StatefulWidget {
  final PetProfile pet;
  final void Function(PetProfile) onSaved;
  const _EditPetSheet({required this.pet, required this.onSaved});
  @override
  State<_EditPetSheet> createState() => _EditPetSheetState();
}

class _EditPetSheetState extends State<_EditPetSheet> {
  late final TextEditingController _nameController;
  late final TextEditingController _ageController;
  late final TextEditingController _weightController;
  final _conditionSearchController = TextEditingController();
  late PetType _selectedType;
  final Set<String> _selectedConditions = {};
  String _conditionSearch = '';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.pet.name);
    _ageController = TextEditingController(text: widget.pet.ageMonths?.toString() ?? '');
    _weightController = TextEditingController(text: widget.pet.weightKg?.toString() ?? '');
    _selectedType = widget.pet.type;
    _selectedConditions.addAll(widget.pet.conditions);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _conditionSearchController.dispose();
    super.dispose();
  }

  List<PetCondition> get _availableConditions {
    final conditions = allConditions
        .where((c) => c.affectedSpecies.contains(_selectedType))
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name));
    if (_conditionSearch.isEmpty) return conditions;
    return conditions.where((c) =>
        c.name.toLowerCase().contains(_conditionSearch.toLowerCase())).toList();
  }

  Future<void> _save() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    final profile = PetProfile(
      id: widget.pet.id,
      name: name,
      type: _selectedType,
      ageMonths: int.tryParse(_ageController.text),
      weightKg: double.tryParse(_weightController.text),
      conditions: _selectedConditions.toList(),
      createdAt: widget.pet.createdAt,
    );

    await PetProfileService.saveProfile(profile);
    widget.onSaved(profile);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final lang = localeProvider.locale.languageCode;
    return Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.85),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Center(
            child: Container(width: 40, height: 4,
              decoration: BoxDecoration(color: AppColors.textMuted.withOpacity(0.3), borderRadius: BorderRadius.circular(2))),
          ),
        ),
        Flexible(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                lang == 'en' ? 'Edit Pet' : 'Izmeni ljubimca',
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
              const SizedBox(height: 20),

              // Conditions section
              Text(
                lang == 'en' ? 'Health conditions (current or past)' : 'Zdravstvena stanja (sadasnja ili prosla)',
                style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 4),
              Text(
                lang == 'en' ? 'Select conditions your pet has or had' : 'Izaberite bolesti koje vas ljubimac ima ili je imao',
                style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted),
              ),
              const SizedBox(height: 10),

              // Selected conditions chips
              if (_selectedConditions.isNotEmpty) ...[
                Wrap(spacing: 6, runSpacing: 6,
                  children: _selectedConditions.map((cId) {
                    final condition = allConditions.where((c) => c.id == cId).firstOrNull;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedConditions.remove(cId)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.accent.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.accent.withOpacity(0.3)),
                        ),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          Text(condition?.icon ?? '🩺', style: const TextStyle(fontSize: 12)),
                          const SizedBox(width: 4),
                          Text(condition?.name ?? cId, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.accent)),
                          const SizedBox(width: 4),
                          Icon(Icons.close_rounded, size: 14, color: AppColors.accent.withOpacity(0.7)),
                        ]),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
              ],

              // Condition search
              Container(
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: TextField(
                  controller: _conditionSearchController,
                  style: GoogleFonts.inter(color: AppColors.textPrimary, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: lang == 'en' ? 'Search conditions...' : 'Pretrazi bolesti...',
                    hintStyle: GoogleFonts.inter(color: AppColors.textMuted, fontSize: 13),
                    prefixIcon: const Icon(Icons.search_rounded, color: AppColors.textMuted, size: 18),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                  onChanged: (v) => setState(() => _conditionSearch = v),
                ),
              ),
              const SizedBox(height: 8),

              // Condition list
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 180),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _availableConditions.length.clamp(0, 20),
                  itemBuilder: (context, index) {
                    final condition = _availableConditions[index];
                    final isSelected = _selectedConditions.contains(condition.id);
                    return GestureDetector(
                      onTap: () => setState(() {
                        if (isSelected) {
                          _selectedConditions.remove(condition.id);
                        } else {
                          _selectedConditions.add(condition.id);
                        }
                      }),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        margin: const EdgeInsets.only(bottom: 4),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primary.withOpacity(0.08) : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(children: [
                          Text(condition.icon, style: const TextStyle(fontSize: 16)),
                          const SizedBox(width: 10),
                          Expanded(child: Text(condition.name, style: GoogleFonts.inter(fontSize: 13,
                            color: isSelected ? AppColors.primary : AppColors.textSecondary,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400))),
                          if (isSelected)
                            const Icon(Icons.check_circle_rounded, color: AppColors.primary, size: 18),
                        ]),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

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
        ),
      ]),
    );
  }
}
