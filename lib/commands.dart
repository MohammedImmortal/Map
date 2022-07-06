import 'package:flutter/material.dart';
import 'package:map/nodedata.dart';
import 'package:map/mapp.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:map/welcomescreen.dart';

class FieldsState {
  String? current;
  String? destination;

  FieldsState(this.current, this.destination);
  Map<String, dynamic> toJason() => {
        'current': current,
        'destination': destination,
      };
}

class Command extends StatefulWidget {
  const Command({Key? key}) : super(key: key);

  @override
  State<Command> createState() => _CommandState();
}

class _CommandState extends State<Command> {
  var currentController = TextEditingController();
  var destinationController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? selectedNode;
  final currentState = FieldsState("", "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen()),
          ),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text("Destination"),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Please Enter Current Location and Destination',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  TypeAheadFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: currentController,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 11.0,
                          fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          labelText: 'Current Location',
                          contentPadding: EdgeInsets.all(10)),
                    ),
                    suggestionsCallback: NodeData.getSuggestions,
                    itemBuilder: (context, String? suggestion) => ListTile(
                      title: Text(suggestion!),
                    ),
                    onSuggestionSelected: (String? suggestion) =>
                        currentController.text = suggestion!,
                    validator: (value) {
                      String valuelower = value!.toLowerCase();
                      bool isInTheList = false;
                      for (var item in NodeData.nodeList) {
                        if (item == valuelower) {
                          isInTheList = true;
                        }
                      }
                      if (valuelower.isEmpty || isInTheList == false) {
                        return 'Please Select Places only from the List';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (valuelower) => selectedNode = valuelower,
                  ),
                  const SizedBox(height: 15.0),
                  TypeAheadFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: destinationController,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          labelText: 'Destination',
                          contentPadding: EdgeInsets.all(10)),
                    ),
                    suggestionsCallback: NodeData.getSuggestions,
                    itemBuilder: (context, String? suggestion) => ListTile(
                      title: Text(suggestion!),
                    ),
                    onSuggestionSelected: (String? suggestion) =>
                        destinationController.text = suggestion!,
                    validator: (value) {
                      String valuelower = value!.toLowerCase();
                      bool isInTheList = false;
                      for (var item in NodeData.nodeList) {
                        if (item == valuelower) {
                          isInTheList = true;
                        }
                      }
                      if (valuelower.isEmpty || isInTheList == false) {
                        return 'Please Select Places only from the List';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (valuelower) => selectedNode = valuelower,
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          elevation: MaterialStateProperty.all(5),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(10)),
                        ),
                        child: const Text('SUBMIT'),
                        onPressed: () {
                          final form = formKey.currentState!;
                          if (form.validate()) {
                            form.save();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Mapp(
                                          current: currentController.text
                                              .toLowerCase(),
                                          destination: destinationController
                                              .text
                                              .toLowerCase(),
                                        )));
                          }
                        }),
                  ),
                  //const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
