import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pattern_code_generator/controller/patternController.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController RScontroller = TextEditingController();
TextEditingController REcontroller = TextEditingController();
TextEditingController CScontroller = TextEditingController();
TextEditingController CEcontroller = TextEditingController();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text(
          "Pattern Generator",
          style: GoogleFonts.sofia(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<PatternController>(
        builder: (context, provider, child) {
          return ListView(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text("Row Initial value :"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          child: TextField(
                            onChanged: (val) {},
                            onSubmitted: (val) {},
                            controller: RScontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.green.shade900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Row Ending value :"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          child: TextField(
                            onChanged: (val) {},
                            onSubmitted: (val) {},
                            controller: REcontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.green.shade900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Column Initial value :"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          child: TextField(
                            onChanged: (val) {},
                            onSubmitted: (val) {},
                            controller: CScontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.green.shade900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Column Ending value :"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          child: TextField(
                            controller: CEcontroller,
                            onChanged: (val) {},
                            onSubmitted: (val) {},
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.green.shade900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              for (int i = int.parse(RScontroller.text);
                  i <= int.parse(REcontroller.text);
                  i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.values[provider.align],
                  children: [
                    for (int j = int.parse(CScontroller.text);
                        j <= int.parse(CEcontroller.text);
                        j++)
                      Card(
                        child: Text(
                          provider.valueType == 0
                              ? j.toString()
                              : provider.valueType == 1
                                  ? "*"
                                  : String.fromCharCode(j + 64),
                        ),
                      ),
                  ],
                ),
              Spacer(),
              CupertinoSlidingSegmentedControl(
                groupValue: provider.align,
                children: {
                  0: Icon(Icons.align_horizontal_left),
                  2: Icon(Icons.align_horizontal_center),
                  1: Icon(Icons.align_horizontal_right),
                },
                onValueChanged: (val) {
                  provider.changeAlignment(align: val ?? 0);
                },
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoSlidingSegmentedControl(
                groupValue: provider.valueType,
                children: {
                  0: Text("Num"),
                  1: Text("Star"),
                  2: Text("Char"),
                },
                onValueChanged: (val) {
                  provider..chnagevalueType(valueType: val ?? 0);
                },
              ),
              SizedBox(
                height: 40,
              ),
            ],
          );
        },
      ),
    );
  }
}
