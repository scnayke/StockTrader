import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'neww_stocks_record.g.dart';

abstract class NewwStocksRecord
    implements Built<NewwStocksRecord, NewwStocksRecordBuilder> {
  static Serializer<NewwStocksRecord> get serializer =>
      _$newwStocksRecordSerializer;

  @nullable
  String get name;

  @nullable
  BuiltList<String> get indices;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(NewwStocksRecordBuilder builder) => builder
    ..name = ''
    ..indices = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('neww_stocks');

  static Stream<NewwStocksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  NewwStocksRecord._();
  factory NewwStocksRecord([void Function(NewwStocksRecordBuilder) updates]) =
      _$NewwStocksRecord;

  static NewwStocksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createNewwStocksRecordData({
  String name,
}) =>
    serializers.toFirestore(
        NewwStocksRecord.serializer,
        NewwStocksRecord((n) => n
          ..name = name
          ..indices = null));
