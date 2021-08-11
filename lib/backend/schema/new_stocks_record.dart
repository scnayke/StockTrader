import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'new_stocks_record.g.dart';

abstract class NewStocksRecord
    implements Built<NewStocksRecord, NewStocksRecordBuilder> {
  static Serializer<NewStocksRecord> get serializer =>
      _$newStocksRecordSerializer;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'index_name')
  String get indexName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(NewStocksRecordBuilder builder) => builder
    ..name = ''
    ..indexName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('new_stocks');

  static Stream<NewStocksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  NewStocksRecord._();
  factory NewStocksRecord([void Function(NewStocksRecordBuilder) updates]) =
      _$NewStocksRecord;

  static NewStocksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createNewStocksRecordData({
  String name,
  String indexName,
}) =>
    serializers.toFirestore(
        NewStocksRecord.serializer,
        NewStocksRecord((n) => n
          ..name = name
          ..indexName = indexName));
