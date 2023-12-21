import 'package:flutter/material.dart';
import 'package:hair_salon/features/schedule/provider/appointment_provider.dart';
import 'package:hair_salon/features/schedule/widgets/appointment_tile.dart';
import 'package:hair_salon/models/appointment_model.dart';
import 'package:hair_salon/widgets/loader.dart';
import 'package:provider/provider.dart';

class DisplayUserAppointments extends StatefulWidget {
  const DisplayUserAppointments({super.key});

  @override
  State<DisplayUserAppointments> createState() =>
      _DisplayUserAppointmentsState();
}

class _DisplayUserAppointmentsState extends State<DisplayUserAppointments> {
  List<Appointment> userAppointments = [];
  bool isLoading = false;
  void getAllAppointments() async {
    setState(() {
      isLoading = true;
    });
    final appointmentProvider =
        Provider.of<AppointmentProvider>(context, listen: false);
    userAppointments = await appointmentProvider.getAllAppointments();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
                ? const Loader()
                : SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 60),
              child: Text("My Appointments",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            ),
            ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: userAppointments.length,
                    itemBuilder: (context, index) => AppointmentTile(
                      appointment: userAppointments[index],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
