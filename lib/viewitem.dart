import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_summative/shared/constants.dart';
import 'package:flutter_summative/widgets/appbar.dart';
import 'package:flutter_summative/widgets/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class ViewItemScreen extends StatefulWidget {
  final int id;
  ViewItemScreen({Key key, @required this.id}) : super(key:key);
  @override
  _ViewItemScreenState createState() => _ViewItemScreenState(id);
}

class _ViewItemScreenState extends State<ViewItemScreen> {
  final String fakeStoreURL = 'https://fakestoreapi.com/products/';
  Map fakeStoreData = {};
  int id = 0;
  bool isLoading = true;
  _ViewItemScreenState(this.id);

  @override
  void initState(){
    super.initState();
    getFakeStoreData().then((value){
      Map data = jsonDecode(value.body);
      setState(() {
        fakeStoreData = data;
        isLoading = false;    
      });
    });
  }

  String formatPrice(double price){
    String formattedPrice = price.toStringAsFixed(2);
    return "\$$formattedPrice";
  }

  Future<Response> getFakeStoreData() async{
    int newID = id + 1;
    Response response = await get(Uri.parse('$fakeStoreURL$newID'));
    return response;
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Sidebar(),
      appBar: Header(
        appBar: AppBar(),
        title: AutoSizeText(
          fakeStoreData["title"] == null ? "Loading" : fakeStoreData["title"],
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: colorPalette[3],
              fontWeight: FontWeight.bold,
            )
          ),
        ),
      ), 
      body: isLoading ? 
        Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(colorPalette[1]),
          ),
        )
        :
        Container(
          padding: EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 50),
          decoration: BoxDecoration(
            color: colorPalette[3],
            border: Border.all(
              width: 1,
              color: colorPalette[1]
            ),
            boxShadow: [BoxShadow(
              spreadRadius: 0.1,
              blurRadius: 5,
              offset: Offset(3, 3),
              color: Colors.grey
            )]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  fakeStoreData["image"],
                  fit: BoxFit.fitWidth
                )
              ),
              Text(
                fakeStoreData["title"],
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                  )
                )
              ),
              Text(
                fakeStoreData["description"],
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  )
                )
              ),
              SizedBox(height: 5),
              Text(
                formatPrice(fakeStoreData["price"]),
                textAlign: TextAlign.left,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: accentColors[4],
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                  )
                )
              ),
            ],
          )
        )
    );
  }
}