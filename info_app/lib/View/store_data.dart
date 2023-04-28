
import 'package:flutter/material.dart';
import 'package:info_app/Utils/utils.dart';
import 'package:info_app/db_helper/db_helper.dart';
import 'package:info_app/model/info_model.dart';

class StoreData extends StatefulWidget {
  @override
  _StoreDataState createState() => _StoreDataState();
}

class _StoreDataState extends State<StoreData> {
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

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter the Info'),centerTitle: true,),
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
                SizedBox(
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
                SizedBox(
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
                SizedBox(
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
                SizedBox(
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
                    dbHelper!.insert(
                        InfoModel(
                            name: nameController.text.toString(),
                            username: usernameController.text.toString(),
                            address: addressController.text.toString(),
                            city: cityController.text.toString(),
                            postalCode: double.parse(postalCodeController.text.toString())
                        )).then((value){
                          Utils.toastMessage('Data Added');
                          Utils.toastMessage('Restart your app');

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
                    child: const Center(child: Text('Submit',style: TextStyle(color: Colors.white),)),
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
