import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sm_provider/provider.dart';
import 'package:sm_provider/welcom_screen.dart';
import 'Textformfield.dart';

class Register extends StatefulWidget {
   Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String _imagepath = '';
  final ImagePicker imgpicker = ImagePicker();
  Future getImage() async {
    try {
      var pickedFile = await imgpicker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          _imagepath = pickedFile.path;
        });
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking image.");
    }
  }

   late TextEditingController conUserName = TextEditingController();
   late TextEditingController conEmail = TextEditingController();
   late TextEditingController conPassword  = TextEditingController();
  late TextEditingController image = TextEditingController();
  late TextEditingController phone  = TextEditingController();


   @override
   void dispose() {
     conUserName.dispose();
     conEmail.dispose();
     conPassword.dispose();
     image.dispose();
     phone.dispose();
     super.dispose();
   }

   @override
   void initState() {
     super.initState();
     conUserName..addListener(() {
       Provider.of<MyProvider>(context, listen: false).conUserName
       = conUserName.text;
     });
     conEmail..addListener(() {
       Provider.of<MyProvider>(context, listen: false).conEmail
       = conEmail.text;
     });
     conPassword..addListener(() {
       Provider.of<MyProvider>(context, listen: false).conPassword
       = conPassword.text;
     });
     phone..addListener(() {
       Provider.of<MyProvider>(context, listen: false).phone
       = phone.text;
     });
     image..addListener(() {
       Provider.of<MyProvider>(context, listen: false).image
       = image.text;
     });
   }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 35,),
                const Padding(
                  padding: EdgeInsets.only(bottom: 40.0),
                  child: Icon(Icons.border_color_outlined, size: 100, color: Colors.red,),
                ),
                const SizedBox(height: 5,),
                Text('Sign Up Now!', style: GoogleFonts.bebasNeue(fontSize: 50)),
                const SizedBox(height: 10.0),
                GetTextFormField(
                    controller: conUserName,
                    icon: Icons.person_outline,
                    inputType: TextInputType.name,
                    hintName: 'User Name',
                  onChanged: (value) {
                    value = conUserName;
                  },),
                const SizedBox(height: 10.0),
                GetTextFormField(
                    controller: conEmail,
                    icon: Icons.email,
                    inputType: TextInputType.emailAddress,
                    hintName: 'Email', onChanged: (value) {
                  value = conEmail; },),

                const SizedBox(height: 10.0),

                GetTextFormField(
                  controller: conPassword,
                  icon: Icons.lock,
                  isObscureText: true,
                  hintName: 'Password',
                  onChanged: (value) { value = conPassword; },
                ),

                const SizedBox(height: 10.0),

                GetTextFormField(
                  controller: phone,
                  icon: Icons.phone,
                  hintName: 'Mobile Phone',
                  onChanged: (value) { value = phone; },
                ),

                const SizedBox(height: 10.0),

                GetTextFormField(
                  controller: image,
                  icon: Icons.image,
                  hintName: 'Image',
                  onChanged: (value) { value = image; },
                ),

                const SizedBox(height: 15,),

              // Column(
              //   children: [
              //     CircleAvatar(
              //       radius: 40,
              //       backgroundImage: FileImage(File(_imagepath)),
              //     ),
              //     TextButton(
              //       onPressed: getImage,
              //       child: Row(
              //         mainAxisSize: MainAxisSize.min,
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Container(
              //             margin: EdgeInsets.only(top: 5),
              //             child: const Icon(
              //               Icons.image,
              //             ),
              //           ),
              //           Container(
              //             padding: EdgeInsets.only(
              //               top: 4,
              //               left: 10,
              //             ),
              //             child: Text('Add profle picture'),
              //           ),
              //         ],
              //       ),
              //     )
              //   ],
              // ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextButton(
                    onPressed: (){
                      Navigator.push(context,
                                      PageTransition(child: Welcome(), type: PageTransitionType.topToBottom),);
                    },
                    child: Container(
                      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(12.0)),
                      child:  Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Text('Register', style: GoogleFonts.radley(fontSize: 25, color: Colors.white) ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
