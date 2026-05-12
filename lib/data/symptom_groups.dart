/// Grupisanje simptoma po telesnim sistemima za laksu navigaciju.
/// Symptom grouping by body system for easier navigation.

class SymptomGroup {
  final String id;
  final String nameSr;
  final String nameEn;
  final String icon;
  final List<String> keywordsSr;
  final List<String> keywordsEn;

  const SymptomGroup({
    required this.id,
    required this.nameSr,
    required this.nameEn,
    required this.icon,
    required this.keywordsSr,
    required this.keywordsEn,
  });

  String name(String lang) => lang == 'en' ? nameEn : nameSr;
}

const List<SymptomGroup> symptomGroups = [
  SymptomGroup(
    id: 'digestive',
    nameSr: 'Probavni sistem',
    nameEn: 'Digestive System',
    icon: '🫄',
    keywordsSr: [
      'povracanje', 'proliv', 'dijareja', 'stomak', 'apetit', 'stolica',
      'nadimanje', 'gasovi', 'sluz', 'krv u stolici', 'jedenje trave',
      'podrigivanje', 'crna stolica', 'zatvor', 'naprezanje pri defekaciji',
      'tvrda', 'suva stolica', 'praznjenje creva', 'ispustanje hrane',
      'zvakanje', 'gutanje',
    ],
    keywordsEn: [
      'vomiting', 'diarrhea', 'stomach', 'appetite', 'stool', 'bloat',
      'gas', 'mucus', 'blood in stool', 'eating grass', 'belching',
      'black stool', 'constipation', 'straining', 'hard stool',
      'dropping food', 'chewing', 'swallowing',
    ],
  ),
  SymptomGroup(
    id: 'urinary',
    nameSr: 'Urinarni sistem',
    nameEn: 'Urinary System',
    icon: '💧',
    keywordsSr: [
      'mokrenje', 'mokraca', 'zedj', 'urin', 'krv u mokraci',
      'besika', 'genital', 'posude', 'pesk',
    ],
    keywordsEn: [
      'urination', 'urine', 'thirst', 'blood in urine', 'bladder',
      'genital', 'litter box', 'straining to urinate',
    ],
  ),
  SymptomGroup(
    id: 'skin_coat',
    nameSr: 'Koža i dlaka',
    nameEn: 'Skin & Coat',
    icon: '🐾',
    keywordsSr: [
      'svrab', 'cesanje', 'dlaka', 'koza', 'crvenilo', 'osip',
      'ljuspast', 'perut', 'masna', 'smrdljiv', 'lizanje', 'grickanje',
      'pigmentacija', 'gubitak dlake', 'sapa', 'usiju',
    ],
    keywordsEn: [
      'itch', 'scratch', 'hair', 'skin', 'redness', 'rash', 'flaky',
      'dandruff', 'greasy', 'smelly', 'licking', 'chewing', 'pigment',
      'hair loss', 'paw', 'ear',
    ],
  ),
  SymptomGroup(
    id: 'respiratory',
    nameSr: 'Disajni sistem',
    nameEn: 'Respiratory System',
    icon: '🫁',
    keywordsSr: [
      'disanje', 'kasalj', 'kijanje', 'nos', 'iscedak iz nosa',
      'hropci', 'usta', 'plavicaste desni',
    ],
    keywordsEn: [
      'breathing', 'cough', 'sneeze', 'nose', 'nasal discharge',
      'wheezing', 'mouth', 'blue gums',
    ],
  ),
  SymptomGroup(
    id: 'musculoskeletal',
    nameSr: 'Mišići i zglobovi',
    nameEn: 'Muscles & Joints',
    icon: '🦴',
    keywordsSr: [
      'hramanje', 'ukocenost', 'ustajanje', 'zglobov', 'otecen',
      'skakanje', 'penjanje', 'kretanje', 'paraliza', 'nogu', 'krila',
      'hodanje', 'stopala',
    ],
    keywordsEn: [
      'limping', 'stiffness', 'getting up', 'joint', 'swollen',
      'jumping', 'climbing', 'moving', 'paralysis', 'leg', 'wing',
      'walking', 'foot',
    ],
  ),
  SymptomGroup(
    id: 'neurological',
    nameSr: 'Nervni sistem',
    nameEn: 'Nervous System',
    icon: '🧠',
    keywordsSr: [
      'napadi', 'konvulzije', 'svest', 'drhtanje', 'dezorijentisan',
      'nesvestica', 'uvijanje vrata', 'ravnotez', 'kruzenje',
    ],
    keywordsEn: [
      'seizure', 'convulsion', 'consciousness', 'tremor', 'disoriented',
      'fainting', 'neck twisting', 'balance', 'circling',
    ],
  ),
  SymptomGroup(
    id: 'general',
    nameSr: 'Opšti simptomi',
    nameEn: 'General Symptoms',
    icon: '🌡️',
    keywordsSr: [
      'letargija', 'slabost', 'tezin', 'temperatura', 'dehidracija',
      'zamaranje', 'aktivnost', 'pospanost', 'hladnoc', 'puls',
      'kilogram', 'energij', 'nemir', 'agresivnost', 'ponasanj',
      'skrivanje', 'smrt',
    ],
    keywordsEn: [
      'lethargy', 'weakness', 'weight', 'temperature', 'dehydration',
      'fatigue', 'activity', 'drowsiness', 'cold', 'pulse',
      'overweight', 'energy', 'restless', 'aggression', 'behavior',
      'hiding', 'death',
    ],
  ),
  SymptomGroup(
    id: 'oral_dental',
    nameSr: 'Usta i zubi',
    nameEn: 'Mouth & Teeth',
    icon: '🦷',
    keywordsSr: [
      'zadah', 'desni', 'krvarenje desni', 'zubi', 'pljuvack',
      'miris daha', 'cirevi u ustima',
    ],
    keywordsEn: [
      'breath', 'gums', 'bleeding gums', 'teeth', 'drool',
      'breath odor', 'mouth ulcers',
    ],
  ),
  SymptomGroup(
    id: 'eyes_vision',
    nameSr: 'Oči i vid',
    nameEn: 'Eyes & Vision',
    icon: '👁️',
    keywordsSr: [
      'vid', 'zamucen', 'zutica', 'ociju', 'suzenje', 'zenice',
    ],
    keywordsEn: [
      'vision', 'blurred', 'jaundice', 'eyes', 'tearing', 'pupil',
    ],
  ),
  SymptomGroup(
    id: 'reproductive',
    nameSr: 'Reproduktivni sistem',
    nameEn: 'Reproductive System',
    icon: '🥚',
    keywordsSr: [
      'vagine', 'iscedak', 'jaje', 'nosivost', 'ljuska', 'kloake',
    ],
    keywordsEn: [
      'vaginal', 'discharge', 'egg', 'laying', 'shell', 'cloaca',
    ],
  ),
];

/// Odredjuje grupu za dati simptom na osnovu kljucnih reci.
/// Vraca ID grupe ili 'other' ako ne pripada nijednoj.
String getSymptomGroupId(String symptom, String lang) {
  final lower = symptom.toLowerCase();
  for (final group in symptomGroups) {
    final keywords = lang == 'en' ? group.keywordsEn : group.keywordsSr;
    for (final keyword in keywords) {
      if (lower.contains(keyword)) {
        return group.id;
      }
    }
  }
  return 'other';
}

/// Grupise listu simptoma po telesnim sistemima.
Map<String, List<String>> groupSymptoms(List<String> symptoms, String lang) {
  final grouped = <String, List<String>>{};
  for (final symptom in symptoms) {
    final groupId = getSymptomGroupId(symptom, lang);
    grouped.putIfAbsent(groupId, () => []);
    grouped[groupId]!.add(symptom);
  }
  // Sortiraj simptome unutar svake grupe
  for (final list in grouped.values) {
    list.sort();
  }
  return grouped;
}

/// Vraca SymptomGroup objekat po ID-u.
SymptomGroup? getGroupById(String id) {
  for (final group in symptomGroups) {
    if (group.id == id) return group;
  }
  return null;
}

/// Naziv za "ostalo" grupu.
String otherGroupName(String lang) => lang == 'en' ? 'Other' : 'Ostalo';

/// Ikona za "ostalo" grupu.
String otherGroupIcon = '📋';
