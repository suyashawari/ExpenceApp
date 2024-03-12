// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import './model/expence.dart';

class NewExpence extends StatefulWidget {
  NewExpence({super.key, required this.addExpence});
  Function(Expence) addExpence;

  @override
  State<NewExpence> createState() => _NewExpenceState();
}

class _NewExpenceState extends State<NewExpence> {
  final _titleValue = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.travel;
  final _amountValue = TextEditingController();
  @override
  void dispose() {
    _titleValue.dispose();
    _amountValue.dispose();
    super.dispose();
  }

  void _persentDatePicker() async {
    final now = DateTime.now();
    final fristDate = DateTime(now.year - 1, now.month - 1, now.day);
    final userDates = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: fristDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = userDates;
    });
  }

  void _submitExpenceData() {
    final enteredAmount=double.tryParse(_amountValue.text);
    bool incorrectAmount = (enteredAmount== null) ||
        (enteredAmount <= 0);
       
    if (_titleValue.text.trim().isEmpty ||
        incorrectAmount ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text("fill all Correctly.."),
              content: const Text("fill the title, amount, date properly... "),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("okey"))
              ],
            );
          });
    }else{
      widget.addExpence(Expence(
        title: _titleValue.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ));
      Navigator.pop(context);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: _titleValue,
              maxLength: 15,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(label: Text("Title")),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(children: [
              Expanded(
                flex: 3,
                child: TextField(
                  keyboardType: TextInputType.number,
                  
                  controller: _amountValue,
                  decoration: const InputDecoration(
                      label: Text("Amount"),
                      prefix: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("\$"))),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Text(_selectedDate != null
                        ? formatter.format(_selectedDate!)
                        : "Select a Date"),
                    IconButton(
                        icon: const Icon(Icons.date_range_outlined),
                        onPressed: _persentDatePicker)
                  ],
                ),
              )
            ]),
            const SizedBox(
              height: 10,
            ),
            Row(children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e.name.toUpperCase()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  }),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(onPressed: (){
               
                _submitExpenceData();}, child: const Text("Add"))
            ])
          ],
        ),
      ),
    );
  }
}
