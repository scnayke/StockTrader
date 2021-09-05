import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'stocks_record.g.dart';

abstract class StocksRecord
    implements Built<StocksRecord, StocksRecordBuilder> {
  static Serializer<StocksRecord> get serializer => _$stocksRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get symbol;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StocksRecordBuilder builder) => builder
    ..name = ''
    ..symbol = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Stocks');

  static Stream<StocksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  StocksRecord._();
  factory StocksRecord([void Function(StocksRecordBuilder) updates]) =
      _$StocksRecord;

  static StocksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createStocksRecordData({
  String name,
  String symbol,
}) =>
    serializers.toFirestore(
        StocksRecord.serializer,
        StocksRecord((s) => s
          ..name = name
          ..symbol = symbol));
