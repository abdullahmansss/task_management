class UserModel {
  final int? id;
  final String name;
  final int age;
  final String email;
  final String phone;
  final String address;
  final DateTime? createdAt;

  UserModel({
    this.id,
    required this.name,
    required this.age,
    required this.email,
    required this.phone,
    required this.address,
    this.createdAt,
  });

  // Convert a UserModel instance to a Map for database insertion
  Map<String, dynamic> toMap() => {
    'name': name,
    'age': age,
    'email': email,
    'phone': phone,
    'address': address,
  };

  // Create a UserModel instance from a Map (e.g., from database query)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int?,
      name: map['name'] as String,
      age: map['age'] as int,
      email: map['email'] as String,
      phone: map['phone'] as String,
      //       map['address']
      address: map['address'] as String,
      //         rawUsers[2]['created_at']
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'] as String)
          : null,
    );
  }
}