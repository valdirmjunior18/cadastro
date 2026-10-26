import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: FormularioExemplo()));

class FormularioExemplo extends StatefulWidget {
  const FormularioExemplo({super.key});

  @override
  State<FormularioExemplo> createState() => _FormularioExemploState();
}

class _FormularioExemploState extends State<FormularioExemplo> {
  final _formKey = GlobalKey<FormState>();
  final _nomeanimal = TextEditingController();
  final _idadeanimal = TextEditingController();
  bool _aceitouTermos = false;
  void _submeterFormulario() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Processando dados de ${_nomeanimal.text}'), backgroundColor: Colors.green,),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro Rápido')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeanimal,
                decoration: const InputDecoration(
                  labelText: 'Nome do Animal',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Informe um nome válido!';
                  }
                  return null;
                },
              ),
             DropdownButtonFormField<String>(
              decoration: const InputDecoration(
              labelText: 'Selecione a espécie do animal!',
              ),
              items: const [
              DropdownMenuItem(
              value: 'gato',
              child: Text('Gato'),
              ),
              DropdownMenuItem(
              value: 'cachorro',
              child: Text('Cachorro'),
              ),
              DropdownMenuItem(
              value: 'leao',
              child: Text('Leão'),
              ),
              DropdownMenuItem(
              value: 'tartaruga',
              child: Text('Tartaruga'),
              ),
              ],
              onChanged: (value) { /* Ação */ },
              validator: (value) =>
              value == null ? 'Selecione...' : null,
              ),

                  TextFormField(
                controller: _idadeanimal,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                labelText: 'Digite a idade do animal',
                border: OutlineInputBorder(),
                ),
                validator: (value) {
                  
                  if (value == null || value.isEmpty) {
                    return 'Informe uma idade correta!';
                  }
                  return null;
                },
              ),
              // Estado da seleção
              // Construção do Widget
              CheckboxListTile(
              title: const Text('Aceito termos'),
              value: _aceitouTermos,
              onChanged: (novoValor) {
              setState(() {
              _aceitouTermos = novoValor ?? false;
              });
              },
              ),




              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submeterFormulario,
                child: const Text('Cadastrar Pet'),
               
              ),
            ],
          ),
        ),
      ),
    );
  }
}