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
          return Column(
            children: [
              for (int i = 1; i <= 5; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.values[provider.align],
                  children: [
                    for (int j = 1; j <= i; j++)
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
              SizedBox(
                height: 10,
              ),
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
                height: 10,
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
            ],
          );
        },
      ),
    );
  }
}
