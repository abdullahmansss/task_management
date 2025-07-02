import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_app/core/theme/colors.dart';
import 'package:task_app/core/theme/text_styles.dart';
import 'package:task_app/core/util/constants/routes.dart';
import 'package:task_app/core/util/constants/spacing.dart';
import 'package:task_app/core/util/extensions/context_extension.dart';
import 'package:task_app/features/home/data/user_model.dart';
import 'package:task_app/features/home/presentation/logic/home_cubit.dart';
import 'package:task_app/features/home/presentation/logic/home_states.dart';
import 'package:task_app/features/login/presentation/screen/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Home Screen',
              style: TextStylesManager.bold20,
            ),
          ),
          body: ListView.separated(
            itemBuilder: (context, index) {
              UserModel user = homeCubit.users[index];

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: ColorsManager.primaryColor2,
                      child: Text(
                        (index + 1).toString(),
                        style: TextStylesManager.bold18.copyWith(
                          color: ColorsManager.whiteColor,
                        ),
                      ),
                    ),
                    horizontalSpace10,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: TextStylesManager.bold16.copyWith(
                              color: ColorsManager.textColor,
                            ),
                          ),
                          verticalSpace4,
                          Text(
                            'Age: ${user.age}',
                            style: TextStylesManager.regular14.copyWith(
                              color: ColorsManager.textColor,
                            ),
                          ),
                          verticalSpace4,
                          Text(
                            'Email: ${user.email}',
                            style: TextStylesManager.regular14.copyWith(
                              color: ColorsManager.textColor,
                            ),
                          ),
                          verticalSpace4,
                          Text(
                            'Phone: ${user.phone}',
                            style: TextStylesManager.regular14.copyWith(
                              color: ColorsManager.textColor,
                            ),
                          ),
                          verticalSpace4,
                          Text(
                            'Address: ${user.address}',
                            style: TextStylesManager.regular14.copyWith(
                              color: ColorsManager.textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => Container(
              height: 1,
              color: ColorsManager.blackColor.withValues(
                alpha: 0.1,
              ),
            ),
            itemCount: homeCubit.users.length,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: ColorsManager.primaryColor2,
            onPressed: () async {
              homeCubit.changeTheme();

              // homeCubit.openDatabaseForTheFirstTime();
              //
              // showModalBottomSheet(
              //     context: context,
              //     showDragHandle: true,
              //     builder: (context) {
              //       return SizedBox(
              //         width: double.infinity,
              //         child: Padding(
              //           padding: const EdgeInsets.all(16.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 'Save new user',
              //                 style: TextStylesManager.bold18,
              //               ),
              //               verticalSpace20,
              //               TextFormField(
              //                 controller: homeCubit.nameController,
              //                 cursorColor: ColorsManager.primaryColor,
              //                 style: TextStylesManager.medium16.copyWith(
              //                   color: ColorsManager.blackColor,
              //                 ),
              //                 decoration: InputDecoration(
              //                   labelText: 'Name',
              //                   labelStyle: TextStylesManager.regular16,
              //                   border: OutlineInputBorder(
              //                     borderRadius: BorderRadius.circular(8),
              //                     borderSide: BorderSide(
              //                       color: ColorsManager.primaryColor,
              //                     ),
              //                   ),
              //                   focusedBorder: OutlineInputBorder(
              //                     borderRadius: BorderRadius.circular(8),
              //                     borderSide: BorderSide(
              //                       color: ColorsManager.primaryColor,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               verticalSpace10,
              //               TextFormField(
              //                 controller: homeCubit.ageController,
              //                 cursorColor: ColorsManager.primaryColor,
              //                 style: TextStylesManager.medium16.copyWith(
              //                   color: ColorsManager.blackColor,
              //                 ),
              //                 decoration: InputDecoration(
              //                   labelText: 'Age',
              //                   labelStyle: TextStylesManager.regular16,
              //                   border: OutlineInputBorder(
              //                     borderRadius: BorderRadius.circular(8),
              //                     borderSide: BorderSide(
              //                       color: ColorsManager.primaryColor,
              //                     ),
              //                   ),
              //                   focusedBorder: OutlineInputBorder(
              //                     borderRadius: BorderRadius.circular(8),
              //                     borderSide: BorderSide(
              //                       color: ColorsManager.primaryColor,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               verticalSpace10,
              //               TextFormField(
              //                 controller: homeCubit.emailController,
              //                 cursorColor: ColorsManager.primaryColor,
              //                 style: TextStylesManager.medium16.copyWith(
              //                   color: ColorsManager.blackColor,
              //                 ),
              //                 decoration: InputDecoration(
              //                   labelText: 'Email',
              //                   labelStyle: TextStylesManager.regular16,
              //                   border: OutlineInputBorder(
              //                     borderRadius: BorderRadius.circular(8),
              //                     borderSide: BorderSide(
              //                       color: ColorsManager.primaryColor,
              //                     ),
              //                   ),
              //                   focusedBorder: OutlineInputBorder(
              //                     borderRadius: BorderRadius.circular(8),
              //                     borderSide: BorderSide(
              //                       color: ColorsManager.primaryColor,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               verticalSpace10,
              //               TextFormField(
              //                 controller: homeCubit.phoneController,
              //                 cursorColor: ColorsManager.primaryColor,
              //                 style: TextStylesManager.medium16.copyWith(
              //                   color: ColorsManager.blackColor,
              //                 ),
              //                 decoration: InputDecoration(
              //                   labelText: 'Phone',
              //                   labelStyle: TextStylesManager.regular16,
              //                   border: OutlineInputBorder(
              //                     borderRadius: BorderRadius.circular(8),
              //                     borderSide: BorderSide(
              //                       color: ColorsManager.primaryColor,
              //                     ),
              //                   ),
              //                   focusedBorder: OutlineInputBorder(
              //                     borderRadius: BorderRadius.circular(8),
              //                     borderSide: BorderSide(
              //                       color: ColorsManager.primaryColor,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               verticalSpace10,
              //               TextFormField(
              //                 controller: homeCubit.addressController,
              //                 cursorColor: ColorsManager.primaryColor,
              //                 style: TextStylesManager.medium16.copyWith(
              //                   color: ColorsManager.blackColor,
              //                 ),
              //                 decoration: InputDecoration(
              //                   labelText: 'Address',
              //                   labelStyle: TextStylesManager.regular16,
              //                   border: OutlineInputBorder(
              //                     borderRadius: BorderRadius.circular(8),
              //                     borderSide: BorderSide(
              //                       color: ColorsManager.primaryColor,
              //                     ),
              //                   ),
              //                   focusedBorder: OutlineInputBorder(
              //                     borderRadius: BorderRadius.circular(8),
              //                     borderSide: BorderSide(
              //                       color: ColorsManager.primaryColor,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               Spacer(),
              //               SizedBox(
              //                 child: ElevatedButton(
              //                   style: ElevatedButton.styleFrom(
              //                     shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(8),
              //                     ),
              //                     minimumSize: const Size(double.infinity, 50),
              //                     backgroundColor: ColorsManager.primaryColor,
              //                     foregroundColor: Colors.white,
              //                   ),
              //                   onPressed: () {
              //                     homeCubit.insertDataInUsersTable();
              //                     context.pop;
              //                   },
              //                   child: const Text('Save'),
              //                 ),
              //               ),
              //               verticalSpace20,
              //             ],
              //           ),
              //         ),
              //       );
              //     });
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
