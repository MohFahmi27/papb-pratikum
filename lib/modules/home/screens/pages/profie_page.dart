import 'package:flutter/material.dart';
import 'package:papb/modules/home/widgets/detail_banner_widget.dart';

import '../../../../constants/app_routes.dart';
import '../../../../utils/services/local_storage_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo.shade800,
          elevation: 0,
          title: const Text(
            "Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () => showSettings(context),
                icon: const Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            const DetailBannerWidget(
              "Mohammad Fahmi",
              "mohammadfahmi417@gmail.com",
              "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600",
            ),
            SizedBox(
              height: 50,
              child: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(
                    text: "Post",
                  ),
                  Tab(
                    text: "Tagged",
                  ),
                ],
                labelColor: Colors.indigo,
              ),
            ),
            SizedBox(
              height: 100,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  Center(child: Text("Post Feed")),
                  Center(child: Text("Tagged Feed")),
                ],
              ),
            )
          ],
        ));
  }

  showSettings(BuildContext context) => showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: settingsItem(),
          );
        },
      );

  Widget settingsItem() => Builder(builder: (BuildContext context) {
        return ListView(
          shrinkWrap: true,
          children: [
            const ListTile(
              leading: Icon(Icons.notifications_active_outlined),
              title: Text("Notification"),
              subtitle: Text("Atur segala jenis pesan notifikasi"),
            ),
            const ListTile(
              leading: Icon(Icons.privacy_tip_outlined),
              title: Text("Privasi Akun"),
              subtitle: Text("Atur Penggunaan data"),
            ),
            const ListTile(
              leading: Icon(Icons.edit_note_outlined),
              title: Text("Edit Akun"),
              subtitle: Text("Atur Akun data"),
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text("Logout"),
              onTap: () async {
                LocalStorageService.setStateLogin(false);
                Navigator.popAndPushNamed(context, AppRoutes.login);
              },
            )
          ],
        );
      });
}
