import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/image_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';

class SupplierNotificationScreen extends BaseStatefulWidget {
  @override
  _SupplierNotificationScreenState createState() => _SupplierNotificationScreenState();
}

class _SupplierNotificationScreenState extends BaseState<SupplierNotificationScreen>
    with BasicScreen {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getTitle(
          notifications,
          fontSize: APPBAR_FONT_SIZE,
          color: Theme.of(context).secondaryHeaderColor,
          weight: FontWeight.w700,
        ),
        bottom: const PreferredSize(
          preferredSize: Size(0, 0),
          child: Divider(
            height: 0.5,
            color: colorBlack,
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (ctx, i) {
          return notificationItem();
        },
        itemCount: 5,
        separatorBuilder: (ctx, i) {
          return const Divider(thickness: 0.5);
        },
      ),
      bottomNavigationBar: SupplierBottomNav(2),
    );
  }

  Widget notificationItem() {
    return ListTile(
      leading: const Icon(Icons.local_offer),
      title: getSmallText('Congratulations!',
          fontSize: HOME_TITLE_SIZE, weight: FontWeight.w700),
      subtitle: getSmallText(
          'Your item from your store named Block heel has been purchased.',
          fontSize: CATEGORY_TEXT_SIZE),
      trailing: Image.asset(IC_STORE),
    );
  }
}
