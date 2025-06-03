import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/trip_provider.dart';

class MyTripsScreen extends ConsumerWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripList = ref.watch(tripListNotifierProvider);

    return ListView.builder(
      itemCount: tripList.length,
      itemBuilder: (context, index) {
        final trip = tripList[index];
        return ListTile(
          title: Text(trip.title),
          subtitle: Text(trip.description),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              ref.read(tripListNotifierProvider.notifier).removeTrip(index);
            },
          ),
        );
      },
    );
  }
}
