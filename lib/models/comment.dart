import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class CommentModel {
  final String id, comment;

  CommentModel({
    required this.id,
    required this.comment,
  });
  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);

  factory CommentModel.fromFirebase(DocumentSnapshot snapshot) =>
      CommentModel.fromJson(
          snapshot.data() as Map<String, dynamic>..['id'] = snapshot.id);

  Map<String, dynamic> toFirebase() => toJson().remove('id');
}
