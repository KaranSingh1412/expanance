// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DBTransactionAdapter extends TypeAdapter<DBTransaction> {
  @override
  final int typeId = 0;

  @override
  DBTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DBTransaction(
      title: fields[0] as String,
      amount: fields[1] as double,
      dateOfTransaction: fields[2] as DateTime,
      tags: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, DBTransaction obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.dateOfTransaction)
      ..writeByte(3)
      ..write(obj.tags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DBTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
