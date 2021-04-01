import 'package:flutter/material.dart';
import 'package:flutter_summative/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: colorPalette[1],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('reigen.jpg')
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Text(
                "Rene Matthew Labuguen",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: colorPalette[3]
                  )
                )
              )
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "April 13, 1999",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: colorPalette[3]
                  )
                )
              )
            ),
            Container(
              margin: EdgeInsets.only(top:25),
              alignment: Alignment.center,
              child: Text(
                "BS-Information Technology 3A",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: colorPalette[3],
                  )
                )
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Ateneo de Davao University",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: colorPalette[3],
                  )
                )
              ),
            )
          ],
        )
      ),
    );
  }
}