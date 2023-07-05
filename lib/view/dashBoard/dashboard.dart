import 'package:admin_side_flutter/utils/constants/colors.dart';
import 'package:admin_side_flutter/utils/constants/padding.dart';
import 'package:admin_side_flutter/view/dashBoard/widgets/cardwidget.dart';
import 'package:admin_side_flutter/view/dashBoard/widgets/drawerwidget.dart';
import 'package:admin_side_flutter/view/widgets/customtextwidget.dart';
import 'package:admin_side_flutter/view/widgets/primarywidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/admin_dashboard_contoller.dart';


class ScreenDashBoard extends StatelessWidget {
  const ScreenDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    //const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final apiResponse = Provider.of<ApigetReponse>(context,listen: false);
    final adminModel = apiResponse.adminModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bgcolor,
        title: const TextWidget(
          text: 'Dashboard',
          size: 30,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
      ),
      drawer: const DrawerWidget(),
      body: 
      adminModel == null  ? const CircularProgressIndicator():
      PrimaryWidget(
        widget: GridView.count(
          padding: paddingall10,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.2,
          children:  [
            CardWidget(
              image:
                  'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
              text: 'Active Users',
              count:Provider.of<ApigetReponse>(context).adminModel!.activeUsers.toString(),
            ),
            CardWidget(
              image:
                  'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
              text: 'Blocked Users',
              count: Provider.of<ApigetReponse>(context).adminModel!.blockedUsers.toString(),
            ),
            CardWidget(
              image:
                  'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
              text: 'Active Doctors',
              count: Provider.of<ApigetReponse>(context).adminModel!.activeDoctors.toString(),
            ),
            CardWidget(
              image:
                  'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
              text: 'Blocked Doctor',
              count: Provider.of<ApigetReponse>(context).adminModel!.blockedDoctors.toString(),
            ),
           CardWidget(
              image:
                  'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
              text: 'Verified Doctors',
              count: Provider.of<ApigetReponse>(context).adminModel!.verifiedDoctors.toString(),
            ),
            CardWidget(
              image:
                  'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
              text: 'Unverifed Doctors',
              count: Provider.of<ApigetReponse>(context).adminModel!.unVerifiedDoctors.toString(),
            ),
            CardWidget(
              image:
                  'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
              text: 'Totel Revenue',
              count: Provider.of<ApigetReponse>(context).adminModel!.totalRevenue.toString(),
            ),
            CardWidget(
              image:
                  'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
              text: 'Sucessful Apoinments',
              count: Provider.of<ApigetReponse>(context).adminModel!.successfulAppointments.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
