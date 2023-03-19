import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../core/models/category_model copy.dart';
import '../../core/models/category_model.dart';
import '../../core/models/subcategory_model.dart';
import '../../core/services/category_db_service.dart';

class AddNGORequirements extends StatefulWidget {
  final CategoryModel2 selectedCategory;
  final int selectedSubCategory;
  final String docRef;

  AddNGORequirements(
      {required this.selectedCategory,
      required this.selectedSubCategory,
      required this.docRef});

  @override
  State<AddNGORequirements> createState() => _AddNGORequirementsState();
}

class _AddNGORequirementsState extends State<AddNGORequirements> {
  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();

  static const List<String> listOccurance = <String>[
    'Zilnic',
    'Saptamanal',
    'Lunar',
    'O singura data'
  ];

  String dropdownValue = listOccurance.first;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
        children: [
          Text("Adauga cerintele ONG-ului"),
          Text(
            "${this.widget.selectedCategory.name} > ${this.widget.selectedCategory.subcategory![widget.selectedSubCategory].name}",
            style: TextStyle(fontSize: 16),
          )
        ],
      )),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: myController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              decoration: InputDecoration(labelText: 'Cantitate'),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items:
                  listOccurance.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(myController.text);
            CategoryModel2 updatedTotal = widget.selectedCategory;
            updatedTotal.subcategory![widget.selectedSubCategory].total =
                int.parse(myController.text);
            DatabaseServiceCategory().update(widget.docRef, updatedTotal);
          },
          child: const Icon(Icons.save)),
    );
  }
}
