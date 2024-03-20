import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Screen/Settings/Wedgits/SettingsCard.dart';

class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.only(top: 50, left: 10, right: 10),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SettingCard(
                data: "Case Status",
                ontap: () {},
                path: "Assets/Icons/Group.png",
              ),
              SettingCard(
                data: "Case Type",
                ontap: () {},
                path: "Assets/Icons/Vector1.png",
              )
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SettingCard(
                data: "Make & Model",
                ontap: () {},
                path: "Assets/Icons/Vector3.png",
              ),
              SettingCard(
                data: "Device Data",
                ontap: () {},
                path: "Assets/Icons/Vector4.png",
              )
            ],
          )
        ],
      ),
    );
  }
}
