
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ChangedPassword());

class ChangedPassword extends StatelessWidget {
  const ChangedPassword({Key? key}) : super(key: key);

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: Password(title: appTitle),
    );
  }
}

class Password extends StatefulWidget {
  const Password({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Password> createState() => _PasswordState();
}

bool _passwordVisible=false;
bool _confirmpasswordVisible=false;
@override
  void initState() {
    _passwordVisible = false;
    _confirmpasswordVisible = false;
  }


class _PasswordState extends State<Password> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change Password', style: TextStyle(color:Colors.black, fontSize: 15),),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading:IconButton(
                    icon:Image.asset('assets/images/Layer 1.png'),
                    onPressed: () => {
                      Navigator.of(context).pop(true)
                    },
                  ) ,
      elevation: 0,
      actions: [
            Builder(
              builder: (context) => IconButton(
                    icon:Image.asset('assets/images/Group 15214.png'),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  ),
            ),
          ],
          ),
      body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children:[
            Align(
              alignment: Alignment.center,
              child: Image.asset('assets/images/CustomerAvatar.png')),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text('Change Password', style: TextStyle(fontSize:20),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10),
                child: Text('Enter your new Password and then click on the saved button below.', textAlign: TextAlign.center,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: DottedBorder(
                  radius: Radius.circular(10),
                borderType: BorderType.RRect,
                child: ListTile(
        title: Row(
          children:[
            Image.asset('assets/images/lock.png'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextField(
                  controller: passwordController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration.collapsed(hintText: 'Password')),
              ),
            ),
            IconButton(onPressed: (){
              setState(() {
                   _passwordVisible = !_passwordVisible;
               });
            }, 
            icon: Icon( _passwordVisible
               ? Icons.visibility
               : Icons.visibility_off,))
          ],
        ),
        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: DottedBorder(
                  radius: Radius.circular(10),
                borderType: BorderType.RRect,
                child: ListTile(
        title: Row(
          children:[
            Image.asset('assets/images/lock.png'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextField(
                  obscureText: !_confirmpasswordVisible,
                  controller: confirmpasswordController,
                  decoration: InputDecoration.collapsed(hintText: 'Confirm Password')),
              ),
            ),
            IconButton(onPressed: (){
              setState(() {
                   _confirmpasswordVisible = !_confirmpasswordVisible;
               });
            }, 
            icon: Icon( _confirmpasswordVisible
               ? Icons.visibility
               : Icons.visibility_off,))
          ],
        ),
        ),
                ),
              ),
              Padding(
    padding: const EdgeInsets.only(top: 25),
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
	width: 300,
	child: TextButton(
    
    child: Text('SAVE', style: TextStyle(color:Colors.white),),
    style:
    ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(55, 20, 55, 20)),
      backgroundColor: MaterialStateProperty.all(Color(0xFFf66b00)),

      
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
      
      )
      
      
    )

    
    ),
    onPressed: () {},
    
),
    ),
    
  ),
                  ]
                ),
                
              ),
      ),
    );
  }
}
    