import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/Services.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  //instance of services class (Database Instance)
  DatabaseMethods databaseMethods = new DatabaseMethods();

  //Controllers handling the text INPUT for each  user Data
  TextEditingController fullNameController = new TextEditingController();
  TextEditingController dobController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController bankAcNoController = new TextEditingController();
  TextEditingController ifscNoController = new TextEditingController();
  TextEditingController githubController = new TextEditingController();

//Parsing the different data into a single varible userData
  formData() {
    Map<String, dynamic> userData = {
      "Full Name": fullNameController.text,
      "DateOFBirth": dobController.text,
      "Email-Id": emailController.text,
      "Address": addressController.text,
      "Bank Account No": bankAcNoController.text,
      "IFSC Code": ifscNoController.text,
      "Github Handel": githubController.text,
    };
    databaseMethods.addData(userData, fullNameController.text);
    print(userData);
    fullNameController.clear();
    dobController.clear();
    emailController.clear();
    addressController.clear();
    bankAcNoController.clear();
    ifscNoController.clear();
    githubController.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Form Verification",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellowAccent,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Container(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    //Tfull name,DOB,email,mailing addres,bank Ac no , ifsc code,github handel
                    TextFormField(
                      controller: fullNameController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter Full Name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: "Full Name"),
                    ),
                    TextFormField(
                      controller: dobController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Date of Birth';
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: "Date Of Birth"),
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (!value.contains("@")) {
                          return "Please enter a valid email-Id";
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: "Email-Id"),
                    ),
                    TextFormField(
                      controller: addressController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Address/Mailing Address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: "Address"),
                    ),
                    TextFormField(
                      controller: bankAcNoController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Bank AC NO';
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: "Bank AC NO."),
                    ),
                    TextFormField(
                      controller: ifscNoController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter IFSC Code';
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: "IFSC Code"),
                    ),
                    TextFormField(
                      controller: githubController,
                      validator: (value) {
                        if (!value.contains(".com")) {
                          return 'Please enter Github Handel';
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: "Github Handel"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          print("Pressed");
                          if (_formKey.currentState.validate()) {
                            print("pressed with validation of all");
                            formData();
                          }
                        },
                        child: Text("SUBMIT"))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
