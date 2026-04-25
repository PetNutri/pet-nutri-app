/// FINALNI UNIFICIRANI FAJL: conditions_database.dart - DEO 1
/// Zadržani svi originalni detaljni opisi i tretmani.

import 'extra_conditions_dogs_cats.dart';

enum PetType { dog, cat, rabbit, rodent, bird, terrarium, aquarium }

/// Kategorije za lakšu navigaciju u korisničkom interfejsu
enum ConditionCategory {
  digestive,      // Jetra, Pankreas, IBD, Gastritis, Zubi
  urinary,        // Bubrezi, Kristali, Piometra
  endocrine,      // Dijabetes, Štitna žlezda, Kušing
  dermatological, // Alergije, Koža
  cardiovascular, // Srce
  neurological,   // Epilepsija
  musculoskeletal, // ARTRITIS i MBD (Ovdje je bila greška)
  exotic,         // Specifično za ptice, reptile, ribe
  other           // Gojaznost, Grip, Kašalj
}

class DietaryGuideline {
  final String nutrient;
  final String recommendation;
  final String reason;
  const DietaryGuideline({required this.nutrient, required this.recommendation, required this.reason});
}

class PetCondition {
  final String id;
  final String name;
  final String description;
  final List<PetType> affectedSpecies;
  final ConditionCategory category; 
  final String icon;
  final List<String> symptoms;
  final List<DietaryGuideline> guidelines;
  final List<String> goodIngredients;
  final List<String> badIngredients;
  final String treatment;

  const PetCondition({
    required this.id, required this.name, required this.description, 
    required this.affectedSpecies, required this.category, required this.icon, 
    required this.symptoms, required this.guidelines, 
    required this.goodIngredients, required this.badIngredients, required this.treatment,
  });
}

// Funkcije za UI
Map<ConditionCategory, List<PetCondition>> getConditionsGrouped(PetType petType) {
  final Map<ConditionCategory, List<PetCondition>> map = {};
  for (var condition in allConditions) {
    if (condition.affectedSpecies.contains(petType)) {
      map.putIfAbsent(condition.category, () => []).add(condition);
    }
  }
  return map;
}

final List<PetCondition> allConditions = [
  ...conditionsDatabase,
  ...extraDogCatConditions,
];

const List<PetCondition> conditionsDatabase = [
  PetCondition(
    id: 'hepatitis',
    name: 'Hepatitis',
    category: ConditionCategory.digestive,
    description: 'Hepatitis je upala jetre koja moze biti akutna ili hronicna, a nastaje usled virusnih, bakterijskih, toksinskih ili autoimunih uzroka. Ostecenje hepatocita dovodi do poremecaja metabolizma, detoksikacije i proizvodnje zucnih kiselina. Bez adekvatnog lecenja moze napredovati do ciroze ili potpunog otkazivanja jetre.',
    affectedSpecies: [PetType.dog, PetType.cat],
    icon: '🫁',
    symptoms: ['Gubitak apetita', 'Povracanje', 'Zutica (zuta boja koze i ociju)', 'Letargija i slabost', 'Povecan unos vode', 'Tamna mokraca', 'Nadut stomak', 'Gubitak tezine'],
    guidelines: [
      DietaryGuideline(nutrient: 'Proteini', recommendation: 'moderate', reason: 'Visokokvalitetni, lako svarljivi proteini u umerenoj kolicini.'),
      DietaryGuideline(nutrient: 'Masti', recommendation: 'low', reason: 'Smanjene masti rasterecuju jetru.'),
      DietaryGuideline(nutrient: 'Bakar', recommendation: 'avoid', reason: 'Bakar se akumulira u ostecenoj jetri.'),
      DietaryGuideline(nutrient: 'Vlakna', recommendation: 'moderate', reason: 'Pomaze u vezivanju toksina u crevima.'),
      DietaryGuideline(nutrient: 'Antioksidansi', recommendation: 'high', reason: 'Vitamin E i C stite celije jetre.'),
    ],
    goodIngredients: ['piletina', 'curetina', 'pirinac', 'jaja', 'svezi sir', 'vitamin e', 'vitamin c', 'omega 3'],
    badIngredients: ['bakar', 'jetra', 'dzigerica', 'nusproizvod', 'kukuruz', 'psenica'],
    treatment: 'Lecenje hepatitisa zavisi od uzroka i tezine bolesti. Kod infektivnog hepatitisa pasa primenjuju se antivirusni protokoli i suportivna terapija, dok se kod bakterijskih infekcija koriste antibiotici poput Amoksicilina ili Metronidazola. Hepatoprotektori kao sto su S-adenozilmetionin (SAMe) i silimarin (ekstrakt biljke sikavice) pomazu u zastiti i regeneraciji celija jetre. Ursodeoksiholna kiselina (Ursodiol) se koristi za poboljsanje protoka zuci i smanjenje upale. Infuziona terapija je neophodna za korekciju dehidracije i elektrolitnog disbalansa. Antiemetici poput Maropitanta (Cerenia) kontrolisu povracanje, a vitamin K se daje ako postoji poremecaj koagulacije. Obavezno posetite veterinara za krvne analize (ALT, AST, bilirubin) i ultrazvuk jetre radi procene stepena ostecenja.',
  ),
  PetCondition(
    id: 'kidney_disease',
    name: 'Bubrezna bolest',
    category: ConditionCategory.urinary,
    description: 'Hronicna bubrezna insuficijencija (HBI) je progresivno i nepovratno ostecenje bubreznog tkiva koje dovodi do smanjene sposobnosti filtracije krvi i eliminacije otpadnih materija. Bolest se klasifikuje u cetiri stadijuma prema IRIS sistemu na osnovu nivoa kreatinina i SDMA u krvi. Rana dijagnoza i dijetetska intervencija mogu znacajno usporiti napredovanje bolesti.',
    affectedSpecies: [PetType.dog, PetType.cat],
    icon: '🫘',
    symptoms: ['Pojacano mokrenje', 'Pojacana zedj', 'Gubitak apetita', 'Povracanje', 'Gubitak tezine', 'Los zadah (miris na amonijak)', 'Letargija', 'Dehidracija', 'Bledilo desni'],
    guidelines: [
      DietaryGuideline(nutrient: 'Proteini', recommendation: 'low', reason: 'Smanjeni proteini da se ne opterete bubrezi.'),
      DietaryGuideline(nutrient: 'Fosfor', recommendation: 'avoid', reason: 'Fosfor pogorsava bubreznu funkciju.'),
      DietaryGuideline(nutrient: 'Natrijum', recommendation: 'low', reason: 'Nizak natrijum pomaze kontrolu krvnog pritiska.'),
      DietaryGuideline(nutrient: 'Omega-3', recommendation: 'high', reason: 'Smanjuje upalu u bubrezima.'),
    ],
    goodIngredients: ['jaja', 'omega 3', 'riblje ulje', 'pirinac', 'batat'],
    badIngredients: ['fosfor', 'kostano brasno', 'so', 'natrijum', 'nusproizvod'],
    treatment: 'Lecenje hronicne bubrezne bolesti je dozivotno i usmereno na usporavanje progresije. Vezaci fosfora poput aluminijum-hidroksida ili lantanum-karbonata se dodaju hrani da smanje apsorpciju fosfora iz creva. Benazepril (ACE inhibitor) se koristi za smanjenje proteinurije i zastitu bubreznog tkiva. Subkutana infuzija fizioloskog rastvora se primenjuje kod kuce za odrzavanje hidratacije. Eritropoetin (Epoetin alfa) ili Darbepoetin se daju kod teske anemije uzrokovane smanjenom proizvodnjom eritropoetina. Antiemetici poput Maropitanta i stimulatori apetita kao Mirtazapin pomazu u kontroli mucnine i odrzavanju unosa hrane. Redovno pracenje krvnih parametara (urea, kreatinin, fosfor, SDMA) kod veterinara je neophodno svakih 3-6 meseci. Prelazak na specijalnu renalnu dijetu sa smanjenim proteinima i fosforom je kljucan deo terapije.',
  ),
  PetCondition(
    id: 'diabetes',
    name: 'Dijabetes',
    category: ConditionCategory.endocrine,
    description: 'Dijabetes melitus je endokrini poremecaj koji nastaje usled nedovoljne proizvodnje insulina (tip 1, cesci kod pasa) ili rezistencije na insulin (tip 2, cesci kod macaka). Neregulisan secer u krvi dovodi do ostecenja krvnih sudova, nerava, bubrega i ociju. Pravilna ishrana sa niskim glikemijskim indeksom je temelj kontrole bolesti uz insulinsku terapiju.',
    affectedSpecies: [PetType.dog, PetType.cat],
    icon: '💉',
    symptoms: ['Pojacana zedj', 'Ucestalo mokrenje', 'Pojacan apetit uz gubitak tezine', 'Letargija', 'Zamucen vid', 'Sporo zarastanje rana', 'Ceste infekcije', 'Sladak miris daha'],
    guidelines: [
      DietaryGuideline(nutrient: 'Ugljeni hidrati', recommendation: 'low', reason: 'Nizak GI sprecava skokove secera u krvi.'),
      DietaryGuideline(nutrient: 'Proteini', recommendation: 'high', reason: 'Visok protein pomaze stabilizaciji glukoze.'),
      DietaryGuideline(nutrient: 'Vlakna', recommendation: 'high', reason: 'Vlakna usporavaju apsorpciju secera.'),
    ],
    goodIngredients: ['piletina', 'curetina', 'riba', 'vlakna', 'bundeva', 'boranija'],
    badIngredients: ['secer', 'kukuruzni sirup', 'psenica', 'kukuruz', 'beli pirinac'],
    treatment: 'Osnova lecenja dijabetesa je insulinska terapija — kod pasa se najcesce koristi srednje-delujuci insulin (Caninsulin/vetsulin), dok se kod macaka preferira dugodeluci insulin poput Glargina (Lantus) ili Protamin-cink insulina. Doza insulina se titrira na osnovu krivulje glukoze u krvi koju radi veterinar. Obroci moraju biti u isto vreme svakog dana, neposredno pre ili posle davanja insulina. Kod macaka sa tipom 2 dijabetesa, niskougljikohidratna dijeta bogata proteinima moze dovesti do remisije bolesti. Redovno merenje fruktozamina i glukoze u krvi je neophodno za pracenje kontrole bolesti. Kod dijabetesne ketoacidoze (hitno stanje) potrebna je hospitalizacija sa intravenskom infuzijom i kratkodelujucim insulinom. Obavezno posetite veterinara odmah ako primetite povracanje, letargiju ili miris acetona iz usta.',
  ),
  // ... i tako dalje za Pancreatitis, Allergies, Obesity, Urinary, Heart, Arthritis, IBD, Thyroid, Dental, Skin, Gastritis...
  // Nastavak liste conditionsDatabase unutar conditions_database.dart

  PetCondition(
    id: 'pancreatitis',
    name: 'Pankreatitis',
    category: ConditionCategory.digestive,
    description: 'Pankreatitis je upala pankreasa koja nastaje kada digestivni enzimi postanu aktivni unutar samog organa i pocnu da razaraju tkivo. Moze biti akutni (iznenadni, teski) ili hronicni (ponavljajuci, blazi). Masna hrana, gojaznost i neki lekovi su najcesci okidaci, a bolest moze biti zivotno ugrozavajuca bez pravovremenog lecenja.',
    affectedSpecies: [PetType.dog, PetType.cat],
    icon: '🔥',
    symptoms: ['Jak bol u stomaku', 'Povracanje', 'Proliv', 'Gubitak apetita', 'Dehidracija', 'Letargija', 'Grbljenje ledja (kod pasa)', 'Povisena temperatura'],
    guidelines: [
      DietaryGuideline(nutrient: 'Masti', recommendation: 'avoid', reason: 'Masti su glavni okidac pankreatitisa.'),
      DietaryGuideline(nutrient: 'Proteini', recommendation: 'moderate', reason: 'Lako svarljivi proteini u umerenoj kolicini.'),
      DietaryGuideline(nutrient: 'Vlakna', recommendation: 'moderate', reason: 'Pomaze probavi bez opterecenja pankreasa.'),
    ],
    goodIngredients: ['pileca prsa', 'curetina', 'pirinac', 'bundeva', 'batat'],
    badIngredients: ['mast', 'ulje', 'puter', 'loj', 'slanina'],
    treatment: 'Akutni pankreatitis zahteva hospitalizaciju sa agresivnom intravenskom infuzionom terapijom za korekciju dehidracije i elektrolitnog disbalansa. Analgetici poput Buprenorfina ili Metadona se koriste za kontrolu jakog abdominalnog bola, a Meloksikam se moze primeniti kod blazih slucajeva. Antiemetici Maropitant (Cerenia) i Ondansetron kontrolisu povracanje i mucninu. Rano enteralno hranjenje malom kolicinom niskomasne hrane je pozeljno cim se povracanje kontrolise. Kod hronicnog pankreatitisa, suplementacija pankreasnim enzimima moze poboljsati varenje. Antibiotici poput Amoksicilina sa klavulanskom kiselinom se daju samo ako postoji sumnja na sekundarnu bakterijsku infekciju. Obavezno posetite veterinara za ultrazvuk abdomena i krvne analize (lipaza, amilaza, cPLI/fPLI).',
  ),
  PetCondition(
    id: 'heart_disease',
    name: 'Srcana bolest',
    category: ConditionCategory.cardiovascular,
    description: 'Srcane bolesti kod pasa i macaka obuhvataju degenerativnu bolest mitralnog zaliska (MMVD, najcesca kod pasa malih rasa), dilatativnu kardiomiopatiju (DCM, kod velikih rasa) i hipertroficnu kardiomiopatiju (HCM, najcesca kod macaka). Bolest dovodi do smanjene sposobnosti srca da pumpa krv, nakupljanja tecnosti u plucima ili abdomenu i progresivnog otkazivanja srca.',
    affectedSpecies: [PetType.dog, PetType.cat],
    icon: '❤️',
    symptoms: ['Kasalj (narocito nocu)', 'Tesko disanje', 'Brzo zamaranje', 'Smanjena aktivnost', 'Gubitak apetita', 'Nadut stomak (tecnost)', 'Plavicaste desni', 'Nesvestica'],
    guidelines: [
      DietaryGuideline(nutrient: 'Natrijum', recommendation: 'low', reason: 'Nizak natrijum smanjuje zadrzavanje tecnosti.'),
      DietaryGuideline(nutrient: 'Taurin', recommendation: 'high', reason: 'Taurin je kljucan za funkciju srcanog misica.'),
      DietaryGuideline(nutrient: 'Omega-3', recommendation: 'high', reason: 'Smanjuje upalu i podrzava srce.'),
    ],
    goodIngredients: ['riba', 'losos', 'taurin', 'omega 3', 'riblje ulje', 'piletina'],
    badIngredients: ['so', 'natrijum', 'slanina', 'preradjeno meso'],
    treatment: 'Lecenje srcane bolesti zavisi od stadijuma i tipa oboljenja. Pimobendan (Vetmedin) je lek prvog izbora kod pasa sa MMVD i DCM jer poboljsava kontraktilnost srca i sirii krvne sudove. Furosemid (Lasix) je diuretik koji se koristi za uklanjanje viska tecnosti iz pluca i abdomena. ACE inhibitori poput Enalaprila ili Benazeprila smanjuju opterecenje srca i usporavaju progresiju bolesti. Spironolakton se dodaje kao blagi diuretik i antifibrotik. Kod macaka sa HCM, Atenolol ili Diltiazem se koriste za usporavanje srcane frekvencije, a Klopidogrel za prevenciju tromboembolije. Suplementacija taurinom je obavezna kod DCM povezane sa deficitom taurina. Redovni ultrazvucni pregledi srca (ehokardiografija) kod veterinarskog kardiologa su neophodni za pracenje napredovanja bolesti.',
  ),
  PetCondition(
    id: 'arthritis',
    name: 'Artritis',
    category: ConditionCategory.neurological,
    description: 'Osteoartritis je degenerativna bolest zglobova koja nastaje usled propadanja zglobne hrskavice, sto dovodi do bola, upale i smanjene pokretljivosti. Najcesce pogadja kukove, kolena, laktove i kicmu, narocito kod starijih i gojaznih zivotinja. Bolest je progresivna i neizleciva, ali se simptomi mogu znacajno kontrolisati kombinacijom dijete, lekova i fizikalne terapije.',
    affectedSpecies: [PetType.dog, PetType.cat],
    icon: '🦴',
    symptoms: ['Hramanje', 'Ukocenost posle odmora', 'Otezano ustajanje', 'Smanjena aktivnost', 'Bolni zglobovi na dodir', 'Oteceni zglobovi', 'Lizanje bolnih mesta', 'Odbijanje skakanja ili penjanja'],
    guidelines: [
      DietaryGuideline(nutrient: 'Omega-3', recommendation: 'high', reason: 'Snazno antiinflamatorno dejstvo na zglobove.'),
      DietaryGuideline(nutrient: 'Glukozamin', recommendation: 'high', reason: 'Podrzava obnovu hrskavice.'),
      DietaryGuideline(nutrient: 'Kalorije', recommendation: 'low', reason: 'Odrzavanje idealne tezine smanjuje opterecenje zglobova.'),
    ],
    goodIngredients: ['losos', 'riblje ulje', 'omega 3', 'glukozamin', 'hondroitin', 'kurkuma'],
    badIngredients: ['secer', 'kukuruz', 'psenica', 'nusproizvod'],
    treatment: 'Nesteroidni antiinflamatorni lekovi (NSAIL) poput Meloksikama (Metacam) ili Karprofen (Rimadyl) su osnova terapije bola kod pasa, dok se kod macaka koristi Meloksikam u nizoj dozi ili noviji lek Solensia (Frunevetmab, anti-NGF antitelo). Glukozamin-hondroitin sulfat suplementi pomazu u zastiti i obnovi hrskavice. Adekvan (polisulfatovani glikozaminoglikan) se daje kao serija injekcija za zastitu zglobne hrskavice. Omega-3 masne kiseline u visokim dozama (EPA i DHA) imaju dokazano antiinflamatorno dejstvo. Fizikalna terapija ukljucujuci hidroterapiju, lasersku terapiju i kontrolisane setnje znacajno poboljsava pokretljivost. Odrzavanje idealne telesne mase je kljucno jer svaki visak kilograma dodatno opterecuje zglobove. Obavezno posetite veterinara za rendgen zglobova i plan lecenja prilagodjen stadijumu bolesti.',
  ),
  PetCondition(
    id: 'ibd',
    name: 'Upalna bolest creva (IBD)',
    category: ConditionCategory.digestive,
    description: 'Upalna bolest creva (IBD) je hronicno stanje karakterisano infiltracijom zapaljenskih celija u zid creva, sto dovodi do poremecaja varenja i apsorpcije hranljivih materija. Najcesci oblici su limfocitno-plazmocitni enteritis i eozinofilni enteritis. Dijagnoza se postavlja biopsijom creva, a lecenje zahteva kombinaciju dijetetske terapije i imunosupresivnih lekova.',
    affectedSpecies: [PetType.dog, PetType.cat],
    icon: '🩺',
    symptoms: ['Hronican proliv', 'Povracanje', 'Gubitak tezine', 'Gubitak apetita', 'Krv ili sluz u stolici', 'Nadimanje i gasovi', 'Bolovi u stomaku', 'Lose stanje dlake'],
    guidelines: [
      DietaryGuideline(nutrient: 'Proteini', recommendation: 'moderate', reason: 'Hidrolizovani ili novi proteini smanjuju reakciju creva.'),
      DietaryGuideline(nutrient: 'Masti', recommendation: 'low', reason: 'Niske masti su lakse za varenje.'),
      DietaryGuideline(nutrient: 'Probiotici', recommendation: 'high', reason: 'Podrzavaju zdravu crevnu floru.'),
    ],
    goodIngredients: ['piletina', 'curetina', 'pirinac', 'bundeva', 'probiotici', 'prebiotici'],
    badIngredients: ['psenica', 'kukuruz', 'soja', 'mlecni proizvodi', 'vestacki dodaci'],
    treatment: 'Lecenje IBD-a zahteva kombinaciju dijetetske i medikamentozne terapije. Prednizolon je imunosupresivni lek prvog izbora koji se daje u opadajucim dozama tokom nekoliko nedelja. Budezonid se koristi kao alternativa sa manje sistemskih nuspojava jer deluje lokalno na creva. Metronidazol ima antiinflamatorno i antibakterijsko dejstvo na creva i cesto se kombinuje sa kortikosteroidima. Kod teskih slucajeva koji ne reaguju na steroide, koriste se jaci imunosupresivi poput Azatioprina (kod pasa) ili Hlorambucila (kod macaka). Dijeta sa hidrolizovanim proteinima ili novim izvorom proteina je kljucna za smanjenje antigenske stimulacije creva. Probiotici i prebiotici pomazu u obnovi zdrave crevne mikroflore. Redovne kontrole kod veterinara sa krvnim analizama su neophodne za pracenje nuspojava lekova i prilagodjavanje terapije.',
  ),
  PetCondition(
    id: 'hypothyroidism',
    name: 'Hipotireoza',
    category: ConditionCategory.endocrine,
    description: 'Hipotireoza je endokrini poremecaj uzrokovan nedovoljnom proizvodnjom hormona stitne zlezde (T4 i T3), najcesce usled autoimunog tiroiditisa ili idiopatske atrofije zlezde. Smanjen nivo tiroidnih hormona usporava metabolizam celokupnog organizma. Bolest je najcesca kod pasa srednjih i velikih rasa, a dijagnoza se postavlja merenjem ukupnog T4, slobodnog T4 i TSH u krvi.',
    affectedSpecies: [PetType.dog],
    icon: '🦋',
    symptoms: ['Debljanje bez povecanog apetita', 'Letargija i pospanost', 'Gubitak dlake', 'Suva i ljuspasta koza', 'Osetljivost na hladnocu', 'Spor puls', 'Tamna pigmentacija koze', 'Ceste kozne infekcije'],
    guidelines: [
      DietaryGuideline(nutrient: 'Kalorije', recommendation: 'low', reason: 'Spor metabolizam zahteva manje kalorija.'),
      DietaryGuideline(nutrient: 'Proteini', recommendation: 'high', reason: 'Visok protein podrzava metabolizam.'),
      DietaryGuideline(nutrient: 'Omega-3', recommendation: 'high', reason: 'Pomaze zdravlju koze i dlake.'),
    ],
    goodIngredients: ['riba', 'piletina', 'omega 3', 'riblje ulje', 'batat', 'boranija'],
    badIngredients: ['secer', 'kukuruzni sirup', 'mast', 'nusproizvod'],
    treatment: 'Lecenje hipotireoze je dozivotno i zasniva se na oralnoj suplementaciji sintetickim tiroidnim hormonom — Levotiroksinom (Soloxine, Thyro-Tabs). Pocetna doza je obicno 0.02 mg/kg dva puta dnevno, a zatim se prilagodjava na osnovu kontrolnih krvnih analiza. Prva kontrola nivoa T4 u krvi se radi 4-6 nedelja nakon pocetka terapije, a zatim svakih 6 meseci. Lek se daje na prazan zeludac jer hrana moze smanjiti apsorpciju. Poboljsanje energije i aktivnosti se obicno primecuje vec nakon 1-2 nedelje, dok potpuni oporavak koze i dlake moze trajati 3-6 meseci. Niskokaloricna dijeta bogata proteinima pomaze u kontroli telesne mase dok se metabolizam normalizuje. Obavezno posetite veterinara za redovne kontrole hormona i prilagodjavanje doze leka.',
  ),
  PetCondition(
    id: 'hyperthyroidism',
    name: 'Hipertireoza',
    category: ConditionCategory.endocrine,
    description: 'Hipertireoza je najcesci endokrini poremecaj kod macaka starijih od 8 godina, uzrokovan benignim tumorom (adenomom) stitne zlezde koji proizvodi prekomerne kolicine tiroidnih hormona. Ubrzani metabolizam dovodi do gubitka tezine uprkos povecanom apetitu, tahikardije i ostecenja srca i bubrega. Nelecena hipertireoza moze dovesti do hipertroficne kardiomiopatije i srcane insuficijencije.',
    affectedSpecies: [PetType.cat],
    icon: '⚡',
    symptoms: ['Gubitak tezine uz pojacan apetit', 'Pojacana zedj i mokrenje', 'Hiperaktivnost i nemir', 'Povracanje', 'Proliv', 'Lose stanje dlake', 'Ubrzan puls', 'Agresivnost ili promena ponasanja'],
    guidelines: [
      DietaryGuideline(nutrient: 'Jod', recommendation: 'avoid', reason: 'Ogranicenje joda smanjuje proizvodnju hormona.'),
      DietaryGuideline(nutrient: 'Kalorije', recommendation: 'high', reason: 'Potrebno nadoknaditi gubitak tezine.'),
      DietaryGuideline(nutrient: 'Proteini', recommendation: 'high', reason: 'Visok protein za ocuvanje misicne mase.'),
    ],
    goodIngredients: ['piletina', 'curetina', 'jaja', 'pirinac'],
    badIngredients: ['riba', 'morski plodovi', 'alge', 'jod'],
    treatment: 'Lecenje hipertireoze kod macaka ima nekoliko opcija. Metimazol (Tapazol/Felimazole) je antitiroidni lek koji blokira proizvodnju hormona i daje se oralno ili transdermalno na unutrasnju stranu usne skoljke. Terapija radioaktivnim jodom (I-131) je zlatni standard jer trajno izleci bolest jednom injekcijom, ali zahteva specijalizovanu kliniku. Hirurska tiroidektomija je opcija kod macaka koje ne tolerisu lekove. Dijeta sa ogranicenim jodom (Hill\'s y/d) moze kontrolisati blage slucajeve. Redovno pracenje nivoa T4 u krvi je neophodno svakih 3-6 meseci, kao i pracenje bubrezne funkcije jer lecenje hipertireoze moze demaskirati skrivenu bubreznu bolest. Kod macaka sa sekundarnom kardiomiopatijom, Atenolol se koristi za kontrolu tahikardije. Obavezno posetite veterinara za kompletnu krvnu sliku, biohemiju i merenje krvnog pritiska.',
  ),
  PetCondition(
    id: 'dental_disease',
    name: 'Bolesti zuba i desni',
    category: ConditionCategory.digestive,
    description: 'Parodontalna bolest je najcesca bolest kod pasa i macaka — pogadja preko 80% zivotinja starijih od 3 godine. Pocinje nakupljanjem plaka i zubnog kamenca, napreduje do gingivitisa (upale desni), a zatim do parodontitisa sa razaranjem kostiju vilice i gubitkom zuba. Bakterije iz usne duplje mogu preko krvotoka dospeti do srca, jetre i bubrega i izazvati sistemske infekcije.',
    affectedSpecies: [PetType.dog, PetType.cat],
    icon: '🦷',
    symptoms: ['Los zadah', 'Crvenilo i otecenost desni', 'Krvarenje desni', 'Otezano zvakanje', 'Gubitak apetita', 'Ispustanje hrane iz usta', 'Curenje pljuvacke', 'Labavi ili izgubljeni zubi'],
    guidelines: [
      DietaryGuideline(nutrient: 'Tekstura hrane', recommendation: 'high', reason: 'Suva hrana pomaze mehanickom ciscenju zuba.'),
      DietaryGuideline(nutrient: 'Kalcijum', recommendation: 'moderate', reason: 'Podrzava zdravlje kostiju i zuba.'),
      DietaryGuideline(nutrient: 'Vitamin C', recommendation: 'high', reason: 'Pomaze zdravlju desni i zarastanju.'),
    ],
    goodIngredients: ['piletina', 'riba', 'vitamin c', 'kalcijum', 'suva hrana'],
    badIngredients: ['secer', 'meka lepljiva hrana', 'kukuruzni sirup'],
    treatment: 'Profesionalno ciscenje zuba (dentalna profilaksa) pod opstom anestezijom je osnova lecenja parodontalne bolesti i ukljucuje uklanjanje kamenca ultrazvukom, poliranje zuba i subgingivalno kiretiranje. Ekstrakcija (vadjenje) tesko ostecenih i labavnih zuba je neophodna jer su izvor hronicne infekcije i bola. Antibiotici poput Klindamicina, Amoksicilina sa klavulanskom kiselinom ili Metronidazola se daju pre i posle zahvata za kontrolu bakterijske infekcije. Analgetici Meloksikam i Tramadol se koriste za postoperativnu kontrolu bola. Svakodnevno pranje zuba specijalizovanom pastom za zivotinje (nikada ljudskom) je najvaznija preventivna mera. Dentalne grickalice i dodaci za vodu sa Hlorheksidinom pomazu u smanjenju plaka izmedju profesionalnih ciscenja. Obavezno posetite veterinara za dentalni pregled i rendgen zuba jer vecina parodontalnih problema nije vidljiva golim okom.',
  ),
  PetCondition(
    id: 'skin_issues',
    name: 'Kozni problemi',
    category: ConditionCategory.dermatological,
    description: 'Dermatoloski problemi kod pasa i macaka obuhvataju atopijski dermatitis, bakterijske pioderme, gljivicne infekcije (dermatofitoza), demodikoza i seboreja. Koza je najveci organ tela i njen izgled direktno odrazava opste zdravstveno stanje i kvalitet ishrane. Hronicni kozni problemi cesto zahtevaju multidisciplinarni pristup ukljucujuci dijetetsku terapiju, lekove i kontrolu okoline.',
    affectedSpecies: [PetType.dog, PetType.cat],
    icon: '🐾',
    symptoms: ['Svrab i cesanje', 'Suva i ljuspasta koza', 'Gubitak dlake', 'Crvenilo koze', 'Masna ili smrdljiva koza', 'Ceste kozne infekcije', 'Perut', 'Lizanje i grickanje koze'],
    guidelines: [
      DietaryGuideline(nutrient: 'Omega-3', recommendation: 'high', reason: 'Esencijalne masne kiseline za zdravu kozu i dlaku.'),
      DietaryGuideline(nutrient: 'Cink', recommendation: 'high', reason: 'Cink je kljucan za obnovu koze.'),
      DietaryGuideline(nutrient: 'Biotin', recommendation: 'high', reason: 'Podrzava rast zdrave dlake.'),
    ],
    goodIngredients: ['losos', 'riblje ulje', 'omega 3', 'cink', 'biotin', 'jaja'],
    badIngredients: ['vestacki dodaci', 'boje', 'kukuruz', 'soja'],
    treatment: 'Lecenje koznih problema zavisi od uzroka. Kod bakterijskih piodermi koriste se antibiotici poput Cefaleksina ili Amoksicilina sa klavulanskom kiselinom u trajanju od minimum 3-4 nedelje. Gljivicne infekcije se lece Itrakonazolom ili Ketokonazolom oralno, uz kupanje sa Mikonazol-Hlorheksidin samponom. Atopijski dermatitis se kontrolise Oclacitinibom (Apoquel), Lokivetmabom (Cytopoint) ili imunoterapijom (alergenskim vakcinama). Demodikoza se leci Ivermektinom, Fluralanerom (Bravecto) ili Sarolanerom (Simparica). Medicinski samponi sa Hlorheksidinom (2-4%) se koriste za lokalno lecenje bakterijskih i gljivicnih infekcija koze. Suplementacija omega-3 masnim kiselinama i cinkom poboljsava kvalitet koze i dlake. Obavezno posetite veterinarskog dermatologa za kozni skarifikacioni test, citologiju i eventualno biopsiju koze.',
  ),
  PetCondition(
    id: 'gastritis',
    name: 'Gastritis',
    category: ConditionCategory.digestive,
    description: 'Gastritis je upala sluznice zeluca koja moze biti akutna (izazvana ingestijom neadekvatne hrane, lekova ili toksina) ili hronicna (uzrokovana Helicobacter infekcijom, autoimunim procesima ili dugotrajnom upotrebom NSAIL lekova). Akutni gastritis je obicno samoogranicavajuci, dok hronicni oblik zahteva detaljnu dijagnostiku ukljucujuci endoskopiju sa biopsijom.',
    affectedSpecies: [PetType.dog, PetType.cat],
    icon: '🤢',
    symptoms: ['Povracanje', 'Gubitak apetita', 'Bol u stomaku', 'Letargija', 'Dehidracija', 'Jedenje trave (kod pasa)', 'Podrigivanje', 'Crna stolica (krvarenje)'],
    guidelines: [
      DietaryGuideline(nutrient: 'Masti', recommendation: 'low', reason: 'Niske masti su lakse za zeludac.'),
      DietaryGuideline(nutrient: 'Proteini', recommendation: 'moderate', reason: 'Lako svarljivi proteini u manjim obrocima.'),
    ],
    goodIngredients: ['piletina', 'pirinac', 'bundeva', 'batat', 'kuvana jaja'],
    badIngredients: ['mast', 'zacini', 'vestacki dodaci', 'mlecni proizvodi', 'masna hrana'],
    treatment: 'Akutni gastritis se leci kratkim postom od 12-24 sata (samo kod odraslih zivotinja, ne kod stenaca i macica), a zatim postepenim uvodjenjem blage dijete — kuvana piletina sa pirincem u malim obrocima. Antiemetici Maropitant (Cerenia) i Metoklopramid kontrolisu povracanje i mucninu. Inhibitori protonske pumpe poput Omeprazola ili H2 blokatori poput Famotidina smanjuju lucenje zeludacne kiseline i stite sluzokzu. Sukralfat stvara zastitni sloj preko ostecene sluznice zeluca i pomaze zarastanju. Infuziona terapija je neophodna kod dehidriranih zivotinja za nadoknadu tecnosti i elektrolita. Kod hronicnog gastritisa uzrokovanog Helicobacter infekcijom, koristi se trojna terapija: Amoksicilin, Metronidazol i Omeprazol. Obavezno posetite veterinara ako povracanje traje duze od 24 sata, ako je prisutna krv u povracenom sadrzaju ili ako zivotinja pokazuje znake dehidracije.',
  ),
  // Nastavak liste conditionsDatabase unutar conditions_database.dart (Egzotični ljubimci)

  PetCondition(
    id: 'gi_stasis',
    name: 'GI staza (zastoj creva)',
    category: ConditionCategory.digestive,
    description: 'Gastrointestinalna staza (GI staza) je potencijalno smrtonosno stanje kod kunica i glodara gde se kretanje digestivnog sistema usporava ili potpuno zaustavlja. To dovodi do dehidratacije sadrzaja creva, razmnozavanja stetnih bakterija i nakupljanja gasova. Uzroci ukljucuju ishranu sa malo vlakana, stres, bol ili nedostatak kretanja.',
    affectedSpecies: [PetType.rabbit, PetType.rodent],
    icon: '🐇',
    symptoms: ['Smanjen apetit ili potpuno odbijanje hrane', 'Mali, suvi izmet ili odsustvo izmeta', 'Skrgutanje zubima (znak jakog bola)', 'Nadimanje stomaka', 'Letargija i povlacenje u ugao kaveza', 'Hladne usi (poremecaj cirkulacije)'],
    guidelines: [
      DietaryGuideline(nutrient: 'Vlakna', recommendation: 'high', reason: 'Seno je kljucno za stimulaciju pokretljivosti creva.'),
      DietaryGuideline(nutrient: 'Vlaga', recommendation: 'high', reason: 'Voda i sveze bilje pomazu rehidrataciji sadrzaja creva.'),
      DietaryGuideline(nutrient: 'Ugljeni hidrati', recommendation: 'avoid', reason: 'Secer i zitarice podsticu rast losih bakterija.'),
    ],
    goodIngredients: ['timothy seno', 'voda', 'sveze zacinsko bilje (nana, persun)', 'zelena salata (ne kristal)'],
    badIngredients: ['zitarice', 'voce', 'kukuruz', 'secer', 'industrijske poslastice'],
    treatment: 'GI staza je hitno stanje. Lecenje ukljucuje agresivnu hidrataciju (supkutana ili intravenska infuzija), kontrolu bola nesteroidnim antiinflamatornim lekovima poput Meloksikama (u visokim dozama prilagodjenim kunicima) i prokinetike (Cisaprid ili Metoklopramid) za stimulaciju creva. Prisilno hranjenje (Critical Care formula) je neophodno svaka 2-4 sata dok zivotinja ne pocne sama da jede. Simetikon se koristi za smanjenje bolnih gasova. Antibiotici se daju samo ako postoji sumnja na sekundarnu infekciju. Obavezno posetite veterinara specijalizovanog za egzoticne zivotinje jer pogresan tretman moze biti fatalan.',
  ),
  PetCondition(
    id: 'feather_plucking',
    name: 'Cupanje perja',
    category: ConditionCategory.exotic,
    description: 'Cupanje perja kod ptica (narocito papagaja) je kompleksno ponasanje koje moze biti uzrokovano medicinskim ili psiholoskim faktorima. Medicinski uzroci ukljucuju parazite, alergije na hranu, nedostatak vitamina ili hormonalni disbalans, dok psiholoski uzroci obuhvataju stres, dosadu i nedostatak socijalne interakcije.',
    affectedSpecies: [PetType.bird],
    icon: '🦜',
    symptoms: ['Gubitak perja na grudima i ledjima (ne na glavi)', 'Ostecena struktura perja', 'Krvarenje iz koze na mestima cupanja', 'Preterano sredjivanje (overgrooming)'],
    guidelines: [
      DietaryGuideline(nutrient: 'Vitamin A', recommendation: 'high', reason: 'Kljucan za zdravlje koze i folikula perja.'),
      DietaryGuideline(nutrient: 'Masne kiseline', recommendation: 'high', reason: 'Omega-3 i Omega-6 smanjuju svrab i iritaciju.'),
      DietaryGuideline(nutrient: 'Proteini', recommendation: 'moderate', reason: 'Kvalitetni proteini za obnovu perja.'),
    ],
    goodIngredients: ['sargarepa', 'batat', 'palmino ulje', 'semenke konoplje', 'sveze voce i povrce'],
    badIngredients: ['suncokret (samo suncokret je siromasan)', 'slana hrana', 'secer'],
    treatment: 'Lecenje pocinje iskljucivanjem medicinskih uzroka putem analiza krvi i pregleda koze. Ako je uzrok psiholoski, potrebna je modifikacija okoline — veci kavez, vise igracaka za zvakanje (foraging toys) i vise vremena provedenog van kaveza. U nekim slucajevima se koriste lekovi za modifikaciju ponasanja ili hormonalni implanti. Ishrana se mora obogatiti vitaminom A i esencijalnim masnim kiselinama. Upotreba kradni (elizabethan collar) je poslednja mera ako ptica nanosi sebi ozbiljne povrede.',
  ),
  PetCondition(
    id: 'mbd',
    name: 'Metabolicka bolest kostiju (MBD)',
    category: ConditionCategory.musculoskeletal,
    description: 'Metabolicka bolest kostiju (MBD) je cest i ozbiljan poremecaj kod reptila u zatocenistvu, uzrokovan poremecajem odnosa kalcijuma, fosfora i vitamina D3. Bez dovoljno kalcijuma ili UVB zracenja (koje omogucava sintezu D3), organizam izvlaci kalcijum iz kostiju, cineci ih mekim i lomljivim.',
    affectedSpecies: [PetType.terrarium],
    icon: '🦴',
    symptoms: ['Omeksana donja vilica (rubber jaw)', 'Krive ili otecene noge', 'Grbe na kicmi ili repu', 'Podrhtavanje misica (twitching)', 'Nemogucnost podizanja tela od podloge', 'Lomovi kostiju pri minimalnom naporu'],
    guidelines: [
      DietaryGuideline(nutrient: 'Kalcijum', recommendation: 'high', reason: 'Neophodan za cvrstinu kostiju.'),
      DietaryGuideline(nutrient: 'Vitamin D3', recommendation: 'high', reason: 'Omogucava apsorpciju kalcijuma iz creva.'),
      DietaryGuideline(nutrient: 'Fosfor', recommendation: 'low', reason: 'Visok fosfor blokira apsorpciju kalcijuma.'),
    ],
    goodIngredients: ['insekti posuti kalcijumom', 'sargarepa', 'tamno zeleno lisnato povrce', 'UVB svetlo'],
    badIngredients: ['spanat', 'blitva (sadrze oksalate)', 'meso bez kostiju'],
    treatment: 'Lecenje MBD-a zahteva hitnu korekciju ishrane i osvetljenja. Veterinar moze primeniti injekcije kalcijum-glukonata i oralne suplemente vitamina D3. Neophodno je instalirati nove UVB lampe odgovarajuceg spektra (5.0 ili 10.0 zavisno od vrste) i obezbediti toplotni gradijent. U slucaju preloma, potrebna je stabilizacija udova. Oporavak je dug i deformiteti kostiju mogu ostati trajni, ali se progresija bolesti moze zaustaviti pravovremenom terapijom.',
  ),
  PetCondition(
    id: 'ich',
    name: 'Ihtioftirioza (Ich / Bela tackasta bolest)',
    category: ConditionCategory.exotic,
    description: 'Ihtioftirioza je najcesca parazitska bolest akvarijumskih riba izazvana protozoom Ichthyophthirius multifiliis. Parazit se uvlaci pod kozu ribe, hrane se tkivom i stvara karakteristicne bele tackice. Bolest je visoko zarazna i moze brzo ubiti celu populaciju u akvarijumu.',
    affectedSpecies: [PetType.aquarium],
    icon: '⚪',
    symptoms: ['Male bele tackice (velicine soli) po telu i perajima', 'Cesanje riba o predmete u akvarijumu', 'Ubrzano disanje (paraziti na skrgama)', 'Sklapanje peraja', 'Letargija i gubitak apetita'],
    guidelines: [
      DietaryGuideline(nutrient: 'Vitamin C', recommendation: 'high', reason: 'Jaca imunitet za borbu protiv parazita.'),
      DietaryGuideline(nutrient: 'Beli luk (Allicin)', recommendation: 'moderate', reason: 'Prirodno antiparazitsko dejstvo.'),
    ],
    goodIngredients: ['hrana natopljena vitaminima', 'spirulina', 'sveza visokokvalitetna hrana'],
    badIngredients: ['stara hrana', 'niskokvalitetni peleti'],
    treatment: 'Lecenje se mora sprovesti u celom akvarijumu. Najefikasnija je upotreba lekova na bazi malahit zelenog i formalina. Temperatura vode se postepeno podize na 28-30°C kako bi se ubrzao zivotni ciklus parazita i ucinio ga ranjivim na lekove. Dodavanje akvarijumske soli (1-3g po litru) pomaze u osmoregulaciji i smanjenju stresa kod riba. Terapija obicno traje 10-14 dana. Pre upotrebe lekova, obavezno ukloniti aktivni ugalj iz filtera.',
  ),
  PetCondition(
    id: 'reptile_parasites',
    name: 'Unutrasnji paraziti reptila',
    category: ConditionCategory.exotic,
    description: 'Infekcije crvima i protozoama su veoma ceste kod reptila, narocito onih koji se hrane zivim plenom ili insektima. Paraziti kradu hranljive materije, ostecuju sluznicu creva i mogu izazvati potpunu opstrukciju ili smrt usled sekundarnih infekcija.',
    affectedSpecies: [PetType.terrarium],
    icon: '🐛',
    symptoms: ['Gubitak tezine uprkos jelu', 'Povracanje hrane', 'Proliv ili abnormalno smrdljiv izmet', 'Nadut stomak', 'Letargija'],
    guidelines: [
      DietaryGuideline(nutrient: 'Proteini', recommendation: 'high', reason: 'Nadoknada gubitka proteina usled parazitizma.'),
      DietaryGuideline(nutrient: 'Vitamin A', recommendation: 'high', reason: 'Podrzava imunitet i zdravlje sluznica.'),
      DietaryGuideline(nutrient: 'Kalcijum', recommendation: 'high', reason: 'Odrzava opste zdravlje tokom oporavka.'),
    ],
    goodIngredients: ['insekti posuti vitaminima i kalcijumom', 'kvalitetni pelet', 'svezo povrce', 'celi plen za zmije'],
    badIngredients: ['divlje uhvaceni insekti (mogu nositi parazite)', 'hrana bez suplemenata'],
    treatment: 'Lecenje parazitskih infekcija kod reptila zavisi od vrste parazita identifikovane mikroskopskim pregledom izmeta. Fenbendazol (Panacur) je antihelmentik prvog izbora za nematode i daje se oralno u dozi od 50-100 mg/kg, ponovljeno nakon 2 nedelje. Prazikvantel se koristi za cestode i trematode. Metronidazol je efikasan protiv protozoa poput Entamoeba i Giardia. Ponazuril (Toltrazuril) se koristi za lecenje kokcidioze. Cryptosporidium je najtezi za lecenje i cesto je neizleciv — Paromomicin se koristi ali sa ogranicenim uspehom. Za spoljasnje parazite (grinje), Ivermektin se daje injekciono ili se koristi Fipronil sprej na kozu, a terarijum se temeljno dezinfikuje.',
  ),
];
