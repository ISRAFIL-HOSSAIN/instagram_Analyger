import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.color,
      required this.title,
      required this.onPressed,
      required this.icon});
  final IconData icon;
  final Color color;
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        elevation: 3.0,
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
            onPressed: onPressed(),
            
            //Go to login screen.
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )),
      ),
    );
  }
}


// RoundedButton(
//                     color: Colors.blueAccent,
//                     title: 'Sign Up',
//                     onPressed: () => print('Signup Page'),
//                     // {
//                     //   Navigator.pushNamed(context, '');
//                     // }
//                   ),