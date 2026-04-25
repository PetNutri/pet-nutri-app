import 'conditions_database.dart';

const List<PetCondition> extraDogCatConditions = [
  // ==================== HITNA STANJA (ZA OBE VRSTE) ====================
  
  PetCondition(
    id: 'pyometra',
    name: 'Piometra',
    description: 'Gnojna upala materice koja nastaje usled hormonalnih promena nakon teranja. Ovo je životno ugrožavajuće stanje koje može dovesti do sepse i pucanja materice.',
    affectedSpecies: [PetType.dog, PetType.cat],
    icon: '⚠️',
    symptoms: [
      'Gnojan ili krvav iscedak iz vagine (kod otvorenog tipa)',
      'Naglo povećan unos vode (polidipsija)',
      'Učestalo mokrenje',
      'Naduven stomak',
      'Povraćanje i letargija',
      'Dehidracija',
    ],
    guidelines: [
      DietaryGuideline(
        nutrient: 'Hidracija',
        recommendation: 'Intenzivna nadoknada tečnosti',
        reason: 'Bubrezi su pod velikim stresom zbog toksina iz materice.',
      ),
      DietaryGuideline(
        nutrient: 'Energija',
        recommendation: 'Lako svarljiva, visokokalorična hrana nakon operacije',
        reason: 'Oporavak tkiva i borba protiv infekcije zahtevaju proteine.',
      ),
    ],
    goodIngredients: ['Bujon', 'Kuvana piletina', 'Probiotici', 'Riblje ulje'],
    badIngredients: ['Teška, masna hrana', 'Kosti', 'Sirovo meso'],
    treatment: 'Piometra je hirurški hitan slučaj. Jedini siguran tretman je hitna sterilizacija (ovariohisterektomija). Stabilizacija se vrši agresivnom infuzijom i antibioticima širokog spektra (Enrofloksacin, Metronidazol).',
  ),

  // ==================== PSI (DODATNIH 5+ STANJA) ====================

  PetCondition(
    id: 'cushing_syndrome',
    name: 'Kušingov sindrom',
    description: 'Preterana proizvodnja kortizola od strane nadbubrežnih žlezda.',
    affectedSpecies: [PetType.dog],
    icon: '⚖️',
    symptoms: [
      'Prekomerna glad i žeđ',
      'Gubitak dlake na trupu (simetrično)',
      'Tanak sloj kože i pojava crnih tačaka',
      'Stomak u obliku bureta (viseći stomak)',
    ],
    guidelines: [
      DietaryGuideline(
        nutrient: 'Masti',
        recommendation: 'Nizak nivo masti u ishrani',
        reason: 'Smanjenje rizika od pankreatitisa i lipemije.',
      ),
    ],
    goodIngredients: ['Bela riba', 'Povrće bogato vlaknima', 'Belance'],
    badIngredients: ['Slanina', 'Maslac', 'Crveno meso sa masnoćom'],
    treatment: 'Doživotna terapija Trilostanom (Vetoryl). Redovno praćenje ACTH stimulacionim testom.',
  ),

  PetCondition(
    id: 'pancreatitis_dog',
    name: 'Pankreatitis (Upala gušterače)',
    description: 'Bolna upala pankreasa, često izazvana masnim obrokom.',
    affectedSpecies: [PetType.dog],
    icon: '🤢',
    symptoms: [
      'Povraćanje u luku',
      'Molilački stav (prednji deo tela na podu, zadnji podignut)',
      'Jak bol u stomaku',
      'Dijareja',
    ],
    guidelines: [
      DietaryGuideline(
        nutrient: 'Masti',
        recommendation: 'Strogo <10% masti u suvoj materiji',
        reason: 'Izbegavanje stimulacije pankreasa na lučenje enzima.',
      ),
    ],
    goodIngredients: ['Obrani sir', 'Kuvani pirinač', 'Nemasna ćuretina'],
    badIngredients: ['Ostaci ljudske hrane', 'Ulja', 'Svinjetina'],
    treatment: 'Post, infuzija, analgetici (Buprenorfin) i antiemetici. Kasnije prelazak na strogu medicinsku dijetu.',
  ),

  PetCondition(
    id: 'kennel_cough',
    name: 'Zarazni kašalj',
    description: 'Visoko zarazna respiratorna infekcija.',
    affectedSpecies: [PetType.dog],
    icon: '🗣️',
    symptoms: [
      'Suv, hrapav kašalj (zvuči kao da je nešto zapelo u grlu)',
      'Kijanje',
      'Iscedak iz nosa',
    ],
    guidelines: [
      DietaryGuideline(
        nutrient: 'Tekstura hrane',
        recommendation: 'Omekšati hranu toplom vodom',
        reason: 'Smanjenje iritacije upaljenog grla pri gutanju.',
      ),
    ],
    goodIngredients: ['Med (u tragovima)', 'Topla supa bez soli', 'Vlažna hrana'],
    badIngredients: ['Tvrdi keksi', 'Hladna voda'],
    treatment: 'Antitusici, po potrebi antibiotici (Doksiciklin). Izolacija od drugih pasa.',
  ),

  // ==================== MAČKE (DODATNIH 5+ STANJA) ====================

  PetCondition(
    id: 'flutd',
    name: 'FLUTD (Urološki sindrom)',
    description: 'Problemi sa donjim urinarnim traktom, uključujući kristale i upale.',
    affectedSpecies: [PetType.cat],
    icon: '🚽',
    symptoms: [
      'Naprezanje pri mokrenju',
      'Krv u urinu (krvav iscedak)',
      'Mokrenje van posude',
      'Bolno mjaukanje u pesku',
    ],
    guidelines: [
      DietaryGuideline(
        nutrient: 'Magnezijum i Fosfor',
        recommendation: 'Strogo kontrolisani nivoi minerala',
        reason: 'Sprečavanje formiranja struvitnih kamenaca.',
      ),
      DietaryGuideline(
        nutrient: 'Vlaga',
        recommendation: 'Isključivo mokra hrana ili fontana za vodu',
        reason: 'Razblaživanje urina je ključ prevencije.',
      ),
    ],
    goodIngredients: ['Vlažna medicinska hrana', 'Destilovana voda', 'Brusnica (suplement)'],
    badIngredients: ['Suva hrana sa puno žitarica', 'Mleko', 'Tuna iz konzerve za ljude'],
    treatment: 'Kateterizacija kod blokade, spazmolitici i prelazak na urinarnu dijetu (npr. Royal Canin s/o).',
  ),

  PetCondition(
    id: 'hyperthyroidism',
    name: 'Hipertireoza',
    description: 'Preterano aktivna štitna žlezda, česta kod starijih mačaka.',
    affectedSpecies: [PetType.cat],
    icon: '🦋',
    symptoms: [
      'Gubitak težine uz ogroman apetit',
      'Hiperaktivnost i agresivnost',
      'Loš kvalitet dlake',
      'Ubrzan rad srca',
    ],
    guidelines: [
      DietaryGuideline(
        nutrient: 'Jod',
        recommendation: 'Hrana sa ekstremno niskim sadržajem joda',
        reason: 'Jod je neophodan za proizvodnju tiroidnog hormona.',
      ),
    ],
    goodIngredients: ['Specijalizovana Hills y/d dijeta', 'Kuvana ćuretina bez dodataka'],
    badIngredients: ['Riba (bogata jodom)', 'Morski plodovi', 'Dodaci sa algama'],
    treatment: 'Lekovi (Metimazol), radioaktivni jod ili hirurško uklanjanje žlezde.',
  ),

  PetCondition(
    id: 'hcm_cat',
    name: 'Hipertrofična kardiomiopatija (HCM)',
    description: 'Zadebljanje srčanog mišića koje dovodi do zastoja srca.',
    affectedSpecies: [PetType.cat],
    icon: '❤️',
    symptoms: [
      'Otežano disanje (na usta)',
      'Zadnja paraliza nogu (tromboembolija)',
      'Letargija',
      'Skrivanje',
    ],
    guidelines: [
      DietaryGuideline(
        nutrient: 'Natrijum',
        recommendation: 'Minimalan unos soli',
        reason: 'Sprečavanje nakupljanja tečnosti u plućima.',
      ),
      DietaryGuideline(
        nutrient: 'Taurin',
        recommendation: 'Visok nivo taurina',
        reason: 'Esencijalno za zdravlje miokarda mačke.',
      ),
    ],
    goodIngredients: ['Srce (bogato taurinom)', 'Riblje ulje', 'Piletina'],
    badIngredients: ['Slane poslastice', 'Sir', 'Hrana sa puno natrijuma'],
    treatment: 'Beta-blokatori (Atenolol), ACE inhibitori i lekovi protiv zgrušavanja krvi (Klopidogrel).',
  ),

  PetCondition(
    id: 'cat_flu',
    name: 'Mačji grip (Rhinotracheitis)',
    description: 'Respiratorni kompleks uzrokovan Herpes ili Calici virusom.',
    affectedSpecies: [PetType.cat],
    icon: '🤧',
    symptoms: [
      'Učestalo kijanje',
      'Krvav ili gnojan iscedak iz nosa',
      'Čirevi u ustima (kod Calici virusa)',
      'Gubitak čula mirisa',
    ],
    guidelines: [
      DietaryGuideline(
        nutrient: 'Aromatičnost',
        recommendation: 'Zagrejati hranu da bi jače mirisala',
        reason: 'Mačke neće da jedu ako ne osećaju miris hrane zbog zapušenog nosa.',
      ),
      DietaryGuideline(
        nutrient: 'L-lizin',
        recommendation: 'Suplementacija aminokiselinom L-lizin',
        reason: 'Ometa replikaciju herpes virusa.',
      ),
    ],
    goodIngredients: ['Topla tunjevina', 'L-lizin pasta', 'Mokra hrana'],
    badIngredients: ['Suva hrana (teška za gutanje zbog čireva)'],
    treatment: 'Antibiotici za sekundarne infekcije, inhalacija, čišćenje očiju i nosa, antivirusni lekovi.',
  ),
];
