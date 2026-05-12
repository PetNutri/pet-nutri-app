/// Baza veterinarskih ambulanti u Srbiji

class VetClinic {
  final String name;
  final String city;
  final String address;
  final String phone;
  final String? specialization;
  final String? website;

  const VetClinic({
    required this.name,
    required this.city,
    required this.address,
    required this.phone,
    this.specialization,
    this.website,
  });
}

const List<VetClinic> vetDirectory = [
  // ==================== BEOGRAD ====================
  VetClinic(name: 'Vetmedic', city: 'Beograd', address: 'Bulevar Arsenija Carnojevica 99', phone: '011/2601-022', specialization: 'Hirurgija, interna medicina, egzotika', website: 'https://vetmedic.rs'),
  VetClinic(name: 'Veterinarska klinika Djuric', city: 'Beograd', address: 'Vojvode Stepe 326', phone: '011/3971-700', specialization: 'Ortopedija, kardiologija'),
  VetClinic(name: 'Vet Planet', city: 'Beograd', address: 'Bulevar Kralja Aleksandra 311', phone: '011/2413-700', specialization: 'Dermatologija, stomatologija', website: 'https://vetplanet.rs'),
  VetClinic(name: 'Veterinarska ambulanta Banovo Brdo', city: 'Beograd', address: 'Pozeska 83a', phone: '011/3540-210', specialization: 'Opsta praksa'),
  VetClinic(name: 'Vet Expert', city: 'Beograd', address: 'Ustanička 128', phone: '011/3440-440', specialization: 'Egzoticne zivotinje, ptice, gmizavci'),
  VetClinic(name: 'Klinika za male zivotinje FVM', city: 'Beograd', address: 'Bulevar oslobodjenja 18', phone: '011/3615-436', specialization: 'Univerzitetska klinika, sve specijalizacije'),
  VetClinic(name: 'Vetlife', city: 'Beograd', address: 'Jurija Gagarina 221', phone: '011/2284-100', specialization: 'Hirurgija, oftalmologija', website: 'https://vetlife.rs'),
  VetClinic(name: 'Happy Pet', city: 'Beograd', address: 'Vojislava Ilica 72', phone: '011/2430-530', specialization: 'Opsta praksa, vakcinacija'),
  VetClinic(name: 'Vet House', city: 'Beograd', address: 'Brace Jerkovic 119', phone: '011/3975-200', specialization: 'Interna medicina, ultrazvuk'),
  VetClinic(name: 'Aquavet', city: 'Beograd', address: 'Zemunski put 4', phone: '011/3162-170', specialization: 'Akvaristika, ribe, gmizavci'),

  // ==================== NOVI SAD ====================
  VetClinic(name: 'Vetambulantica', city: 'Novi Sad', address: 'Bulevar Cara Lazara 90', phone: '021/6363-500', specialization: 'Hirurgija, stomatologija'),
  VetClinic(name: 'Veterinarska stanica Novi Sad', city: 'Novi Sad', address: 'Rumenacki put 3', phone: '021/4870-300', specialization: 'Opsta praksa, laboratorija'),
  VetClinic(name: 'Vet Centar NS', city: 'Novi Sad', address: 'Futoska 50', phone: '021/557-800', specialization: 'Kardiologija, ortopedija'),
  VetClinic(name: 'Dr Vet', city: 'Novi Sad', address: 'Kisacka 55', phone: '021/452-300', specialization: 'Egzoticne zivotinje'),

  // ==================== NIŠ ====================
  VetClinic(name: 'Vet Klinika Nis', city: 'Nis', address: 'Bulevar Nemanjica 25', phone: '018/511-200', specialization: 'Hirurgija, interna medicina'),
  VetClinic(name: 'Veterinarska ambulanta Mediana', city: 'Nis', address: 'Vizantijski bulevar 12', phone: '018/233-400', specialization: 'Opsta praksa'),
  VetClinic(name: 'Zoo Vet', city: 'Nis', address: 'Cara Dusana 80', phone: '018/522-100', specialization: 'Male zivotinje, vakcinacija'),

  // ==================== KRAGUJEVAC ====================
  VetClinic(name: 'Vet Klinika Kragujevac', city: 'Kragujevac', address: 'Kralja Petra I 18', phone: '034/335-200', specialization: 'Hirurgija, ultrazvuk'),
  VetClinic(name: 'Veterinarska stanica Kragujevac', city: 'Kragujevac', address: 'Industrijska 2', phone: '034/300-500', specialization: 'Opsta praksa, laboratorija'),

  // ==================== SUBOTICA ====================
  VetClinic(name: 'Vet Centar Subotica', city: 'Subotica', address: 'Korzo 10', phone: '024/553-100', specialization: 'Opsta praksa, stomatologija'),
  VetClinic(name: 'Dr Petrovic', city: 'Subotica', address: 'Segedinski put 88', phone: '024/548-200', specialization: 'Hirurgija, ortopedija'),

  // ==================== OSTALI GRADOVI ====================
  VetClinic(name: 'Vet Ambulanta Cacak', city: 'Cacak', address: 'Bulevar oslobodjenja 15', phone: '032/222-100', specialization: 'Opsta praksa'),
  VetClinic(name: 'Veterinarska stanica Zrenjanin', city: 'Zrenjanin', address: 'Cara Dusana 2', phone: '023/511-300', specialization: 'Opsta praksa, laboratorija'),
  VetClinic(name: 'Vet Klinika Pancevo', city: 'Pancevo', address: 'Vojvode Radomira Putnika 22', phone: '013/345-100', specialization: 'Hirurgija, interna medicina'),
  VetClinic(name: 'Veterinarska ambulanta Valjevo', city: 'Valjevo', address: 'Karadjordjeva 50', phone: '014/221-300', specialization: 'Opsta praksa'),
  VetClinic(name: 'Vet Centar Leskovac', city: 'Leskovac', address: 'Bulevar oslobodjenja 44', phone: '016/212-500', specialization: 'Opsta praksa'),
  VetClinic(name: 'Veterinarska stanica Kraljevo', city: 'Kraljevo', address: 'Zelena Gora 4', phone: '036/311-200', specialization: 'Opsta praksa, laboratorija'),
  VetClinic(name: 'Vet Ambulanta Uzice', city: 'Uzice', address: 'Dimitrija Tucovica 30', phone: '031/513-400', specialization: 'Opsta praksa'),
  VetClinic(name: 'Veterinarska stanica Sombor', city: 'Sombor', address: 'Venac Radomira Putnika 8', phone: '025/412-100', specialization: 'Opsta praksa, zivina'),
  VetClinic(name: 'Vet Klinika Jagodina', city: 'Jagodina', address: 'Kneza Lazara 12', phone: '035/222-600', specialization: 'Opsta praksa'),
  VetClinic(name: 'Veterinarska ambulanta Smederevo', city: 'Smederevo', address: 'Karadjordjeva 15', phone: '026/222-100', specialization: 'Opsta praksa'),
];

/// Vraca listu gradova u kojima postoje veterinari
List<String> getVetCities() {
  return vetDirectory.map((v) => v.city).toSet().toList()..sort();
}

/// Vraca veterinare za dati grad
List<VetClinic> getVetsInCity(String city) {
  return vetDirectory.where((v) => v.city == city).toList();
}
