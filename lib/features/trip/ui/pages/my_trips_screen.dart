import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/trip_provider.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/travel_card.dart';

class MyTripsScreen extends ConsumerWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripList = ref.watch(tripListNotifierProvider);

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(), // for mobile
      child: Column(
        children: [
          CustomSearchBar(),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(), // necessary for mobile
            itemCount: tripList.length,
            itemBuilder: (context, index) {
              final trip = tripList[index];
              return TravelCard(
                imageUrl: trip.photos[0],
                title: trip.title,
                description: trip.description,
                date: DateFormat.yMMMMd().format(trip.date),
                location: trip.location,
                onDelete: () {
                  ref.read(tripListNotifierProvider.notifier).removeTrip(index);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
