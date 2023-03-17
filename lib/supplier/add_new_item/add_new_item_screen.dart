import 'dart:io';

import 'package:fleasnitch/base/base_screen.dart';
import 'package:fleasnitch/bloc/main_bloc.dart';
import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:fleasnitch/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddNewItemScreen extends BaseStatefulWidget {
  @override
  _AddNewItemScreenState createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends BaseState<AddNewItemScreen> with BasicScreen {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List categories = [
    'Shoes',
    'Tops',
    'Mobile phones',
    'Beauty',
    'Grocery',
    'Pharmacy',
    'Electronics'
  ];
  late String selectedCategory;

  List<File> images = [];

  @override
  void initState() {
    selectedCategory = categories[0];
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: getTitle(
          addNewItem,
          fontSize: HOME_TITLE_SIZE,
          color: Theme.of(context).secondaryHeaderColor,
          weight: FontWeight.w700,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          padding: EdgeInsets.zero,
          onPressed: () {
            bloc.add(SupplierHomeEvent());
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: VERTICAL_PADDING, horizontal: HORIZONTAL_PADDING),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getSmallText(
                  itemDetails,
                  weight: FontWeight.w700,
                  fontSize: HOME_TITLE_SIZE,
                ),
                const SizedBox(height: VERTICAL_PADDING * 3),
                commonTextFormField(
                  context: context,
                  hintText: itemName,
                  labelText: itemName,
                  border: true,
                ),
                const SizedBox(height: VERTICAL_PADDING * 3),
                commonTextFormField(
                  context: context,
                  hintText: itemSizes,
                  labelText: itemSizes,
                  border: true,
                ),
                const SizedBox(height: VERTICAL_PADDING * 3),
                commonTextFormField(
                  context: context,
                  hintText: hashtags,
                  labelText: tags,
                  border: true,
                  maxLines: null,
                ),
                const SizedBox(height: VERTICAL_PADDING * 3),
                commonTextFormField(
                  context: context,
                  hintText: itemPrice,
                  labelText: itemPrice,
                  border: true,
                ),
                const SizedBox(height: VERTICAL_PADDING * 3),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: category,
                  ),
                  hint: getSmallText(category),
                  items: categories
                      .map((e) => DropdownMenuItem(
                            child: getSmallText(e),
                            value: e.toString(),
                          ))
                      .toList(),
                  onChanged: (dynamic val) {
                    setState(() {
                      selectedCategory = val.toString();
                    });
                  },
                  value: selectedCategory,
                ),
                const SizedBox(height: VERTICAL_PADDING * 3),
                commonTextFormField(
                  context: context,
                  hintText: productDetails,
                  labelText: productDetails,
                  maxLines: null,
                  minLines: 4,
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(height: VERTICAL_PADDING * 2),
                OutlinedButton(
                  onPressed: chooseImageSourceType,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: secondaryColor.withOpacity(0.4),
                    foregroundColor: secondaryColor,
                    minimumSize: const Size.fromHeight(35),
                  ),
                  child: getSmallText(
                    addImages,
                    color: secondaryDarkColor,
                    weight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: VERTICAL_PADDING * 2),
                if (images != null)
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: images.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
                      itemBuilder: (ctx, index) {
                        return Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Image.file(
                                images[index],
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    images.removeAt(index);
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colorBlack.withOpacity(0.5),
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    size: 18,
                                    color: colorWhite,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ElevatedButton(
                  onPressed: () {},
                  child: getSmallText(
                    addItem,
                    color: colorWhite,
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
        images.add(File(pickedFile.path));
      });
      Navigator.pop(context);
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
    List<XFile?> filesPicked = await picker.pickMultiImage();

    if (filesPicked.isNotEmpty) {
      for (int i = 0; i < filesPicked.length; i++) {
        images.add(File(filesPicked[i]!.path));
      }
      setState(() {});
      Navigator.pop(context);
    } else {
      print('No image selected');
      Navigator.pop(context);
    }
  }
}
