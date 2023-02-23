import 'package:easy_stepper/easy_stepper.dart';
import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';

class SummaryScreen extends BaseStatefulWidget {
  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends BaseState<SummaryScreen> with BasicScreen {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      backgroundColor: itemBackground,
      appBar: AppBar(
        title: getTitle(
          orderSummary,
          fontSize: HOME_TITLE_SIZE,
          // color: Theme.of(context).secondaryHeaderColor,
          weight: FontWeight.w700,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          padding: EdgeInsets.zero,
          onPressed: () {
            bloc.add(PaymentEvent());
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
      body: Column(
        children: [
          cartSteps(3),
          const Divider(thickness: 0.5, height: 1),
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
            color: colorWhite,
            child: Row(
              children: [
                const Icon(Icons.car_rental),
                const SizedBox(width: 4),
                getSmallText(estimatedDelivery, fontSize: CATEGORY_TEXT_SIZE),
                getSmallText('Thursday, 09th Feb'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
