import 'package:flutter/material.dart';
import 'package:konverter_suhu/provider/temperature_dropdown.dart';
import 'package:provider/provider.dart';

class TempDropdown extends StatelessWidget {
  const TempDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TemperatureDropdown>(
      builder: (
        final BuildContext context,
        final TemperatureDropdown temperatureDropdown,
        final Widget? child,
      ) {
        return DropdownButton<String>(
          isExpanded: true,
          value: temperatureDropdown.selectedItem,
          onChanged: (String? newValue) {
            temperatureDropdown.selected = newValue!;
          },
          items: temperatureDropdown.listItem.map<DropdownMenuItem<String>>(
            (final String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
