import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
   final List<Map<dynamic,dynamic>> users;

   HomeScreen(this.users);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List of Users'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount:users.length,
          itemBuilder:(context,index){
            return Container(
              height:60,
              width:60,
              child:Column(
                children:[
                  Text('${users[index]['Id']}',),
                  Text('${users[index]['password']}',),
                ]
              ),
            );
          }
        ),
      ),
    );
  }
}
