import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

 AppBar buildAppBar(BuildContext context,{bool isAppTitle =false,String titleText =""}) {
    return AppBar(
      backgroundColor: Theme.of(context).accentColor,
      centerTitle: true,
      title: Text(
        
        isAppTitle? "ConnecIT": titleText,
        
        
        style: isAppTitle? GoogleFonts.signika(
        fontSize: 30,
        color: Colors.white
      
      ):TextStyle(
         fontSize: 30,
        color: Colors.white
      
      ),),
    );
  }