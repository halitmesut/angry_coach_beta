import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MeasurementUnitScreen extends StatefulWidget {
  const MeasurementUnitScreen({Key? key}) : super(key: key);

  @override
  State<MeasurementUnitScreen> createState() => _MeasurementUnitScreenState();
}

class _MeasurementUnitScreenState extends State<MeasurementUnitScreen> {
  var box = Hive.box("userProperties");
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 2,
              ),
              ListTile(
                title: const Text(
                  "Height unit",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: ValueListenableBuilder(
                  valueListenable: Hive.box("userProperties").listenable(),
                  builder: (context, Box box, _) {
                    if (box.get('userHeightUnit') == null) {
                      return const Text(
                        'Select Your Height Unit',
                      );
                    } else {
                      return Text(
                        box.get("userHeightUnit"),
                      );
                    }
                  },
                ),

                // Text(context.watch<MeasuremetUnits>().heightUnit),
                isThreeLine: false,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (index) async {
                                await box.put(
                                    "userHeightUnit", heightUnits[index]);
                              },

                              // {
                              //   context
                              //       .read<MeasuremetUnits>()
                              //       .getUserHeightUnit(heightUnits[index]);
                              // },
                              children: heightUnits
                                  .map(
                                    (item) => Center(
                                      child: Text(
                                        item,
                                        style: const TextStyle(fontSize: 20),
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
                title: const Text(
                  "Weight unit",
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: ValueListenableBuilder(
                  valueListenable: Hive.box("userProperties").listenable(),
                  builder: (context, Box box, _) {
                    if (box.get('userWeightUnit') == null) {
                      return const Text(
                        'Select Your Weight Unit',
                      );
                    } else {
                      return Text(
                        box.get("userWeightUnit"),
                      );
                    }
                  },
                ),

                //  Text(context.watch<MeasuremetUnits>().weightUnit),
                isThreeLine: false,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (index) async {
                                await box.put(
                                    "userWeightUnit", heightUnits[index]);
                              },

                              // {
                              //   context
                              //       .read<MeasuremetUnits>()
                              //       .getUserWeightUnit(weightUnits[index]);
                              // },
                              children: weightUnits
                                  .map(
                                    (item) => Center(
                                      child: Text(
                                        item,
                                        style: const TextStyle(fontSize: 20),
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
                title: const Text(
                  "Volume unit",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: ValueListenableBuilder(
                  valueListenable: Hive.box("userProperties").listenable(),
                  builder: (context, Box box, _) {
                    if (box.get('userVolumeUnit') == null) {
                      return const Text(
                        'Select Your Volume Unit',
                      );
                    } else {
                      return Text(
                        box.get("userVolumeUnit"),
                      );
                    }
                  },
                ),

                //Text(context.watch<MeasuremetUnits>().volumeUnit),
                isThreeLine: false,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (index) async {
                                await box.put(
                                    "userVolumeUnit", volumeUnits[index]);
                              },

                              // {
                              //   context
                              //       .read<MeasuremetUnits>()
                              //       .getUserVolumeUnit(volumeUnits[index]);
                              // },
                              children: volumeUnits
                                  .map(
                                    (item) => Center(
                                      child: Text(
                                        item,
                                        style: const TextStyle(fontSize: 20),
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
                title: const Text(
                  "Energy unit",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: ValueListenableBuilder(
                  valueListenable: Hive.box("userProperties").listenable(),
                  builder: (context, Box box, _) {
                    if (box.get('userEnergyUnit') == null) {
                      return const Text(
                        'Select Your Energy Unit',
                      );
                    } else {
                      return Text(
                        box.get("userEnergyUnit"),
                      );
                    }
                  },
                ),

                //Text(context.watch<MeasuremetUnits>().energyUnit),
                isThreeLine: false,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Center(
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (index) async {
                                await box.put(
                                    "userEnergyUnit", energyUnits[index]);
                              },

                              //  {
                              //   context
                              //       .read<MeasuremetUnits>()
                              //       .getUserEnergyUnit(energyUnits[index]);
                              // },
                              children: energyUnits
                                  .map(
                                    (item) => Center(
                                      child: Text(
                                        item,
                                        style: const TextStyle(fontSize: 20),
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
              const Expanded(
                child: SizedBox(),
              ),
              Container(
                padding: const EdgeInsets.only(top: 2, left: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: const Border(
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
