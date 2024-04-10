import 'package:flutter/material.dart';
import 'package:tasktrail/services/firrestore.dart';

class AddJob extends StatefulWidget {
  const AddJob({Key? key}) : super(key: key);

  @override
  State<AddJob> createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  final FirestoreService firestoreService = FirestoreService();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final slotsController = TextEditingController();
  final addressController = TextEditingController();
  final contactController = TextEditingController();
  String? category;
  String ownerEmail = 'sineth2@gmail.com';

  void addJob() async {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        priceController.text.isEmpty ||
        slotsController.text.isEmpty ||
        addressController.text.isEmpty ||
        category == null) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text(
            'Please fill all fields',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      );
      return;
    }

    await firestoreService.addJob(
      titleController.text,
      descriptionController.text,
      int.parse(priceController.text),
      int.parse(slotsController.text),
      addressController.text,
      category!,
      contactController.text,
      ownerEmail,
    );

    // clear fields
    titleController.clear();
    descriptionController.clear();
    priceController.clear();
    slotsController.clear();
    addressController.clear();
    contactController.clear();
    category = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        title: const Text("Add New Job"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Job Title',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: UnderlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: UnderlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: slotsController,
                decoration: const InputDecoration(
                  labelText: 'Available Slots',
                  border: UnderlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: UnderlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: contactController,
                decoration: InputDecoration(
                  labelText: 'Contact',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: category,
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.tertiary,
                ),
                items: <String>['Category 1', 'Category 2', 'Category 3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  print(newValue);
                  setState(() {
                    category = newValue;
                  });
                },
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                child: Text('Submit',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    )),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
                onPressed: addJob,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
