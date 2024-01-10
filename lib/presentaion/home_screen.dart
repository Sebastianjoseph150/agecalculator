import 'package:agecalculator/provider/age_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Hompage extends StatelessWidget {
  const Hompage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Center(
          child: Text(
            'Age calculator',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Ageprovider ageProvider =
                    Provider.of<Ageprovider>(context, listen: false);

                ageProvider.showCustomDatePicker(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                textStyle: const TextStyle(color: Colors.white),
              ),
              child: const Text(
                'Pick your birth date',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20), 
            Consumer<Ageprovider>(
              builder: (context, ageProvider, _) {
                return Text(
                  'Your Age: ${ageProvider.age}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18, // Adjust font size as needed
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
