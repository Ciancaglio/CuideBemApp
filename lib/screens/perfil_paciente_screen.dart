import 'package:flutter/material.dart';

class PerfilPacienteScreen extends StatelessWidget {
  const PerfilPacienteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil do Paciente')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/paciente.png'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Paulo Almeida',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              '78 anos',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            const ListTile(
              title: Text('Condições médicas'),
              subtitle: Text('Febre alta 39 graus'),
            ),
            const Divider(),
            const ListTile(
              title: Text('Cuidados '),
              subtitle: Text('Assadura limpeza da ferida a cada 3h'),
            ),
            const Divider(),
            const ListTile(
              title: Text('Preferências'),
              subtitle: Text('Administração, diárias, rotina'),
            ),
          ],
        ),
      ),
    );
  }
}
