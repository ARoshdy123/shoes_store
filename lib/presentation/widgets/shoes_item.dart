import 'package:flutter/material.dart';
import 'package:shoes_store/domain/entities/shoes.dart';

/// Widget to display a single shoes item
class ShoeItem extends StatelessWidget {
  final Shoe shoe;

  const ShoeItem({Key? key, required this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              shoe.imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            shoe.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}