import 'package:flutter/material.dart';
import 'package:konverter_suhu/provider/history.dart';
import 'package:konverter_suhu/provider/result.dart';
import 'package:konverter_suhu/provider/temperature_dropdown.dart';
import 'package:provider/provider.dart';

class ButtonConvert extends StatelessWidget {
  const ButtonConvert({super.key, required this.etInput});

  final TextEditingController etInput;

  @override
  Widget build(BuildContext context) {
    return Consumer2<TemperatureDropdown, Result>(
      builder: (
        final BuildContext context,
        final TemperatureDropdown temperatureDropdown,
        final Result result,
        final Widget? child,
      ) {
        return ElevatedButton(
          onPressed: () {
            context.read<Result>().convert(
                temperatureDropdown.selectedItem, double.parse(etInput.text));
            context.read<History>().addListHasil(
                '${etInput.text} Celcius = ${result.result} ${temperatureDropdown.selectedItem}');
          },
          child: const Text(
            'Konversi Suhu',
            style: TextStyle(fontSize: 20),
          ),
        );
      },
    );
  }
}
