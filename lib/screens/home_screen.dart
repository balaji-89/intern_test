import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final users=Hive.box('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Users'),
      ),

      body: FutureBuilder(
          future: Hive.openBox('users'),
          builder: (BuildContext context, AsyncSnapshot snapShot) {


            if (snapShot.connectionState != ConnectionState.done)
              return CircularProgressIndicator();
            else
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(

                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 60,
                        width: 60,
                        child: Column(children: [
                          Text(
                            '${users.getAt(index)['Id']}',
                          ),
                          Text(
                            '${users.getAt(index)['password']}',
                          ),
                        ]),
                      );
                    }),
              );
          }),
    );
  }
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
