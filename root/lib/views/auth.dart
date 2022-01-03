import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:root/const/const.dart';
import 'package:root/views/home.dart';

class Login extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Center(
                child: Lottie.asset('assets/ani2-1.json', height: 150),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Login',
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: firstColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Container(
                width: 200,
                child: Center(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: textEditingController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor insira seu numero.';
                      } else if (!value.isPhoneNumber) {
                        return 'Insira um numero de telefone';
                      } else if (value.length != 9) {
                        return 'Insira um numero de telefone';
                      }
                      return null;
                    },
                    onChanged: (String value) {},
                    style: GoogleFonts.montserrat(fontSize: 14),
                    decoration: InputDecoration(
                        labelText: 'Numero',
                        labelStyle: GoogleFonts.montserrat(fontSize: 14),
                        prefixStyle: GoogleFonts.montserrat(fontSize: 14),
                        prefixText: '+244 '),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                child: Center(
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    controller: textEditingController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor insira a senha.';
                      }
                      return null;
                    },
                    onChanged: (String value) {},
                    style: GoogleFonts.montserrat(fontSize: 14),
                    decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: GoogleFonts.montserrat(fontSize: 14),
                        prefixStyle: GoogleFonts.montserrat(fontSize: 14),
                        prefixText: ' '),
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(Home());
                    if (_formKey.currentState.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Bem vindo',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white, fontSize: 15))),
                      );
                    } else {
                      print('Erro no form');
                    }
                  },
                  child: Container(
                    height: 80.0,
                    width: 180,
                    child: Column(
                      children: [
                        Container(
                          width: 147,
                          height: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xff000000)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: Center(
                              child: Text('Entrar',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white, fontSize: 15)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              /*SizedBox(
                height: 10,
              ),
              Center(
                  child: GestureDetector(
                      onTap: () {
                        Get.to(Register());
                      },
                      child: Text(
                        'Não tem uma conta? registar-se.',
                        style: GoogleFonts.montserrat(
                          color: firstColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ))),*/
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
