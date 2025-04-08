import 'package:hive/hive.dart';

part 'observacao_model.g.dart';

@HiveType(typeId: 0)
class Observacao extends HiveObject {
  @HiveField(0)
  String tipo;

  @HiveField(1)
  String descricao;

  @HiveField(2)
  DateTime horario;

  Observacao({
    required this.tipo,
    required this.descricao,
    required this.horario,
  });
}

