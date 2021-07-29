import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning/button_header_widget.dart';

class DateTimePickerWidget extends StatefulWidget {
  @override
  _DateTimePickerWidgetState createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  DateTime? dateTime;

  String get textToShow {
    return dateTime == null
        ? "select Date & time"
        : DateFormat('dd/MM/yyyy HH:mm').format(dateTime!);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonHeaderWidget(
          "date & time", textToShow, () => pickDateTime(context)),
    );
  }

  Future pickDateTime(BuildContext context) async {
    final initialDate = dateTime == null ? DateTime.now() : dateTime!;
    final firstDate = initialDate.subtract(Duration(days: 365 * 5));
    final lastDate = initialDate.add(Duration(days: 365 * 5));
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);
    if (newDate == null) return;

    final initialTime = dateTime == null
        ? TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute)
        : TimeOfDay(hour: dateTime!.hour, minute: dateTime!.minute);
    final newTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (newTime == null) return;
    final newDateTime = DateTime(newDate.year,newDate.month,newDate.day,newTime.hour,newTime.minute);

    setState(() => dateTime = newDateTime);
  }
}
