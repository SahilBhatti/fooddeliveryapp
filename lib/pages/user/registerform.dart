import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:demoapp/pages/drawer/drawer.dart';
import 'package:demoapp/src/flutter_google_places.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:math';

import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
const kGoogleApiKey = "AIzaSyDLdAEq-U9bDQdIkPGl9AXCELyly7Q9EnQ";
void main() => runApp(const RegisterForm());

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: PersonalInformation(title: appTitle),
    );
  }
}

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  var place;
  File? vehicleimage;
  File? personalid;
  File? pickdrivinglicense;
  List<XFile>? _imageFileList = [];
  final ImagePicker _picker = ImagePicker();
  final String uploadUrl = 'http://ezmoov.com:5000/images/customer';
  var headers = {
    "token": "Bearer hjskdhskjdhsjkdhskjdhskjdhskdhskjdhsdjksjhdsjkdsdks"
  };
  Future<String> uploadImage(filepath, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromPath('photo', filepath));
    //var res = await request.send();
    //print("path:  "+res.toString());
    http.Response response =
        await http.Response.fromStream(await request.send());
    print("Result: ${response.body}");
    return response.body;
    //https://api.imgur.com/3/upload
  }

  Future vehlicleimagePick() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final temp = File(image.path);
      setState(() => this.vehicleimage = temp);
      print(temp.path);
      return uploadImage(vehicleimage!.path, uploadUrl);
    } on PlatformException catch (e) {
      print('$e');
    }
  }

  Future<String> id(filepath, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromPath('photo', filepath));
    //var res = await request.send();
    //print("path:  "+res.toString());
    http.Response response =
        await http.Response.fromStream(await request.send());
    print("Result: ${response.body}");
    return response.body;
    //https://api.imgur.com/3/upload
  }

  Future personalidPick() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final temp = File(image.path);
      setState(() => this.personalid = temp);
      print(temp.path);
      return id(personalid!.path, uploadUrl);
    } on PlatformException catch (e) {
      print('$e');
    }
  }

  Future<String> drivinglicense(filepath, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromPath('photo', filepath));
    //var res = await request.send();
    //print("path:  "+res.toString());
    http.Response response =
        await http.Response.fromStream(await request.send());
    print("Result: ${response.body}");
    return response.body;
    //https://api.imgur.com/3/upload
  }

  Future drivinglicensePick() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final temp = File(image.path);
      setState(() => this.pickdrivinglicense = temp);
      print(temp.path);
      return drivinglicense(pickdrivinglicense!.path, uploadUrl);
    } on PlatformException catch (e) {
      print('$e');
    }
  }

  multipleImg() async {
    final List<XFile>? selected = await _picker.pickMultiImage();
    if (selected!.isNotEmpty) {
      _imageFileList!.addAll(selected);
      print(_imageFileList!.toString());
    }
  }

  var _currentSelectedValue2;
  var _transportType = ["Car", "Bike", "Bicycle"];
  TextEditingController nameController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController vehicleTypeController = TextEditingController();
  TextEditingController documentFieldController = TextEditingController();
  Set<Polyline> lines = {};
  var formKey = GlobalKey<FormState>();
  String? userName;
  String? userEmail;
  String? userImage;
  getuserdetails() async {
    userName = await SessionManager().get("displayName");
    // userName=name;
    userEmail = await SessionManager().get("email");
    // userEmail=email;
    userImage = await SessionManager().get("photoURL");
    // userImage=photoURL;
  }

  Future validateData() async {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState?.save();
      // final restaurantname = nameController.text;
      // final id = idController.text;
      // final address = addressController.text;
      // final country = countryController.text;
      // print("name  " + restaurantname);
      // print("id  " + id);
      // print("address  " + address);
      // print("country  " + country);
      setState(() {
        // if (restaurantname != '' &&
        //     id != '' &&
        //     country != '' &&
        //     address != '') {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Home(
                      name: userName!,
                      email: userEmail!,
                      userProfile: userImage!,
                    )));
        // } else {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(content: Text("check details and try again")));
        // }
      });
    } else {
      print("not valid");
    }
  }

  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  Map<PolylineId, Polyline> polylines = {};
  late GoogleMapController mapController;
  String _currentAddress = '';

  late Position _currentPosition;
  String startAddress = '';
  String destinationAddress = '';
  String? placeDistance;

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();

  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final startAddressFocusNode = FocusNode();
  final desrinationAddressFocusNode = FocusNode();

  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        print('CURRENT POS: $_currentPosition');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
      await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  // Method for retrieving the address
  _getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        startAddressController.text = _currentAddress;
        startAddress = _currentAddress;
        print('CURRENT Address: $_currentAddress');
      });
    } catch (e) {
      print(e);
    }
  }

  File? file;
  pickfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path.toString());
      print(file!.path);
      return file;
    } else {
      return;
      // User canceled the picker
    }
  }

  var countryName;
  @override
  void initState() {
    super.initState();
    getuserdetails();
    _getAddress();
    startAddress = _currentAddress;
    _getCurrentLocation();
  }
 Future<void> _handlePressButton() async {
    // show input autocomplete with selected mode
    // then get the Prediction selected
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      onError: onError,
      // mode: _mode,
      language: "en-gb",
      decoration: InputDecoration(
        hintText: 'Search',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      //components: [Component(Component.country, "en-gb")],
    );
print(p.toString());
print("p.toString()");
   return displayPrediction(p!, context);
  }
   Future displayPrediction(Prediction p, BuildContext context) async {
  // ignore: unnecessary_null_comparison
  if (p != null) {
    // get detail (lat/lng)
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: kGoogleApiKey,
      apiHeaders: await GoogleApiHeaders().getHeaders(),
    );
    PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId!);
    final lat = detail.result.geometry?.location.lat;
    final lng = detail.result.geometry?.location.lng;
     place=p.placeId;
     print(detail.result);
     
    // ignore: deprecated_member_use
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${p.placeId} - $lat/$lng")),
    );
  }
  //List<Location> locations = await locationFromAddress(p.description.toString());
}
   void onError(PlacesAutocompleteResponse response) {
    // ignore: deprecated_member_use
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(response.errorMessage!)),
    );
  }
final homeScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      appBar: AppBar(
        title: Text(
          'Account Information',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset('assets/images/Layer 1.png'),
          onPressed: () => {Navigator.of(context).pop(true)},
        ),
        elevation: 0,
        actions: [
          // Builder(
          //   builder: (context) => IconButton(
          //     icon: Image.asset('assets/images/Group 15214.png'),
          //     onPressed: () => SlideDrawer.of(context)?.toggle(),
          //   ),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
                onTap: () {},
                child: Image.asset('assets/images/Customer avatarfgfd.png')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Account Registration".toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: DottedBorder(
                        radius: Radius.circular(40),
                        borderType: BorderType.RRect,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: 'Vehicle Name',
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: DottedBorder(
                        radius: Radius.circular(40),
                        borderType: BorderType.RRect,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: TextFormField(
                            controller: vehicleNumberController,
                            decoration: InputDecoration(
                              hintText: 'Vehicle Number',
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: DottedBorder(
                        radius: Radius.circular(40),
                        borderType: BorderType.RRect,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 20,
                            top: 10,
                            bottom: 10,
                          ),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Text('Vehicle Type'),
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
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 170),
                                        child: Text(value),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            },
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: DottedBorder(
                      radius: Radius.circular(40),
                      borderType: BorderType.RRect,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: TextFormField(
                          controller: idController,
                          decoration: InputDecoration(
                            hintText: 'Personal ID',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: DottedBorder(
                      radius: Radius.circular(40),
                      borderType: BorderType.RRect,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            CountryCodePicker(
         onChanged: print,
         // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
         initialSelection: 'IT',
         favorite: ['FR'],
         // optional. Shows only country name and flag
         showCountryOnly: true,
         // optional. Shows only country name and flag when popup is closed.
         showOnlyCountryWhenClosed: true,
         // optional. aligns the flag and the Text left
         alignLeft: false,
         closeIcon: Icon(Icons.close),
       ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: DottedBorder(
                      radius: Radius.circular(40),
                      borderType: BorderType.RRect,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        // child: Row(
                        //   children: [
                        //     Flexible(child: Padding(
                        //       padding: const EdgeInsets.symmetric(vertical:15),
                        //       child: Text(_currentAddress,overflow: TextOverflow.ellipsis,),
                        //     )),
                        //   ],
                        // ),
                        child: Row(
                          children: [
                            Expanded(
                                                          child: TextField(
                                decoration: InputDecoration(
                                  hintText: "place!",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(onPressed: () async {
                Prediction? p = await PlacesAutocomplete.show(
                    context: context, apiKey: kGoogleApiKey);
                displayPrediction(p!, context);
                print(p.description);
              },
                              icon: Icon(Icons.arrow_drop_down,)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Stack(
                          children: [
                            DottedBorder(
                              child: GoogleMap(
                                initialCameraPosition: _initialLocation,
                                myLocationEnabled: true,
                                myLocationButtonEnabled: false,
                                mapType: MapType.normal,
                                zoomGesturesEnabled: true,
                                zoomControlsEnabled: false,
                                polylines: Set<Polyline>.of(polylines.values),
                                onMapCreated: (GoogleMapController controller) {
                                  mapController = controller;
                                },
                                onCameraMove: (CameraPosition cameraPosition) {
                                  print(cameraPosition.zoom);
                                },
                              ),
                            ),
                            Container(
                              child: SafeArea(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 30.0, bottom: 30.0),
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.white
                                            .withOpacity(0.6), // button color
                                        child: InkWell(
                                          splashColor:
                                              Colors.white, // inkwell color
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: Icon(Icons.my_location),
                                          ),
                                          onTap: () {
                                            mapController.animateCamera(
                                              CameraUpdate.newCameraPosition(
                                                CameraPosition(
                                                  target: LatLng(
                                                    _currentPosition.latitude,
                                                    _currentPosition.longitude,
                                                  ),
                                                  zoom: 18.0,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 10, bottom: 10),
                    child: GestureDetector(
                      onTap: () => vehlicleimagePick(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0, right: 20),
                        child: vehicleimage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.file(
                                  vehicleimage!,
                                  height: 250,
                                  width: 450,
                                ))
                            : DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(10),
                                child: SizedBox(
                                  height: 250,
                                  width: 450,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 90),
                                        child: Center(
                                            child: Column(
                                          children: [
                                            DottedBorder(
                                              borderType: BorderType.Circle,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(Icons.camera_alt),
                                              ),
                                            ),
                                            Text('Attech Vehicle Image'),
                                          ],
                                        )),
                                      )),
                                ),
                              ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 20, right: 10, bottom: 10),
                    child: GestureDetector(
                      onTap: () => personalidPick(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0, right: 20),
                        child: personalid != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SizedBox(
                                  height: 250,
                                  width: 450,
                                  child: Image.file(
                                    personalid!,
                                  ),
                                ))
                            : DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(10),
                                child: SizedBox(
                                  height: 250,
                                  width: 450,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 90),
                                        child: Column(
                                          children: [
                                            DottedBorder(
                                              borderType: BorderType.Circle,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(Icons.camera_alt),
                                              ),
                                            ),
                                            Center(
                                                child:
                                                    Text('Attech Personal Id')),
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 20, right: 10, bottom: 10),
                    child: GestureDetector(
                      onTap: () => drivinglicensePick(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0, right: 20),
                        child: pickdrivinglicense != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SizedBox(
                                  height: 250,
                                  width: 450,
                                  child: Image.file(
                                    pickdrivinglicense!,
                                  ),
                                ))
                            : DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(10),
                                child: SizedBox(
                                  height: 250,
                                  width: 450,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 90),
                                        child: Column(
                                          children: [
                                            DottedBorder(
                                              borderType: BorderType.Circle,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(Icons.camera_alt),
                                              ),
                                            ),
                                            Center(
                                                child: Text(
                                                    'Attech driving license')),
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      width: 320,
                      child: ElevatedButton(
                        child: Text(
                          'save'.toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: HexColor(orange),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 5.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          elevation: 8.0,
                          minimumSize: Size(double.infinity,
                              44), // double.infinity is the width and 30 is the height
                        ),
                        onPressed: () {
                          validateData();

                          //Navigator.push(context, MaterialPageRoute(builder: (context)=> Home(name: userName.toString(), email: userEmail.toString(), imageProfile: userImage.toString())));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
 

class Uuid {
  final Random _random = Random();

  String generateV4() {
    // Generate xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx / 8-4-4-4-12.
    final int special = 8 + _random.nextInt(4);

    return '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}-'
        '${_bitsDigits(16, 4)}-'
        '4${_bitsDigits(12, 3)}-'
        '${_printDigits(special, 1)}${_bitsDigits(12, 3)}-'
        '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}';
  }

  String _bitsDigits(int bitCount, int digitCount) =>
      _printDigits(_generateBits(bitCount), digitCount);

  int _generateBits(int bitCount) => _random.nextInt(1 << bitCount);

  String _printDigits(int value, int count) =>
      value.toRadixString(16).padLeft(count, '0');
}