import 'package:expence_tracker/model/expence.dart';
import 'package:expence_tracker/widgets/expence_item.dart';
import 'package:flutter/material.dart';

class expenceList extends StatelessWidget {
  const expenceList({super.key,required this.expences,required this.deleteExpence});
final List<Expence>expences;
final void Function(Expence) deleteExpence;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: ((context, index) => Dismissible(
      key: ValueKey(expences[index]),
      onDismissed: (direction) => deleteExpence(expences[index]),
       child :ColoredBox(
        color: Colors.transparent,
        child: ExpenceItem(expenceitem: expences[index]))
      // confirmDismiss: (direction){
    
      // },
     )),itemCount: expences.length,);
  }
}