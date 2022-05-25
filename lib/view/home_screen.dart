import 'package:dev_technologies_task/controller/auth_ontroller.dart';
import 'package:dev_technologies_task/widgets/my_filled_button.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff46AA6E),
        leading: IconButton(icon: const Icon(Icons.arrow_back, size: 0,), onPressed: () {},),
        leadingWidth: 10,
        title: const Text('Home Page', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Welcome to Hapnezz', style: TextStyle(fontSize: 20, color: Color(0xff46AA6E)),),
              const SizedBox(height: 15,),
              MyFilledButton(
                width: double.infinity,
                height: 55,
                color: Colors.red,
                txtColor: Colors.white,
                borderRadius: 5,
                txt: 'Log Out',
                ontap: () {
                  authController.logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
