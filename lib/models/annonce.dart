import 'utilisateur.dart';

class Annonce {
  Utilisateur utilisateur;
  String description;
  String groupSanguin;
  DateTime dateDePublication;
  DateTime? dateDeModification;

  Annonce({
    required this.utilisateur,
    required this.description,
    required this.groupSanguin,
    required this.dateDePublication,
    this.dateDeModification,
  });

  factory Annonce.fromJson(Map<String, dynamic> json) {
    return Annonce(
      utilisateur: Utilisateur.fromJson(json['utilisateur']),
      description: json['description'],
      groupSanguin: json['groupSanguin'],
      dateDePublication: DateTime.parse(json['date_de_publication']),
      dateDeModification: json['date_de_modification'] != null
          ? DateTime.parse(json['date_de_modification'])
          : null,
    );
  }

  static List<Annonce> listfromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => Annonce.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'utilisateur': utilisateur.toJson(),
      'description': description,
      'groupSanguin': groupSanguin,
      'date_de_publication': dateDePublication.toIso8601String(),
      'date_de_modification': dateDeModification?.toIso8601String(),
    };
  }
}

// annonce.fromjson()
