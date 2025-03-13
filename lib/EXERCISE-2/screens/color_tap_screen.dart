import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w5_observer_pattern_state_management/EXERCISE-2/main.dart';
import 'package:w5_observer_pattern_state_management/EXERCISE-2/provider/color_counters_provider.dart';

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: [ColorTap(type: CardType.red), ColorTap(type: CardType.blue)],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;

  const ColorTap({super.key, required this.type});

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorCountersProvider>(
      builder: (_, colorCounters, __) {
        final tapCount =
            type == CardType.red
                ? colorCounters.redTapCount
                : colorCounters.blueTapCount;
        final onTap =
            type == CardType.red
                ? colorCounters.incrementRedTapCount
                : colorCounters.incrementBlueTapCount;

        return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 100,
            child: Center(
              child: Text(
                'Taps: $tapCount',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}