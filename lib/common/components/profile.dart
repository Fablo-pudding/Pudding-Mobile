import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingProfile extends StatefulWidget {
  final String nickName;
  final String explanation;
  final void Function()? ontap;
  final File? image;

  const PuddingProfile({
    super.key,
    required this.nickName,
    required this.explanation,
    this.ontap,
    this.image,
  });

  @override
  State<PuddingProfile> createState() => _PuddingProfileState();
}

class _PuddingProfileState extends State<PuddingProfile> {
  final ImagePicker _picker = ImagePicker();
    File? _fileImage;

  getImage() async {
    XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      requestFullMetadata: false,
    );
    if (image != null) {
      setState(() {
        _fileImage = File(image.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        imageProfile(),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.nickName, style: PuddingTextStyle.heading2),
            SizedBox(height: 9),
            Text(
              widget.explanation,
              style: PuddingTextStyle.heading3.copyWith(
                color: PuddingColor.gray400,
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget _buildImage(){
     if(_fileImage != null) {
       return Expanded(
           child: Image.file(_fileImage!, fit: BoxFit.cover,),
       );
     }
     else{
       return Expanded(
           child: Container(
             color: PuddingColor.white,
           ),
       );
     }
  }
  Widget imageProfile() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: _fileImage != null ? FileImage(_fileImage!) : null,
          child: _fileImage == null ? SvgPicture.asset(
            'assets/img/profile.svg',
            width: 200,
            height: 200,
          ) : null
        ),
        Positioned(
          bottom: 0,
          right: -8,
          child: InkWell(
            onTap: () async {
              await getImage();
              if(!mounted) return;
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: SvgPicture.asset('assets/img/pen.svg'),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
      child: Column(
        children: [
          _buildImage(),
            Row(
              children: [
                Expanded(
                  child:
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: PuddingElevatedButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text('적용')),
                      ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

