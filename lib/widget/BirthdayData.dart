import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthdayData extends StatefulWidget {
  final DateTime birthday;
  final ValueChanged<DateTime> onChangedBirthday;

  const BirthdayData({
    required this.birthday,
    required this.onChangedBirthday,
  });

  @override
  _BirthdayDataState createState() => _BirthdayDataState();
}

class _BirthdayDataState extends State<BirthdayData> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    setDate();
  }

  @override
  void didUpdateWidget(covariant BirthdayData oldWidget) {
    super.didUpdateWidget(oldWidget);
    setDate();
  }

  void setDate() {
    if (widget.birthday != null) {
      controller.text = DateFormat.yMd().format(widget.birthday);
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
        controller: controller,
        validator: (value) => value!.isEmpty ? 'Is Required' : null,
        readOnly: true,
        decoration: InputDecoration(
          prefixText: ' ',
          hintText: 'Your birthday',
          prefixIcon: GestureDetector(
              onTap: (){
                selectDate(context);
              },
              child: Icon(Icons.calendar_today_rounded)
          ),
          border: OutlineInputBorder(),
        ),
      );
  }

  Future<void> selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: widget.birthday ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      widget.onChangedBirthday(selectedDate);
    }
  }
}

