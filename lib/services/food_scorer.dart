import '../data/conditions_database.dart';
import 'pet_food_api.dart';

class FoodScore {
  final PetFoodProduct product;
  final int score; // 0-100
  final List<String> pros;
  final List<String> cons;
  final String rating; // "Odlično", "Dobro", "Prosečno", "Loše"

  FoodScore({
    required this.product,
    required this.score,
    required this.pros,
    required this.cons,
    required this.rating,
  });
}

class FoodScorer {
  static FoodScore evaluate(PetFoodProduct product, PetCondition condition) {
    int score = 50;
    final pros = <String>[];
    final cons = <String>[];

    final ingredientsLower = (product.ingredients ?? '').toLowerCase();

    // Check good ingredients
    for (final good in condition.goodIngredients) {
      if (ingredientsLower.contains(good.toLowerCase())) {
        score += 8;
        pros.add('Sadrži: $good');
      }
    }

    // Check bad ingredients
    for (final bad in condition.badIngredients) {
      if (ingredientsLower.contains(bad.toLowerCase())) {
        score -= 12;
        cons.add('Sadrži: $bad');
      }
    }

    // Check nutrient guidelines
    for (final g in condition.guidelines) {
      _evaluateNutrient(g, product, score, pros, cons).then((result) {
        score = result.$1;
      });
    }

    // Evaluate based on nutriments directly
    score += _evaluateNutriments(product, condition, pros, cons);

    score = score.clamp(0, 100);

    final rating = switch (score) {
      >= 75 => 'Odlično',
      >= 55 => 'Dobro',
      >= 35 => 'Prosečno',
      _ => 'Loše',
    };

    return FoodScore(
      product: product,
      score: score,
      pros: pros.toSet().toList(),
      cons: cons.toSet().toList(),
      rating: rating,
    );
  }

  static Future<(int,)> _evaluateNutrient(
    DietaryGuideline g,
    PetFoodProduct product,
    int score,
    List<String> pros,
    List<String> cons,
  ) async {
    return (score,);
  }

  static int _evaluateNutriments(
    PetFoodProduct product,
    PetCondition condition,
    List<String> pros,
    List<String> cons,
  ) {
    int bonus = 0;

    for (final g in condition.guidelines) {
      final nutrient = g.nutrient.toLowerCase();
      final rec = g.recommendation;

      if (nutrient.contains('mast') || nutrient.contains('fat')) {
        final fat = product.fatPer100g;
        if (fat != null) {
          if (rec == 'low' || rec == 'avoid') {
            if (fat < 8) {
              bonus += 10;
              pros.add('Nisko masnoće (${fat.toStringAsFixed(1)}g/100g)');
            } else if (fat > 15) {
              bonus -= 10;
              cons.add('Visoko masnoće (${fat.toStringAsFixed(1)}g/100g)');
            }
          }
        }
      }

      if (nutrient.contains('protein')) {
        final protein = product.proteinPer100g;
        if (protein != null) {
          if (rec == 'high') {
            if (protein > 25) {
              bonus += 8;
              pros.add('Visok protein (${protein.toStringAsFixed(1)}g/100g)');
            }
          } else if (rec == 'low') {
            if (protein < 20) {
              bonus += 8;
              pros.add('Umeren protein (${protein.toStringAsFixed(1)}g/100g)');
            } else if (protein > 30) {
              bonus -= 8;
              cons.add('Previše proteina (${protein.toStringAsFixed(1)}g/100g)');
            }
          }
        }
      }

      if (nutrient.contains('vlakna') || nutrient.contains('fiber')) {
        final fiber = product.fiberPer100g;
        if (fiber != null && rec == 'high') {
          if (fiber > 3) {
            bonus += 6;
            pros.add('Dobra vlakna (${fiber.toStringAsFixed(1)}g/100g)');
          }
        }
      }

      if (nutrient.contains('natrijum') || nutrient.contains('sodium') || nutrient.contains('so')) {
        final salt = product.saltPer100g;
        if (salt != null && (rec == 'low' || rec == 'avoid')) {
          if (salt < 0.5) {
            bonus += 6;
            pros.add('Nisko soli (${salt.toStringAsFixed(2)}g/100g)');
          } else if (salt > 1.5) {
            bonus -= 8;
            cons.add('Previše soli (${salt.toStringAsFixed(2)}g/100g)');
          }
        }
      }
    }

    return bonus;
  }
}
