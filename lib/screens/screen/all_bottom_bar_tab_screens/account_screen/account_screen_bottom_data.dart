import 'package:flutter/material.dart';
import 'package:new_quickly_desige/constant/app_color.dart';
import 'package:new_quickly_desige/constant/common_text.dart';
import 'package:new_quickly_desige/constant/font_style.dart';
import 'package:new_quickly_desige/main.dart';
import 'package:new_quickly_desige/screens/screen/about_quickly/about_quickly.dart';
import 'package:new_quickly_desige/screens/screen/address_screen/manage_address/manage_address_screen/manage_address_screen.dart';
import 'package:new_quickly_desige/screens/screen/notification_screen/notification_screen/notification_screen.dart';
import 'package:new_quickly_desige/screens/screen/profile_screen/profile_screen/profile_screen.dart';
import 'package:new_quickly_desige/screens/screen/request_product/request_product/request_product.dart';
import 'package:new_quickly_desige/screens/screen/saved_items/saved_items_screen/saved_items_screen.dart';
import 'package:new_quickly_desige/screens/screen/setting_screen/setting_screen/setting_screen.dart';
import 'package:new_quickly_desige/screens/screen/support_screen/support_screen/support_screen.dart';
import 'package:new_quickly_desige/screens/screen/terms_and_condition_screen/terms_and_condition_screen.dart';

class AccountScreenBottomData extends StatefulWidget {
  const AccountScreenBottomData({super.key});

  @override
  State<AccountScreenBottomData> createState() =>
      _AccountScreenBottomDataState();
}

class _AccountScreenBottomDataState extends State<AccountScreenBottomData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ));
          },
          child: const AccountSetting(
            text: "Your Profile",
            icon: Icon(Icons.person_outline_outlined),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ));
          },
          child: const AccountSetting(
            text: "Notifications",
            icon: Icon(Icons.notifications_active_outlined),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SavedItemScreen(),
                ));
          },
          child: GestureDetector(
            /* onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectAddressScreen(),
                  ));
            },*/
            child: const AccountSetting(
              text: "Saved",
              icon: Icon(Icons.save_as_outlined),
            ),
          ),
        ),
        const AccountSetting(
          text: "Manage Vehicle",
          icon: Icon(Icons.car_rental_outlined),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ManageAddressScreen(),
                ));
          },
          child: const AccountSetting(
            text: "Manage Address",
            icon: Icon(Icons.location_on_outlined),
          ),
        ),
        const AccountSetting(
          text: "Points and Rewards",
          icon: Icon(Icons.point_of_sale_outlined),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RequestProduct(),
                ));
          },
          child: const AccountSetting(
            text: "Request Product",
            icon: Icon(Icons.preview_outlined),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SupportScreen(),
                ));
          },
          child: const AccountSetting(
            text: "Support",
            icon: Icon(Icons.support_agent_outlined),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TermsAndConditionScreen(),
                ));
          },
          child: const AccountSetting(
            text: "Terms and Conditions",
            icon: Icon(Icons.mark_unread_chat_alt_outlined),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutQuickly(),
                ));
          },
          child: const AccountSetting(
            text: "About Quickly",
            icon: Icon(Icons.align_vertical_bottom_outlined),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingScreen(),
                ));
          },
          child: const AccountSetting(
            text: "Settings",
            icon: Icon(Icons.settings_suggest_outlined),
          ),
        ),
      ],
    );
  }
}

class AccountSetting extends StatelessWidget {
  final String text;
  final Widget icon;
  const AccountSetting({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: mq.width * .12, top: mq.width * .04),
      child: Column(
        children: [
          Row(
            children: [
              icon,
              SizedBox(
                width: mq.width * .13,
              ),
              CommonText(
                  text: text,
                  fontSize: fo15,
                  fontWeight: f600,
                  fontColor: blackColor),
              Flexible(child: Container()),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: primaryColor,
              ),
            ],
          ),
          SizedBox(
            height: mq.width * .01,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: brown9fColor,
          )
        ],
      ),
    );
  }
}
