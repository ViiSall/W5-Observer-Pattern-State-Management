import 'package:w5_observer_pattern_state_management/EXERCISE-1/models/ride_pref.dart';
import 'package:w5_observer_pattern_state_management/EXERCISE-1/services/ride_pref_listener.dart';

class RidePreferenceService {
  RidePreference? _ridePreference;
  final List<RidePreferencesListener> _listeners = [];

  void addListener(RidePreferencesListener ridePreferencesListener) {
    _listeners.add(ridePreferencesListener);
  }

  void setRidePreference(RidePreference newRidePreference) {
    _ridePreference = newRidePreference;
    _notifyListeners();
  }

  void _notifyListeners() {
    for (var listener in _listeners) {
      listener.onPreferenceSelected(_ridePreference!);
    }
  }
}