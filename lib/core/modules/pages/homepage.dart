import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matador_apptest/core/data/models/user.dart';
import 'package:matador_apptest/core/data/provider/user_provider.dart';
import 'package:matador_apptest/core/data/repo/repo.dart';
import 'package:matador_apptest/core/modules/controller/userC.dart';
import 'package:matador_apptest/core/modules/pages/widgets/customCard.dart';
import 'package:matador_apptest/core/modules/pages/widgets/customappbar.dart';
import 'package:matador_apptest/core/utils/const.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homec = Get.put(UserController(RepoUser(UserProvider())));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: custappbar('List User'),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: Obx(() {
              return ListView.builder(
                  itemCount: homec.userList.length,
                  itemBuilder: (BuildContext Context, int index) {
                    User user = homec.userList[index];
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showBottomSheet(context, user);
                          },
                          child: cutscard(user),
                        ),
                      ],
                    );
                  });
            })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: cPrimary,
        child: Icon(Icons.add),
        onPressed: () {
          homec.addUser();
        },
      ),
    );
  }

  _bottomSheetButton({
    required String label,
    required Function()? onTap,
    required Color clr,
    bool isClose = false,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose == true
                ? Get.isDarkMode
                    ? Colors.grey[600]!
                    : Colors.grey[300]!
                : clr,
          ),
          borderRadius: BorderRadius.circular(20),
          color: clr,
        ),
        child: Center(
          child: Text(label, style: TextStyle(color: cWhite)),
        ),
      ),
    );
  }

  _showBottomSheet(BuildContext context, User user) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: MediaQuery.of(context).size.height / 0.5,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _bottomSheetButton(
              label: "Delete Task",
              onTap: () {
                homec.deleteUser(user.id!);
              },
              clr: Colors.red,
              context: context,
            ),
            // SizedBox(height: 10,),

            _bottomSheetButton(
              label: "Edit",
              onTap: () {
                homec.editUser(user);
              },
              isClose: true,
              clr: Colors.green,
              context: context,
            ),

            _bottomSheetButton(
              label: "Lihat Profil",
              onTap: () {
                // homec.showUser(user);
                homec.showUser(user);
              },
              isClose: true,
              clr: cPrimary,
              context: context,
            ),
            SizedBox(
              height: 50,
            ),
            _bottomSheetButton(
              label: "Close",
              onTap: () {
                Get.back();
              },
              isClose: true,
              clr: Colors.grey,
              context: context,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
