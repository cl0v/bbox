import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'beat.g.dart';

//Vai dar problema no id, pois eu salvo apenas o id do beat.

@JsonSerializable()
class Beat {
  final String id, title;
  final BeatAuthor author;
  final DateTime publishedAt;
  final List<BeatEdit> edits;

  const Beat({
    required this.id,
    required this.title,
    required this.author,
    required this.publishedAt,
    required this.edits,
  });

  factory Beat.fromJson(Map<String, dynamic> json) => _$BeatFromJson(json);

  Map<String, dynamic> toJson() => _$BeatToJson(this);

  factory Beat.fromFirebase(DocumentSnapshot snapshot) => Beat.fromJson(
      snapshot.data() as Map<String, dynamic>..['id'] = snapshot.id);

  Map<String, dynamic> toFirebase() => toJson().remove('id');
}

@JsonSerializable()
//Evidentemente uma subcollection
class BeatEdit {
  final String id;
  final String name;
  final DateTime editedAt;

  BeatEdit({
    required this.id,
    required this.name,
    required this.editedAt,
  });

  factory BeatEdit.fromJson(Map<String, dynamic> json) =>
      _$BeatEditFromJson(json);

  Map<String, dynamic> toJson() => _$BeatEditToJson(this);

  factory BeatEdit.fromFirebase(DocumentSnapshot snapshot) => BeatEdit.fromJson(
      snapshot.data() as Map<String, dynamic>..['id'] = snapshot.id);

  Map<String, dynamic> toFirebase() => toJson().remove('id');
}

@JsonSerializable()
// Collection
class BeatAuthor {
  final String id;

  /// Nome escolhido (MC/DJ)
  final String nickName;

  /// Foto do perfil
  final String profileSmallPicture;
  BeatAuthor({
    required this.id,
    required this.nickName,
    required this.profileSmallPicture,
  });

  factory BeatAuthor.fromJson(Map<String, dynamic> json) =>
      _$BeatAuthorFromJson(json);

  Map<String, dynamic> toJson() => _$BeatAuthorToJson(this);

  factory BeatAuthor.fromFirebase(DocumentSnapshot snapshot) =>
      BeatAuthor.fromJson(
          snapshot.data() as Map<String, dynamic>..['id'] = snapshot.id);

  Map<String, dynamic> toFirebase() => toJson().remove('id');
}
