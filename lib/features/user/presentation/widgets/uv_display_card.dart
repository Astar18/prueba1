import 'package:flutter/material.dart';

class UvDisplayCard extends StatelessWidget {
  final double uvIndex;
  final String location;

  const UvDisplayCard({
    super.key, 
    required this.uvIndex, 
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wb_sunny, size: 50, color: Colors.orange),
            const SizedBox(height: 10),
            Text(
              location,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              'Índice UV: $uvIndex',
              style: TextStyle(
                fontSize: 24, 
                color: uvIndex > 8 ? Colors.red : Colors.green,
                fontWeight: FontWeight.w900
              ),
            ),
          ],
        ),
      ),
    );
  }
}