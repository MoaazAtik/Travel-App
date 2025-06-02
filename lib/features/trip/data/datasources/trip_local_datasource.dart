/* If I was working with a remote API, this would be where I (interact)
call the remote API with Dio or Http.
In my case, I'm just using Hive. */
import 'package:hive_flutter/hive_flutter.dart';

import '../models/trip_model.dart';

class TripLocalDataSource {
  final Box<TripModel> tripBox;

  TripLocalDataSource(this.tripBox);

  List<TripModel> getTrips() {
    return tripBox.values.toList();
  }

  void addTrip(TripModel trip) {
    tripBox.add(trip);
  }

  void deleteTrip(int index) {
    tripBox.deleteAt(index);
  }
}
