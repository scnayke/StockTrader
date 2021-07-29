import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tickers_record.g.dart';

abstract class TickersRecord
    implements Built<TickersRecord, TickersRecordBuilder> {
  static Serializer<TickersRecord> get serializer => _$tickersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'NAME_OF_COMPANY')
  String get nameOfCompany;

  @nullable
  @BuiltValueField(wireName: 'SERIES')
  String get series;

  @nullable
  @BuiltValueField(wireName: 'SYMBOL')
  String get symbol;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TickersRecordBuilder builder) => builder
    ..nameOfCompany = ''
    ..series = ''
    ..symbol = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tickers');

  static Stream<TickersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TickersRecord._();
  factory TickersRecord([void Function(TickersRecordBuilder) updates]) =
      _$TickersRecord;

  static TickersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createTickersRecordData({
  String nameOfCompany,
  String series,
  String symbol,
}) =>
    serializers.toFirestore(
        TickersRecord.serializer,
        TickersRecord((t) => t
          ..nameOfCompany = nameOfCompany
          ..series = series
          ..symbol = symbol));
