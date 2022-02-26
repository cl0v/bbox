import 'package:bbox/models/beat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/comment.dart';

class VoiceRepository extends FirebaseRepository {
  static const _collectionName = 'VOICE';
  VoiceRepository() : super(_collectionName);
}

class BeatRepository extends FirebaseRepository<Beat> {
  static const _collectionName = 'BEAT';
  BeatRepository() : super(_collectionName);
}

class LyricRepository extends FirebaseRepository {
  static const _collectionName = 'LYRIC';
  LyricRepository() : super(_collectionName);
}

class CommentRepository {
  static const _collectionName = 'comments';
  
  Future<void> create(
          DocumentReference<Map<String, dynamic>> doc, CommentModel comment) =>
      doc.collection(_collectionName).add(comment.toFirebase());
}

class FirebaseRepository<T> {
  FirebaseRepository(String collectionName) {
    collection = FirebaseFirestore.instance.collection(collectionName);
  }

  late CollectionReference<Map<String, dynamic>> collection;

  final CommentRepository commentRepository = CommentRepository();

  //TODO: Possivelmente atualizar a tela após comentar.
  //Caso de algum error na publicacao do commentario, exibe uma exclamação para tentar novamente
  Future<void> addComment(String beatId, CommentModel comment) =>
      commentRepository.create(collection.doc(beatId), comment);

  //TODO: Se eu retornar o id, eu posso pelo menos compartilhar o arquivo pelo ID;
  Future<String> add(Map<String, dynamic> firebaseMap) =>
      //TODO: Possivelmente trocar o path para id
      collection.add(firebaseMap).then((value) => value.path);

  Future<List<T>> fetchAll(
          T Function(QueryDocumentSnapshot<Map<String, dynamic>>) onConvert) =>
      collection
          .get()
          .then((value) => value.docs.map<T>((e) => onConvert(e)).toList());
}
