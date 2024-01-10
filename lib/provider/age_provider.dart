

import 'package:flutter/material.dart';

class Ageprovider extends ChangeNotifier {
  late DateTime? _selectedDate; 
  int _age = 0;

  DateTime? get selectedDate => _selectedDate; 
  int get age => _age; 

  Future<void> showCustomDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      _selectedDate = pickedDate;
      final Duration difference = DateTime.now().difference(pickedDate);
      final int calculatedAge = (difference.inDays / 365).floor();

      _age = calculatedAge;

      notifyListeners();
    }
  }
}
