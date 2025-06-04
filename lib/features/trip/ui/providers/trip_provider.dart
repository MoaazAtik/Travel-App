import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/datasources/trip_local_datasource.dart';
import '../../data/models/trip_model.dart';
import '../../data/repositories/trip_repository_impl.dart';
import '../../domain/entities/trip.dart';
import '../../domain/repositories/trip_repository.dart';
import '../../domain/usecases/add_trip.dart';
import '../../domain/usecases/delete_trip.dart';
import '../../domain/usecases/get_trips.dart';

// Data source
final tripLocalDataSourceProvider = Provider<TripLocalDataSource>((ref) {
  final Box<TripModel> tripBox = Hive.box('trips');
  return TripLocalDataSource(tripBox);
});

// Repository
final tripRepositoryProvider = Provider<TripRepository>((ref) {
  final localDataSource = ref.read(tripLocalDataSourceProvider);
  return TripRepositoryImpl(localDataSource);
});

// Use cases
final addTripProvider = Provider<AddTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return AddTrip(repository);
});

final getTripsProvider = Provider<GetTrips>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return GetTrips(repository);
});

final deleteTripProvider = Provider<DeleteTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return DeleteTrip(repository);
});

// Notifier Provider
// This provider will manage fetching trips from the repository.
final tripListNotifierProvider =
    StateNotifierProvider<TripListNotifier, List<Trip>>((ref) {
      final getTrips = ref.read(getTripsProvider);
      final addTrip = ref.read(addTripProvider);
      final deleteTrip = ref.read(deleteTripProvider);

      return TripListNotifier(getTrips, addTrip, deleteTrip);
    });

// Notifier
class TripListNotifier extends StateNotifier<List<Trip>> {
  final GetTrips _getTrips;
  final AddTrip _addTrip;
  final DeleteTrip _deleteTrip;

  TripListNotifier(this._getTrips, this._addTrip, this._deleteTrip)
    : super([]) {
    // Call loadTrips() when the notifier is created to initialize the state.
    loadTrips();
  }

  Future<void> addNewTrip(Trip trip) async {
    await _addTrip(trip);
    /* equivalent to: await _addTrip.call(trip);
    because '.call' automatically gets called. */
    // Call loadTrips() to update the state in Uni-directional Data Flow.
    loadTrips();
  }

  Future<void> removeTrip(int tripId) async {
    await _deleteTrip(tripId);
    // Call loadTrips() to update the state in Uni-directional Data Flow.
    loadTrips();
  }

  Future<void> loadTrips() async {
    state = await _getTrips();
  }

  Future<void> searchTrips(String query) async {
    state = await _getTrips();
    final list = state
        .where(
          (trip) =>
              trip.title.toLowerCase().contains(query) ||
              trip.location.toLowerCase().contains(query),
        )
        .toList();

    state = list.isEmpty ? state : list;
  }
}
