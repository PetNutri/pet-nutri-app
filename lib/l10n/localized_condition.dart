import '../data/conditions_database.dart';
import 'condition_translations.dart';

/// Returns localized name for a condition.
String localizedName(PetCondition c, String lang) {
  if (lang == 'en') {
    return conditionTranslationsEn[c.id]?.name ?? c.name;
  }
  return c.name;
}

/// Returns localized description for a condition.
String localizedDescription(PetCondition c, String lang) {
  if (lang == 'en') {
    return conditionTranslationsEn[c.id]?.description ?? c.description;
  }
  return c.description;
}

/// Returns localized treatment for a condition.
String localizedTreatment(PetCondition c, String lang) {
  if (lang == 'en') {
    return conditionTranslationsEn[c.id]?.treatment ?? c.treatment;
  }
  return c.treatment;
}

/// Returns localized symptoms for a condition.
List<String> localizedSymptoms(PetCondition c, String lang) {
  if (lang == 'en') {
    return conditionTranslationsEn[c.id]?.symptoms ?? c.symptoms;
  }
  return c.symptoms;
}

/// Returns localized guidelines for a condition.
List<DietaryGuideline> localizedGuidelines(PetCondition c, String lang) {
  if (lang == 'en') {
    final tr = conditionTranslationsEn[c.id];
    if (tr != null) {
      return tr.guidelines.map((g) => DietaryGuideline(
        nutrient: g.nutrient,
        recommendation: g.recommendation,
        reason: g.reason,
      )).toList();
    }
  }
  return c.guidelines;
}
