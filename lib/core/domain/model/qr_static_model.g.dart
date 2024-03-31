// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_static_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QRStaticModelAdapter extends TypeAdapter<QRStaticModel> {
  @override
  final int typeId = 0;

  @override
  QRStaticModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QRStaticModel(
      account: fields[0] as String,
      amount: fields[2] as double,
      motif: fields[3] as String,
      currency: fields[4] as Currency,
    );
  }

  @override
  void write(BinaryWriter writer, QRStaticModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.account)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.motif)
      ..writeByte(4)
      ..write(obj.currency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QRStaticModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
