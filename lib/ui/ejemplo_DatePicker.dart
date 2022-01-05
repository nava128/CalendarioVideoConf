import 'package:flutter/material.dart';
import 'package:nava/ui/cls_colores.dart';
import 'package:nava/ui/widget_timepicker_textfield.dart';

class FlutterDatePickerExample extends StatelessWidget {
  final ValueNotifier<DateTime?> dateSub = ValueNotifier(null);
  final ValueNotifier<DateTime?> longDateSub = ValueNotifier(null);
  final ValueNotifier<TimeOfDay?> timeSub = ValueNotifier(null);
  final ValueNotifier<TimeOfDay?> timeSubShort = ValueNotifier(null);
  final TextEditingController meetingName = TextEditingController();
  final TextEditingController meetingLink = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario de VideoConferencias'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              ' Crear Reunion',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(
              height: 20,
            ),
            buildTextField(controller: meetingName, hint: ' Ingrese Nombre de la Reunion'),
            const SizedBox(
              height: 20,
            ),
            buildTextField(controller: meetingLink, hint: ' Ingrese el Link de la reunion'),
            const SizedBox(
              height: 10,
            ),
            const Text(
               'Fecha Corta',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18.0),
            ),
            ValueListenableBuilder<DateTime?>(
                valueListenable: dateSub,
                builder: (context, dateVal, child) {
                  return InkWell(
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050),
                            currentDate: DateTime.now(),
                            initialEntryMode: DatePickerEntryMode.calendar,
                            initialDatePickerMode: DatePickerMode.day,
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
                                      primary: Colors.blueGrey,
                                      onSurface: AppColors.blackCoffee,
                                    )
                                ),
                                child: child!,
                              );
                            });
                        dateSub.value = date;
                      },
                      child: buildDateTimePicker(
                          dateVal != null ? convertDate(dateVal) : ''));
                }),
            const SizedBox(
              height: 10,
            ),
            const Text(
              ' Formato del horario 12 hrs.',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18.0),
            ),
            ValueListenableBuilder<TimeOfDay?>(
                valueListenable: timeSubShort,
                builder: (context, timeVal, child) {
                  return InkWell(
                      onTap: () async {
                        TimeOfDay? time = await showTimePicker(
                          context: context,
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context)
                              child: child!,
                            );
                          },
                          initialTime: TimeOfDay.now(),
                        );
                        timeSubShort.value = time;
                      },
                      child: buildDateTimePicker(timeVal != null
                          ? convertTime(timeVal)
                          : ''));
                }),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              ' Fecha Larga',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18.0),
            ),
            ValueListenableBuilder<DateTime?>(
                valueListenable: longDateSub,
                builder: (context, dateVal, child) {
                  return InkWell(
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context),
                                child: child!,
                              );
                            });
                        longDateSub.value = date;
                      },
                      child: buildDateTimePicker(
                          dateVal != null ? longDate(dateVal) : ''));
                }),
            const SizedBox(
              height: 10,
            ),
            const Text(
              ' Formato del horario 24 hrs.',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18.0),
            ),
            ValueListenableBuilder<TimeOfDay?>(
                valueListenable: timeSub,
                builder: (context, timeVal, child) {
                  return InkWell(
                      onTap: () async {
                        TimeOfDay? time = await showTimePicker(
                          context: context,
                          builder: (context, child) {
                            return MediaQuery(
                              data: MediaQuery.of(context).copyWith(
                                  alwaysUse24HourFormat: true),
                              child: child!,
                            );
                          },
                          initialTime: TimeOfDay.now(),
                        );
                        timeSub.value = time;
                      },
                      child: buildDateTimePicker(timeVal != null
                          ? timeVal.format(context)
                          : ''));
                }),
            const SizedBox(height: 20.0,),
            ElevatedButton(onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Reaunion Creada'),
                duration: Duration(seconds: 5),));
            }, child: const Text('ENVIAR')),
          ],
        ),
        ),
        
      ),
    );
  }

 
}
