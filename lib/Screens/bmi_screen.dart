import 'package:flutter/material.dart';
import 'package:projects_flutter/shared/menu_bottom.dart';
import 'package:projects_flutter/shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final double fontsize = 18;
  bool isMetrec = true;
  bool isImperial = false;
  double? height;
  double? weight;
  String result = '';
  late List<bool> isSelected;
  final TextEditingController heighttxt = TextEditingController();
  final TextEditingController weighttxt = TextEditingController();
  String heighthint = '';
  String weighthint = '';
  @override
  void initState() {
    isSelected = [isMetrec, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heighthint =
        'please enter your height in ' + ((isMetrec) ? 'meters' : 'inches');
    weighthint =
        'please enter your weight in ' + ((isMetrec) ? 'kilos' : 'pounds');
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        bottomNavigationBar: menuBottom(context),
        drawer: const MenuDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ToggleButtons(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Metric',
                      style: TextStyle(fontSize: fontsize),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Imperial',
                      style: TextStyle(fontSize: fontsize),
                    ),
                  ),
                ],
                isSelected: isSelected,
                onPressed: toggleMeasure,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  controller: heighttxt,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: heighthint,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextField(
                  controller: weighttxt,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: weighthint,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () => findBMI(),
                  child: Text(
                    'Calculate BMI',
                    style: TextStyle(fontSize: fontsize),
                  )),
              Text(
                result,
                style: TextStyle(fontSize: fontsize),
              )
            ],
          ),
        ));
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetrec = true;
      isImperial = false;
    } else {
      isMetrec = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetrec, isImperial];
    });
  }

  void findBMI() {
    double bmi = 0;
    double height = double.tryParse(heighttxt.text) ?? 0;
    double weight = double.tryParse(weighttxt.text) ?? 0;
    if (isMetrec) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }

    setState(() {
       result = ('your BMI is ' + bmi.toStringAsFixed(2));
    });
  }
}
