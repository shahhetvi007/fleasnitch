import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/helper/ad_helper.dart';
import 'package:fleasnitch/helper/auth_helper.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AccountScreen extends BaseStatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends BaseState<AccountScreen> with BasicScreen {
  File? imagePicked;
  bool isSigningOut = false;

  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  RewardedAd? _rewardedAd;
  int _numRewardedLoadAttempts = 0;
  int maxFailedLoadAttempts = 3;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
    _createRewardedAd();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          setState(() {
            _isBannerAdReady = false;
          });
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    );
    _bannerAd.load();
  }

  void _createRewardedAd() {
    RewardedAd.load(
        adUnitId: AdHelper.rewardedAdUnitId,
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            print('$ad loaded');
            _rewardedAd = ad;
            _numRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (err) {
            print('Rewarded failed to load $err');
            _rewardedAd = null;
            _numRewardedLoadAttempts += 1;
            if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
              _createRewardedAd();
            }
          },
        ));
  }

  void _showRewardedAd() {
    if (_rewardedAd == null) {
      print('Warning: attempt to show rewarded ad before loaded');
      return;
    }
    _rewardedAd!.fullScreenContentCallback =
        FullScreenContentCallback(onAdShowedFullScreenContent: (ad) {
      print('$ad onAdShowedFullScreenContent');
    }, onAdDismissedFullScreenContent: (ad) {
      print('$ad onAdDismissedFullScreenContent');
      ad.dispose();
      _createRewardedAd();
    }, onAdFailedToShowFullScreenContent: (ad, err) {
      print('$ad onAdFailedToShowFullScreenContent $err');
      ad.dispose();
      _createRewardedAd();
    });
    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(onUserEarnedReward: (ad, reward) {
      print('Reward earned $reward');
    });
    _rewardedAd = null;
  }

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      backgroundColor: itemBackground,
      appBar: AppBar(
        title: getTitle(
          account,
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
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                bloc.add(CartEvent());
              },
              icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: isSigningOut
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
                  width: double.infinity,
                  color: colorWhite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      addProfile(),
                      const SizedBox(height: VERTICAL_PADDING),
                      getTitle(
                        AuthHelper().user.displayName,
                        // "",
                        weight: FontWeight.w800,
                      ),
                      getSmallText(editProfile,
                          fontSize: CATEGORY_TEXT_SIZE,
                          weight: FontWeight.w600,
                          color: secondaryDarkColor),
                    ],
                  ),
                ),
                const SizedBox(height: VERTICAL_PADDING),
                ListTile(
                  leading: const Icon(
                    Icons.save_as,
                    color: secondaryDarkColor,
                  ),
                  title: getSmallText(savedAddresses, weight: FontWeight.w600),
                  tileColor: colorWhite,
                  onTap: () {
                    bloc.add(SavedAddressEvent());
                  },
                ),
                const SizedBox(height: VERTICAL_PADDING / 2),
                ListTile(
                  leading: const Icon(
                    Icons.add_shopping_cart_outlined,
                    color: secondaryDarkColor,
                  ),
                  title: getSmallText(becomeASupplier, weight: FontWeight.w600),
                  tileColor: colorWhite,
                  onTap: () {
                    bloc.add(SupplierLoginEvent());
                  },
                ),
                const SizedBox(height: VERTICAL_PADDING / 2),
                ListTile(
                  leading: const Icon(
                    Icons.favorite_border,
                    color: secondaryDarkColor,
                  ),
                  onTap: () {
                    bloc.add(FavoritesEvent());
                  },
                  title: getSmallText(yourWishlist, weight: FontWeight.w600),
                  tileColor: colorWhite,
                ),
                const SizedBox(height: VERTICAL_PADDING / 2),
                ListTile(
                  leading: const Icon(
                    Icons.shopping_bag_outlined,
                    color: secondaryDarkColor,
                  ),
                  title: getSmallText(yourOrders, weight: FontWeight.w600),
                  tileColor: colorWhite,
                  onTap: () {
                    bloc.add(OrdersEvent());
                  },
                ),
                const SizedBox(height: VERTICAL_PADDING / 2),
                ListTile(
                  leading: const Icon(
                    Icons.monetization_on,
                    color: secondaryDarkColor,
                  ),
                  title: getSmallText(getReward, weight: FontWeight.w600),
                  tileColor: colorWhite,
                  onTap: () {
                    // bloc.add(OrdersEvent());
                    _showRewardedAd();
                  },
                ),
                const SizedBox(height: VERTICAL_PADDING / 2),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: secondaryDarkColor,
                  ),
                  title: getSmallText(logout, weight: FontWeight.w600),
                  tileColor: colorWhite,
                  onTap: () {
                    logoutDialog();
                  },
                ),
                if (_isBannerAdReady)
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: _bannerAd.size.height.toDouble(),
                        width: _bannerAd.size.width.toDouble(),
                        child: AdWidget(
                          ad: _bannerAd,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
      bottomNavigationBar: BottomNav(4),
    );
  }

  Widget addProfile() {
    return GestureDetector(
      onTap: chooseImageSourceType,
      child: Stack(children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: secondaryColor.withOpacity(0.2),
          ),
        ),
        (imagePicked != null)
            ? Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: FileImage(
                        imagePicked!,
                      ),
                      fit: BoxFit.fill,
                    )),
              )
            : const Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Icon(
                  Icons.person_add_alt_outlined,
                  color: secondaryDarkColor,
                  size: 32,
                ),
              )
      ]),
    );
  }

  void chooseImageSourceType() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BORDER_RADIUS)),
        context: context,
        builder: (ctx) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getSmallText(
                      editPhoto,
                      fontSize: HOME_TITLE_SIZE,
                      weight: FontWeight.w700,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: VERTICAL_PADDING / 2),
                const Divider(),
                const SizedBox(height: VERTICAL_PADDING / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: imageFromCamera,
                          icon: const Icon(Icons.camera_alt),
                          color: secondaryDarkColor,
                        ),
                        getSmallText(camera),
                      ],
                    ),
                    const SizedBox(width: HORIZONTAL_PADDING * 2),
                    Column(
                      children: [
                        IconButton(
                          onPressed: imageFromGallery,
                          icon: const Icon(Icons.photo),
                          color: secondaryDarkColor,
                        ),
                        getSmallText(gallery),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: VERTICAL_PADDING * 2),
              ],
            ),
          );
        });
  }

  Future imageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        imagePicked = File(pickedFile.path);
      });
      Navigator.pop(context);
      print(imagePicked);
    } else {
      print('No image path received');
      Navigator.pop(context);
    }
  }

  Future imageFromGallery() async {
    PermissionStatus? result;
    if (Platform.isIOS) {
      result = await Permission.photos.request();
      print(result);
    }
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imagePicked = File(pickedFile.path);
      });
      Navigator.pop(context);
      print(imagePicked);
    } else {
      print('No image selected');
      Navigator.pop(context);
    }
  }

  logoutDialog() {
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: getTitle(logout, weight: FontWeight.w800),
            content: getSmallText(logoutText),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: getSmallText(no)),
              TextButton(
                  onPressed: () async {
                    setState(() {
                      isSigningOut = true;
                    });
                    await AuthHelper().signOut(context);
                    bloc.add(LoginEvent());
                    setState(() {
                      isSigningOut = false;
                    });
                  },
                  child: getSmallText(yes,
                      color: secondaryDarkColor, weight: FontWeight.w800)),
            ],
          );
        });
  }
}
