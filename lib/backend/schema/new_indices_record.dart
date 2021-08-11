import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'new_indices_record.g.dart';

abstract class NewIndicesRecord
    implements Built<NewIndicesRecord, NewIndicesRecordBuilder> {
  static Serializer<NewIndicesRecord> get serializer =>
      _$newIndicesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'index_name')
  String get indexName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(NewIndicesRecordBuilder builder) =>
      builder..indexName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('new_indices');

  static Stream<NewIndicesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  NewIndicesRecord._();
  factory NewIndicesRecord([void Function(NewIndicesRecordBuilder) updates]) =
      _$NewIndicesRecord;

  static NewIndicesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createNewIndicesRecordData({
  String indexName,
}) =>
    serializers.toFirestore(NewIndicesRecord.serializer,
        NewIndicesRecord((n) => n..indexName = indexName));
