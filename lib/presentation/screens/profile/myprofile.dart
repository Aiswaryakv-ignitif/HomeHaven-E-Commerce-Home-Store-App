import'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
         
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 80), // Space for the overlapping card
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("General", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF404040))),
                  const SizedBox(height: 15),
                  _buildMenuTile(icon: Icons.receipt_long, title: "Transaction"),
                  _buildMenuTile(icon: Icons.favorite_border, title: "Wishlist"),
                  _buildMenuTile(icon: Icons.bookmark_border, title: "Saved Address"),
                  _buildMenuTile(icon: Icons.credit_card, title: "Payment Methods"),
                  _buildMenuTile(icon: Icons.notifications_none, title: "Notification"),
                  _buildMenuTile(icon: Icons.lock_outline, title: "Security"),
                  
                  const SizedBox(height: 20),
                  const Text("Help", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF404040))),
                  
                
                ],
              ),
            ),
          ],
        ),
      );
    
  }
}

Widget _buildHeader() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        height: 190,
        width: double.infinity,
        decoration:BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
              colors:[ 
                Color(0xFF1A7F65),
                Color(0xFF115543),
              ],
              )
            ),
        // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
        padding: const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 16),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Account",
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            // Icon(Icons.notifications_none, color: Colors.white,size: 28,),
             IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_outlined,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
          ],
        ),
      ),
     
      Positioned(
        top: 140,
        left: 16,
        right: 16,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 5))
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/profile.png')
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text("Claire Cooper",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFF404040))),
                  Text("claire.cooper@mail.com",
                      style: TextStyle(color: Color(0xFF757575),fontSize: 16)),
                ],
              ),
               const Spacer(),
              
              Icon(Icons.edit_note_outlined, color: const Color(0xFF404040),size: 35,),
              // IconButton(onPressed: () {}, icon: const Icon(Icons.edit_note_outlined),color: Color(0xFF404040),iconSize: 35,)
            ],
          ),
        ),
      ),
    ],
  );
}



Widget _buildMenuTile({required IconData icon, required String title}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 5))
            ],
    ),
    child: ListTile(
      leading: Icon(icon, color: const Color(0xFF404040),size: 28,),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
      trailing: const Icon(Icons.chevron_right, color:Color(0xFF404040)),
      onTap: () {},
    ),
  );
}