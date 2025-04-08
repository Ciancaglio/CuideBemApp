import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/observacao_model.dart';
 // Certifique-se de ter esse import

class RegistrarObservacaoScreen extends StatefulWidget {
  const RegistrarObservacaoScreen({super.key});

  @override
  State<RegistrarObservacaoScreen> createState() =>
      _RegistrarObservacaoScreenState();
}

class _RegistrarObservacaoScreenState extends State<RegistrarObservacaoScreen> {
  final _formKey = GlobalKey<FormState>();
  String _sintoma = '';
  double _intensidade = 5;
  String _observacoes = '';

  void _salvarObservacao() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // ✅ Salvar no Hive
      final box = Hive.box<Observacao>('observacoes');
      box.add(
        Observacao(
          tipo: _sintoma,
          descricao: _observacoes,
          horario: DateTime.now(),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Observação salva com sucesso!')),
      );

      // Limpa os campos
      setState(() {
        _sintoma = '';
        _intensidade = 5;
        _observacoes = '';
      });

      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Observação')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Sintoma'),
                onSaved: (value) => _sintoma = value ?? '',
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Informe o sintoma'
                            : null,
              ),
              const SizedBox(height: 16),
              Text('Intensidade: ${_intensidade.round()}'),
              Slider(
                min: 0,
                max: 10,
                divisions: 10,
                label: _intensidade.round().toString(),
                value: _intensidade,
                onChanged: (value) {
                  setState(() {
                    _intensidade = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Observações'),
                maxLines: 4,
                onSaved: (value) => _observacoes = value ?? '',
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _salvarObservacao,
                child: const Text('Salvar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/diario');
                },
                child: const Text('Ver Diário do Paciente'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/perfil');
                },
                child: const Text('Ver Perfil do Paciente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

