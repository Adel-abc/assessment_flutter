import 'package:assessment/providers/auth_provider.dart';
import 'package:assessment/screens/books_page.dart';
import 'package:assessment/screens/registration_page.dart';
import 'package:assessment/widgets/text_form_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});


  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  GlobalKey<FormState> _login = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _login,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              TextFormCustom(controllerName: userEmail, icon: Icons.email, lable: "Email", isSecure: false, validator: (value) 
              {
                if (value == null || value.isEmpty) {
                    return "Cannot be null";
                  }
                  if (value.length < 8) {
                    return "Enter valid email.";
                  }
              }),

              TextFormCustom(controllerName: userPassword, icon: Icons.lock, lable: "Password", isSecure: true, validator: (value) 
              {
                if (value == null || value.isEmpty) {
                    return "Cannot be null";
                  }
                  if (value.length < 2) {
                    return "Enter valid name.";
                  }
              }),



              ElevatedButton(
                onPressed: () {
                  if (_login.currentState!.validate()) {
                    pro.logIn(
                      email: userEmail.text,
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
                      MaterialPageRoute(builder: (context) => BooksPage(userName: "user",)),
                    );
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),




              TextButton(onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
              },
               child: Text("Don't have account, SignUp."))
            ],
          ),
        ),
      ),
    );
  }
}