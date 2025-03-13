import 'package:w5_observer_pattern_state_management/EXERCISE-1/models/ride_pref.dart';

abstract class RidePreferencesListener {
  void onPreferenceSelected(RidePreference ridePreference);
}

class ConsoleLogger implements RidePreferencesListener {
  @override
  void onPreferenceSelected(RidePreference ridePreference) {
    print("Logger: Ride preference updated to $ridePreference\n");
  }
}