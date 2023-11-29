import 'package:flutter/material.dart';

import '../controllers/home_page_controller.dart';

class ForumPageView extends StatefulWidget {
  const ForumPageView({super.key});

  @override
  State<ForumPageView> createState() => _ForumPageViewState();
}

class _ForumPageViewState extends State<ForumPageView> {
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
    final List<String> themes = [
      "Tecnologia",
      "Ciências",
      "Artes",
      "Esportes",
      "Música",
      "Filmes",
      "Séries",
      "Livros",
      "Jogos",
      "Outros",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.forum,
                color: Color(0xFF121212),
                size: 24,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                'Fórum',
                style: TextStyle(
                  color: Color(0xFF121212),
                  fontSize: 18,
                  fontFamily: 'Kaisei HarunoUmi',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFBF3F61),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {
                      _homeController.add();
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
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
        SizedBox(
          height: 100,
          child: Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: themes.length,
              itemBuilder: (context, index) {
                final item = themes[index];
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF97D2C7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.only(left: 20, right: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: 100,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text(
                        item,
                        style: const TextStyle(
                          color: Color(0xFFBF3F61),
                          fontSize: 12,
                          fontFamily: 'Kaisei HarunoUmi',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
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
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
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
                        const SizedBox(
                          width: 24,
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
                        SizedBox(
                          width: 24,
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
