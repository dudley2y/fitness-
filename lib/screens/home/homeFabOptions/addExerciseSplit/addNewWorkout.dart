import 'dart:html';

import 'package:fitness/models/makeABetterName.dart';
import 'package:flutter/material.dart';

class AddNewWorkout extends StatefulWidget {
  AddNewWorkout({Key? key, required this.metaList, required this.day})
      : super(key: key);
  List<List<ExcerciseMeta>> metaList;
  int day;

  @override
  _AddNewWorkoutState createState() => _AddNewWorkoutState();
}

class _AddNewWorkoutState extends State<AddNewWorkout> {
  List<Widget> workoutList = [];
  final TextEditingController excersizeNameCtl =
      TextEditingController(text: 'Excercise Name Here');
  final TextEditingController setCtl = TextEditingController();
  final TextEditingController repCtl = TextEditingController(text: 'Reps');
  final TextEditingController weightCtl = TextEditingController(text: 'Weight');
  final _setFormKey = GlobalKey<FormState>();

  String dropdownValue = 'Constant Reps';
  ElevatedButton addWorkoutButton = ElevatedButton(
    onPressed: () {},
    child: const Text('1'),
  );
/*
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
          )
*/
  int _sets = 0;

  @override
  Widget build(BuildContext context) {
    final TextField _repTextFeild = TextField(
      controller: repCtl,
      onTap: () => repCtl.clear(),
    );
    final Form setForm = Form(
        onChanged: () => _setFormKey.currentState!.validate(),
        key: _setFormKey,
        child: TextFormField(
          onFieldSubmitted: (value) {
            try {
              _sets = int.parse(value.trim());
            } on FormatException {
              _sets = 0;
            }
            setState(() {});
          },
          validator: (value) {
            // int x = 0;
            if (value == null || value.isEmpty) {
              _sets = 1;
              return 'Please enter a number';
            }
            try {
              _sets = int.parse(value.trim());
            } on FormatException {
              _sets = 1;
              return 'Please enter a number';
            }
            setState(() {});
          },
          obscureText: false,
          decoration: const InputDecoration(labelText: 'Number of sets'),
          controller: setCtl,
        ));
    final TextField _weightTextFeild = TextField(
      controller: weightCtl,
      onTap: () => weightCtl.clear(),
    );

    String name = '', reps = '', sets = '';
    return Scaffold(
      appBar: AppBar(title: const Text('Adding workout!')),
      body: Column(
        children: [
          DropdownButton(
              value: dropdownValue,
              items: <String>[
                'Constant Reps',
                'Variable Reps',
                'Timed',
                'Circut'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? index) {
                setState(() {
                  dropdownValue = index!;
                });
              }),
          dropdownValue == 'Constant Reps'
              ? Column(children: [
                  TextField(
                    controller: excersizeNameCtl,
                    onTap: () => excersizeNameCtl.clear(),
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 2,
                    children: [_repTextFeild, setForm, _weightTextFeild],
                  ),
                ])
              : dropdownValue == 'Variable Reps'
                  ? Column(children: [
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 2,
                        children: [
                          TextField(
                            controller: excersizeNameCtl,
                            onTap: () => excersizeNameCtl.clear(),
                          ),
                          setForm
                        ],
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: _setFormKey.currentState!.validate()
                              ? _sets.ceil().clamp(0, 20)
                              : 1,
                          itemBuilder: (BuildContext context, index) {
                            // print('index: $_sets');
                            return const Text('foo');
                          })
                    ])
                  : Text('bar'),
        ],
      ),
    );
  }
}

/** 
 * use validator in leiu of controllers, see signup
 * check for docs.length, if not 0, display, otherwise we show default
 * see foo.dart for example
 */
