import 'package:fitness/screens/home/homeFabOptions/addExerciseSplit/createNewSplit.dart';
import 'package:flutter/material.dart';

class NameSplit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NameSplit();
}

class _NameSplit extends State<NameSplit> {
  final splitNameController = TextEditingController();
  final exerciseNameController = TextEditingController(text: 'Exercise here');
  final setCountController = TextEditingController(text: 'Sets');
  final repCountController = TextEditingController(text: 'Reps');

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Split'),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '*Please enter a name.';
                }
                return null;
              },
              obscureText: false,
              decoration: const InputDecoration(labelText: 'Split Name'),
              controller: splitNameController,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Go!'),
                onPressed: () async {
                  final value = _formKey.currentState!.validate();
                  if (value) {
                    String? name = splitNameController.text.trim();
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateSplit(name: name)));
                  }
                  setState(() {});
                },
              ),
            ], // children
          ),
        ], // children
      ),
    );
  }
}
