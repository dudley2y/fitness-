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
  final TextEditingController repCtl = TextEditingController();
  final TextEditingController weightCtl = TextEditingController();
  final TextEditingController timeCtl = TextEditingController();
  final _setFormKey = GlobalKey<FormState>();
  final _repFormKey = GlobalKey<FormState>();
  final _weightFormKey = GlobalKey<FormState>();
  final _timeFormKey = GlobalKey<FormState>();

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
  int _reps = 0;
  int _weight = 0;
  String _time = '';
  List<String> vrepsList = [];
  List<List<String>> circutList = [];

  @override
  Widget build(BuildContext context) {
    final Form _setForm = Form(
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
          onEditingComplete: () {
            try {
              _sets = int.parse(setCtl.text.trim());
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

    final Form _repForm = Form(
        onChanged: () => _repFormKey.currentState!.validate(),
        key: _repFormKey,
        child: TextFormField(
          onFieldSubmitted: (value) {
            try {
              _reps = int.parse(value.trim());
            } on FormatException {
              _reps = 0;
            }
            setState(() {});
          },
          onEditingComplete: () {
            try {
              _reps = int.parse(repCtl.text.trim());
            } on FormatException {
              _reps = 0;
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
          decoration: const InputDecoration(labelText: 'Number of reps'),
          controller: repCtl,
        ));

    final Form _weightForm = Form(
        onChanged: () => _weightFormKey.currentState!.validate(),
        key: _weightFormKey,
        child: TextFormField(
          onFieldSubmitted: (value) {
            try {
              _weight = int.parse(value.trim());
            } on FormatException {
              _weight = 0;
            }
            setState(() {});
          },
          onEditingComplete: () {
            try {
              _weight = int.parse(weightCtl.text.trim());
            } on FormatException {
              _weight = 0;
            }
            setState(() {});
          },
          validator: (value) {
            // int x = 0;
            if (value == null || value.isEmpty) {
              _weight = 1;
              return 'Please enter a number';
            }
            try {
              _weight = int.parse(value.trim());
            } on FormatException {
              _weight = 1;
              return 'Please enter a number';
            }
            setState(() {});
          },
          obscureText: false,
          decoration: const InputDecoration(labelText: 'Weight'),
          controller: weightCtl,
        ));

    final Form _timeForm = Form(
        onChanged: () => _timeFormKey.currentState!.validate(),
        key: _timeFormKey,
        child: TextFormField(
          onFieldSubmitted: (value) {
            _time = value.trim();
            setState(() {});
          },
          onEditingComplete: () {
            _time = timeCtl.text.trim();
            setState(() {});
          },
          validator: (value) {
            // int x = 0;
            if (value == null || value.isEmpty) {
              _time = '';
              return 'Please enter a time';
            }
            _time = value.trim();
            setState(() {});
          },
          obscureText: false,
          decoration: const InputDecoration(labelText: 'Time'),
          controller: timeCtl,
        ));

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
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? index) {
                setState(() {
                  dropdownValue = index!;
                  vrepsList.clear();
                  for (var element in circutList) {
                    element.clear();
                  }
                  circutList.clear();
                });
              }),
          dropdownValue ==
                  'Constant Reps' // are there switch cases for widgets?
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
                    children: [_repForm, _setForm, _weightForm],
                  ),
                ])
              : dropdownValue == 'Variable Reps'
                  ? ListView(shrinkWrap: true, children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: excersizeNameCtl,
                              onTap: () => excersizeNameCtl.clear(),
                            ),
                          ),
                          Expanded(
                            child: _setForm,
                          ),
                        ],
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: _setFormKey.currentState!.validate()
                              ? _sets.ceil().clamp(0, 11) // breaks at 7
                              : 0,
                          itemBuilder: (BuildContext context, index) {
                            // print('index: $_sets');
                            return TextField(
                              onSubmitted: (value) {
                                if (vrepsList.length <= index) {
                                  vrepsList.add(value);
                                } else {
                                  vrepsList[index] = value;
                                }
                              },
                            ); // make this not text, make feild
                          })
                    ])
                  : Column(
                      // timed
                      children: [
                        TextField(
                          controller: excersizeNameCtl,
                          onTap: () => excersizeNameCtl.clear(),
                        ),
                        _timeForm,
                      ],
                    )
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
