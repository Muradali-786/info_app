import 'package:flutter/material.dart';
import 'package:info_app/Utils/utils.dart';
import 'package:info_app/View/store_data.dart';
import 'package:info_app/View/update_data.dart';
import 'package:info_app/db_helper/db_helper.dart';
import 'package:info_app/model/info_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      appBar: AppBar(title: Text('User Information'),
      centerTitle: true,
      ),
      body: Column(
        children: [



          Expanded(
            child: FutureBuilder(
                future: notesList,
                builder: (context,AsyncSnapshot<List<InfoModel>>snapshot){

                  if(snapshot.hasData){
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context,index){
                       return Card(
                         child: Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                           child: Column(

                             children: [
                             reUsable(title: 'Name', value: snapshot.data![index].name.toString()),
                               reUsable(title: 'Username', value: snapshot.data![index].username.toString()),
                               reUsable(title: 'Adress', value: snapshot.data![index].address.toString()),
                               reUsable(title: 'City', value: snapshot.data![index].city.toString()),
                               reUsable(title: 'PostalCode', value: snapshot.data![index].postalCode.toString()),
                               const SizedBox(height: 10,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   InkWell(
                                     onTap: (){
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateScreen(idey: snapshot.data![index].id!,)));
                                       
                                     },
                                     child: Container(
                                       height: 30,
                                       width: 150,
                                       decoration: BoxDecoration(
                                         color: Colors.green,
                                         borderRadius: BorderRadius.circular(10)
                                       ),
                                       child:const  Center(
                                         child: Text('Update',style: TextStyle(color: Colors.white,fontSize: 16)),
                                       ),
                                     ),
                                   ),
                                   InkWell(
                                     onTap: (){
                                       dbHelper!.delete(snapshot.data![index].id!).then((value) {
                                         Utils.toastMessage('Item Deleted success');
                                         setState((){
                                           notesList=dbHelper!.getNotesList();
                                           snapshot.data!.remove(snapshot.data![index]);
                                         });



                                       }).onError((error, stackTrace) {

                                         Utils.toastMessage(error.toString());

                                       });
                                     

                                     },
                                     child: Container(
                                       height: 30,
                                       width: 150,
                                       decoration: BoxDecoration(
                                           color: Colors.green,
                                           borderRadius: BorderRadius.circular(10)
                                       ),
                                       child: const Center(child: Text('Delete',style: TextStyle(color: Colors.white,fontSize: 16),)),
                                     ),
                                   )
                                 ],
                               )


                             ],
                           ),
                         ),
                       );

                        });
                  }else{
                    return CircularProgressIndicator();

                  }

                }),
          ),




        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>StoreData()));

        },
        child: Icon(Icons.add),
      ),
    );

  }
}
class reUsable extends StatelessWidget {
  final dynamic title,value;

  const reUsable({Key? key,
    required this.title,
    required this.value,





  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      child: Column(
        children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          Text(value,style:TextStyle(fontSize: 15,))

        ],
      )
        ],
      ),
    );
  }
}

