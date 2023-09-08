import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class CounterDesign extends StatefulWidget {
  const CounterDesign({super.key});

  @override
  State<CounterDesign> createState() => _CounterDesignState();
}

class _CounterDesignState extends State<CounterDesign> {
  String _selectedValue = '';

  void _handleValueSelected(String value) {
    setState(() {
      _selectedValue = value; // Actualiza el valor en la primera pantalla
    });
  }

  int _n = 1;
  int _amt = 2800;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 175.0,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 187, 222, 251),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                height: 52,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.blueGrey[50],
                        foregroundColor: Colors.black),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            onValueSelected:
                                _handleValueSelected, // Pasa la función de retorno de llamada
                          ),
                        ),
                      );
                    },
                    child: Text('$_selectedValue')),
              )),
            ],
          ),
        ),
        const SizedBox(
          width: 18.0,
        ),
        Container(
            child: Text(
          'Total $_amt',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        )),
      ],
    );
  }
}

class SecondScreen extends StatefulWidget {
  final Function(String) onValueSelected;

  SecondScreen({required this.onValueSelected});
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<DateTime?> _rangeDatePickerWithActionButtonsWithValue = [
    DateTime.now(),
    DateTime.now().add(const Duration(days: 5))
  ];

  final config = CalendarDatePicker2WithActionButtonsConfig(
    calendarType: CalendarDatePicker2Type.range,
    disableModePicker: true,
  );

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
              .map((v) => v.toString().replaceAll('00:00:00.000', ''))
              .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate  $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

  String value = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecciona una fecha'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          CalendarDatePicker2WithActionButtons(
            onOkTapped: () => {
              value = _getValueText(
                config.calendarType,
                _rangeDatePickerWithActionButtonsWithValue,
              ),
              widget.onValueSelected(
                  value), // Pasa el valor de vuelta a la primera pantalla
              Navigator.pop(context)
            },
            config: config,
            value: _rangeDatePickerWithActionButtonsWithValue,
            onValueChanged: (dates) => setState(
                () => _rangeDatePickerWithActionButtonsWithValue = dates),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Selection(s):  '),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  _getValueText(
                    config.calendarType,
                    _rangeDatePickerWithActionButtonsWithValue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
