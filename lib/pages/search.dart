import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loginDesign/auth/firestore.dart';
import 'package:loginDesign/models/user.dart';
import 'package:loginDesign/provider/search_provider.dart';
import 'package:loginDesign/widgets/progress.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() { 
    super.initState();
    var search = Provider.of<SearchUser>(context,listen: false);
    search.resetStreams();
  }

  clearSearch() {
    var search = Provider.of<SearchUser>(context,listen: false);
    searchController.clear();
    search.resetStreams();
    setState(() {
      
    });
  }

  AppBar buildSearchField() {
    var search = Provider.of<SearchUser>(context);
    return AppBar(
      backgroundColor: Colors.white,
      title: TextFormField(
        onFieldSubmitted: (value) {
          print(value);
          search.getUsers(value);
        },
        controller: searchController,
        decoration: InputDecoration(
          hintText: "Search for a user...",
          filled: true,
          prefixIcon: Icon(
            Icons.account_box,
            size: 28.0,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: clearSearch,
          ),
        ),
      ),
    );
  }

  Container buildNoContent() {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SvgPicture.asset(
              'assets/search.svg',
              height: orientation == Orientation.portrait ? 300.0 : 200.0,
            ),
            Text(
              "Find Users",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                fontSize: 60.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildSearchResults() {
    var search = Provider.of<SearchUser>(context);

    return ListView.builder(
      itemCount: search.searchUser.length,
      itemBuilder: (context, index) {
        return UserResult(search.searchUser[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var search = Provider.of<SearchUser>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
      appBar: buildSearchField(),
      body:
          search.searchUser.length == 0 ? buildNoContent() : buildSearchResults(),
    );
  }
}

class UserResult extends StatelessWidget {
  final Users user;

  UserResult(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.7),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => print('tapped'),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: CachedNetworkImageProvider(user.image),
              ),
              title: Text(
                user.name,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                user.username,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Divider(
            height: 2.0,
            color: Colors.white54,
          ),
        ],
      ),
    );
  }
}
