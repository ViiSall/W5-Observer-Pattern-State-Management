import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w5_observer_pattern_state_management/EXERCISE-2/screens/color_tap_screen.dart';
import 'package:w5_observer_pattern_state_management/EXERCISE-2/provider/color_counters_provider.dart';
import 'package:w5_observer_pattern_state_management/EXERCISE-2/screens/statistics_screen.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ColorCountersProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Home()),
      ),
    ),
  );
}

enum CardType { red, blue }

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorCountersProvider>(
      builder: (_, colorCounters, __) {
        int currentIndex = colorCounters.currentIndex;

        return Scaffold(
          body: currentIndex == 0 ? ColorTapsScreen() : StatisticsScreen(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              colorCounters.changeIndexTo(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.tap_and_play),
                label: 'Taps',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: 'Statistics',
              ),
            ],
          ),
        );
      },
    );
  }
}