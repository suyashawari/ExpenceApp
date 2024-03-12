

import 'package:expence_tracker/new_expence.dart';
import 'package:expence_tracker/widgets/Chart/chart.dart';
import 'package:expence_tracker/widgets/expence_list.dart';
import 'package:expence_tracker/model/expence.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpenceTracker extends StatefulWidget {
  const ExpenceTracker({super.key});

  @override
  State<ExpenceTracker> createState() => _ExpenceTrackerState();
}

class _ExpenceTrackerState extends State<ExpenceTracker> {
  final List<Expence> _registerExpences = [
    Expence(
        title: "Flutter Course",
        amount: 2000,
        date: DateTime.now(),
        category: Category.food),
    Expence(
        title: "nextjs Course",
        amount: 3000,
        date: DateTime.now(),
        category: Category.stay),
    Expence(
        title: "react Course",
        amount: 7000,
        date: DateTime.now(),
        category: Category.travel),
  ];

  void addExpence(Expence expence) {
    setState(() {
      _registerExpences.add(Expence(
        title: expence.title,
        amount: expence.amount,
        date: expence.date,
        category: expence.category,
      ));
    });
  }

  void deleteExpence(Expence exp) {
    final indexExpence = _registerExpences.indexOf(exp);
    setState(() {
      _registerExpences.remove(exp);
    });
       ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(

      content:const Text(
        "Expence Deleted",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
      duration:const Duration(seconds: 2),
      action: SnackBarAction(
        label: "Undo",
        onPressed: (){
          setState(() {
            _registerExpences.insert(indexExpence, exp);
             
          });
        },
      ),
    ));
  }

  void _openAddExpenceOverlay(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => SizedBox(
            width: double.infinity,
            child: NewExpence(
              addExpence: addExpence,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No expences found ! Start Adding Some"),
    );
    if (_registerExpences.isNotEmpty) {
      mainContent = expenceList(
        expences: _registerExpences,
        deleteExpence: deleteExpence,
      );
    }
    return Scaffold(
      
      appBar: AppBar(
        title:  const Text("Expence Manager",),
        actions: [
         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: IconButton(
                onPressed: () {
                  _openAddExpenceOverlay(context);
                },
                icon: const Icon(Icons.add,size: 39, )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Column(
          children: [
           Padding(
              padding:const EdgeInsets.all(12),
              child: Center(child: Chart(expenses: _registerExpences))),
            Expanded(child: mainContent)
          ],
        ),
      ),
    );
  }
}
