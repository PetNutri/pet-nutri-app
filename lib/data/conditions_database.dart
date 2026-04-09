/// Veterinary dietary guidelines for common pet conditions.
/// Sources: veterinary nutrition textbooks & clinical practice guidelines.

enum PetType { dog, cat }

class DietaryGuideline {
  final String nutrient;
  final String recommendation; // "low", "moderate", "high", "avoid"
  final String reason;

  const DietaryGuideline({
    required this.nutrient,
    required this.recommendation,
    required this.reason,
  });
}

class PetCondition {
  final String id;
  final String name;
  final String description;
  final List<PetType> affectedSpecies;
  final String icon;
  final List<DietaryGuideline> guidelines;
  final List<String> goodIngredients;
  final List<String> badIngredients;

  const PetCondition({
    required this.id,
    required this.name,
    required this.description,
    required this.affectedSpecies,
    required this.icon,
    required this.guidelines,
    required this.goodIngredients,
    required this.badIngredients,
  });
}

const List<PetCondition> conditionsDatabase = [
  PetCondition(
    id: 'hepatitis',
    name: 'Hepatitis',
    description: 'Upala jetre — potrebna dijeta sa smanjenim opterećenjem za jetru.',
    affectedSpecies: [PetType.dog, PetType.cat],
    icon: '🫁',
    guidelines: [
      DietaryGuideline(
        nutrient: 'Proteini',
        recommendation: 'moderate',
        reason: 'Visokokvalitetni, lako svarljivi proteini u umerenoj količini.',
      ),
      DietaryGuideline(
        nutrient: 'Masti',
        recommendation: 'low',
        reason: 'Smanjene masti rasterećuju jetru.',
      ),
      DietaryGuideline(
        nutrient: 'Bakar',
        recommendation: 'avoid',
        reason: 'Bakar se akumulira u oštećenoj jetri.',
      ),
      DietaryGuideline(
        nutrient: 'Vlakna',
        recommendation: 'moderate',
        reason: 'Pomaže u vezivanju toksina u crevima.',
      ),
      DietaryGuideline(
        nutrient: 'Antioksidansi',
        recommendation: 'high',
        reason: 'Vitamin E i C štite ćelije jetre.',
      ),
    ],
    goodIngredients: [
      'piletina', 'chicken', 'ćuretina', 'turkey',
      'beli rice', 'rice', 'pirinač',
      'jaja', 'egg', 'cottage cheese',
      'vitamin e', 'vitamin c', 'omega 3',
    ],
    badIngredients: [
      'copper', 'bakar', 'cu ',
      'liver', 'jetra', 'džigerica',
      'by-product', 'nusproizvod',
      'corn', 'kukuruz', 'wheat', 'pšenica',
    ],
  ),
  PetCondition(
    id: 'kidney_disease',
    name: 'Bubrežna bolest',
    description: 'Hronična bubrežna insuficijencija — smanjen unos fosfora i proteina.',
    affectedSpecies: [PetType.dog, PetType.cat],
    icon: '🫘',
    guidelines: [
      DietaryGuideline(
        nutrient: 'Proteini',
        recommendation: 'low',
        reason: 'Smanjeni proteini da se ne opterete bubrezi.',
      ),
      DietaryGuideline(
        nutrient: 'Fosfor',
        recommendation: 'avoid',
        reason: 'Fosfor pogoršava bubrežnu funkciju.',
      ),
      DietaryGuideline(
        nutrient: 'Natrijum',
        recommendation: 'low',
        reason: 'Nizak natrijum pomaže kontrolu krvnog pritiska.',
      ),
      DietaryGuideline(
        nutrient: 'Omega-3',
        recommendation: 'high',
        reason: 'Smanjuje upalu u bubrezima.',
      ),
    ],
    goodIngredients: [
      'egg', 'jaja', 'omega 3', 'fish oil', 'riblje ulje',
      'rice', 'pirinač', 'sweet potato', 'batat',
    ],
    badIngredients: [
      'phosphorus', 'fosfor', 'bone meal', 'koštano brašno',
      'salt', 'so', 'sodium', 'natrijum',
      'by-product', 'nusproizvod',
    ],
  ),
  PetCondition(
    id: 'diabetes',
    name: 'Dijabetes',
    description: 'Šećerna bolest — potrebna hrana sa niskim glikemijskim indeksom.',
    affectedSpecies: [PetType.dog, PetType.cat],
    icon: '💉',
    guidelines: [
      DietaryGuideline(
        nutrient: 'Ugljeni hidrati',
        recommendation: 'low',
        reason: 'Nizak GI sprečava skokove šećera u krvi.',
      ),
      DietaryGuideline(
        nutrient: 'Proteini',
        recommendation: 'high',
        reason: 'Visok protein pomaže stabilizaciju glukoze.',
      ),
      DietaryGuideline(
        nutrient: 'Vlakna',
        recommendation: 'high',
        reason: 'Vlakna usporavaju apsorpciju šećera.',
      ),
    ],
    goodIngredients: [
      'chicken', 'piletina', 'turkey', 'ćuretina',
      'fish', 'riba', 'fiber', 'vlakna',
      'pumpkin', 'bundeva', 'green beans', 'boranija',
    ],
    badIngredients: [
      'sugar', 'šećer', 'corn syrup', 'kukuruzni sirup',
      'wheat', 'pšenica', 'corn', 'kukuruz',
      'white rice', 'beli pirinač',
    ],
  ),
  PetCondition(
    id: 'pancreatitis',
    name: 'Pankreatitis',
    description: 'Upala pankreasa — strogo nisko masna dijeta.',
    affectedSpecies: [PetType.dog, PetType.cat],
    icon: '🔥',
    guidelines: [
      DietaryGuideline(
        nutrient: 'Masti',
        recommendation: 'avoid',
        reason: 'Masti su glavni okidač pankreatitisa.',
      ),
      DietaryGuideline(
        nutrient: 'Proteini',
        recommendation: 'moderate',
        reason: 'Lako svarljivi proteini u umerenoj količini.',
      ),
      DietaryGuideline(
        nutrient: 'Vlakna',
        recommendation: 'moderate',
        reason: 'Pomaže probavi bez opterećenja pankreasa.',
      ),
    ],
    goodIngredients: [
      'chicken breast', 'pileća prsa', 'turkey', 'ćuretina',
      'rice', 'pirinač', 'pumpkin', 'bundeva',
      'sweet potato', 'batat',
    ],
    badIngredients: [
      'fat', 'mast', 'oil', 'ulje', 'butter', 'puter',
      'lard', 'mast', 'tallow', 'loj',
      'bacon', 'slanina',
    ],
  ),
  PetCondition(
    id: 'allergies',
    name: 'Alergije na hranu',
    description: 'Preosetljivost na određene sastojke — eliminaciona dijeta.',
    affectedSpecies: [PetType.dog, PetType.cat],
    icon: '🤧',
    guidelines: [
      DietaryGuideline(
        nutrient: 'Proteini',
        recommendation: 'moderate',
        reason: 'Koristiti novel proteine (jagnjetina, divljač, riba).',
      ),
      DietaryGuideline(
        nutrient: 'Žitarice',
        recommendation: 'avoid',
        reason: 'Česti alergeni — izbegavati pšenicu, kukuruz, soju.',
      ),
    ],
    goodIngredients: [
      'lamb', 'jagnjetina', 'venison', 'divljač',
      'salmon', 'losos', 'duck', 'pačetina',
      'sweet potato', 'batat', 'pea', 'grašak',
    ],
    badIngredients: [
      'wheat', 'pšenica', 'corn', 'kukuruz',
      'soy', 'soja', 'beef', 'govedina',
      'dairy', 'mlečni', 'artificial', 'veštački',
    ],
  ),
  PetCondition(
    id: 'obesity',
    name: 'Gojaznost',
    description: 'Prekomerna težina — niskokalorična dijeta bogata vlaknima.',
    affectedSpecies: [PetType.dog, PetType.cat],
    icon: '⚖️',
    guidelines: [
      DietaryGuideline(
        nutrient: 'Kalorije',
        recommendation: 'low',
        reason: 'Smanjen kalorijski unos za gubitak težine.',
      ),
      DietaryGuideline(
        nutrient: 'Vlakna',
        recommendation: 'high',
        reason: 'Vlakna daju osećaj sitosti.',
      ),
      DietaryGuideline(
        nutrient: 'Proteini',
        recommendation: 'high',
        reason: 'Visok protein čuva mišićnu masu tokom mršavljenja.',
      ),
    ],
    goodIngredients: [
      'chicken', 'piletina', 'turkey', 'ćuretina',
      'fiber', 'vlakna', 'green beans', 'boranija',
      'pumpkin', 'bundeva', 'carrot', 'šargarepa',
    ],
    badIngredients: [
      'fat', 'mast', 'sugar', 'šećer',
      'corn syrup', 'kukuruzni sirup',
      'by-product', 'nusproizvod',
    ],
  ),
  PetCondition(
    id: 'urinary',
    name: 'Urinarni problemi',
    description: 'Kristali/kamenci u mokraćnim putevima — kontrola pH i minerala.',
    affectedSpecies: [PetType.dog, PetType.cat],
    icon: '💧',
    guidelines: [
      DietaryGuideline(
        nutrient: 'Magnezijum',
        recommendation: 'low',
        reason: 'Višak magnezijuma doprinosi formiranju kristala.',
      ),
      DietaryGuideline(
        nutrient: 'Fosfor',
        recommendation: 'low',
        reason: 'Kontrola fosfora smanjuje rizik od kamenaca.',
      ),
      DietaryGuideline(
        nutrient: 'Vlaga',
        recommendation: 'high',
        reason: 'Mokra hrana pomaže razblaženju urina.',
      ),
    ],
    goodIngredients: [
      'chicken', 'piletina', 'fish', 'riba',
      'wet food', 'vlažna hrana', 'cranberry', 'brusnica',
    ],
    badIngredients: [
      'magnesium', 'magnezijum', 'ash', 'pepeo',
      'phosphorus', 'fosfor', 'salt', 'so',
    ],
  ),
];
