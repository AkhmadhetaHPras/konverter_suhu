import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konverter_suhu/components/button_convert.dart';
import 'package:konverter_suhu/components/list_history.dart';
import 'package:konverter_suhu/components/temp_dropdown.dart';
import 'package:konverter_suhu/provider/history.dart';
import 'package:konverter_suhu/provider/result.dart';
import 'package:konverter_suhu/provider/temperature_dropdown.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Result>(
        create: (_) => Result(),
      ),
      ChangeNotifierProvider<TemperatureDropdown>(
        create: (_) => TemperatureDropdown(),
      ),
      ChangeNotifierProvider<History>(
        create: (_) => History(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController etInput = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Konverter Suhu'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  hintText: "Masukkan Suhu Dalam Celcius"),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: etInput,
              keyboardType: TextInputType.number,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 35),
              width: 200,
              child: const TempDropdown(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  const Text(
                    'Hasil',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '${context.watch<Result>().result}',
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ButtonConvert(etInput: etInput),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Text(
                'Riwayat Konversi',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ),
            Expanded(
              child: ListHistory(list: context.watch<History>().listHasil),
            ),
          ],
        ),
      ),
    );
  }
}
