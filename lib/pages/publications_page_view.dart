import 'package:flutter/material.dart';
import '../controllers/home_page_controller.dart';

class PublicationsPageView extends StatefulWidget {
  const PublicationsPageView({
    super.key,
  });

  @override
  State<PublicationsPageView> createState() => _PublicationsPageViewState();
}

class _PublicationsPageViewState extends State<PublicationsPageView> {
  final _homeController = HomePageController();

  @override
  void initState() {
    _homeController.getUserData();
    _homeController.updateState = updatedState;

    _homeController.filter("");

    super.initState();
  }

   void updatedState() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24.0, left: 24.0),
          child: Text(
            "Olá, ${_homeController.user['name']!}",
            style: const TextStyle(
              color: Color(0xFF337367),
              fontSize: 24,
              fontFamily: 'Kaisei HarunoUmi',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: TextFormField(
            onChanged: _homeController.filter,
            onTapOutside: (tap) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              prefixIcon: const Icon(
                Icons.search,
                color: Color(0xFF97D2C7),
              ),
              labelText: 'Pesquisar',
              labelStyle: const TextStyle(
                color: Color(0xFF918F90),
                fontSize: 16,
                fontFamily: 'Kaisei Decol',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xFFD98FAA),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xFFD98FAA),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _homeController.publicationsList.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = _homeController.publicationsList[index];
              return Column(
                children: [
                  const Divider(
                    color: Color(0xFFDFDFDF),
                    thickness: 1,
                  ),
                  ListTile(
                    title: Text(
                      "@${item.user}",
                      style: const TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 13,
                        fontFamily: 'Kaisei HarunoUmi',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        item.description,
                        style: const TextStyle(
                          color: Color(0xFF121212),
                          fontSize: 12,
                          fontFamily: 'Kaisei HarunoUmi',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        item.image,
                      ),
                      backgroundColor: const Color.fromARGB(255, 211, 240, 235)
                      // child: Icon(
                      //   Icons.person,
                      //   color: Colors.white,
                      // ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Color(0xFFBF3F61),
                            ),
                            Text(
                              "Curtir",
                              style: TextStyle(
                                color: Color(0xFF929090),
                                fontSize: 12,
                                fontFamily: 'Kaisei HarunoUmi',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.insert_comment_outlined,
                              color: Color(0xFFBF3F61),
                            ),
                            Text(
                              "Comentar",
                              style: TextStyle(
                                color: Color(0xFF929090),
                                fontSize: 12,
                                fontFamily: 'Kaisei HarunoUmi',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.compare_arrows,
                              color: Color(0xFFBF3F61),
                            ),
                            Text(
                              "Republicar",
                              style: TextStyle(
                                color: Color(0xFF929090),
                                fontSize: 12,
                                fontFamily: 'Kaisei HarunoUmi',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.bookmark_border,
                              color: Color(0xFFBF3F61),
                            ),
                            Text(
                              "Salvar",
                              style: TextStyle(
                                color: Color(0xFF929090),
                                fontSize: 12,
                                fontFamily: 'Kaisei HarunoUmi',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
