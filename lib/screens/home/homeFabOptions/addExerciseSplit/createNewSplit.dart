import 'package:fitness/models/makeABetterName.dart';
import 'package:fitness/screens/home/globals.dart';
import 'package:fitness/screens/home/homeFab/actionbutton.dart';
import 'package:fitness/screens/home/homeFab/expandablefab.dart';
import 'package:fitness/screens/home/homeFabOptions/addExerciseSplit/addNewWorkout.dart';
import 'package:flutter/material.dart';

import 'exerciseWidget.dart';

class CreateSplit extends StatefulWidget {
  CreateSplit({Key? key, required this.name}) : super(key: key);
  final String name;
  int editDay = viewDay = dayToInt('Sunday');

  final List<List<ExcerciseMeta>> _splitMeta = [[], [], [], [], [], [], []];
  @override
  State<StatefulWidget> createState({name}) => _CreateSplit();
}

class _CreateSplit extends State<CreateSplit> {
  int _selectedIndex = 0;
  void _onBottomNavBarTap(int index) {
    if (index == 0) {
      if (widget.editDay <= 0) return;
      widget.editDay--;
      setState(() {});
      return;
    }
    if (widget.editDay >= 6) return;
    widget.editDay++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // one entry per day;
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Create a workout schedule for ${intToDay(widget.editDay)}'),
        actions: [
          IconButton(
            onPressed: () {
              print('saved?');
            },
            icon: const Icon(Icons.upload_sharp),
            tooltip: 'Save split to cloud',
          ),
        ],
      ),
      floatingActionButton: ActionButton(
        // new workout button
        icon: const Icon(Icons.add_circle_outlined),
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddNewWorkout(
                        metaList: widget._splitMeta,
                        day: widget.editDay,
                      )));

          setState(() {});
        },
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: widget._splitMeta[widget.editDay].length,
        itemBuilder: (BuildContext context, int index) {
          return ExerciseWidget(
            title: widget._splitMeta[widget.editDay][index].name,
            desc: widget._splitMeta[widget.editDay][index].set +
                ' x ' +
                widget._splitMeta[widget.editDay][index].rep,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.arrow_left,
              color: Colors.blue,
            ),
            label: 'left',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.arrow_right,
              color: Colors.blue,
            ),
            label: 'right',
          ),
        ],
        onTap: _onBottomNavBarTap,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
