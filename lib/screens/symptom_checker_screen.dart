import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/conditions_database.dart';
import '../data/symptom_groups.dart';
import '../data/symptom_urgency.dart';
import '../l10n/app_localizations.dart';
import '../l10n/localized_condition.dart';
import '../main.dart';
import '../theme/app_theme.dart';
import '../utils/text_utils.dart';
import 'condition_screen.dart';

class SymptomCheckerScreen extends StatefulWidget {
  const SymptomCheckerScreen({super.key});
  @override
  State<SymptomCheckerScreen> createState() => _SymptomCheckerScreenState();
}

class _SymptomCheckerScreenState extends State<SymptomCheckerScreen> {
  PetType _selectedPet = PetType.dog;
  final Set<String> _selectedSymptoms = {};
  List<PetCondition> _results = [];
  String _searchQuery = '';
  final _symptomSearchController = TextEditingController();
  String? _expandedGroupId;
  bool _showAllGroups = false;

  List<String> get _allSymptoms {
    final lang = localeProvider.locale.languageCode;
    final symptoms = <String>{};
    for (final condition in allConditions) {
      if (condition.affectedSpecies.contains(_selectedPet)) {
        symptoms.addAll(localizedSymptoms(condition, lang));
      }
    }
    final list = symptoms.toList()..sort();
    return list;
  }

  List<String> get _filteredSymptoms {
    if (_searchQuery.isEmpty) return _allSymptoms;
    return _allSymptoms.where((s) => containsNormalized(s, _searchQuery)).toList();
  }

  Map<String, List<String>> get _groupedSymptoms {
    final lang = localeProvider.locale.languageCode;
    return groupSymptoms(_filteredSymptoms, lang);
  }

  void _updateResults() {
    final lang = localeProvider.locale.languageCode;
    setState(() {
      if (_selectedSymptoms.isEmpty) { _results = []; return; }
      final matches = <MapEntry<PetCondition, int>>[];
      for (final condition in allConditions) {
        if (!condition.affectedSpecies.contains(_selectedPet)) continue;
        final syms = localizedSymptoms(condition, lang);
        int matchCount = 0;
        for (final symptom in syms) {
          if (_selectedSymptoms.contains(symptom)) matchCount++;
        }
        if (matchCount > 0) matches.add(MapEntry(condition, matchCount));
      }
      matches.sort((a, b) => b.value.compareTo(a.value));
      _results = matches.map((m) => m.key).toList();
    });
  }

  void _toggleSymptom(String symptom) {
    setState(() {
      if (_selectedSymptoms.contains(symptom)) {
        _selectedSymptoms.remove(symptom);
      } else {
        _selectedSymptoms.add(symptom);
      }
    });
    _updateResults();
  }

  void _changePetType(PetType type) {
    setState(() {
      _selectedPet = type;
      _selectedSymptoms.clear();
      _results = [];
      _expandedGroupId = null;
    });
  }

  void _clearAll() {
    setState(() {
      _selectedSymptoms.clear();
      _results = [];
    });
  }

  String _localizedPetType(PetType type, AppLocalizations l) {
    switch (type) {
      case PetType.dog: return l.dogs;
      case PetType.cat: return l.cats;
      case PetType.rabbit: return l.rabbits;
      case PetType.rodent: return l.rodents;
      case PetType.bird: return l.birds;
      case PetType.terrarium: return l.terrarium;
      case PetType.aquarium: return l.aquarium;
    }
  }

  @override
  void dispose() {
    _symptomSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final lang = l.lang;
    final isSearching = _searchQuery.isNotEmpty;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: -40, right: -40,
            child: Container(width: 200, height: 200,
              decoration: BoxDecoration(shape: BoxShape.circle,
                gradient: RadialGradient(colors: [AppColors.accent.withOpacity(0.15), Colors.transparent])))),
          SafeArea(
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
                          Text(l.appTitle, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
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
                      Expanded(
                        child: Text(l.symptomChecker, style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                      ),
                      if (_selectedSymptoms.isNotEmpty)
                        GestureDetector(
                          onTap: _clearAll,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: AppColors.danger.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              lang == 'en' ? 'Clear all' : 'Obriši sve',
                              style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.danger),
                            ),
                          ),
                        ),
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
                      Text(l.markSymptoms, style: GoogleFonts.inter(fontSize: 14, color: AppColors.textSecondary, height: 1.5))
                          .animate().fadeIn(duration: 400.ms),
                      const SizedBox(height: 16),

                      // Pet type selector
                      Wrap(spacing: 10, runSpacing: 10,
                        children: PetType.values.map((type) => _PetChip(
                          label: _localizedPetType(type, l),
                          isSelected: _selectedPet == type,
                          onTap: () => _changePetType(type),
                        )).toList(),
                      ).animate().fadeIn(delay: 100.ms, duration: 400.ms),
                      const SizedBox(height: 20),

                      // Search field
                      Container(
                        decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.glassBorder)),
                        child: TextField(
                          controller: _symptomSearchController,
                          style: GoogleFonts.inter(color: AppColors.textPrimary, fontSize: 15),
                          decoration: InputDecoration(
                            hintText: l.searchSymptoms,
                            hintStyle: GoogleFonts.inter(color: AppColors.textMuted),
                            prefixIcon: const Icon(Icons.search_rounded, color: AppColors.textMuted),
                            suffixIcon: _searchQuery.isNotEmpty
                                ? IconButton(icon: const Icon(Icons.close_rounded, color: AppColors.textMuted, size: 18),
                                    onPressed: () { _symptomSearchController.clear(); setState(() => _searchQuery = ''); })
                                : null,
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14)),
                          onChanged: (v) => setState(() => _searchQuery = v)),
                      ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
                      const SizedBox(height: 16),

                      // Selected symptoms chips
                      if (_selectedSymptoms.isNotEmpty) ...[
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '${_selectedSymptoms.length}',
                                style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.primary),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              lang == 'en' ? 'Selected symptoms' : 'Izabrani simptomi',
                              style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Wrap(spacing: 8, runSpacing: 8,
                          children: _selectedSymptoms.map((s) => GestureDetector(
                            onTap: () => _toggleSymptom(s),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                              ),
                              child: Row(mainAxisSize: MainAxisSize.min, children: [
                                Flexible(
                                  child: Text(s, style: GoogleFonts.inter(fontSize: 13, color: AppColors.primary, fontWeight: FontWeight.w500)),
                                ),
                                const SizedBox(width: 4),
                                Icon(Icons.close_rounded, size: 16, color: AppColors.primary.withOpacity(0.7)),
                              ])),
                          )).toList()),
                        const SizedBox(height: 20),
                      ],

                      // Results section
                      if (_results.isNotEmpty) ...[
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [AppColors.primary.withOpacity(0.1), AppColors.accent.withOpacity(0.1)]),
                            borderRadius: BorderRadius.circular(16)),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Row(children: [
                              const Text('💡', style: TextStyle(fontSize: 18)),
                              const SizedBox(width: 8),
                              Text(
                                lang == 'en' ? 'Possible conditions' : 'Moguća stanja',
                                style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '${_results.length}',
                                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.primary),
                                ),
                              ),
                            ]),
                            const SizedBox(height: 4),
                            Text(l.basedOnSymptoms, style: GoogleFonts.inter(fontSize: 12, color: AppColors.textMuted)),
                          ]),
                        ),
                        const SizedBox(height: 12),
                        ..._results.asMap().entries.map((entry) {
                          final condition = entry.value;
                          final syms = localizedSymptoms(condition, lang);
                          final matchCount = syms.where((s) => _selectedSymptoms.contains(s)).length;
                          final matchPercent = (matchCount / syms.length * 100).round();
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: GestureDetector(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ConditionScreen(condition: condition))),
                              child: GlassCard(
                                padding: const EdgeInsets.all(16),
                                child: Row(children: [
                                  Container(width: 50, height: 50,
                                    decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.12), borderRadius: BorderRadius.circular(14)),
                                    child: Center(child: Text(condition.icon, style: const TextStyle(fontSize: 26)))),
                                  const SizedBox(width: 14),
                                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    Text(localizedName(condition, lang), style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                                    const SizedBox(height: 6),
                                    Row(children: [
                                      // Match bar
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(4),
                                          child: LinearProgressIndicator(
                                            value: matchCount / syms.length,
                                            backgroundColor: AppColors.primary.withOpacity(0.1),
                                            valueColor: AlwaysStoppedAnimation<Color>(
                                              matchPercent >= 60 ? AppColors.success : AppColors.accent,
                                            ),
                                            minHeight: 6,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '$matchCount/${syms.length}',
                                        style: GoogleFonts.inter(fontSize: 12, color: AppColors.accent, fontWeight: FontWeight.w600),
                                      ),
                                    ]),
                                  ])),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.textMuted, size: 16),
                                ]),
                              ),
                            ),
                          ).animate().fadeIn(delay: Duration(milliseconds: entry.key * 80), duration: 350.ms).slideY(begin: 0.08, end: 0);
                        }),
                        const SizedBox(height: 20),
                      ],

                      // Symptom groups section
                      Row(
                        children: [
                          Text(
                            lang == 'en' ? 'Symptoms by category' : 'Simptomi po kategoriji',
                            style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                          ),
                          const Spacer(),
                          if (!isSearching)
                            GestureDetector(
                              onTap: () => setState(() => _showAllGroups = !_showAllGroups),
                              child: Text(
                                _showAllGroups
                                    ? (lang == 'en' ? 'Collapse' : 'Skupi')
                                    : (lang == 'en' ? 'Expand all' : 'Proširi sve'),
                                style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.primary),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Grouped symptoms or flat list when searching
                      if (isSearching)
                        ..._filteredSymptoms.map((symptom) => _buildSymptomTile(symptom))
                      else
                        ..._buildGroupedSymptomList(lang),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildGroupedSymptomList(String lang) {
    final grouped = _groupedSymptoms;
    final widgets = <Widget>[];

    // Sortiraj grupe po redosledu iz symptomGroups liste
    final orderedGroupIds = symptomGroups.map((g) => g.id).toList();
    final sortedKeys = grouped.keys.toList()
      ..sort((a, b) {
        final indexA = orderedGroupIds.indexOf(a);
        final indexB = orderedGroupIds.indexOf(b);
        final ia = indexA == -1 ? 999 : indexA;
        final ib = indexB == -1 ? 999 : indexB;
        return ia.compareTo(ib);
      });

    for (final groupId in sortedKeys) {
      final symptoms = grouped[groupId]!;
      final group = getGroupById(groupId);
      final groupName = group?.name(lang) ?? otherGroupName(lang);
      final groupIcon = group?.icon ?? otherGroupIcon;
      final isExpanded = _showAllGroups || _expandedGroupId == groupId;
      final selectedInGroup = symptoms.where((s) => _selectedSymptoms.contains(s)).length;

      widgets.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (_expandedGroupId == groupId) {
                  _expandedGroupId = null;
                } else {
                  _expandedGroupId = groupId;
                }
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: isExpanded ? AppColors.primary.withOpacity(0.08) : AppColors.card,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isExpanded ? AppColors.primary.withOpacity(0.3) : AppColors.glassBorder,
                ),
              ),
              child: Row(children: [
                Text(groupIcon, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(groupName, style: GoogleFonts.inter(
                        fontSize: 14, fontWeight: FontWeight.w600,
                        color: isExpanded ? AppColors.primary : AppColors.textPrimary,
                      )),
                      Text(
                        '${symptoms.length} ${lang == 'en' ? 'symptoms' : 'simptoma'}',
                        style: GoogleFonts.inter(fontSize: 11, color: AppColors.textMuted),
                      ),
                    ],
                  ),
                ),
                if (selectedInGroup > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$selectedInGroup',
                      style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.primary),
                    ),
                  ),
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(Icons.keyboard_arrow_down_rounded,
                    color: isExpanded ? AppColors.primary : AppColors.textMuted, size: 22),
                ),
              ]),
            ),
          ),
        ),
      );

      // Expanded symptoms
      if (isExpanded) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 12),
            child: Column(
              children: symptoms.map((symptom) => _buildSymptomTile(symptom)).toList(),
            ),
          ),
        );
      }
    }

    return widgets;
  }

  Widget _buildSymptomTile(String symptom) {
    final isSelected = _selectedSymptoms.contains(symptom);
    final urgency = getSymptomUrgency(symptom);
    final isUrgent = urgency == SymptomUrgency.urgent;
    final isSerious = urgency == SymptomUrgency.serious;

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        onTap: () => _toggleSymptom(symptom),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withOpacity(0.08)
                : isUrgent
                    ? AppColors.danger.withOpacity(0.04)
                    : AppColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? AppColors.primary.withOpacity(0.4)
                  : isUrgent
                      ? AppColors.danger.withOpacity(0.3)
                      : AppColors.glassBorder,
            ),
          ),
          child: Row(children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 22, height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.primary : Colors.transparent,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.textMuted.withOpacity(0.5),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check_rounded, color: Colors.white, size: 14)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(symptom, style: GoogleFonts.inter(fontSize: 14,
              color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400))),
            if (isUrgent)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.danger.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text('🚨 HITNO', style: GoogleFonts.inter(fontSize: 9, fontWeight: FontWeight.w700, color: AppColors.danger)),
              )
            else if (isSerious)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.warning.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text('⚠️', style: GoogleFonts.inter(fontSize: 10)),
              ),
          ]),
        ),
      ),
    );
  }
}

class _PetChip extends StatefulWidget {
  final String label; final bool isSelected; final VoidCallback onTap;
  const _PetChip({required this.label, required this.isSelected, required this.onTap});
  @override
  State<_PetChip> createState() => _PetChipState();
}

class _PetChipState extends State<_PetChip> {
  bool _hovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(onTap: widget.onTap,
        child: AnimatedContainer(duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          transform: _hovering && !widget.isSelected ? (Matrix4.identity()..scale(1.05)) : Matrix4.identity(),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
            color: widget.isSelected ? AppColors.accent : _hovering ? AppColors.card.withOpacity(0.8) : AppColors.card,
            boxShadow: widget.isSelected
                ? [BoxShadow(color: AppColors.accent.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 4))]
                : _hovering ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 2))] : null,
            border: _hovering && !widget.isSelected ? Border.all(color: AppColors.primary.withOpacity(0.3)) : null),
          child: Text(widget.label, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600,
            color: widget.isSelected ? Colors.white : _hovering ? AppColors.textPrimary : AppColors.textSecondary)))));
  }
}
