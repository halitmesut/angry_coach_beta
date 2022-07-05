import 'package:angry_coach_beta/extract/widgets.dart';
import 'package:flutter/material.dart';

class CoachPage extends StatelessWidget {
  const CoachPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 30,
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                      flex: 2, child: Image.asset('assets/angrycoachh.jpg')),
                  Expanded(child: Container()),
                ],
              ),
            ),
            const Spacer(flex: 2),
            Expanded(
              flex: 40,
              child: GestureDetector(
                onTap: () {
                  bottomSheetText(context,
                      "Aşağıdaki 5 maddeyi tamamlamazsan kızarım. Tamamlarsan dünyanın en mutlu koçuna dönüşürüm. Bundan çok değil 1 ay sonra ise aynaya baktığında sen dünyanın en mutlu çekirgesi olursun. Anlaşıldı mı çekirge. Görevlerini yap ikimiz de başaralım.");
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 230, 230, 230),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: const Center(
                    child: Text(
                      "Senden sporcu değil çekirge bile olmaz. Daha boğazını tutamıyorsun. Bide utanmadan kakmış benden düzgün bi vücut istiyorsun.",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 10,
              child: GestureDetector(
                onTap: () {
                  bottomSheetText(context,
                      "Senden gün içinde yediğin leblebi tanesini bile bana söylemeni istiyorum. Birşeyler yer ve bana söylemezen kızarım. Söylersen ise düzgün bir programla yolumuza devam eder, bizi görenleri hayretlere düşürürüz.");
                },
                child: NormalListItem(
                  textInput: "Nutrient Input",
                  iconData: Icons.check_circle,
                  iconColors: Colors.green,
                  topLeftCornerRadius: 30,
                  topRightCornerRadius: 30,
                  bottomLeftCornerRadius: 0,
                  bottomRightCornerRadius: 0,
                ),
              ),
            ),
            const SizedBox(height: 1),
            Expanded(
              flex: 10,
              child: GestureDetector(
                onTap: () {
                  bottomSheetText(context,
                      "Sana o kadar güzel bir kalori hesabı yaptım ki, harfiyyen uyman gerekiyor. Ne çok fazla, ne çok az. Tam sana göre. Fakat senin için yüzde 10'luk bir sapmayı gözardı edebilirim. Bu miktarın dışındaki sapmalarda çok öfkelenirim.");
                },
                child: NormalListItem(
                  textInput: "Calorie Goal",
                  iconData: Icons.check_circle,
                  iconColors: Colors.green,
                  topLeftCornerRadius: 0,
                  topRightCornerRadius: 0,
                  bottomLeftCornerRadius: 0,
                  bottomRightCornerRadius: 0,
                ),
              ),
            ),
            const SizedBox(height: 1),
            Expanded(
                flex: 10,
                child: GestureDetector(
                  onTap: () {
                    bottomSheetText(context,
                        "Boy ve kilo değerlerine bakarak senin vücudunun bir günde ne kaddar suya ihtiyaç duyduğunu hesapladım. Senin 2.5 litre su tüketmen gerekiyor. Ama sen bu miktarı tüketmeyerek beni kızdırıyorsun çekirge. ");
                  },
                  child: NormalListItem(
                      textInput: "Water Consumption",
                      iconData: Icons.cancel,
                      iconColors: Colors.red,
                      topLeftCornerRadius: 0,
                      topRightCornerRadius: 0,
                      bottomLeftCornerRadius: 30,
                      bottomRightCornerRadius: 30),
                )),
            Expanded(flex: 2, child: Container()),
          ],
        ),
      ),
    );
  }

  Future<dynamic> bottomSheetText(BuildContext context, String text) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Center(
              child: Container(
                padding: const EdgeInsets.all(40),
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ));
  }
}
