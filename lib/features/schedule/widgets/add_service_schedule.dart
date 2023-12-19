import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class AddServiceSchedule extends StatefulWidget {
  const AddServiceSchedule({super.key});

  @override
  State<AddServiceSchedule> createState() => _AddServiceScheduleState();
}

class _AddServiceScheduleState extends State<AddServiceSchedule> {
  TimeOfDay time = TimeOfDay(hour: 12, minute: 00);
  int noOfHours = 0;

  void pickTime() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        time = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime?> _dates = [
      DateTime(2023, DateTime.now().month, DateTime.now().day)
    ];

    TextEditingController _noOfHours = TextEditingController();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 25),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      spreadRadius: 3,
                      blurRadius: 5,
                    )
                  ]),
              child: CalendarDatePicker2WithActionButtons(
                config: CalendarDatePicker2WithActionButtonsConfig(
                  selectedDayHighlightColor: Colors.blue,
                  firstDayOfWeek: 1,
                  calendarType: CalendarDatePicker2Type.single,
                  selectedDayTextStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                  centerAlignModePicker: true,
                  customModePickerIcon: const SizedBox(),
                ),
                value: _dates,
                onValueChanged: (dates) {
                  _dates = dates;
                },
                onCancelTapped: () => _dates = [
                  DateTime(2023, DateTime.now().month, DateTime.now().day)
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select Time",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: pickTime,
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            time.format(context).toString(),
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select hours",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                              decoration: const InputDecoration(
                                  hintText: "Hours",
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500),
                                  border: InputBorder.none),
                              cursorColor: Colors.blue,
                              keyboardType: TextInputType.number,
                              controller: _noOfHours,
                              onChanged: (value) =>
                                  noOfHours = int.parse(value),
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScheduleScreen(service: service)));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
                child: const Text(
                  "Schedule a session",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text("(Services available only on weekdays)",),
          )
        ],
      ),
    );
  }
}
