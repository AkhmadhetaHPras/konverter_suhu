import 'package:flutter/material.dart';

class ListHistory extends StatelessWidget {
  const ListHistory({super.key, required this.list});

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Text(
              '${index + 1}.   ${list[index]}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
