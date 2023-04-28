class InfoModel{

   int? id;
  String? name;
  String? username;
  String? address;
  String? city;
  double? postalCode;

   InfoModel({
      this.id,
      required this.name,
      required this.username,
      required this.address,
      required  this.city,
      required this.postalCode
   });
   InfoModel.fromMap(Map<String ,dynamic> json):
         id=json['id'],
         name=json['name'],
         username=json['username'],
         address=json['address'],
         city=json['city'],
         postalCode=json['postalCode'];

   Map<String ,Object?> toMap(){
     return {
       'id':id,
       'name': name,
       'username':username,
       'address':address,
       'city':city,
       'postalCode':postalCode

     };

   }

}