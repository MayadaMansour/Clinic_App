import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notfa/core/main_cubit/cubit_main.dart';
import 'package:notfa/core/main_cubit/main_state.dart';
import 'package:notfa/utils/color_resource/color_resources.dart';
import '../widget/recommended_doctors.dart';
import '../widget/recommended_articals.dart';
import '../widget/slider_pannar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.background,
      appBar: AppBar(
        backgroundColor: ColorResources.background,
        title: Text(
          "الصفحه الرئيسيه",
          style: TextStyle(
              color: ColorResources.mainColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notification_add,
                  color: ColorResources.mainColor,
                  size: 30,
                )),
          )
        ],
      ),
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SliderPannar(),
                SizedBox(height: 20,),
                Text(
                  ':الأطباء الموصي بيهم',
                  style: TextStyle(color: ColorResources.mainColor,fontSize: 18,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8,),
                RecommendedDoctors(),
                SizedBox(height: 20,),
                Text(
                   ':المقالات الأكثر شيوعا ',
                  style: TextStyle(color: ColorResources.mainColor,fontSize: 18,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8,),
                RecommendedArticals()
              ],
            ),
          ),
        ),
      )),
    );
    // return BlocConsumer<NotfaCubit, NotfaState>(
    //   listener: (context, state) {},
    //   builder: (context, state) {
    //     return ConditionalBuilder(
    //         condition: NotfaCubit.get(context).model != null,
    //         builder: (context) => Scaffold(
    //               backgroundColor: ColorResources.background,
    //               appBar: AppBar(
    //                 backgroundColor: ColorResources.background,
    //                 title: Text(
    //                   "الصفحه الرئيسيه",
    //                   style: TextStyle(
    //                       color: ColorResources.mainColor,
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.bold),
    //                 ),
    //                 centerTitle: true,
    //                 automaticallyImplyLeading: false,
    //                 elevation: 0,
    //                 actions: [
    //                   Padding(
    //                     padding: const EdgeInsets.only(right: 10),
    //                     child: IconButton(
    //                         onPressed: () {},
    //                         icon: Icon(
    //                           Icons.notification_add,
    //                           color: ColorResources.mainColor,
    //                           size: 30,
    //                         )),
    //                   )
    //                 ],
    //               ),
    //               body: SafeArea(
    //                   child: SizedBox(
    //                 height: MediaQuery.of(context).size.height,
    //                 child: SingleChildScrollView(
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(10),
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.end,
    //                       crossAxisAlignment: CrossAxisAlignment.end,
    //                       children: [
    //                         Container(
    //                           height: 50,
    //                           color: Colors.amber.withOpacity(0.5),
    //                           child: Padding(
    //                             padding: const EdgeInsets.symmetric(horizontal: 20),
    //                             child: Row(children: [
    //                               Icon(Icons.info_outline),
    //                               SizedBox(width: 10,),
    //                               Expanded(child: Text("Please Verify Your Email")),
    //                               Spacer(),
    //                               SizedBox(width: 20,),
    //                               TextButton(onPressed: (){}, child: Text("Send",style: TextStyle(fontSize: 15),))
    //                             ],),
    //                           ),
    //                         ),
    //                         SliderPannar(),
    //                         SizedBox(
    //                           height: 20,
    //                         ),
    //                         Text(
    //                           ':الأطباء الموصي بيهم',
    //                           style: TextStyle(
    //                               color: ColorResources.mainColor,
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold),
    //                         ),
    //                         SizedBox(
    //                           height: 8,
    //                         ),
    //                         RecommendedDoctors(),
    //                         SizedBox(
    //                           height: 20,
    //                         ),
    //                         Text(
    //                           ':المقالات الأكثر شيوعا ',
    //                           style: TextStyle(
    //                               color: ColorResources.mainColor,
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold),
    //                         ),
    //                         SizedBox(
    //                           height: 8,
    //                         ),
    //                         RecommendedArticals()
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               )),
    //             ),
    //         fallback: (context) => Center(
    //               child: CircularProgressIndicator(),
    //             ));
    //   },
    // );
  }
}
