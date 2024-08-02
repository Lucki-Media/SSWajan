import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_s_wajan/screens/calculator_screen.dart';
import 'package:s_s_wajan/screens/home_page.dart';
import 'package:s_s_wajan/utils/app_colors.dart';
import 'package:s_s_wajan/utils/app_font_styles.dart';
import 'package:s_s_wajan/utils/app_strings.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> steelList = AppStrings.getSteelList1(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(2.0),
              child: Container(
                color: AppColors.kWhite,
                height: 2.0,
                width: double.infinity,
              )),
          toolbarHeight: 50,
          backgroundColor: AppColors.kBlack,
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 5.0, left: 12),
            child: Image.asset(
              'assets/images/splashLogo.png',
            ),
          ),
          centerTitle: true,
          title: Text(
            AppStrings.kAppName,
            style: AppFontStyles.splashSubText(fontWeight: FontWeight.bold),
          ),

        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black
              ),
            ),
            Image.asset('assets/images/mainHome.png',fit: BoxFit.cover,height: double.infinity,
              width: double.infinity,),
            Padding(
              padding: const EdgeInsets.only(top: 20.0,bottom: 10),
              child: ListView.builder(
                itemCount: steelList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(51, 51, 51, 1)
                    ),
                    child: Center(
                      child: ListTile(
                          onTap: () {

                            //if(index == 0){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CalculatorScreen(
                                      appBarName: steelList[index],
                                      selIndex: index,
                                    ),
                                  ));
                            //}


                          },
                          leading: SvgPicture.asset(
                          '${AppStrings.imageList[index]}',

                          // You can customize the width, height, and other properties as needed
                        ),
                        title: Text(steelList[index],style: AppFontStyles.splashSubText(fontWeight: FontWeight.bold,fontSize: 18),),
                        trailing: Icon(Icons.arrow_forward_ios,color: AppColors.kWhite,),
                      ),
                    ),
                    // child: Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.center
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         Center(child: Text(steelList[index],style: AppFontStyles.splashSubText(fontWeight: FontWeight.bold,fontSize: 18),)),
                    //       ],
                    //     )
                    //   ],
                    // ),
                  ),
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}
