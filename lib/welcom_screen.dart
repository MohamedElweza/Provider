import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sm_provider/provider.dart';
import 'package:sm_provider/result.dart';

class Welcome extends StatelessWidget {
  final Duration duration = const Duration(milliseconds: 800);
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8),
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              FadeInUp(
                duration: duration,
                delay: const Duration(milliseconds: 2000),
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 50,
                    left: 5,
                    right: 5,
                  ),
                  width: size.width,
                  height: size.height / 2,
                  child: Lottie.asset("assets/wl.json", animate: true),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              /// TITLE
              FadeInUp(
                duration: duration,
                delay: const Duration(milliseconds: 1600),
                child:  Text(
                  "Welcome ${provider.conUserName}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),

              ///
              const SizedBox(
                height: 10,
              ),

              /// SUBTITLE
              FadeInUp(
                duration: duration,
                delay: const Duration(milliseconds: 1000),
                child:  Text(
                  """
Your Email is ${provider.conEmail} 
Your Phone Number is ${provider.phone} 
                   """,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
                ),
              ),

              // Expanded(child: Container()),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Books', style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    RawMaterialButton(
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    constraints: BoxConstraints(minWidth: 24.0, minHeight: 24.0),
                    onPressed: (){
                      provider.decrement();
                    },
                    elevation: 2.0,
                    fillColor: Colors.lightBlue,
                    child: Icon(
                      Icons.remove,
                      color: Colors.black,
                      size: 12.0,
                    ),
                    shape: CircleBorder(),
                  ),
                      // _createIncrementDicrementButton(Icons.remove, () => _dicrement()),
                      Text(provider.counter.toString()),
                      RawMaterialButton(
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        constraints: BoxConstraints(minWidth: 24.0, minHeight: 24.0),
                        onPressed: (){
                          provider.increment();
                        },
                        elevation: 2.0,
                        fillColor: Colors.lightBlue,
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 12.0,
                        ),
                        shape: CircleBorder(),
                      ),
                    ],
                  ),
                ]
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context,
                      PageTransition(child: Result(), type: PageTransitionType.leftToRight),);
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(12.0)),
                    child:  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Text('Go to the Cart!', style: GoogleFonts.radley(fontSize: 25, color: Colors.white) ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SButton extends StatelessWidget {
  const SButton({
    Key? key,
    required this.size,
    required this.color,
    required this.borderColor,
    required this.img,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  final Size size;
  final Color color;
  final Color borderColor;
  final String img;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: ((context) => const MainScreen()),
        //   ),
        // );
      },
      child: Container(
        width: size.width / 1.2,
        height: size.height / 15,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              height: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
