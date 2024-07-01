// reservation_screen.dart
import 'package:flutter/material.dart';
import 'restaurant.dart';

class ReservationScreen extends StatefulWidget {
  final Restaurant restaurant;

  ReservationScreen({required this.restaurant});

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  int selectedTable = 1;
  DateTime selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation for ${widget.restaurant.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Select a Table:'),
            DropdownButton<int>(
              value: selectedTable,
              onChanged: (value) {
                setState(() {
                  selectedTable = value!;
                });
              },
              items: List.generate(10, (index) => index + 1).map((tableNumber) {
                return DropdownMenuItem<int>(
                  value: tableNumber,
                  child: Text('Table $tableNumber'),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text('Select a Date and Time:'),
            ElevatedButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 2)),
                );
                if (picked != null) {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    setState(() {
                      selectedDateTime = DateTime(
                        picked.year,
                        picked.month,
                        picked.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );
                    });
                  }
                }
              },
              child: Text('Pick Date and Time'),
            ),
            SizedBox(height: 16),
            Text('Selected Table: $selectedTable'),
            Text('Selected Date and Time: ${selectedDateTime.toString()}'),
          ],
        ),
      ),
    );
  }
}
