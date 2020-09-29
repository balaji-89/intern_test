import 'package:flutter/material.dart';
import 'package:intern_test/screens/log_in%20screen.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LogInPage(),
    );
  }
}

class LogInPage extends StatelessWidget {
  final List<String> selection = ['Log In', 'Sign Up'];

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset('assets/images/grocery_test_image.jpg'),
              ),
              Text('Grocery Shop',style: TextStyle(letterSpacing: 2,fontSize: 25,fontWeight:FontWeight.bold, color: Colors.green.withOpacity(0.8)),),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              RaisedButton(
                  child: Text(selection[0],
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LogInScreen(selectedOption: selection[0])));
                  }),
                SizedBox(
                  width: 40,
                    child: Text('or',textAlign: TextAlign.center,)),
              RaisedButton(
                  child: Text(selection[1],
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LogInScreen(selectedOption: selection[1])));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
