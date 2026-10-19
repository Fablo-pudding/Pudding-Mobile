import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/pudding_assets.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:material_symbols_icons/symbols.dart';

class PuddingProfile extends StatefulWidget {
  final String nickName;
  final File? image;

  const PuddingProfile({
    super.key,
    required this.nickName,
    this.image,
  });

  @override
  State<PuddingProfile> createState() => _PuddingProfileState();
}

class _PuddingProfileState extends State<PuddingProfile> {
  final ImagePicker _picker = ImagePicker();
  File? _saveImage;
  File? _tempImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        imageProfile(),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.nickName, style: PuddingTextStyle.heading2),
          ],
        ),
      ],
    );
  }

  Widget _buildImage() {
    if (_tempImage != null) {
      return Image.file(_tempImage!, fit: BoxFit.cover);
    } else {
      return Container(color: PuddingColor.white);
    }
  }

  Widget imageProfile() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: _saveImage != null ? FileImage(_saveImage!) : null,
          child: _saveImage == null
              ? SvgPicture.asset(
                  PuddingAssets.profile,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                )
              : null,
        ),
        Positioned(
          bottom: -5,
          right: -5,
          child: GestureDetector(
            onTap: () async {
              var image = await _picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                setState(() {
                  _tempImage = File(image.path);
                });
              }
              if (!mounted) return;
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: PuddingColor.main,
              ),
              alignment: Alignment.center,
              child: Icon(
                Symbols.mode_edit_outline,
                size: 16,
                color: PuddingColor.brown,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          Expanded(child: _buildImage()),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: PuddingElevatedButton(
                    onPressed: () {
                      if (_tempImage != null) {
                        setState(() {
                          _saveImage = _tempImage;
                          imageCache.clear();
                        });
                      }
                      Navigator.pop(context);
                    },
                    child: Text('적용'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
