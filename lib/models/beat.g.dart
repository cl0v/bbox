// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Beat _$BeatFromJson(Map<String, dynamic> json) => Beat(
      id: json['id'] as String,
      title: json['name'] as String,
      author: BeatAuthor.fromJson(json['author'] as Map<String, dynamic>),
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      edits: (json['edits'] as List<dynamic>)
          .map((e) => BeatEdit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BeatToJson(Beat instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.title,
      'author': instance.author,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'edits': instance.edits,
    };

BeatEdit _$BeatEditFromJson(Map<String, dynamic> json) => BeatEdit(
      id: json['id'] as String,
      name: json['name'] as String,
      editedAt: DateTime.parse(json['editedAt'] as String),
    );

Map<String, dynamic> _$BeatEditToJson(BeatEdit instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'editedAt': instance.editedAt.toIso8601String(),
    };

BeatAuthor _$BeatAuthorFromJson(Map<String, dynamic> json) => BeatAuthor(
      id: json['id'] as String,
      nickName: json['nickName'] as String,
      profileSmallPicture: json['profileSmallPicture'] as String,
    );

Map<String, dynamic> _$BeatAuthorToJson(BeatAuthor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickName': instance.nickName,
      'profileSmallPicture': instance.profileSmallPicture,
    };
