import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_summative/shared/constants.dart';
import 'package:flutter_summative/viewitem.dart';
import 'package:flutter_summative/widgets/appbar.dart';
import 'package:flutter_summative/widgets/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class FakeStoreScreen extends StatefulWidget {
  @override
  _FakeStoreScreenState createState() => _FakeStoreScreenState();
}

class _FakeStoreScreenState extends State<FakeStoreScreen> {
  final String fakeStoreURL = 'https://fakestoreapi.com/products';
  List<dynamic> fakeStoreData = [];
  int dataLength = 0;

  bool isLoading = true;
  
  @override
  void initState(){
    super.initState();
    getFakeStoreData().then((value){
      List<dynamic> data = jsonDecode(value.body);
      setState(() {
        fakeStoreData = data;
        dataLength = fakeStoreData.length;
        isLoading = false;    
      });
    });
  }

  String formatPrice(double price){
    String formattedPrice = price.toStringAsFixed(2);
    return "\$$formattedPrice";
  }

  Future<Response> getFakeStoreData() async{
    Response response = await get(Uri.parse(fakeStoreURL));
    return response;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Header(
        appBar: AppBar(),
        title: AutoSizeText(
          "Fake Store",
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: colorPalette[3],
              fontWeight: FontWeight.bold
            )
          ),
        ),
      ), 
      endDrawer: Sidebar(),
      body: isLoading ? 
        Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(colorPalette[1]),
          ),
        ) : 
        Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: colorPalette[3],
        margin: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2/3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: dataLength,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index){
            return Container( 
              padding: EdgeInsets.all(10),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => ViewItemScreen(id: index),
                          ),
                        );
                      },
                      child: Image.network(
                        fakeStoreData[index]["image"],
                        fit: BoxFit.fitWidth
                      )
                    )
                  ),  
                  SizedBox(height: 10),
                  Text(
                    fakeStoreData[index]["title"],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      )
                    )
                  ),
                  Text(
                    fakeStoreData[index]["description"],
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.w400,
                      )
                    )
                  ),
                  SizedBox(height: 5),
                  Text(
                    formatPrice(fakeStoreData[index]["price"]),
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: accentColors[4],
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      )
                    )
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () { print("BOUGHT: $index"); },
                        child: Text(
                          "Buy",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: colorPalette[2],
                              fontWeight: FontWeight.bold,
                            )
                          )
                        )
                      ),
                      TextButton(
                        onPressed: () { print("ADDED TO CART: $index"); },
                        child: Text(
                          "Add to Cart",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: colorPalette[1],
                              fontWeight: FontWeight.bold,
                            )
                          )
                        )
                      ),
                    ],
                  )
                ]
              ),
            );
          },
        )
      )
    );
  }
}