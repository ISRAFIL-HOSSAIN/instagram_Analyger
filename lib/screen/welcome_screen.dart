import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((status) {
      final connected = status == InternetConnectionStatus.connected;
      showSimpleNotification(
        Text(connected ? "CONNECTED TO INTERNET" : "NO INTERNET Connection"),
        background: connected ? Colors.green : Colors.red,
      );

      print("Internet Connection not connected");
    });
  }
  // SubmitButton .........................

  Widget _signInButton() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'login_screen');
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: const Color(0xffdf8333).withAlpha(100),
                offset: const Offset(2, 4),
                blurRadius: 8,
                spreadRadius: 2),
          ],
          color: Colors.white,
        ),
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),
      ),
    );
  }

  // Signup Button
  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'signup_screen');
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: const Text('SignUp',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            )),
      ),
    );
  }

  // label
  Widget _label() {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 20),
      child: Column(children: const <Widget>[
        Text(
          'Quick Login with Touch ID',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        SizedBox(
          height: 20,
        ),
        Icon(Icons.fingerprint,
            size: 90, color: Color.fromARGB(147, 249, 255, 255)),
        Text(
          'Touch ID',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            decoration: TextDecoration.underline,
          ),
        )
      ]),
    );
  }

  Widget _title() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'IG ',
            style: GoogleFonts.rosarivo(
              textStyle: Theme.of(context).textTheme.headline1,
              fontSize: 50,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(248, 225, 232, 253),
            ),
            children: const [
              TextSpan(
                text: 'Stalker',
                style: TextStyle(
                    color: Color.fromARGB(255, 121, 61, 126), fontSize: 40),
              ),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _title(),
                const SizedBox(
                  height: 80,
                ),
                _signInButton(),
                const SizedBox(height: 20),
                _signUpButton(),
                const SizedBox(
                  height: 20,
                ),
                _label(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
