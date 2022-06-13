import 'package:angry_coach_beta/providers/user_volumu_measurement_unit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:angry_coach_beta/providers/user_height_measurement_unit.dart';
import 'package:angry_coach_beta/providers/user_weight_measurement_unit.dart';
import 'package:angry_coach_beta/providers/user_energy_measurement_unit.dart';

class MeasurementUnitScreen extends StatefulWidget {
  const MeasurementUnitScreen({Key? key}) : super(key: key);

  @override
  State<MeasurementUnitScreen> createState() => _MeasurementUnitScreenState();
}

class _MeasurementUnitScreenState extends State<MeasurementUnitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "Measurement Units",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      child: Text("Height Unit"),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(40),
                                    child: Column(
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              context
                                                  .read<
                                                      UserHeightMeasurementUnit>()
                                                  .setUserHeightMeasurementUnit(
                                                      "Cm");
                                              Navigator.pop(context);
                                            },
                                            child: Text("Cm")),
                                        TextButton(
                                            onPressed: () {
                                              context
                                                  .read<
                                                      UserHeightMeasurementUnit>()
                                                  .setUserHeightMeasurementUnit(
                                                      "Inch");
                                              Navigator.pop(context);
                                            },
                                            child: Text("Inch")),
                                      ],
                                    ),
                                  ),
                                ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30)),
                            ));
                      }),
                  Text(context
                      .watch<UserHeightMeasurementUnit>()
                      .userHeightMeasurementUnit),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      child: Text("Weight Unit"),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(40),
                                    child: Column(
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              context
                                                  .read<
                                                      UserWeightMeasurementUnit>()
                                                  .setUserWeightMeasurementUnit(
                                                      "Kg");
                                              Navigator.pop(context);
                                            },
                                            child: Text("Kg")),
                                        TextButton(
                                            onPressed: () {
                                              context
                                                  .read<
                                                      UserWeightMeasurementUnit>()
                                                  .setUserWeightMeasurementUnit(
                                                      "Lb");
                                              Navigator.pop(context);
                                            },
                                            child: Text("Lb")),
                                      ],
                                    ),
                                  ),
                                ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30)),
                            ));
                      }),
                  Text(context
                      .watch<UserWeightMeasurementUnit>()
                      .userWeightMeasurementUnit),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      child: Text("Volumu Unit"),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(40),
                                    child: Column(
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              context
                                                  .read<
                                                      UserVolumeMeasurementUnit>()
                                                  .setUserVolumeMeasurementUnit(
                                                      "ml");
                                              Navigator.pop(context);
                                            },
                                            child: Text("ml")),
                                        TextButton(
                                            onPressed: () {
                                              context
                                                  .read<
                                                      UserVolumeMeasurementUnit>()
                                                  .setUserVolumeMeasurementUnit(
                                                      "oz");
                                              Navigator.pop(context);
                                            },
                                            child: Text("oz")),
                                      ],
                                    ),
                                  ),
                                ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30)),
                            ));
                      }),
                  Text(context
                      .watch<UserVolumeMeasurementUnit>()
                      .userVolumeMeasurementUnit),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      child: Text("Energy Unit"),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(40),
                                    child: Column(
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              context
                                                  .read<
                                                      UserEnergyMeasurementUnit>()
                                                  .setUserEnergyMeasurementUnit(
                                                      "Calories");
                                              Navigator.pop(context);
                                            },
                                            child: Text("Calories")),
                                        TextButton(
                                            onPressed: () {
                                              context
                                                  .read<
                                                      UserEnergyMeasurementUnit>()
                                                  .setUserEnergyMeasurementUnit(
                                                      "Kilojoules");
                                              Navigator.pop(context);
                                            },
                                            child: Text("Kilojoules")),
                                      ],
                                    ),
                                  ),
                                ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30)),
                            ));
                      }),
                  Text(context
                      .watch<UserEnergyMeasurementUnit>()
                      .userEnergyMeasurementUnit),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(top: 2, left: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                  ),
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  elevation: 0,
                  color: Colors.deepOrange,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  height: 60,
                  child: Text(
                    "Set",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
