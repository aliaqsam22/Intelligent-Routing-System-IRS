import 'package:flutter/material.dart';
import '../drawer_pages/feedback.dart';

import '../drawer_pages/log_out.dart';
import '../drawer_pages/return_policy.dart';
import '../drawer_pages/track_order.dart';

import '../drawer_pages/privacy.dart';
import '../drawer_pages/term_condition.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 80),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(60), topRight: Radius.circular(60)),
        child: Drawer(
          surfaceTintColor: Colors.amber,
          child: ListView(
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(60))),
                  child: ListTile(
                    title: Text(
                      'IRS Map',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Go The Best Way',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  )),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Colors.black54,
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyTrackO()));
                  },
                  icon: const Icon(Icons.arrow_forward_ios_sharp),
                  color: Colors.black54,
                ),
                title: const Text(
                  'Home',
                  selectionColor: Colors.white70,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.route,
                  color: Colors.black54,
                ),
                title: const Text(
                  'Plan a Route',
                  selectionColor: Colors.white70,
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyFeedBack()));
                  },
                  icon: const Icon(Icons.arrow_forward_ios_sharp),
                  color: Colors.black54,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.cloud,
                  color: Colors.black54,
                ),
                title: const Text(
                  'Weather Map',
                  selectionColor: Colors.white70,
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyPrivacy()));
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.black54,
                    )),
              ),
              ListTile(
                leading: const Icon(
                  Icons.verified_user,
                  color: Colors.black54,
                ),
                title: const Text(
                  'Profile',
                  selectionColor: Colors.white70,
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyReturnPolicy()));
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.black54,
                    )),
              ),
              ListTile(
                leading: const Icon(
                  Icons.rule,
                  color: Colors.black54,
                ),
                title: const Text(
                  'Term & Condition',
                  selectionColor: Colors.white70,
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MytermC()));
                  },
                  icon: const Icon(Icons.arrow_forward_ios_sharp),
                  color: Colors.black54,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.black54,
                ),
                title: const Text(
                  'Logout',
                  selectionColor: Colors.white70,
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyLogout()));
                  },
                  icon: const Icon(Icons.arrow_forward_ios_sharp),
                  color: Colors.black54,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
