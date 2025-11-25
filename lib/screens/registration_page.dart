import 'package:assessment/providers/auth_provider.dart';
import 'package:assessment/screens/login_page.dart';
import 'package:assessment/widgets/text_form_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  GlobalKey<FormState> _register = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SignUp",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _register,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormCustom(
                controllerName: userName,
                icon: Icons.person,
                lable: "Name",
                isSecure: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Cannot be null";
                  }
                  if (value.length < 2) {
                    return "Enter valid name.";
                  }
                },
              ),
              TextFormCustom(
                controllerName: userPhone,
                icon: Icons.phone,
                lable: "Phone Number",
                isSecure: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Cannot be null";
                  }
                  if (value.length != 11) {
                    return "Enter valid phone number.";
                  }
                },
              ),
              TextFormCustom(
                controllerName: userEmail,
                icon: Icons.email,
                lable: "Email",
                isSecure: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Cannot be null";
                  }
                  if (value.length < 8) {
                    return "Enter valid email.";
                  }
                },
              ),
              TextFormCustom(
                controllerName: userPassword,
                icon: Icons.lock,
                lable: "Password",
                isSecure: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Cannot be null";
                  }
                  if (value.length < 2) {
                    return "Enter valid name.";
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_register.currentState!.validate()) {
                    pro.signUp(
                      name: userName.text,
                      email: userEmail.text,
                      phone: userPhone.text,
                      password: userPassword.text,
                    );
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        pro.authModel?.message ?? "Defalut Message",
                      ),
                    ),
                  );

                  if (pro.authModel?.status == "false") {
                     ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        pro.authModel?.message ?? "User Already Exist",
                      ),
                    ),
                  );
                  }

                  if (pro.authModel?.status == "true") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }
                },
                child: Text(
                  "SignUp",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: 20),
              TextButton(onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
              }, child: Text("Already have an account, Login."))
            ],
          ),
        ),
      ),
    );
  }
}
