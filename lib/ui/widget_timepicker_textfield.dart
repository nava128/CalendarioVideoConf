import 'package:flutter/material.dart';
import 'package:nava/ui/cls_colores.dart';
import 'package:intl/intl.dart';

String convertDate(DateTime dateTime) {
  return DateFormat('dd/MM/yyyy').format(dateTime);
}

String longDate(DateTime dateTime) {
  return DateFormat('EEE, MMM d, yyy').format(dateTime);
}

String convertTime(TimeOfDay timeOfDay) {
  DateTime tempDate = DateFormat('hh:mm').parse(timeOfDay.hour.toString() + ':' + timeOfDay.minute.toString());
  var dateFormat = DateFormat('h:mm a');
  return dateFormat.format(tempDate);
}

Widget buildDateTimePicker(String data) {
  return ListTile(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: const BorderSide(color: AppColors.eggPlant, width: 1.5),
    ),
    title: Text(data),
    trailing: const Icon(
      Icons.calendar_today,
      color: AppColors.eggPlant,
    ),
  );
}

Widget buildTextField({String? hint, required TextEditingController controller}) {
  return TextField(
    controller: controller,
    textCapitalization: TextCapitalization.words,
    decoration: InputDecoration(
      labelText: hint ?? '',
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.eggPlant, width: 1.5),
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.eggPlant, width: 1.5),
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
    ),
  );
}
