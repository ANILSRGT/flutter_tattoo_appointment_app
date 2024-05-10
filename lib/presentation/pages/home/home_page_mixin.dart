part of 'home_page.dart';

mixin HomePageMixin on State<HomePage> {
  final HomePageCubit _homePageCubit = HomePageCubit();

  late final ScrollController? _scrollController;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  Timer? _searchTimer;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    _searchTimer?.cancel();
    _homePageCubit.close();
    super.dispose();
  }

  void _onSearch(String query) {
    _searchTimer?.cancel();
    _searchTimer = Timer(const Duration(milliseconds: 500), () {
      _search(query);
    });
  }

  void _search(String query) {
    _searchFocusNode.unfocus();
    if (query.isEmpty) return;
    log('Search: $query');
  }
}
