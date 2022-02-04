import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:slide_drawer/slide_drawer.dart';
import 'package:http/http.dart'as http;
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  TextEditingController phone=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController id=TextEditingController();
  var formKey = GlobalKey<FormState>();
  Future validateData() async {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState?.save();
      // setState(() {
      //   if (id == email && id2 == password) {
      //     // Navigator.push(context, MaterialPageRoute(builder: (context)=> Home(name: '', email: emailController.text)));
      //   } else {
      //     print(" valid122");
      //   }
      // });
    } else {
      print("not valid");
    }
  }
  @override
void initState(){
  super.initState();
  userName=name.text;
  userEmail=email.text;
  getuserdetails();
}
   String ?userName;
    String ?userEmail;
    String ?userImage;
  getuserdetails()async{
   
    userName = await SessionManager().get("displayName");
    // userName=name;
    userEmail = await SessionManager().get("email");
    // userEmail=email;
    userImage = await SessionManager().get("photoURL");
    // userImage=photoURL;
  }

   File? profile;
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

  Future profilePick() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final temp = File(image.path);
      setState(() => this.profile = temp);
      print(temp.path);
      return uploadImage(profile!.path, uploadUrl);
    } on PlatformException catch (e) {
      print('$e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Information',
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
          Builder(
            builder: (context) => IconButton(
              icon: Image.asset('assets/images/Group 15214.png'),
              onPressed: () => SlideDrawer.of(context)?.toggle(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            profile!=null?
            Image.file(
              profile!,
              height: 80,
              width: 80,
            ):ClipRRect(
              borderRadius: BorderRadius.circular(50),
                          child: userImage!=null?ClipRRect(
              borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                userImage!,
                height: 80,
                width: 80,
              ),
            ):Image.asset(
                'assets/images/Customer avatarfgfd.png',
                height: 80,
                width: 80,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Edit Profile',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Form(
              key: formKey,
                          child: Column(
                            children: [
              Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
              child: Container(
                  child: Row(
                    children: [
                      Expanded(
                                              child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26, width: 0.75),
                          borderRadius: BorderRadius.circular(30.0)),
                contentPadding: const EdgeInsets.symmetric(vertical: 4,horizontal: 30),
                hintText: "Phone Number",
                prefixIcon: Container(
                                  child: CountryCodePicker(
                                    onChanged: print,
                                    initialSelection: 'US',
                                    favorite: ['+44'],
                                    showCountryOnly: false,
                                    flagDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10)),
                                    showOnlyCountryWhenClosed: false,
                                    alignLeft: false,
                                  ),
                                ),
                hintStyle: headingText),
            keyboardType: TextInputType.text,
            style: headingText,
            controller: phone,
            validator: MultiValidator([
              RequiredValidator(errorText: "Required"),
            ]),
          ),
                      ),
                    ],
                  ),),
            ),
                        
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Container(
                  child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26, width: 0.75),
                    borderRadius: BorderRadius.circular(30.0)),
                contentPadding: const EdgeInsets.symmetric(vertical: 4,horizontal: 30),
                hintText: "Name",
                prefixIcon: Icon(Icons.account_circle_outlined),
                hintStyle: headingText),
            keyboardType: TextInputType.text,
            style: headingText,
            controller: TextEditingController()..text='$userName',
            validator: MultiValidator([
              RequiredValidator(errorText: "Required"),
            ]),
          ),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Container(
                  child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26, width: 0.75),
                    borderRadius: BorderRadius.circular(30.0)),
                contentPadding: const EdgeInsets.symmetric(vertical: 4,horizontal: 30),
                hintText: "Email Address",
                prefixIcon: Icon(Icons.email),
                hintStyle: headingText),
            keyboardType: TextInputType.text,
            style: headingText,
            controller: TextEditingController()..text='$userEmail',
            validator: MultiValidator([
              RequiredValidator(errorText: "Required"),
            ]),
          ),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Container(
                  child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26, width: 0.75),
                    borderRadius: BorderRadius.circular(30.0)),
                contentPadding: const EdgeInsets.symmetric(vertical: 4,horizontal: 30),
                hintText: "Personal ID",
                prefixIcon: Icon(Icons.credit_card),
                hintStyle: headingText),
            keyboardType: TextInputType.text,
            style: headingText,
            controller: id,
            validator: MultiValidator([
              RequiredValidator(errorText: "Required"),
            ]),
          ),),
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
                child: TextButton(
                  child: Text(
                    'SAVE',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.fromLTRB(55, 20, 55, 20)),
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFFf66b00),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ))),
                  onPressed: () {
                    validateData();
                  },
                ),
              ),
            ),
                ],
                          ),
            ),
          ],
        ),
      ),
    );
  }
}
