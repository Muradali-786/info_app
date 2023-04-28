import 'package:flutter/material.dart';
import 'package:info_app/Utils/utils.dart';
import 'package:info_app/db_helper/db_helper.dart';
import 'package:info_app/model/info_model.dart';

class UpdateScreen extends StatefulWidget {
  var idey;
   UpdateScreen({Key? key,required this.idey}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final postalCodeController = TextEditingController();


  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    addressController.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    super.dispose();
  }
  DBHelper? dbHelper;
  late Future<List<InfoModel>> notesList;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper=DBHelper();
    loadData();
  }
  loadData()async{
    notesList=dbHelper!.getNotesList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update the Info'),centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
               const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              const  SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                      labelText: 'Address',
                      hintText: 'Enter your address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
               const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(
                      labelText: 'City',
                      hintText: 'Enter your city',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
             const   SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: postalCodeController,
                  decoration: InputDecoration(
                      labelText: 'Postal Code',
                      hintText: 'accept only integers value',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    dbHelper!.update(
                        InfoModel(
                          id:widget.idey ,
                            name: nameController.text.toString(),
                            username: usernameController.text.toString(),
                            address: addressController.text.toString(),
                            city: cityController.text.toString(),
                            postalCode: double.parse(postalCodeController.text.toString())
                        )).then((value){
                      Utils.toastMessage('Data Updated');
                      Utils.toastMessage('Restart your app');
                      setState((){
                        notesList=dbHelper!.getNotesList();
                      });

                      Navigator.pop(context);


                    }).onError((error, stackTrace) {
                      Utils.toastMessage(error.toString());

                    });

                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)

                    ),
                    child: const Center(child: Text('Update',style: TextStyle(color: Colors.white),)),
                  ),
                ),




              ],
            ),
          ),
        ),
      ),
    );;
  }
}
