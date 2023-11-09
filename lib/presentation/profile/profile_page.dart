import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../common/utils/color.dart';
import '../../common/utils/text_style_gilroy.dart';
import '../../common/utils/text_style_proxima.dart';
import '../../common/widget/custom_app_bar.dart';
import '../../common/widget/custom_text_form_field.dart';
import '../../common/widget/primary_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              DefaultTabController(
                initialIndex: 0,
                length: 2,
                child: Container(
                  height: 34,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: TabBar(
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                          color: bgTabBar,
                          borderRadius: BorderRadius.circular(30)),
                      labelStyle: primaryProxima14,
                      labelColor: primaryColor,
                      unselectedLabelStyle: greyProxima14,
                      unselectedLabelColor: grey,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: const [
                        Tab(
                          text: "Profile Saya",
                        ),
                        Tab(
                          text: "Pengaturan",
                        )
                      ]),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 114,
                width: Get.width,
                decoration: ShapeDecoration(
                  color: buttonColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: shadow.withOpacity(0.1),
                      blurRadius: 24,
                      offset: const Offset(0, 16),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 20,
                      top: 0,
                      bottom: 0,
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const ShapeDecoration(
                              color: Colors.black,
                              shape: OvalBorder(),
                            ),
                            child: const Image(
                              image:
                                  AssetImage("assets/images/image_profile.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Angga ',
                                      style: whiteGilroyRegular16,
                                    ),
                                    TextSpan(
                                      text: 'Praja',
                                      style: whiteGilroyRegular14,
                                    ),
                                  ],
                                ),
                              ),
                              Opacity(
                                opacity: 0.5,
                                child: Text(
                                  'Membership BBLK',
                                  style: whiteProxima11,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        right: 0,
                        child: SvgPicture.asset(
                          "assets/images/ic_bg_profile.svg",
                        )),
                    Positioned(
                        right: 20,
                        bottom: 0,
                        child: SvgPicture.asset(
                          "assets/images/ic_bg_notification_2.svg",
                        ))
                  ],
                ),
              ),
              Container(
                height: 48,
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  color: buttonColor.withOpacity(0.9),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: shadow.withOpacity(0.1),
                      blurRadius: 24,
                      offset: const Offset(0, 16),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    'Lengkapi profile anda untuk memaksimalkan penggunaan aplikasi',
                    style: whiteProxima12,
                  ),
                ),
              ),
              Container(
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(),
                  shadows: [
                    BoxShadow(
                      color: shadow.withOpacity(0.1),
                      blurRadius: 24,
                      offset: const Offset(0, 16),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child:  Column(
                  children: [
                    const SizedBox(height: 30,),
                    Text(
                      'Pilih data yang ingin ditampilkan',
                      style: primaryGilroyRegular16,
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: ShapeDecoration(
                            color: bgTabBar,
                            shape: const OvalBorder(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: SvgPicture.asset(
                              "assets/images/ic_profile.svg",
                            ),
                          ),
                        ),
                        const SizedBox(width: 12,),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Data Diri',
                              style: primaryGilroyRegular14,
                            ),
                            Text(
                              'Data diri anda sesuai KTP',
                              style: greyProxima10,
                            )
                          ],
                        ),
                        const SizedBox(width: 12,),
                        Container(
                          width: 36,
                          height: 36,
                          decoration: const ShapeDecoration(
                            color: Colors.grey,
                            shape: OvalBorder(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: SvgPicture.asset(
                              "assets/images/ic_location.svg",
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const CustomTextFormField(
                      labelText: 'Nama Depan',
                      hintText: 'Nama depan',
                      textInputType: TextInputType.name,
                    ),
                    const SizedBox(height: 20,),
                    const CustomTextFormField(
                      labelText: 'Nama Belakang',
                      hintText: 'Nama belakang',
                      textInputType: TextInputType.name,
                    ),
                    const SizedBox(height: 20,),
                    const CustomTextFormField(
                      labelText: 'Email',
                      hintText: 'Masukan email anda',
                    ),
                    const SizedBox(height: 20,),
                    const CustomTextFormField(
                      labelText: 'No. Telpon',
                      hintText: 'Masukkan No Telpon anda',
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(height: 20,),
                    const CustomTextFormField(
                      labelText: 'No. KTP',
                      hintText: 'Masukkan No. KTP anda',
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(height: 40,),
                    Row(
                      children: [
                        Icon(Icons.info, color: buttonColor,),
                        const SizedBox(width: 12,),
                        Expanded(
                          child: Text(
                            'Pastikan profile anda terisi dengan benar, data pribadi anda terjamin keamanannya',
                            style: greyProxima12,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 40,),
                    const PrimaryButton(
                      text: 'Simpan profile',
                      iconData: Icons.save,
                      isUseIcon: true,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
