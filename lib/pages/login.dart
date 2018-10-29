// Define a Custom Form Widget
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

// Define a corresponding State class. This class will hold the data related to
// the form.
class LoginFormState extends State<LoginForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a `GlobalKey<FormState>`, not a GlobalKey<LoginFormState>!
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Scaffold(
      body: Builder(
          // Create an inner BuildContext so that the onPressed methods
          // can refer to the Scaffold with Scaffold.of().
          builder: (BuildContext context) {
        return Container(
          decoration: new BoxDecoration(
            // new
            gradient: new LinearGradient(
              // new
              // Where the linear gradient begins and ends
              begin: Alignment.topRight, // new
              end: Alignment.bottomLeft, // new
              // Add one stop for each color.
              // Stops should increase
              // from 0 to 1
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's
                // Colors class.
                Colors.green[400],
                Colors.green[600],
                Colors.green[700],
                Colors.green[800],
              ],
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(32.0),
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: 144.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    // Use email input type for emails.
                    decoration: new InputDecoration(
                      hintText: 'you@example.com',
                      labelText: 'E-mail Address',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a password';
                      }
                    },
                    obscureText: true, // Use secure text for passwords.
                    decoration: new InputDecoration(
                      hintText: 'Password',
                      labelText: 'Enter your password',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    color: Colors.white70,
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, we want to show a Snackbar
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text('Loging In')));
                        Navigator.pop(context);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 24.0,
                      ),
                      child: Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: FlatButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, we want to show a Snackbar
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                      }
                    },
                    child: Text(
                      'Create account',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
