import 'package:flutter/material.dart';

import '../../components/RoundedButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var sizeh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 241, 244),
      appBar: AppBar(
        title: const Text(
          'IG Stalker',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.notification_add_rounded),
              onPressed: () {}),
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(236, 131, 31, 245),
      ),
      body: Stack(children: [
        Column(children: [
          Container(
            height: sizeh / 4.9,
            decoration: const BoxDecoration(
                color: Color.fromARGB(236, 131, 31, 245),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0))),
            child: Column(children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "58",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      Text(
                        "Followers",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.adobe.com/express/create/media_1bcd514348a568faed99e65f5249895e38b06c947.jpeg?width=400&format=jpeg&optimize=medium"),
                        radius: 45,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Israfil hossain ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        "35",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Followings",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // const _Divider(),
            ]),
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Column(children: [
              RoundedButton(
                icon: Icons.account_balance,
                color: Color.fromARGB(219, 190, 59, 164),
                title: 'Your Profile Visitors',
                onPressed: () => print('Signup Page'),
                // {
                //   Navigator.pushNamed(context, '');
                // }
              ),
              RoundedButton(
                icon: Icons.abc,
                color: Color.fromARGB(219, 190, 59, 164),
                title: 'Display Stories Secretly',
                onPressed: () => print('Signup Page'),
                // {
                //   Navigator.pushNamed(context, '');
                // }
              ),
            ])),
          ),
        ]),
      ]),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      indent: 20,
      endIndent: 20,
      color: Colors.grey,
    );
  }
}
