import 'package:elys/view/api_data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height * 1;
    final Width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      backgroundColor: Color(0xff45DFD0),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: 115,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Height * 0.02),
             const  Text(
                'ELYA',
                style: TextStyle(
                    fontSize: 42,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Height * 0.02),
           const    Text(
                'All Your Finances inside \na Fancy App',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            Container(
                width: 35,
                child:const  Divider(
                  color: Colors.white60,
                  thickness: 10,
                ),
              ),
              SizedBox(height: Height * 0.1),

              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ApiData()));

                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextFormField(
                       enabled: false,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(130, 20, 20, 15),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'LOGIN',
                        hintStyle: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15))),


                  ),
                ),
              ),
              SizedBox(height: Height * 0.02),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ApiData()));
              },
              child:  Material(
                elevation: 18,
                shadowColor: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(120, 20, 20, 15),
                      fillColor: Color(0xffA3D3CF),
                      filled: true,
                      hintText: 'SIGN UP',
                      hintStyle: const TextStyle(
                        fontSize: 22,
                        color: Colors.white70,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ),
              SizedBox(height: Height * 0.08),

              Container(
                width: double.infinity,
                child:const  Divider(
                  color: Colors.white60,
                  thickness: 5,
                ),
              ),
              SizedBox(height: Height * 0.04),
             const Center(
                child: Text('Designes by Royalz',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),),
              )
            ],
          ),
        ),
      )),
    );
  }
}

