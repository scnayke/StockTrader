import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'be_record.g.dart';

abstract class BeRecord implements Built<BeRecord, BeRecordBuilder> {
  static Serializer<BeRecord> get serializer => _$beRecordSerializer;

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

  static void _initializeBuilder(BeRecordBuilder builder) => builder
    ..name = ''
    ..series = ''
    ..symbol = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BE');

  static Stream<BeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BeRecord._();
  factory BeRecord([void Function(BeRecordBuilder) updates]) = _$BeRecord;

  static BeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createBeRecordData({
  String name,
  String series,
  String symbol,
}) =>
    serializers.toFirestore(
        BeRecord.serializer,
        BeRecord((b) => b
          ..name = name
          ..series = series
          ..symbol = symbol));
