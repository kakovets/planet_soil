import 'dart:convert';
import 'dart:developer';
import 'package:json_annotation/json_annotation.dart';
part 'region_model.g.dart';

typedef Json = Map<String, dynamic>;

@JsonSerializable()
class RegionModel {
  final String code;
  final String name;
  @JsonKey(name: 'nameEs')
  final String nameSpanish;
  @JsonKey(name: 'nameFr')
  final String nameFrench;
  final String latitude;
  final String longitude;

  RegionModel({
    required this.code,
    required this.name,
    required this.nameSpanish,
    required this.nameFrench,
    required this.latitude,
    required this.longitude,
  });

  factory RegionModel.fromJson(Json json) => _$RegionModelFromJson(json);
  Json toJson() => _$RegionModelToJson(this);
}


// jsonParser with Pattern from previous project

class Note {
  Note.archived({title, text, dateTime});

  factory Note.fromJson(Json json) {
    if (json case {
    'title': String title,
    'text': String text,
    'dateTime': String dtString,
    }) {
      var dt = DateTime.parse(dtString);
      return Note.archived(title: title, text: text, dateTime: dt);
    } else {
      throw const FormatException("Invalid JSON format for Note");
    }
  }
}


// Straight jsonParser from ChatGPT

// Define classes to represent the JSON structure
class Continent {
  final String code;
  final String latitude;
  final String longitude;
  final String name;
  final String nameEs;
  final String nameFr;

  Continent({
    required this.code,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.nameEs,
    required this.nameFr,
  });

  factory Continent.fromJson(Map<String, dynamic> json) {
    return Continent(
      code: json['code'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      name: json['name'],
      nameEs: json['nameEs'],
      nameFr: json['nameFr'],
    );
  }
}

class ContinentList {
  final List<Continent> continents;
  final Map<String, dynamic> meta;

  ContinentList({
    required this.continents,
    required this.meta,
  });

  factory ContinentList.fromJson(Map<String, dynamic> json) {
    List<Continent> continentsList = [];
    json['continents'].forEach((continent) {
      continentsList.add(Continent.fromJson(continent));
    });

    return ContinentList(
      continents: continentsList,
      meta: json['meta'],
    );
  }
}

void parser() {
  // Your JSON string
  String jsonString = '''
  {
    "continents": [
      {
        "code": "eu",
        "latitude": "51",
        "longitude": "10",
        "name": "Europe",
        "nameEs": "Europa",
        "nameFr": "Europe"
      },
      {
        "code": "na",
        "latitude": "51.0000002",
        "longitude": "-109",
        "name": "North America",
        "nameEs": "América del Norte",
        "nameFr": "Amérique du Nord"
      },
      {
        "code": "as",
        "latitude": "51.2086975",
        "longitude": "89.2343748",
        "name": "Asia",
        "nameEs": "Asia",
        "nameFr": "Asie"
      },
      {
        "code": "sa",
        "latitude": "-21.0002179",
        "longitude": "-61.0006565",
        "name": "South America",
        "nameEs": "Sudamerica",
        "nameFr": "Amérique du Sud"
      },
      {
        "code": "oc",
        "latitude": "-18.3128",
        "longitude": "138.5156",
        "name": "Oceania",
        "nameEs": "Oceanía",
        "nameFr": "Océanie"
      },
      {
        "code": "af",
        "latitude": "11.5024338",
        "longitude": "17.7578122",
        "name": "Africa",
        "nameEs": "África",
        "nameFr": "Afrique"
      },
      {
        "code": "an",
        "latitude": "-79.4063075",
        "longitude": "0.3149312",
        "name": "Antarctica",
        "nameEs": "Antártida",
        "nameFr": "Antarctique"
      }
    ],
    "meta": {
      "currentPage": 1,
      "firstPage": 1,
      "lastPage": 1,
      "perPage": 10,
      "total": 7
    }
  }
  ''';

  // Parse the JSON string
  Map<String, dynamic> jsonMap = jsonDecode(jsonString);

  // Convert the parsed JSON into Dart objects
  ContinentList continentList = ContinentList.fromJson(jsonMap);

  // Access the parsed data
  log('Total continents: ${continentList.continents.length}');
  log('First continent: ${continentList.continents[0].name}');
  log('second continent: ${continentList.continents[1].name}');
  log('second continent: ${continentList.continents[1].latitude}');
  log('second continent: ${continentList.continents[1].longitude}');
  log('second continent: ${continentList.continents[1].nameFr}');
  log('second continent: ${continentList.continents[1].nameEs}');
}
