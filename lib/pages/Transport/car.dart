import 'package:demoapp/pages/Transport/transport.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:slide_drawer/slide_drawer.dart';

void main() => runApp(const Car());

class Car extends StatelessWidget {
  const Car({Key? key}) : super(key: key);

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: CarScreen(title: appTitle),
    );
  }
}

class CarScreen extends StatefulWidget {
  const CarScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CarScreen> createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  var _transportType = [
    "Food",
    "Transport",
  ];
  var _currentSelectedValue;

  var _transportModel = [
    "Food",
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
          'Car Registration',
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
              },
            ),
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
                                hintText: 'Vespa',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            isEmpty: _currentSelectedValue == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: Text('Vespa'),
                                value: _currentSelectedValue,
                                isDense: true,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _currentSelectedValue = newValue;
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
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
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
                                hintText: 'Sprint 150',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            isEmpty: _currentSelectedValue2 == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: Text('Sprint 150'),
                                value: _currentSelectedValue2,
                                isDense: true,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _currentSelectedValue2 = newValue;
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
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
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
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Car Registration Number',
                          style: TextStyle(fontSize: 10)),
                      Text('Fuel Type', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: new Row(
                    children: <Widget>[
                      new Flexible(
                        child: DottedBorder(
                          radius: Radius.circular(5),
                          borderType: BorderType.RRect,
                          child: new TextField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(40)),
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 16.0),
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            // style: Theme.of(context).textTheme.body1,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      new Flexible(
                        child: DottedBorder(
                          radius: Radius.circular(5),
                          borderType: BorderType.RRect,
                          child: new TextField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(40)),
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 16.0),
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            // style: Theme.of(context).textTheme.body1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Date of Manufacture',
                          style: TextStyle(fontSize: 10)),
                      Text('Date of Registration',
                          style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: new Row(
                    children: <Widget>[
                      new Flexible(
                        child: DottedBorder(
                          radius: Radius.circular(5),
                          borderType: BorderType.RRect,
                          child: new TextField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(40)),
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 16.0),
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            // style: Theme.of(context).textTheme.body1,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      new Flexible(
                        child: DottedBorder(
                          radius: Radius.circular(5),
                          borderType: BorderType.RRect,
                          child: new TextField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(40)),
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 16.0),
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            // style: Theme.of(context).textTheme.body1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Text(
                    'Please Upload Car Registration Certificate Below',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/images/upload icon.png'),
                    Text('FRONT'),
                    Image.asset('assets/images/delete icon.png'),
                  ],
                ),
                Center(
                  child: DottedBorder(
                    radius: Radius.circular(5),
                    borderType: BorderType.RRect,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(100, 60, 100, 60),
                      child: DottedBorder(
                        borderType: BorderType.Circle,
                        child: Image.asset('assets/images/Photo camera.png'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/images/upload icon.png'),
                    Text('Back'),
                    Image.asset('assets/images/delete icon.png'),
                  ],
                ),
                Center(
                  child: DottedBorder(
                    radius: Radius.circular(5),
                    borderType: BorderType.RRect,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(100, 60, 100, 60),
                      child: DottedBorder(
                        borderType: BorderType.Circle,
                        child: Image.asset('assets/images/Photo camera.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            TextButton(
                onPressed: () {},
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFf66b00)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(55, 20, 55, 20),
                      child: Text(
                        'SEND FOR REGISTRATION',
                        style: TextStyle(color: Colors.white),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
