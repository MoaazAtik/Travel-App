import '../../domain/repositories/trip_repository.dart';
import '../entities/trip.dart';

class GetTrips {
  final TripRepository repository;

  GetTrips(this.repository);

  /// This method will be called when the class is instantiated.
  /// Get all trips.
  Future<List<Trip>> call() {
    return repository.getTrips();
  }
}
