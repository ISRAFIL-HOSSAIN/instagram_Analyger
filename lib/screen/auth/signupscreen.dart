import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import '../../widget/bezierContainer.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
          'Sign Up',
          style: TextStyle(
            fontSize: 22,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
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
        _entryField("Username "),
        _entryField("Email id"),
        _entryField(
          "Password",
          isPassword: true,
        ),
      ],
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, 'login_screen'),
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.all(15),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'Already have an account ?',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Login',
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
                    SizedBox(
                      height: sizeh * .02,
                    ),
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
