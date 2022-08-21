import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import '../../widget/bezierContainer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((status) {
      final connected = status == InternetConnectionStatus.connected;
      showSimpleNotification(
          Text(connected ? "CONNECTED TO INTERNET" : "NO INTERNET"),
          background: Colors.green);
    });
  }

  // backButton Widget
  Widget _backButton() {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Row(children: [
          Container(
            padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
            child: const Icon(
              Icons.keyboard_arrow_left,
              color: Color.fromARGB(255, 29, 28, 28),
            ),
          ),
          const Text(
            'Back',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          )
        ]),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            obscureText: isPassword,
            decoration: const InputDecoration(
              border: InputBorder.none,
              fillColor: Color.fromARGB(255, 241, 239, 239),
              filled: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, 'home_screen'),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2),
            ],
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 72, 161, 251),
                  Color.fromARGB(255, 97, 16, 228)
                ])),
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(children: const <Widget>[
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              thickness: 1,
            ),
          ),
        ),
        Text('or'),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Divider(
              thickness: 1,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ]),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        text: 'IG ',
        style: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w700,
          color: Color(0xFFF502BE),
        ),
        children: [
          TextSpan(
            text: 'Stalker',
            style:
                TextStyle(color: Color.fromARGB(255, 62, 5, 122), fontSize: 35),
          ),
        ],
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email id"),
        _entryField(
          "Password",
          isPassword: true,
        ),
      ],
    );
  }

  // Widget _googleButton() {
  //   return InkWell(
  //     onTap: () async => await signWithGoogle(),
  //     child: Container(
  //       height: 50,
  //       margin: const EdgeInsets.symmetric(vertical: 20),
  //       decoration: const BoxDecoration(
  //         borderRadius: BorderRadius.all(Radius.circular(10)),
  //       ),
  //       child: Row(
  //         children: <Widget>[
  //           Expanded(
  //             flex: 1,
  //             child: Container(
  //               decoration: const BoxDecoration(
  //                 color: Color.fromARGB(255, 234, 221, 221),
  //                 borderRadius: BorderRadius.only(
  //                   bottomLeft: Radius.circular(10),
  //                   topLeft: Radius.circular(10),
  //                 ),
  //               ),
  //               alignment: Alignment.center,
  //               child: Image.asset('assets/images/google.png',
  //                   height: 40, width: 40),
  //               // const Text(
  //               //   'G',
  //               //   style: TextStyle(
  //               //     color: Colors.white,
  //               //     fontSize: 28,
  //               //     fontWeight: FontWeight.bold,
  //               //   ),
  //               // ),
  //             ),
  //           ),
  //           Expanded(
  //             flex: 5,
  //             child: Container(
  //               decoration: const BoxDecoration(
  //                 color: Color(0xfffC54238),
  //                 borderRadius: BorderRadius.only(
  //                     bottomRight: Radius.circular(5),
  //                     topRight: Radius.circular(5)),
  //               ),
  //               alignment: Alignment.center,
  //               child: const Text(
  //                 'Log in with Google',
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 19,
  //                   fontWeight: FontWeight.w400,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, 'signup_screen'),
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.all(15),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'Don\'t have an account ?',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'SignUp',
                style: TextStyle(
                  color: Color.fromARGB(255, 63, 19, 222),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizeh = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: sizeh,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -sizeh * .20,
                right: -MediaQuery.of(context).size.width * .4,
                child: const BezierContainer(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: sizeh * .2),
                    _title(),
                    const SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.centerRight,
                      child: const Text(
                        'Forgot Password ?',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    _divider(),
                    // _googleButton(),
                    // SizedBox(
                    //   height: sizeh * .005,
                    // ),
                    _createAccountLabel(),
                  ],
                )),
              ),
              Positioned(top: 25, left: 0, child: _backButton()),
            ],
          ),
        ),
      ),
    );
  }
}
