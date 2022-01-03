import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:root/service/service.dart';
import 'package:root/views/home.dart';

double heightScreen(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double widthScreen(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

Color backgrouColor = Colors.white;
Color firstColor = Color(0xffCEE88D);

String user_key = 'user_phone';

Alert(
  context, {
  String title,
  String contexto,
  Function anotherAction,
  bool isDeleteUser,
  bool isCocluir,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title,
            style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(contexto,
                  style: GoogleFonts.montserrat(
                      color: Colors.black, fontSize: 12)),
            ],
          ),
        ),
        actions: <Widget>[
          isDeleteUser == true
              ? TextButton(
                  child: Text('Apagar',
                      style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 13)),
                  onPressed: () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Usuario apagado',
                              style: GoogleFonts.montserrat(
                                  color: Colors.white, fontSize: 15))),
                    );
                    //Get.back();
                    await Service.deleteUser();
                    Get.to(Home());
                  },
                )
              : Container(),
          isCocluir == true
              ? TextButton(
                  child: Text('Cocncluir',
                      style: GoogleFonts.montserrat(
                          color: Colors.black, fontSize: 13)),
                  onPressed: () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Usuario restaurado',
                              style: GoogleFonts.montserrat(
                                  color: Colors.white, fontSize: 15))),
                    );
                    //Get.back();
                    await Service.resetUser();
                    Get.to(Home());
                  },
                )
              : Container(),
          TextButton(
            child: Text('Fechar',
                style:
                    GoogleFonts.montserrat(color: Colors.black, fontSize: 13)),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
    },
  );
}
