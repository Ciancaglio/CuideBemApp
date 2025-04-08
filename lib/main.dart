import 'package:cuidabemapp/screens/perfil_paciente_screen.dart';
import 'package:flutter/material.dart';
import 'screens/boas_vindas_screen.dart';
import 'screens/registrar_observacao_screen.dart';
import 'screens/diario_paciente_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cuidabemapp/models/observacao_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ObservacaoAdapter());
  await Hive.openBox<Observacao>('observacoes');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CuidaBem',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => const BoasVindasScreen(),
        '/registrar': (context) => const RegistrarObservacaoScreen(),
        '/diario': (context) => const DiarioPacienteScreen(),
        '/perfil': (context) => const PerfilPacienteScreen(),
      },
    );
  }
}

