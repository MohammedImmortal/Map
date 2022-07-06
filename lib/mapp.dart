import 'package:flutter/material.dart';
import 'package:map/node.dart';
import 'package:map/position.dart';
import 'package:map/line.dart';

class Mapp extends StatefulWidget {
  const Mapp({Key? key, required this.current, required this.destination})
      : super(key: key);
  final String current;
  final String destination;

  @override
  State<Mapp> createState() => _MappState(current, destination);
}

class _MappState extends State<Mapp> {
  final String current;
  final String destination;

  @override
  void initState() {
    changeColour(current, destination);
    super.initState();
  }

  Map<String, bool> nodeCheck = {
    'cairo': false,
    'alexandria': false,
    'tanta': false,
    'benha': false,
    'hurghada': false,
    'dahab': false,
    'damanhur': false,
    'kafr El Sheikh': false,
    'kafr El Zayat': false,
    'mansoura': false,
    'aswan': false,
    'asyut': false,
    'beni Suef': false,
    'borg El Arab': false,
    'damietta': false,
  };

  _MappState(this.current, this.destination);

  void changeValue(node) {
    nodeCheck[node] = true;
  }

  void changeColour(cur, des) {
    nodeCheck = {
      'cairo': false,
      'alexandria': false,
      'tanta': false,
      'benha': false,
      'hurghada': false,
      'dahab': false,
      'damanhur': false,
      'kafr El Sheikh': false,
      'kafr El Zayat': false,
      'mansoura': false,
      'aswan': false,
      'asyut': false,
      'beni Suef': false,
      'borg El Arab': false,
      'damietta': false,
    };
    changeValue(cur);
    changeValue(des);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(' Map '),
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.teal,
            child: Stack(
              children: [
                NodeMap(
                  ispushed: nodeCheck["cairo"]!,
                  top: 160.0,
                  left: 312.0,
                  texxt: "Cairo",
                ),

                NodeMap(
                  ispushed: nodeCheck["benha"]!,
                  top: 160.0,
                  left: 221.0,
                  texxt: "Benha",
                ),
                NodeMap(
                  ispushed: nodeCheck["tanta"]!,
                  top: 0.0,
                  left: 130.0,
                  texxt: "Tanta",
                ),
                NodeMap(
                  ispushed: nodeCheck["kafr El Zayat"]!,
                  top: 0.0,
                  left: 50.0,
                  texxt: "Kafr El Zayat",
                ),
                NodeMap(
                  ispushed: nodeCheck["kafr El Sheikh"]!,
                  top: 230.0,
                  left: 260.0,
                  texxt: "Kafr El Sheikh",
                ),
                NodeMap(
                  ispushed: nodeCheck["damanhur"]!,
                  top: 230.0,
                  left: 130.0,
                  texxt: "Damanhur",
                ),
                NodeMap(
                  ispushed: nodeCheck["alexandria"]!,
                  top: 390.0,
                  left: 260.0,
                  texxt: "Alexandria",
                ),
                NodeMap(
                  ispushed: nodeCheck["mansoura"]!,
                  top: 390.0,
                  left: 130.0,
                  texxt: "Mansoura",
                ),
                NodeMap(
                  ispushed: nodeCheck["hurghada"]!,
                  top: 310.0,
                  left: 0.0,
                  texxt: "Hurghada",
                ),
                NodeMap(
                  ispushed: nodeCheck["dahab"]!,
                  top: 410.0,
                  left: 0.0,
                  texxt: "Dahab",
                ),
                NodeMap(
                  ispushed: nodeCheck["damietta"]!,
                  top: 420.0,
                  left: 190.0,
                  texxt: "Damietta",
                ),
                NodeMap(
                  ispushed: nodeCheck["aswan"]!,
                  top: 580.0,
                  left: 190.0,
                  texxt: "Aswan",
                ),
                NodeMap(
                  ispushed: nodeCheck["asyut"]!,
                  top: 420.0,
                  left: 310.0,
                  texxt: "Asyut",
                ),
                NodeMap(
                  ispushed: nodeCheck["beni Suef"]!,
                  top: 580.0,
                  left: 310.0,
                  texxt: "Beni Suef",
                ),
                const PositionMap(
                  top: 90.0,
                  left: 320.0,
                  texxt: "A",
                ),
                const PositionMap(
                  top: 90.0,
                  left: 230.0,
                  texxt: "B",
                ),
                const PositionMap(
                  top: 90.0,
                  left: 140.0,
                  texxt: "C",
                ),
                const PositionMap(
                  top: 90.0,
                  left: 60.0,
                  texxt: "D",
                ),
                const PositionMap(
                  top: 320.0,
                  left: 60.0,
                  texxt: "E",
                ),
                const PositionMap(
                  top: 320.0,
                  left: 140.0,
                  texxt: "F",
                ),
                const PositionMap(
                  top: 320.0,
                  left: 270.0,
                  texxt: "G",
                ),
                const PositionMap(
                  top: 420.0,
                  left: 60.0,
                  texxt: "H",
                ),
                const PositionMap(
                  top: 510.0,
                  left: 60.0,
                  texxt: "I",
                ),
                const PositionMap(
                  top: 510.0,
                  left: 200.0,
                  texxt: "J",
                ),
                const PositionMap(
                  top: 510.0,
                  left: 320.0,
                  texxt: "K",
                ),
                //Horizontal Lines
                const LineMap(
                  width: 60.0,
                  height: 25.0,
                  top: 100.0,
                  left: 260.0,
                ),
                const LineMap(
                  width: 60.0,
                  height: 25.0,
                  top: 100.0,
                  left: 170.0,
                ),
                const LineMap(
                  width: 50.0,
                  height: 25.0,
                  top: 100.0,
                  left: 90.0,
                ),
                const LineMap(
                  width: 100.0,
                  height: 25.0,
                  top: 330.0,
                  left: 170.0,
                ),
                const LineMap(
                  width: 50.0,
                  height: 25.0,
                  top: 330.0,
                  left: 90.0,
                ),
                const LineMap(
                  width: 10.0,
                  height: 15.0,
                  top: 338.0,
                  left: 50.0,
                ),
                const LineMap(
                  width: 10.0,
                  height: 15.0,
                  top: 438.0,
                  left: 50.0,
                ),
                const LineMap(
                  width: 90.0,
                  height: 25.0,
                  top: 525.0,
                  left: 230.0,
                ),
                const LineMap(
                  width: 110.0,
                  height: 25.0,
                  top: 525.0,
                  left: 90.0,
                ),
                //Vertical Lines
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 140.0,
                  left: 328.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 140.0,
                  left: 238.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 70.0,
                  left: 148.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 70.0,
                  left: 68.0,
                ),
                const LineMap(
                  width: 20.0,
                  height: 180.0,
                  top: 140.0,
                  left: 65.0,
                ),
                const LineMap(
                  width: 20.0,
                  height: 50.0,
                  top: 370.0,
                  left: 65.0,
                ),
                const LineMap(
                  width: 20.0,
                  height: 40.0,
                  top: 470.0,
                  left: 65.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 300.0,
                  left: 278.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 370.0,
                  left: 278.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 300.0,
                  left: 148.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 370.0,
                  left: 148.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 490.0,
                  left: 208.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 560.0,
                  left: 208.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 490.0,
                  left: 328.0,
                ),
                const LineMap(
                  width: 15.0,
                  height: 20.0,
                  top: 560.0,
                  left: 328.0,
                ),
              ],
            )));
  }
}
