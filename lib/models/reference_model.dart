class ReferenceModel{
  String name, role, company, email,phone;
  ReferenceModel({this.name, this.role, this.company, this.email, this.phone});

    ReferenceModel.fromMap(Map<String, dynamic> map)

    : name = map['name'],
      role = map['role'],
      company = map['company'],
      email = map['email'],
      phone = map['phone'];

   Map<String, dynamic> toMap() {
    return {
      'name': name,
      'role': role,
      'company': company,
      'email': email,
      'phone': phone,
    };
  }

    
  

   @override
  String toString() {
    return 'ReferenceModel{role: $role, company: $company, email: $email, phone: $phone }';
  }
   
}