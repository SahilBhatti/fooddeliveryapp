import 'package:demoapp/pages/user/SocailLogin.dart';
import 'package:demoapp/pages/user/googlesignin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart'as http;
import 'package:demoapp/pages/user/urlmodal.dart';


class Logout extends StatefulWidget {
      @override
      State<StatefulWidget> createState() => LogoutState();
    }

    class LogoutState extends State<Logout>
        with SingleTickerProviderStateMixin {
    late  final AnimationController controller;
     late final Animation<double> scaleAnimation;

      @override
      void initState() {
        super.initState();

        controller =
            AnimationController(vsync: this, duration: Duration(milliseconds: 450));
        scaleAnimation =
            CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

        controller.addListener(() {
          setState(() {});
        });

        controller.forward();
      }

       Future<void>logout()async{
    dynamic id =await SessionManager().remove("email");

    dynamic id2 =await SessionManager().remove("password");
  print(id);
  print(id2);
  var response=await http.get(Uri.parse(Url.url+"/login/logout"),
  headers: {
            "token":
                "Bearer hjskdhskjdhsjkdhskjdhskjdhskdhskjdhsdjksjhdsjkdsdks"
          });
          print(response.body);
          print("logout");
          print(response.statusCode);
          if(response.statusCode==200){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SocailLogin()));
          }else{
            ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('logout failed')));
          }
    // Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
    
  }

      @override
      Widget build(BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Container(
                margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(15.0),
                  height: 350.0,
                  width: 280.0,
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/images/hd_logo.png',height:150,width: 150,),
                      Text('Want to Logout ?',style: TextStyle(fontWeight:FontWeight.bold, fontSize:20),),
                      Padding(
                        padding: const EdgeInsets.only(top:50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:[
                          ElevatedButton(onPressed: (){
                            Navigator.pop(context);
                          },
                            child: Padding(
                              padding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),
                              child: Text('Cancel'.toUpperCase(),style: TextStyle(fontWeight:FontWeight.bold,)),
                            ),),
                            ElevatedButton(onPressed: ()async{
                              signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return SocailLogin();}), ModalRoute.withName('/'));
                              logout();
                              // Navigator.push(
                              // context,
                              // MaterialPageRoute(
                              //     builder: (context) => SocailLogin()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left:30,right:30,top:5,bottom:5),
                              child: Text('Ok'.toUpperCase(),style: TextStyle(fontWeight:FontWeight.bold,),),
                            )
                        )]),
                      )
                    ],
                  )),
            ),
          ),
        );
      }
    }