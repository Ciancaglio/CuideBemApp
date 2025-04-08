import 'package:flutter/material.dart';

class DiarioPacienteScreen extends StatelessWidget {
  const DiarioPacienteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulando dados locais
    final List<Map<String, dynamic>> observacoes = [
      {
        'sintoma': 'Dor de cabeça',
        'intensidade': 7,
        'observacoes': 'Paciente reclamou logo ao acordar.',
        'data': '07/04/2025',
      },
      {
        'sintoma': 'Confusão mental',
        'intensidade': 5,
        'observacoes': 'Demorou a reconhecer familiares.',
        'data': '06/04/2025',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Diário do Paciente')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: observacoes.length,
        itemBuilder: (context, index) {
          final item = observacoes[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: Text(item['sintoma']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Intensidade: ${item['intensidade']}'),
                  Text('Observações: ${item['observacoes']}'),
                  Text('Data: ${item['data']}'),
                ],
                
              ),
              
              isThreeLine: true,
            ),
            
          );
        },
      ),
      
    );
  }
}
