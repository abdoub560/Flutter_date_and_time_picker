import 'package:flutter/material.dart';
import 'package:learning/widgets/button_header_widget.dart';

class TimePickerWidget extends StatefulWidget {
  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay? time;

  String get textToShow {
    return time == null
        ? "select Time"
        : "${time!.hour.toString().padLeft(2,"0")}:${time!.minute.toString().padLeft(2,"0")}";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonHeaderWidget("time", textToShow, () => pickTime(context)),
    );
  }

  Future pickTime(BuildContext context) async {
    final initialTime = time == null ? TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute) : time!;
    final newTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (newTime == null) return;
    setState(() => time = newTime);
  }
}
