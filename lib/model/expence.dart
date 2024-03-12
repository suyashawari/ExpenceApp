// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
 final formatter=DateFormat.yMd();
enum Category { food, travel, work, stay }
const categoryitem={
Category.food:Icons.lunch_dining_sharp,
Category.stay:Icons.explore,
Category.travel:Icons.travel_explore_outlined,
Category.work:Icons.work_sharp
};

class Expence {
  Expence({required this.title, required this.amount, required this.date,required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate{
    return formatter.format(date);
  }
}
class expenceBucket {
  expenceBucket({required this.expences , required this.category});
  final Category category;
  final List<Expence> expences;
  expenceBucket.forCategory(List<Expence>allExpences,this.category):expences=allExpences.where((expence) => expence.category==category).toList();
  double get totalExpence{
    double sum = 0;
    for(final expence in expences){
      sum += expence.amount;
    }
    return sum;
  }
}
