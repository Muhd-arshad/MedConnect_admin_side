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
        widget: Consumer<ApigetReponse>(
         
          builder: (context, getDashboardProvider,child) {
            return GridView.count(
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
                  count:getDashboardProvider.adminModel!.activeUsers.toString(),
                ),
                CardWidget(
                  image:
                      'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                  text: 'Blocked Users',
                  count:getDashboardProvider.adminModel!.blockedUsers.toString(),
                ),
                CardWidget(
                  image:
                      'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                  text: 'Active Doctors',
                  count: getDashboardProvider.adminModel!.activeDoctors.toString(),
                ),
                CardWidget(
                  image:
                      'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                  text: 'Blocked Doctor',
                  count: getDashboardProvider.adminModel!.blockedDoctors.toString(),
                ),
               CardWidget(
                  image:
                      'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                  text: 'Verified Doctors',
                  count: getDashboardProvider.adminModel!.verifiedDoctors.toString(),
                ),
                CardWidget(
                  image:
                      'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                  text: 'Unverifed Doctors',
                  count: getDashboardProvider.adminModel!.unVerifiedDoctors.toString(),
                ),
                CardWidget(
                  image:
                      'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                  text: 'Totel Revenue',
                  count: getDashboardProvider.adminModel!.totalRevenue.toString(),
                ),
                CardWidget(
                  image:
                      'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                  text: 'Sucessful Apoinments',
                  count: getDashboardProvider.adminModel!.successfulAppointments.toString(),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
