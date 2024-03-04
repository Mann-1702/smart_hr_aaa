import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminSeminarPage extends StatefulWidget {
  @override
  _AdminSeminarPageState createState() => _AdminSeminarPageState();
}

class _AdminSeminarPageState extends State<AdminSeminarPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  void _addSeminarToFirebase() async {
    if (_titleController.text.isNotEmpty &&
        _placeController.text.isNotEmpty &&
        _selectedDate != null) {
      await FirebaseFirestore.instance.collection('Seminar').doc(_titleController.text).set({
        'title': _titleController.text,
        'place': _placeController.text,
        'date': _selectedDate,
      });
      _titleController.clear();
      _placeController.clear();
      setState(() {
        _selectedDate = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Seminar added successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Seminar Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,

              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 300,
                    width: 600,

                    decoration: BoxDecoration(
                      color: Colors.red,

                      boxShadow: [
                        BoxShadow(
                          color: Colors.red,
                          spreadRadius: 8,
                          blurRadius: 0,

                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/sem.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Add New Seminar',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "NexaBold",
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Seminar Title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _placeController,
                    decoration: InputDecoration(
                      labelText: 'Place',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          _selectedDate == null
                              ? 'Select Date'
                              : 'Selected Date: ${_selectedDate!.toString().split(' ')[0]}',
                        ),
                      ),
                      TextButton(
                        onPressed: () => _selectDate(context),
                        child: Text(
                          'Choose Date',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _addSeminarToFirebase,
                    child: Text('Add Seminar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
