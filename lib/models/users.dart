class UserModel {
  String? email;
  String? wrool;
  String? uid;
  String? Nom;
  String? Prenom;

// receiving data
  UserModel({this.uid, this.email, this.wrool, this.Nom, this.Prenom});
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      wrool: map['wrool'],
      Nom: map['Nom'],
      Prenom: map['Prenom'],
    );
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'wrool': wrool,
      'Nom': Nom,
      'Prenom': Prenom,
    };
  }
}
