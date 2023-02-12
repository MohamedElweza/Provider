import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:sm_provider/provider.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: true,
      centerTitle: true,
      leading: PopupMenuButton(
        icon: const CircleAvatar(
          backgroundImage: NetworkImage(
              'Provider.of<MyProvider>(context).image.toString()',
          ),
          backgroundColor: Colors.red,
        ),
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem<String> (
              value: '1',
              child: Text('1'),
            ),
            PopupMenuItem<String> (
              value: '2',
              child: Text('2'),
            ),
          ];
        },
      ),
      // backgroundColor: COLORS_BG,
      title: Text('Cart', style: TextStyle(fontSize: 25, color: Colors.deepPurple),),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:8.0, top: 8, bottom: 8, right: 15),
          child: badges.Badge(
            badgeContent: Text(Provider.of<MyProvider>(context).counter.toString(), style: TextStyle(color: Colors.white),),
            child: Icon(Icons.shopping_cart_rounded, size: 35,color: Colors.black,),
          ),
        )

      ],
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 35,),
            const Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Icon(Icons.book, size: 100, color: Colors.green,),
            ),

            Text(Provider.of<MyProvider>(context).counter.toString(), style: TextStyle(
              color: Colors.black54,
              fontSize: 45,
            ),),

        ],
      ),
    ),
    );
  }
}
