import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bz_record.g.dart';

abstract class BzRecord implements Built<BzRecord, BzRecordBuilder> {
  static Serializer<BzRecord> get serializer => _$bzRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'NAME')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'SERIES')
  String get series;

  @nullable
  @BuiltValueField(wireName: 'SYMBOL')
  String get symbol;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BzRecordBuilder builder) => builder
    ..name = ''
    ..series = ''
    ..symbol = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BZ');

  static Stream<BzRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BzRecord._();
  factory BzRecord([void Function(BzRecordBuilder) updates]) = _$BzRecord;

  static BzRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createBzRecordData({
  String name,
  String series,
  String symbol,
}) =>
    serializers.toFirestore(
        BzRecord.serializer,
        BzRecord((b) => b
          ..name = name
          ..series = series
          ..symbol = symbol));
