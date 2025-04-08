// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observacao_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ObservacaoAdapter extends TypeAdapter<Observacao> {
  @override
  final int typeId = 0;

  @override
  Observacao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Observacao(
      tipo: fields[0] as String,
      descricao: fields[1] as String,
      horario: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Observacao obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.tipo)
      ..writeByte(1)
      ..write(obj.descricao)
      ..writeByte(2)
      ..write(obj.horario);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ObservacaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
