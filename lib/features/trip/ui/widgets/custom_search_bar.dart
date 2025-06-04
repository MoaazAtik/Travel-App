import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/trip_provider.dart';

class CustomSearchBar extends ConsumerWidget {
  CustomSearchBar({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search destination...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              ref
                  .read(tripListNotifierProvider.notifier)
                  .searchTrips(_controller.text);
            },
            icon: Icon(Icons.send),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
