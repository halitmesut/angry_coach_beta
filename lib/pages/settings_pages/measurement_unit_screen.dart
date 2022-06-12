import 'package:flutter/material.dart';

class MeasurementUnitScreen extends StatefulWidget {
  const MeasurementUnitScreen({Key? key}) : super(key: key);

  @override
  State<MeasurementUnitScreen> createState() => _MeasurementUnitScreenState();
}

class _MeasurementUnitScreenState extends State<MeasurementUnitScreen> {
  @override
  Widget build(BuildContext context) {
    String unitOfLength = "x";
    String unitOfWeight = "x";
    String unitOfEnergy = "x";
    String unitOfVolume = "x";

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
              TextButton(
                  child: Text("Lenght"),
                  onPressed: () {
                    unitOfLength = "Meter";
                    print(unitOfLength);
                  }),
              TextButton(
                  child: Text("Weight"),
                  onPressed: () {
                    unitOfWeight = "Kilo";
                    print(unitOfWeight);
                  }),
              TextButton(
                  child: Text("Volume"),
                  onPressed: () {
                    unitOfVolume = "Liter";
                    print(unitOfVolume);
                  }),
              TextButton(
                  child: Text("Energy"),
                  onPressed: () {
                    unitOfEnergy = "Calory";
                    print(unitOfEnergy);
                  }),
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
                    if (unitOfEnergy != "x" &&
                        unitOfVolume != "x" &&
                        unitOfLength != "x" &&
                        unitOfWeight != "x") {
                      print(unitOfEnergy);
                      print(unitOfVolume);
                      print(unitOfLength);
                      print(unitOfWeight);
                    }
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
