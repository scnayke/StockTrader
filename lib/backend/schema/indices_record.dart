import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'indices_record.g.dart';

abstract class IndicesRecord
    implements Built<IndicesRecord, IndicesRecordBuilder> {
  static Serializer<IndicesRecord> get serializer => _$indicesRecordSerializer;

  @nullable
  String get index;

  @nullable
  String get equity;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(IndicesRecordBuilder builder) => builder
    ..index = ''
    ..equity = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('indices');

  static Stream<IndicesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  IndicesRecord._();
  factory IndicesRecord([void Function(IndicesRecordBuilder) updates]) =
      _$IndicesRecord;

  static IndicesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createIndicesRecordData({
  String index,
  String equity,
}) =>
    serializers.toFirestore(
        IndicesRecord.serializer,
        IndicesRecord((i) => i
          ..index = index
          ..equity = equity));
