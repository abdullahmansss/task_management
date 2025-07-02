import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_app/core/util/constants/constants.dart';
import 'package:task_app/features/home/data/user_model.dart';
import 'package:task_app/features/home/presentation/logic/home_states.dart';
import 'package:task_app/main.dart';

HomeCubit homeCubit = HomeCubit.get(navigatorKey.currentContext!);

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  // to access the cubit from anywhere in the app
  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  // counters
  int counter = 0;
  int counter2 = 0;

  void incrementCounterOne() {
    // function execution
    counter++;
    // emit a new state
    emit(CounterOneState());
  }

  void incrementCounterTwo() {
    // function execution
    counter2++;
    debugPrint('Counter Two: $counter2');
    // emit a new state
    emit(CounterTwoState());
  }

  void reset() {
    debugPrint('Resetting counters');
    emit(ResetState());
  }

  Database? database;

  void openDatabaseForTheFirstTime() async {
    openDatabase(
      'mansour_db.db',
      version: 1,
      // onCreate: (db, version) {
      //   debugPrint('Database created');
      //   debugPrint('Version: $version');
      //   // database = db;
      // },
      onOpen: (db) {
        debugPrint('Database opened');
        database = db;

        createTable();
      },
    );
  }

  void createTable() async {
    if (database != null) {
      database!.execute(
        'CREATE TABLE IF NOT EXISTS $usersTable (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, email TEXT, phone TEXT, address TEXT, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)',
      );
      fetchDataFromUsersTable();
      debugPrint('Table created');
    } else {
      debugPrint('Database is not initialized');
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  void insertDataInUsersTable() async {
    if(database != null) {
      UserModel user = UserModel(
        name: nameController.text,
        age: int.parse(ageController.text),
        email: emailController.text,
        address: addressController.text,
        phone: phoneController.text,
      );

      int newRecordId = await database!.insert(usersTable, user.toMap());

      fetchDataFromUsersTable();
      debugPrint('New record inserted with ID: $newRecordId');
    } else {
      debugPrint('Database is not initialized');
    }
  }

  List<UserModel> users = [];

  void fetchDataFromUsersTable() async {
    if(database != null) {
      users.clear(); // Clear the list before fetching new data

      List<Map<String, dynamic>> rawUsers = await database!.query(usersTable);

      for (var userMap in rawUsers) {
        UserModel user = UserModel.fromMap(userMap);
        users.add(user);
      }

      users = users.reversed.toList();

      emit(FetchUserState());

      debugPrint('Fetched ${rawUsers.length} users from the database');
      debugPrint('Fetched ${users.length} users from the database');
    } else {
      debugPrint('Database is not initialized');
    }
  }

  bool isDark = false;

  void changeTheme() {
    isDark = !isDark;
    emit(ChangeThemeState());
  }
}








