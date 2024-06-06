import 'package:flutter/material.dart';
import 'package:untitled/app_bar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Hardcoded user data
    final Map<String, dynamic> userData = {
      'firstName': 'Demon',
      'lastName': 'Silva',
      'userId': '123456789012345',
      'gender': 'Male',
      'email': 'johndoe@example.com',
    };

    return Scaffold(
      appBar: customAppBar(title: 'Profile', showActions: true, showLeading: false, context: context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: const AssetImage("assets/images/2.-electronic-evan (1).jpg"),
                ),
                // Positioned(
                //   bottom: 2,
                //   right: 4,
                //   child: Container(
                //     width: 28,
                //     height: 28,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(100),
                //       color: Colors.blueGrey.withOpacity(0.8),
                //     ),
                //     child: GestureDetector(
                //       onTap: () {
                //         showModalBottomSheet(
                //           context: context,
                //           builder: ((build) => bottomSheet()),
                //         );
                //       },
                //       child: const Icon(
                //         Icons.edit,
                //         color: Colors.black54,
                //         size: 20,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Text(
                  "${userData['firstName']} ${userData['lastName']}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  userData['email'],
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 1),
            ProfileMenuWidget(
              title: "Personal Information",
              icon: Icons.person_2_outlined,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileDetails()),
                );
              },
            ),
            ProfileMenuWidget(
              title: "Contact Information",
              icon: Icons.contact_phone_outlined,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfilePage()),
                );
              },
            ),
            ProfileMenuWidget(
              title: "Career Profile",
              icon: Icons.work_history_outlined,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FeedbackScreen()),
                );
              },
            ),
            const Divider(thickness: 1),
            ProfileMenuWidget(
              title: "Info",
              icon: Icons.info,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FAQAndPricingScreen()),
                );
              },
            ),
            ProfileMenuWidget(
              title: "Log Out",
              icon: Icons.logout,
              textColor: Colors.red,
              endIcon: false,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginForm()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget bottomSheet() {
  //   return Container(
  //     height: 100.0,
  //     width: double.infinity,
  //     margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //     child: Column(
  //       children: <Widget>[
  //         const Text(
  //           "Choose Profile Photo",
  //           style: TextStyle(fontSize: 20.0),
  //         ),
  //         const SizedBox(height: 20),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             TextButton.icon(
  //               icon: const Icon(Icons.camera),
  //               onPressed: () {},
  //               label: const Text("Camera"),
  //             ),
  //             TextButton.icon(
  //               icon: const Icon(Icons.image),
  //               onPressed: () {},
  //               label: const Text("Gallery"),
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.blueGrey.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: Colors.black87,
        ),
      ),
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: textColor, fontSize: 17.0)),
      trailing: endIcon
          ? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.black.withOpacity(0.1),
        ),
        child: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blueGrey,
        ),
      )
          : null,
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Details'),
      ),
      body: Center(
        child: const Text('Profile Details Page'),
      ),
    );
  }
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Center(
        child: const Text('Edit Profile Page'),
      ),
    );
  }
}

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
      ),
      body: Center(
        child: const Text('Feedback Page'),
      ),
    );
  }
}

class FAQAndPricingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ and Pricing'),
      ),
      body: Center(
        child: const Text('FAQ and Pricing Page'),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: const Text('Login Page'),
      ),
    );
  }
}
