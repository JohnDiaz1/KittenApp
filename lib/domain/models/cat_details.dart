// To parse this JSON data, do
//
//     final catDetails = catDetailsFromJson(jsonString);

import 'dart:convert';

List<CatDetails> catDetailsFromJson(String str) => List<CatDetails>.from(json.decode(str).map((x) => CatDetails.fromJson(x)));

String catDetailsToJson(List<CatDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatDetails {
  Weight weight;
  String id;
  String name;
  String? cfaUrl;
  String? vetstreetUrl;
  String? vcahospitalsUrl;
  String temperament;
  String origin;
  String countryCodes;
  String countryCode;
  String description;
  String lifeSpan;
  int indoor;
  int? lap;
  String? altNames;
  int adaptability;
  int affectionLevel;
  int childFriendly;
  int dogFriendly;
  int energyLevel;
  int grooming;
  int healthIssues;
  int intelligence;
  int sheddingLevel;
  int socialNeeds;
  int strangerFriendly;
  int vocalisation;
  int experimental;
  int hairless;
  int natural;
  int rare;
  int rex;
  int suppressedTail;
  int shortLegs;
  String? wikipediaUrl;
  int hypoallergenic;
  String? referenceImageId;
  CatImage? image;
  int? catFriendly;
  int? bidability;

  CatDetails({
    required this.weight,
    required this.id,
    required this.name,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    this.lap,
    this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    this.wikipediaUrl,
    required this.hypoallergenic,
    this.referenceImageId,
    this.image,
    this.catFriendly,
    this.bidability,
  });

  factory CatDetails.fromJson(Map<String, dynamic> json) => CatDetails(
    weight: Weight.fromJson(json["weight"]),
    id: json["id"],
    name: json["name"],
    cfaUrl: json["cfa_url"] ?? '',
    vetstreetUrl: json["vetstreet_url"] ?? '',
    vcahospitalsUrl: json["vcahospitals_url"] ?? '',
    temperament: json["temperament"],
    origin: json["origin"],
    countryCodes: json["country_codes"],
    countryCode: json["country_code"],
    description: json["description"],
    lifeSpan: json["life_span"],
    indoor: json["indoor"],
    lap: json["lap"] ?? 0,
    altNames: json["alt_names"] ?? '',
    adaptability: json["adaptability"],
    affectionLevel: json["affection_level"],
    childFriendly: json["child_friendly"],
    dogFriendly: json["dog_friendly"],
    energyLevel: json["energy_level"],
    grooming: json["grooming"],
    healthIssues: json["health_issues"],
    intelligence: json["intelligence"],
    sheddingLevel: json["shedding_level"],
    socialNeeds: json["social_needs"],
    strangerFriendly: json["stranger_friendly"],
    vocalisation: json["vocalisation"],
    experimental: json["experimental"],
    hairless: json["hairless"],
    natural: json["natural"],
    rare: json["rare"],
    rex: json["rex"],
    suppressedTail: json["suppressed_tail"],
    shortLegs: json["short_legs"],
    wikipediaUrl: json["wikipedia_url"] ?? '',
    hypoallergenic: json["hypoallergenic"],
    referenceImageId: json["reference_image_id"] ?? '',
    image: json["image"] == null ? null : CatImage.fromJson(json["image"]),
    catFriendly: json["cat_friendly"] ?? 0,
    bidability: json["bidability"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "weight": weight.toJson(),
    "id": id,
    "name": name,
    "cfa_url": cfaUrl,
    "vetstreet_url": vetstreetUrl,
    "vcahospitals_url": vcahospitalsUrl,
    "temperament": temperament,
    "origin": origin,
    "country_codes": countryCodes,
    "country_code": countryCode,
    "description": description,
    "life_span": lifeSpan,
    "indoor": indoor,
    "lap": lap,
    "alt_names": altNames,
    "adaptability": adaptability,
    "affection_level": affectionLevel,
    "child_friendly": childFriendly,
    "dog_friendly": dogFriendly,
    "energy_level": energyLevel,
    "grooming": grooming,
    "health_issues": healthIssues,
    "intelligence": intelligence,
    "shedding_level": sheddingLevel,
    "social_needs": socialNeeds,
    "stranger_friendly": strangerFriendly,
    "vocalisation": vocalisation,
    "experimental": experimental,
    "hairless": hairless,
    "natural": natural,
    "rare": rare,
    "rex": rex,
    "suppressed_tail": suppressedTail,
    "short_legs": shortLegs,
    "wikipedia_url": wikipediaUrl,
    "hypoallergenic": hypoallergenic,
    "reference_image_id": referenceImageId,
    "image": image?.toJson(),
    "cat_friendly": catFriendly,
    "bidability": bidability,
  };
}

class CatImage {
  String id;
  int width;
  int height;
  String url;

  CatImage({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });

  factory CatImage.fromJson(Map<String, dynamic> json) => CatImage(
    id: json["id"],
    width: json["width"],
    height: json["height"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "width": width,
    "height": height,
    "url": url,
  };
}

class Weight {
  String imperial;
  String metric;

  Weight({
    required this.imperial,
    required this.metric,
  });

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
    imperial: json["imperial"],
    metric: json["metric"],
  );

  Map<String, dynamic> toJson() => {
    "imperial": imperial,
    "metric": metric,
  };
}
