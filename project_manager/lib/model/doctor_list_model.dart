class DoctorNameModel {
  String docName;
  String docID;
  DoctorNameModel({required this.docName,required this.docID});
 factory DoctorNameModel.empty(){
   return DoctorNameModel(docName: "", docID: "");
  }
}
