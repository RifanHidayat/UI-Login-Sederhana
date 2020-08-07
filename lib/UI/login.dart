import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginsederhana/UI/home.dart';
import 'package:loginsederhana/utilities/constants.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  var cUsername=new TextEditingController();
  var cpass=new TextEditingController();
  var defaultusername="admin";
  var defaultpassword="admin";

  Widget _builUsername(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Text(
          'Username',
        style: kLabelStyle,
      ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: cUsername,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans'
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: "Masukan Username",
              hintStyle: kHintTextStyle,


            ),
          ),

        )
      ],
    );
  }
  Widget _builPass(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: cpass,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans'
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: "Masukan Massword",
              hintStyle: kHintTextStyle,


            ),
          ),

        )
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          var username=cUsername.text;
          var pass=cpass.text;
          if (username.isEmpty){
            showSnakeBar(scaffoldState, 'Username belum diisi');

          }else if (pass.isEmpty){
            showSnakeBar(scaffoldState, 'password belum diisi');

          }else if(username==defaultusername){
            if (pass==defaultpassword){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              cUsername.clear();
              cpass.clear();


            }else{
              showSnakeBar(scaffoldState, 'Password yang dimasukan tidak sesuai');

            }
          }else{
            showSnakeBar(scaffoldState, 'Username yang dimasukkan salah');


          }
//          if (!email.contains("@")){
//            showSnakeBar(scaffoldState, 'Email tidak validr');
//          }else if (password.length<4 || password.length>15 ){
//            showSnakeBar(scaffoldState, 'Minimal password 4 karakter dan Maximal password 15 karakter');
//
//
//          }

        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> scaffoldState =
  new GlobalKey<ScaffoldState>();
  void showSnakeBar(scaffoldState, String _pesan) {
    scaffoldState.currentState.showSnackBar(
      new SnackBar(
        content: Text(_pesan),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,

                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 50.0,
                  ),


                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50.0),
                      _builUsername(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _builPass(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildLoginBtn(),



                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}
