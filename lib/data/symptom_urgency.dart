/// Sistem za oznacavanje hitnosti simptoma.
/// Simptomi koji zahtevaju hitnu veterinarsku pomoc su oznaceni kao urgent.

enum SymptomUrgency {
  /// Hitno — odmah kod veterinara
  urgent,
  /// Ozbiljno — sto pre kod veterinara (u roku od 24h)
  serious,
  /// Normalno — zakazati pregled
  normal,
}

/// Kljucne reci koje ukazuju na HITNE simptome (odmah kod veterinara)
const List<String> _urgentKeywords = [
  'hitno',
  'nemogucnost mokrenja',
  'kolaps',
  'konvulzije',
  'paraliza',
  'iznenadna smrt',
  'krvarenje',
  'krvav iscedak',
  'plavicaste desni',
  'disanje na usta',
  'nemogucnost disanja',
  'gubitak svesti',
  'trovanje',
  'sok',
  'zadnja paraliza',
  'opstrukcija',
  'prolaps',
  'pucanje',
  'sepsa',
  'nekontrolisano',
  'fatalna',
  'naglo nadut',
  'tvrd stomak',
  'zastoj jaja',
  'blokada',
];

/// Kljucne reci koje ukazuju na OZBILJNE simptome (u roku od 24h)
const List<String> _seriousKeywords = [
  'krv u mokraci',
  'krv u stolici',
  'crna stolica',
  'visoka temperatura',
  'povisena temperatura',
  'dehidracija',
  'jak bol',
  'zutica',
  'tesko disanje',
  'otezano disanje',
  'ubrzano disanje',
  'povracanje',
  'nadut stomak',
  'gubitak tezine',
  'odbijanje hrane',
  'letargija',
  'nesvestica',
  'tremor',
  'drhtanje',
  'oteceni zglobovi',
  'gnojan',
  'neprijatan miris',
  'larve',
];

/// Odredjuje hitnost simptoma na osnovu kljucnih reci.
SymptomUrgency getSymptomUrgency(String symptom) {
  final lower = symptom.toLowerCase();
  
  for (final keyword in _urgentKeywords) {
    if (lower.contains(keyword)) return SymptomUrgency.urgent;
  }
  
  for (final keyword in _seriousKeywords) {
    if (lower.contains(keyword)) return SymptomUrgency.serious;
  }
  
  return SymptomUrgency.normal;
}

/// Ikona za nivo hitnosti
String urgencyIcon(SymptomUrgency urgency) {
  switch (urgency) {
    case SymptomUrgency.urgent: return '🚨';
    case SymptomUrgency.serious: return '⚠️';
    case SymptomUrgency.normal: return '';
  }
}

/// Labela za nivo hitnosti
String urgencyLabel(SymptomUrgency urgency, String lang) {
  switch (urgency) {
    case SymptomUrgency.urgent:
      return lang == 'en' ? 'EMERGENCY' : 'HITNO';
    case SymptomUrgency.serious:
      return lang == 'en' ? 'Serious' : 'Ozbiljno';
    case SymptomUrgency.normal:
      return '';
  }
}
