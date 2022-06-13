import 'package:angry_coach_beta/providers/measuremet_units_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeasurementUnitScreen extends StatefulWidget {
  const MeasurementUnitScreen({Key? key}) : super(key: key);

  @override
  State<MeasurementUnitScreen> createState() => _MeasurementUnitScreenState();
}

class _MeasurementUnitScreenState extends State<MeasurementUnitScreen> {
  final heightUnits = ["Cm", "Inch"];
  final weightUnits = ["Kg", "Lb"];
  final volumeUnits = ["ml", "oz"];
  final energyUnits = ["Calorie", "Joule"];

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
        elevation: 3,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 2,
              ),
              ListTile(
                title: Text(
                  "Height unit",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle:
                    Text("${context.watch<MeasuremetUnits>().heightUnit}"),
                isThreeLine: false,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (index) {
                                context
                                    .read<MeasuremetUnits>()
                                    .getUserHeightUnit(heightUnits[index]);
                              },
                              children: heightUnits
                                  .map(
                                    (item) => Center(
                                      child: Text(
                                        item,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ));
                },
              ),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              ListTile(
                title: Text(
                  "Weight unit",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(context.watch<MeasuremetUnits>().weightUnit),
                isThreeLine: false,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (index) {
                                context
                                    .read<MeasuremetUnits>()
                                    .getUserWeightUnit(weightUnits[index]);
                              },
                              children: weightUnits
                                  .map(
                                    (item) => Center(
                                      child: Text(
                                        item,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ));
                },
              ),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              ListTile(
                title: Text(
                  "Volume unit",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(context.watch<MeasuremetUnits>().volumeUnit),
                isThreeLine: false,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (index) {
                                context
                                    .read<MeasuremetUnits>()
                                    .getUserVolumeUnit(volumeUnits[index]);
                              },
                              children: volumeUnits
                                  .map(
                                    (item) => Center(
                                      child: Text(
                                        item,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ));
                },
              ),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              ListTile(
                title: Text(
                  "Energy unit",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(context.watch<MeasuremetUnits>().energyUnit),
                isThreeLine: false,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (index) {
                                context
                                    .read<MeasuremetUnits>()
                                    .getUserEnergyUnit(energyUnits[index]);
                              },
                              children: energyUnits
                                  .map(
                                    (item) => Center(
                                      child: Text(
                                        item,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                      ));
                },
              ),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              Expanded(
                child: SizedBox(),
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
