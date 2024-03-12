import 'package:expence_tracker/model/expence.dart';
import 'package:flutter/material.dart';

class ExpenceItem extends StatelessWidget {
  const ExpenceItem({super.key, required this.expenceitem});
  final Expence expenceitem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text(
               " ${expenceitem.title}",
               textAlign: TextAlign.left,
               style: Theme.of(context).textTheme.titleLarge,
             ),
                  
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Expanded(
                  flex: 1,
                  child: Text("\$ ${expenceitem.amount.toStringAsFixed(2)}")),
             
              Expanded(
                  flex: 1,
                  child: Row(children: [
                    Icon(categoryitem[Category.travel]),
                    Text(expenceitem.formattedDate)
                  ])),
            ]),
          ])),
    );
  }
}
