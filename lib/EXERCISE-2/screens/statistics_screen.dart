import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w5_observer_pattern_state_management/EXERCISE-2/provider/color_counters_provider.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorCountersProvider>(
      builder: (_, colorCounters, __) {
        return Scaffold(
          appBar: AppBar(title: Text('Statistics')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Red Taps: ${colorCounters.redTapCount}',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  'Blue Taps: ${colorCounters.blueTapCount}',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}