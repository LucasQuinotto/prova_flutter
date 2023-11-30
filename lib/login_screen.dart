import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'information_capture_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade200,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
                      Colors.cyan.shade900,
                      Colors.cyan.shade700,
                      Colors.cyan.shade400,
                      Colors.cyan.shade200
                    ]
          )
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 45, right: 45, bottom: 10),
                child: Row(
                  children: [
                    Text("Usuário", style: TextStyle(color: Colors.white, fontSize: 18),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: TextFormField(
                  controller: _userController,
                  decoration: const InputDecoration(
                    prefixIconColor: Colors.black87,
                    prefixIcon: Icon(Icons.person),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder()
                  ),
                  validator: (user){
                    if (user == null || user == ""){
                      return "O usuário é obrigatório.";
                    }
                    if (user.length > 20){
                      return "O usuário não pode ultrapassar 20 caracteres.";
                    }
                    if (user.endsWith(" ")){
                      return "O usuário não pode terminar com caractere de espaço.";
                    }
                    return null;
                  }
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 45, right: 45, bottom: 10),
                child: Row(
                  children: [
                    Text("Senha", style: TextStyle(color: Colors.white, fontSize: 18),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      prefixIconColor: Colors.black87,
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder()
                  ),
                  validator: (password){
                    if (password == null || password == ""){
                      return "A senha é obrigatória.";
                    }
                    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(password)){
                      return "A senha não pode conter caracteres especiais.";
                    }
                    if (password.length < 2){
                      return "A senha deve ter ao menos 2 caracteres.";
                    }
                    if (password.length > 20){
                      return "A senha não pode ultrapassar 20 caracteres.";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent.shade400,
                  borderRadius: BorderRadius.circular(15)
                  ),
                child: InkWell(
                  onTap: (){
                    if (_formKey.currentState!.validate()){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const InformationCaptureScreen()));
                    }

                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
                    child: Text("Entrar", style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: TextButton(
          onPressed: () async{
            if (!await launchUrl(Uri.parse("https://www.google.com.br"))){
              throw Exception('não conseguiu acessar a url');
            }
          },
          child: const Text("Politica de Privacidade", style: TextStyle(color: Colors.white, fontSize: 14),),
        ),
      ),
    );
  }
}
