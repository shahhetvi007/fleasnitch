import 'package:easy_stepper/easy_stepper.dart';
import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';

class FavoritesScreen extends BaseStatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends BaseState<FavoritesScreen> with BasicScreen {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getTitle(
          myProducts,
          fontSize: HOME_TITLE_SIZE,
          weight: FontWeight.w700,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          padding: EdgeInsets.zero,
          onPressed: () {
            bloc.add(HomeScreenEvent());
          },
        ),
        bottom: const PreferredSize(
          preferredSize: Size(0, 0),
          child: Divider(
            height: 0.5,
            color: colorBlack,
          ),
        ),
      ),
      body: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.7),
          itemBuilder: (ctx, index) => const ProductItem()),
    );
  }
}
