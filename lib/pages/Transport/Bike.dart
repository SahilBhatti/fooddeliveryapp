import 'package:demoapp/pages/Transport/transport.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:slide_drawer/slide_drawer.dart';

void main() => runApp(const Bike());

class Bike extends StatelessWidget {
  const Bike({Key? key}) : super(key: key);

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: BikeScreen(title: appTitle),
    );
  }
}

class BikeScreen extends StatefulWidget {
  const BikeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BikeScreen> createState() => _BikeScreenState();
}

class _BikeScreenState extends State<BikeScreen> {
  var _transportType = [
    "Car",
    "Bike",
    "bicycle"
  ];
  var _currentSelectedValue;

  var _transportModel = [
    "City Comfort",
    "Transport",
  ];
  var _currentSelectedValue2;

  var _color = [
    "red",
    "blue",
  ];
  var _currentSelectedValue3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bike Registration',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset('assets/images/Layer 1.png'),
          onPressed: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Transport()))
          },
        ),
        elevation: 0,
        actions: [
          Builder(
            builder: (context) => IconButton(
                icon: Image.asset('assets/images/Group 15214.png'),
                onPressed: () => {
                      SlideDrawer.of(context)?.toggle(),
                    }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFdedede)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 60, 40, 60),
                  child: DottedBorder(
                    borderType: BorderType.Circle,
                    child: Image.asset('assets/images/Photo camera.png'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/upload icon.png'),
                  Image.asset('assets/images/delete icon.png')
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Text('Transport Type'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: DottedBorder(
                    radius: Radius.circular(5),
                    borderType: BorderType.RRect,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(40)),
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 16.0),
                                hintText: 'Specialized',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            isEmpty: _currentSelectedValue2 == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: Text('Specialized'),
                                value: _currentSelectedValue2,
                                isDense: true,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _currentSelectedValue2 = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _transportType.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text('Transport Model'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: DottedBorder(
                    radius: Radius.circular(5),
                    borderType: BorderType.RRect,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(40)),
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 16.0),
                                hintText: 'City Comfort',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            isEmpty: _currentSelectedValue == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: Text('City Comfort'),
                                value: _currentSelectedValue,
                                isDense: true,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _currentSelectedValue = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _transportModel.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text('Color'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: DottedBorder(
                    radius: Radius.circular(5),
                    borderType: BorderType.RRect,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(40)),
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 16.0),
                                hintText: 'Color',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            isEmpty: _currentSelectedValue3 == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: Text('Color'),
                                value: _currentSelectedValue3,
                                isDense: true,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _currentSelectedValue3 = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _color.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text('Date of Manufacture'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: DottedBorder(
                    radius: Radius.circular(5),
                          borderType: BorderType.RRect,
                      child: Padding(
                        padding: const EdgeInsets.only(top:5,bottom:5),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10,bottom: 20)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary:Color(0xFFf66b00)
            ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
                  child: Text(
                    'Send for registration'.toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
