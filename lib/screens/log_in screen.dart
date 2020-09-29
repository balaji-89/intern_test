import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  String selectedOption;

  LogInScreen({@required this.selectedOption});

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  dynamic eMailAddress;
  dynamic password;
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void saveForm() {
    bool isValid = _formKey.currentState.validate();
    if (isValid) {
      _formKey.currentState.save();
    }
  }

  @override
  void dispose() {
    emailIdController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.27,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Image.asset('assets/images/grocery_test_image.jpg'),
            ),
            SizedBox(
              height: widget.selectedOption == 'Log In'
                  ? MediaQuery.of(context).size.height * 0.35
                  : MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width * 0.75,
              child: LayoutBuilder(
                builder: (context, constraints) => Container(
                  padding: EdgeInsets.only(left: 7, right: 7, bottom: 6),
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: Colors.green.withOpacity(0.8)),
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: widget.selectedOption == 'Log In'
                          ? MainAxisAlignment.spaceAround
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            labelText: 'E-Mail ID',
                            hintStyle: TextStyle(
                              fontSize: 10,
                              color: Colors.black26,
                            ),
                            hintText: 'Enter your E-Mail ID',
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.length == 0) {
                              return 'Please enter E-mail Id';
                            }
                            if (!value.contains('@') &&
                                !value.contains('.com')) {
                              
                              return 'Enter valid E-Mail Id';
                            }
                            return null;
                          },
                          onSaved: (email) {
                            eMailAddress = email;
                          },
                        ),
                        TextFormField(
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            labelText: 'Password',
                            hintStyle: TextStyle(
                              fontSize: 10,
                              color: Colors.black26,
                            ),
                            hintText: 'Enter Password',
                          ),
                          textInputAction: widget.selectedOption == 'Sign Up'
                              ? TextInputAction.next
                              : TextInputAction.done,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          validator: (value) {
                            if (value.length <= 5 || value.length == 0) {
                              return 'password is too short';
                            }
                            return null;
                          },
                          onFieldSubmitted: widget.selectedOption == 'Sign Up'
                              ? null
                              : (_) {
                                  saveForm();
                                },
                          onSaved: (receivedPassword) {
                            password = receivedPassword;
                          },
                        ),
                        if (widget.selectedOption == 'Sign Up')
                          TextFormField(
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                focusColor: Colors.green.withOpacity(0.7),
                                labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                labelText: 'Confirm password',
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black26,
                                ),
                                hintText: 'Enter Password'),
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) {
                              saveForm();
                            },
                            validator: (value) {
                              if (value.length <= 5 || value.length == 0) {
                                return 'password is too short';
                              }
                              if (value != passwordController.text) {
                                confirmPasswordController.clear();
                                return 'Enter correct password';
                              }

                              return null;
                            },
                          ),
                        SizedBox(
                          height: 12,
                        ),
                        RaisedButton(
                          child: Text(widget.selectedOption,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          onPressed: saveForm,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.selectedOption == 'Sign Up'
                      ? 'Already have a account ?'
                      : 'Create Account ?',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(
                  width: 15,
                ),
                RaisedButton(
                    child: Text(
                        widget.selectedOption == 'Sign Up'
                            ? 'Log In'
                            : 'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    onPressed: () {

                      setState(() {
                        emailIdController.clear();
                        passwordController.clear();
                        confirmPasswordController.clear();
                        widget.selectedOption == 'Sign Up'
                            ? widget.selectedOption = 'Log In'
                            : widget.selectedOption = 'Sign Up';
                      });
                    }),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
