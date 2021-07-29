import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning/widgets/button_header_widget.dart';

class DatePickerWidget extends StatefulWidget {
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? date;

  String get textToShow {
    return date == null
        ? "select Date"
        : DateFormat('dd/MM/yyyy').format(date!);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonHeaderWidget("date", textToShow, () => pickDate(context)),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = date == null ? DateTime.now() : date!;
    final firstDate = initialDate.subtract(Duration(days: 365 * 5));
    final lastDate = initialDate.add(Duration(days: 365 * 5));
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);
    if (newDate == null) return;
    setState(() => date = newDate);
  }
}
