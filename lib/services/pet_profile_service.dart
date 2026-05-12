import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/conditions_database.dart';

/// Model profila kucnog ljubimca
class PetProfile {
  final String id;
  final String name;
  final PetType type;
  final String? breed;
  final int? ageMonths;
  final double? weightKg;
  final List<String> conditions; // IDs bolesti
  final DateTime createdAt;

  PetProfile({
    required this.id,
    required this.name,
    required this.type,
    this.breed,
    this.ageMonths,
    this.weightKg,
    this.conditions = const [],
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  String get ageDisplay {
    if (ageMonths == null) return '';
    if (ageMonths! < 12) return '$ageMonths mes.';
    final years = ageMonths! ~/ 12;
    final months = ageMonths! % 12;
    if (months == 0) return '$years god.';
    return '$years god. $months mes.';
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'type': type.index,
    'breed': breed,
    'ageMonths': ageMonths,
    'weightKg': weightKg,
    'conditions': conditions,
    'createdAt': createdAt.toIso8601String(),
  };

  factory PetProfile.fromJson(Map<String, dynamic> json) => PetProfile(
    id: json['id'] as String,
    name: json['name'] as String,
    type: PetType.values[json['type'] as int],
    breed: json['breed'] as String?,
    ageMonths: json['ageMonths'] as int?,
    weightKg: (json['weightKg'] as num?)?.toDouble(),
    conditions: List<String>.from(json['conditions'] ?? []),
    createdAt: DateTime.parse(json['createdAt'] as String),
  );
}

/// Servis za upravljanje profilima ljubimaca i favoritima
class PetProfileService {
  static const _profilesKey = 'pet_profiles';
  static const _favoritesKey = 'favorite_conditions';

  static Future<List<PetProfile>> getProfiles() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(_profilesKey) ?? [];
    return data.map((s) => PetProfile.fromJson(jsonDecode(s) as Map<String, dynamic>)).toList();
  }

  static Future<void> saveProfile(PetProfile profile) async {
    final prefs = await SharedPreferences.getInstance();
    final profiles = await getProfiles();
    final index = profiles.indexWhere((p) => p.id == profile.id);
    if (index >= 0) {
      profiles[index] = profile;
    } else {
      profiles.add(profile);
    }
    await prefs.setStringList(
      _profilesKey,
      profiles.map((p) => jsonEncode(p.toJson())).toList(),
    );
  }

  static Future<void> deleteProfile(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final profiles = await getProfiles();
    profiles.removeWhere((p) => p.id == id);
    await prefs.setStringList(
      _profilesKey,
      profiles.map((p) => jsonEncode(p.toJson())).toList(),
    );
  }

  // ==================== FAVORITI ====================

  static Future<Set<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getStringList(_favoritesKey) ?? []).toSet();
  }

  static Future<void> toggleFavorite(String conditionId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = (prefs.getStringList(_favoritesKey) ?? []).toSet();
    if (favorites.contains(conditionId)) {
      favorites.remove(conditionId);
    } else {
      favorites.add(conditionId);
    }
    await prefs.setStringList(_favoritesKey, favorites.toList());
  }

  static Future<bool> isFavorite(String conditionId) async {
    final favorites = await getFavorites();
    return favorites.contains(conditionId);
  }
}
