import 'package:ecommerce_flogics/constants/font_sizes/font_sizes.dart';
import 'package:ecommerce_flogics/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context,userProvider,child){
        String userName = userProvider.userProfile?.username??"";
        String firstName = userProvider.userProfile?.name.firstname??"";
        String lastName = userProvider.userProfile?.name.lastname??"";
        String phone = userProvider.userProfile?.phone??"";
        String city = userProvider.userProfile?.address.city??"";

        return SingleChildScrollView(
          child: (userProvider.userProfile==null)?Center(child: CircularProgressIndicator(),):Column(
            children: [
              Text("User name: $userName",style: TextStyle(fontSize: FontSizes.FONT_SIZE_22),),
              Text("Name: $firstName $lastName",style: TextStyle(fontSize: FontSizes.FONT_SIZE_22)),
              Text("Phone: $phone",style: TextStyle(fontSize: FontSizes.FONT_SIZE_22)),
              Text("City: $city",style: TextStyle(fontSize: FontSizes.FONT_SIZE_22)),

            ],
          ),
        );
      },
    );
  }
}
