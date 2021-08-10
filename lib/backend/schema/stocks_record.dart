import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'stocks_record.g.dart';

abstract class StocksRecord
    implements Built<StocksRecord, StocksRecordBuilder> {
  static Serializer<StocksRecord> get serializer => _$stocksRecordSerializer;

  @nullable
  String get symbol;

  @nullable
  @BuiltValueField(wireName: 'Name_Of_Company')
  String get nameOfCompany;

  @nullable
  String get series;

  @nullable
  @BuiltValueField(wireName: 'date_Of_Listing')
  DateTime get dateOfListing;

  @nullable
  @BuiltValueField(wireName: 'paid_Up_Value')
  int get paidUpValue;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StocksRecordBuilder builder) => builder
    ..symbol = ''
    ..nameOfCompany = ''
    ..series = ''
    ..paidUpValue = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stocks');

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
  String symbol,
  String nameOfCompany,
  String series,
  DateTime dateOfListing,
  int paidUpValue,
}) =>
    serializers.toFirestore(
        StocksRecord.serializer,
        StocksRecord((s) => s
          ..symbol = symbol
          ..nameOfCompany = nameOfCompany
          ..series = series
          ..dateOfListing = dateOfListing
          ..paidUpValue = paidUpValue));
