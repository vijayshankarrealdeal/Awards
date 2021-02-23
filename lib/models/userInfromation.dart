///this contains userdetails.
class UserInformation {
  final String name;
  final String email;
  final String uid;
  final String datecreated;
  final bool isFirst;
  UserInformation(
      {this.name, this.isFirst, this.email, this.uid, this.datecreated});

  ///Creating a map to save data to firestore
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'datecreated': datecreated,
      'isFirst': isFirst,
    };
  }

  factory UserInformation.fromJson(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    } else {
      return UserInformation(
        name: data['name'] == null ? '' : data['name'],
        uid: data['uid'] == null ? '' : data['uid'],
        email: data['email'] == null ? '' : data['email'],
        datecreated: data['datecreated'] == null ? '' : data['datecreated'],
        isFirst: data['isFirst'] == null ? false : data['isFirst'],
      );
    }
  }
}
