import '../data/conditions_database.dart';
import '../l10n/locale_provider.dart';
import '../main.dart';
import 'pet_food_api.dart';

class FoodScore {
  final PetFoodProduct product;
  final int score;
  final List<String> pros;
  final List<String> cons;
  final String rating;

  FoodScore({
    required this.product,
    required this.score,
    required this.pros,
    required this.cons,
    required this.rating,
  });
}

String _t(String sr, String en) => localeProvider.locale.languageCode == 'en' ? en : sr;

class FoodScorer {
  static FoodScore evaluate(PetFoodProduct product, PetCondition condition) {
    int score = 50;
    final pros = <String>[];
    final cons = <String>[];

    final ingredientsLower = (product.ingredients ?? '').toLowerCase();
    final nameLower = product.name.toLowerCase();
    final brandLower = product.brand.toLowerCase();
    final combined = '$ingredientsLower $nameLower $brandLower';

    int goodFound = 0;
    for (final good in condition.goodIngredients) {
      if (combined.contains(good.toLowerCase())) {
        goodFound++;
        if (goodFound <= 4) pros.add(_t('Sadrzi: $good', 'Contains: $good'));
      }
    }
    score += (goodFound * 8).clamp(0, 40);

    int badFound = 0;
    for (final bad in condition.badIngredients) {
      if (combined.contains(bad.toLowerCase())) {
        badFound++;
        if (badFound <= 3) cons.add(_t('Sadrzi: $bad', 'Contains: $bad'));
      }
    }
    score -= (badFound * 10).clamp(0, 40);

    score += _evaluateNutriments(product, condition, pros, cons);

    if (ingredientsLower.isEmpty && product.nutriments == null) {
      if (pros.isEmpty && cons.isEmpty) {
        pros.add(_t('Nedovoljno podataka za detaljnu ocenu', 'Insufficient data for detailed evaluation'));
      }
    }

    score = score.clamp(0, 100);

    final rating = switch (score) {
      >= 75 => _t('Preporuceno', 'Recommended'),
      >= 55 => _t('Dobro', 'Good'),
      >= 35 => _t('Prosecno', 'Average'),
      _ => _t('Ne preporucuje se', 'Not recommended'),
    };

    return FoodScore(product: product, score: score, pros: pros.toSet().toList(), cons: cons.toSet().toList(), rating: rating);
  }

  static int _evaluateNutriments(PetFoodProduct product, PetCondition condition, List<String> pros, List<String> cons) {
    int bonus = 0;
    for (final g in condition.guidelines) {
      final nutrient = g.nutrient.toLowerCase();
      final rec = g.recommendation;

      if (nutrient.contains('mast') || nutrient.contains('fat')) {
        final fat = product.fatPer100g;
        if (fat != null) {
          if (rec == 'low' || rec == 'avoid') {
            if (fat < 8) { bonus += 8; pros.add(_t('Nisko masti (${fat.toStringAsFixed(1)}g/100g)', 'Low fat (${fat.toStringAsFixed(1)}g/100g)')); }
            else if (fat > 15) { bonus -= 8; cons.add(_t('Visoko masti (${fat.toStringAsFixed(1)}g/100g)', 'High fat (${fat.toStringAsFixed(1)}g/100g)')); }
          } else if (rec == 'high') {
            if (fat > 12) { bonus += 6; pros.add(_t('Dobar sadrzaj masti (${fat.toStringAsFixed(1)}g/100g)', 'Good fat content (${fat.toStringAsFixed(1)}g/100g)')); }
          }
        }
      }

      if (nutrient.contains('protein')) {
        final protein = product.proteinPer100g;
        if (protein != null) {
          if (rec == 'high') {
            if (protein > 20) { bonus += 8; pros.add(_t('Visok protein (${protein.toStringAsFixed(1)}g/100g)', 'High protein (${protein.toStringAsFixed(1)}g/100g)')); }
          } else if (rec == 'low' || rec == 'moderate') {
            if (protein < 22) { bonus += 6; pros.add(_t('Umeren protein (${protein.toStringAsFixed(1)}g/100g)', 'Moderate protein (${protein.toStringAsFixed(1)}g/100g)')); }
            else if (protein > 35) { bonus -= 6; cons.add(_t('Previse proteina (${protein.toStringAsFixed(1)}g/100g)', 'Too much protein (${protein.toStringAsFixed(1)}g/100g)')); }
          }
        }
      }

      if (nutrient.contains('vlakna') || nutrient.contains('fiber')) {
        final fiber = product.fiberPer100g;
        if (fiber != null && rec == 'high') {
          if (fiber > 2) { bonus += 6; pros.add(_t('Dobra vlakna (${fiber.toStringAsFixed(1)}g/100g)', 'Good fiber (${fiber.toStringAsFixed(1)}g/100g)')); }
        }
      }

      if (nutrient.contains('natrijum') || nutrient.contains('sodium') || nutrient.contains('so')) {
        final salt = product.saltPer100g;
        if (salt != null && (rec == 'low' || rec == 'avoid')) {
          if (salt < 0.5) { bonus += 6; pros.add(_t('Nisko soli (${salt.toStringAsFixed(2)}g/100g)', 'Low salt (${salt.toStringAsFixed(2)}g/100g)')); }
          else if (salt > 1.5) { bonus -= 8; cons.add(_t('Previse soli (${salt.toStringAsFixed(2)}g/100g)', 'Too much salt (${salt.toStringAsFixed(2)}g/100g)')); }
        }
      }

      if (nutrient.contains('kalorij') || nutrient.contains('energy')) {
        final kcal = product.energyKcal;
        if (kcal != null && rec == 'low') {
          if (kcal < 300) { bonus += 6; pros.add(_t('Niskokaloricno (${kcal.toStringAsFixed(0)} kcal/100g)', 'Low calorie (${kcal.toStringAsFixed(0)} kcal/100g)')); }
          else if (kcal > 400) { bonus -= 6; cons.add(_t('Visokokaloricno (${kcal.toStringAsFixed(0)} kcal/100g)', 'High calorie (${kcal.toStringAsFixed(0)} kcal/100g)')); }
        }
      }
    }
    return bonus;
  }
}
