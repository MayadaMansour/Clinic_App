import 'package:flutter/material.dart';

import '../../../../../../utils/images/images.dart';
import '../../artical_details/ui/articals_page.dart';

class RecommendedArticals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ArticalsPage(
                              name: "عنوان المقاله",
                              desc:
                                  " لا شكّ أن المرور بفترة الحمل التي تمتد لشهورٍ طوال هي أشبه برحلة ممتعة، لكن في الوقت ذاته تحملُ في طيّاتها الكثير من المشقّات التي تتجلى في العديد من التغيّرات الهرمونية والفسيولوجية، ثم ما لبث أن تُكلّل في نهايتها بقدوم المولود الجديد لتجد الأم نفسها مُحاطة بقدر أكبر من التحديات التي تُحفّز عندها فيضاً من المشاعر التي هي مزيج من الفرح والإثارة والخوف والقلق. لكن في كثيرٍ من الأحيان قد تتحول تلك المشاعر إلى اكتئاب وهو ما يعرف بمُسمّى: اكتئاب ما بعد الولادة والذي قد يؤثّر على مقدرتها على ممارسة حياتها اليومية بشكلٍ طبيعي، و مقدرتها على الاعتناء بطفلها على حدٍّ سواء، الأمر الذي قد يتحول من شعورٍ عابر إلى اكتئابٍ شديد قد يطول أمده في بعض الحالات ليصبح مُزمناً.",
                          lunch: "5 نوفمبر 2012",
                          banner: Images.pannar,
                          poster: Images.artical,


                            )));
              },
              child: Container(
                width: 150,
                height: 180,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage(Images.artical),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 8, top: 10),
              child: Text(
                "عنوان المقاله",
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 10,
          );
        },
        itemCount: 3,
      ),
    );
  }
}
