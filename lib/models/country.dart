class Country {


 final String name;

  const Country({required this.name});

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(name: map['name'] as String);
  }

  
}
