import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'eq_record.g.dart';

abstract class EqRecord implements Built<EqRecord, EqRecordBuilder> {
  static Serializer<EqRecord> get serializer => _$eqRecordSerializer;

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

  static void _initializeBuilder(EqRecordBuilder builder) => builder
    ..name = ''
    ..series = ''
    ..symbol = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('EQ');

  static Stream<EqRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  EqRecord._();
  factory EqRecord([void Function(EqRecordBuilder) updates]) = _$EqRecord;

  static EqRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createEqRecordData({
  String name,
  String series,
  String symbol,
}) =>
    serializers.toFirestore(
        EqRecord.serializer,
        EqRecord((e) => e
          ..name = name
          ..series = series
          ..symbol = symbol));
