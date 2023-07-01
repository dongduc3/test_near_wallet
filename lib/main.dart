import 'package:assigment/model/near_model.dart';
import 'package:assigment/repository/near_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:near_api_flutter/near_api_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int indexBtb = 0;
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'NEAR Flutter API Example',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SafeArea(
            child: Scaffold(
                floatingActionButton: FloatingActionButton(
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Colors.deepPurpleAccent,
                          Colors.purple,
                        ],
                      ),
                    ),
                    child: const Icon(Icons.add, size: 25),
                  ),
                  onPressed: () {},
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: indexBtb,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.grey,
                  onTap: (index) {
                    setState(() {
                      indexBtb = index;
                      if (kDebugMode) {
                        print(indexBtb);
                      }
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined, color: indexBtb == 0 ? Colors.blue : Colors.grey),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.find_in_page_outlined, color: indexBtb == 1 ? Colors.blue : Colors.grey),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.map_outlined, color: indexBtb == 2 ? Colors.blue : Colors.grey),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.comment_bank_outlined, color: indexBtb == 3 ? Colors.blue : Colors.grey),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.add_alert_outlined, color: indexBtb == 4 ? Colors.blue : Colors.black45),
                      label: '',
                    ),
                  ],
                ),
                body: const MyHomePage())));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  Map response = {};
  String contractId = 'dev-1652100430918-60749606761829';
  String mutateMethod = 'submitPost';
  String viewMethod = 'getAllPosts';
  late Account connectedAccount;
  String userAccount = 'ducdong.testnet';
  final _textUserIdController = TextEditingController();

  final alo = [
    NearModel(
        id: "1654686721_ungest.testnet",
        accountId: "ungest.testnet",
        topic: Topic(
          id: "default",
          admin: "leeddwcs2.testnet",
          name: "default",
          createdTime: "1652456259952152565",
          description: "default",
        ),
        title: "Made my own inputs on the rawbot",
        body: "QmVhEJK1pksZCSRAPq8VKkm2joGd5To8xKEZJvZ5g66iXz",
        postType: PostType(
          type: "Image",
          url: "https://ipfs.infura.io/ipfs/QmZGHcDS61N9gQL95LGkCVsV5HiVLV6L5Ee2PRLUwB1Dha",
        ),
        time: "1654686721377393519"),
    NearModel(
        id: "ducdong99.testnet",
        accountId: "ducdong.testnet",
        topic: Topic(
          id: "default",
          admin: "leeddwcs2.testnet",
          name: "default",
          createdTime: "1652456289952152565",
          description: "default",
        ),
        title: "Hello World",
        body: "QmVhEJK1pksZCSRAPq8VKkm2joGd5To8xKEZJvZ5g66iXz",
        postType: PostType(
          type: "Image",
          url: "https://ipfs.infura.io/ipfs/QmZGHcDS61N9gQL95LGkCVsV5HiVLV6L5Ee2PRLUwB1Dha",
        ),
        time: "1654686721377393519"),
    NearModel(
        id: "1654686721_ungest.testnet",
        accountId: "ungest.testnet",
        topic: Topic(
          id: "default",
          admin: "leeddwcs2.testnet",
          name: "default",
          createdTime: "652456259952152565",
          description: "default",
        ),
        title: "Made my own inputs on the rawbot",
        body: "QmVhEJK1pksZCSRAPq8VKkm2joGd5To8xKEZJvZ5g66iXz",
        postType: PostType(
          type: "Image",
          url: "https://ipfs.infura.io/ipfs/QmZGHcDS61N9gQL95LGkCVsV5HiVLV6L5Ee2PRLUwB1Dha",
        ),
        time: "1654686721377393519"),
    NearModel(
        id: "ducdong99.testnet",
        accountId: "ducdong.testnet",
        topic: Topic(
          id: "default",
          admin: "leeddwcs2.testnet",
          name: "default",
          createdTime: "1652456289952152565",
          description: "default",
        ),
        title: "Hello World",
        body: "QmVhEJK1pksZCSRAPq8VKkm2joGd5To8xKEZJvZ5g66iXz",
        postType: PostType(
          type: "Image",
          url: "https://ipfs.infura.io/ipfs/QmZGHcDS61N9gQL95LGkCVsV5HiVLV6L5Ee2PRLUwB1Dha",
        ),
        time: "1654686721377393519"),
    NearModel(
        id: "1654686721_ungest.testnet",
        accountId: "ungest.testnet",
        topic: Topic(
          id: "default",
          admin: "leeddwcs2.testnet",
          name: "default",
          createdTime: "1652456259952152565",
          description: "default",
        ),
        title: "Made my own inputs on the rawbot",
        body: "QmVhEJK1pksZCSRAPq8VKkm2joGd5To8xKEZJvZ5g66iXz",
        postType: PostType(
          type: "Image",
          url: "https://ipfs.infura.io/ipfs/QmZGHcDS61N9gQL95LGkCVsV5HiVLV6L5Ee2PRLUwB1Dha",
        ),
        time: "1654686721377393519"),
    NearModel(
        id: "ducdong99.testnet",
        accountId: "ducdong.testnet",
        topic: Topic(
          id: "default",
          admin: "leeddwcs2.testnet",
          name: "default",
          createdTime: "1652456289952152565",
          description: "default",
        ),
        title: "Hello World",
        body: "QmVhEJK1pksZCSRAPq8VKkm2joGd5To8xKEZJvZ5g66iXz",
        postType: PostType(
          type: "Image",
          url: "https://ipfs.infura.io/ipfs/QmZGHcDS61N9gQL95LGkCVsV5HiVLV6L5Ee2PRLUwB1Dha",
        ),
        time: "1654686721377393519"),
  ];

  bool isLikeAnimating = false;
  bool isLoading = true;
  int comment = 0;
  int favorite = 0;
  int rep = 0;
  bool isReplying = false;

  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _textUserIdController.text = "ducdong.testnet";

    // Init late connectAccount

    /* String walletURL = 'https://wallet.testnet.near.org/login/?';
    String contractId = 'dev-1652100430918-60749606761829';
    String appTitle = 'Made my own inputs on the rawbot';
    String accountId = userAccount;
    String nearSignInSuccessUrl = 'https://near-transaction-serializer.herokuapp.com/success';
    String nearSignInFailUrl = 'https://near-transaction-serializer.herokuapp.com/failure';

    connectedAccount = NEARTester.loginWithLimitedAccess(
        walletURL, contractId, accountId, appTitle, nearSignInSuccessUrl, nearSignInFailUrl);*/

    NearApi().getData();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Information text
            /*Text(
              "Contract: $contractId",
            ),
            Text(
              "Mutate Method: $mutateMethod",
            ),
            Text(
              "View Method: $viewMethod",
            ),*/
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                SizedBox(width: 100),
                CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg'),
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
            const DefaultTabController(
              length: 2,
              child: TabBar(
                indicatorColor: Colors.deepOrangeAccent,
                indicatorWeight: 1,
                tabs: [
                  Tab(
                    child: Text(
                      "Rep's",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Articles",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.redAccent,
                      Colors.deepPurpleAccent,
                      Colors.white,
                    ],
                  ),
                ),
                child: ListView.separated(
                  itemCount: alo.length,
                  itemBuilder: (_, index) {
                    return buildFeedPost(index);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Padding(padding: EdgeInsets.only(bottom: 10));
                  },
                )
                //buildFeedPost(),
                ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // TODO: Infor User
                //buildUserId(),
                // TODO: Connect Wallet
                //buildLimitedAccessCard(),
              ],
            )
          ],
        ),
      ),
    );
  }

  buildFeedPost(int index) {
    int time = int.parse(alo[index].time);
    var parse = DateTime.fromMicrosecondsSinceEpoch(time);
    var monthStr = DateFormat('MM').format(parse);
    var dayStr = DateFormat('dd').format(parse);
    var parseMonth = int.parse(monthStr);
    var month = "Jan";
    switch (parseMonth) {
      case 01:
        month = "Jan";
        break;
      case 02:
        month = "Fed";
        break;
      case 03:
        month = "Mar";
        break;
      case 04:
        month = "Apr";
        break;
      case 05:
        month = "May";
        break;
      case 06:
        month = "Jun";
        break;
      case 07:
        month = "Jul";
        break;
      case 08:
        month = "Aug";
        break;
      case 09:
        month = "Sep";
        break;
      case 10:
        month = "Nov";
        break;
      case 11:
        month = "Nov";
        break;
      case 12:
        month = "Dec";
        break;
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: [
          rep == 0
              ? const SizedBox()
              : Container(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.repeat,
                        color: Colors.black,
                        size: 20,
                      ),
                      Text(
                        " @${alo[index].topic.name}",
                        style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.black45, fontSize: 10),
                      ),
                      const Text(
                        " rereped",
                        style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black87, fontSize: 13),
                      ),
                    ],
                  ),
                ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ).copyWith(right: 0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 26,
                  backgroundImage:
                      NetworkImage("https://sourcesofinsight.com/wp-content/uploads/2007/12/Yes-Person.jpg"),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${alo[index].topic.name[0].toUpperCase()}${alo[index].topic.name.substring(1)}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "@${alo[index].topic.name}",
                              style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.black12),
                            ),
                            const SizedBox(
                              height: 40,
                              child: Padding(
                                padding: EdgeInsets.only(top: 3, right: 10, left: 10),
                                child: Text(
                                  ".",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            Text("$month $dayStr",
                                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))
                          ],
                        ),
                        isReplying == false
                            ? const SizedBox()
                            : FadeTransition(
                                opacity: _animation as Animation<double>,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Replying for ',
                                        style: TextStyle(fontSize: 10, color: Colors.grey),
                                      ),
                                      Text(
                                        '@${alo[index].topic.name}',
                                        style: const TextStyle(fontSize: 10, color: Colors.blueAccent),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                        Text(alo[index].title)
                      ],
                    ),
                  ),
                ),
                IconButton(
                  padding: const EdgeInsets.only(bottom: 25),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        backgroundColor: Colors.deepPurpleAccent,
                        child: ListView(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          shrinkWrap: true,
                          children: [
                            'Delete',
                          ]
                              .map((e) => InkWell(
                                    onTap: () async {},
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 16,
                                      ),
                                      child: Text(e),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.more_horiz_outlined, color: Colors.black45),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () async {
                          setState(() {
                            favorite++;
                          });
                        },
                        icon: favorite <= 0
                            ? const Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.black87,
                              )
                            : const Icon(
                                Icons.favorite,
                                color: Colors.black87,
                              )),
                    Text("$favorite", style: const TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          //comment++;
                        });
                      },
                      icon: const Icon(
                        Icons.comment_bank_outlined,
                      ),
                    ),
                    Text("$comment", style: const TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isReplying = true;
                          Future.delayed(
                              const Duration(
                                seconds: 3,
                              ), () {
                            setState(() {
                              isReplying = false;
                              rep++;
                            });
                          });
                        });
                      },
                      icon: const Icon(
                        Icons.repeat,
                      ),
                    ),
                    Text("$rep", style: const TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.ios_share_outlined,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Limited Access
  buildLimitedAccessCard() {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            children: [
              ElevatedButton(
                //connect
                onPressed: () {
                  String walletURL = 'https://wallet.testnet.near.org/login/?';
                  String contractId = 'dev-1652100430918-60749606761829';
                  String appTitle = 'Made my own inputs on the rawbot';
                  String accountId = userAccount;
                  String nearSignInSuccessUrl = 'https://near-transaction-serializer.herokuapp.com/success';
                  String nearSignInFailUrl = 'https://near-transaction-serializer.herokuapp.com/failure';

                  connectedAccount = NEARTester.loginWithLimitedAccess(
                      walletURL, contractId, accountId, appTitle, nearSignInSuccessUrl, nearSignInFailUrl);
                },
                child: const Text("Connect Wallet"),
              ),

              // Get_posts method

              /*ElevatedButton(
                onPressed: () async {
                  String contractId = 'dev-1652100430918-60749606761829';
                  String method = 'get_posts';
                  String methodArgs = '{"from_index": 0, "limit": 10}';

                  Contract contract = Contract(contractId, connectedAccount);
                  response = await NEARTester.callViewMethod(contract, method, methodArgs);
                  setState(() {
                    */ /*alo.forEach((element) {
                      print(element.title);
                    });*/ /*
                    alo[0].title;
                  });
                },
                child: const Text("Call view function"),
              ),
              Text("${alo[1].title}")*/
            ],
          )),
    );
  }

  buildUserId() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User Id to connect with:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              onChanged: (str) {
                userAccount = str;
              },
              controller: _textUserIdController,
            )
          ],
        ),
      ),
    );
  }
}

class NEARTester {
  static loginWithLimitedAccess(walletURL, contractId, accountId, appTitle, signInSuccessUrl, signInFailureUrl) {
    // Generate Keys
    var keyPair = KeyStore.newKeyPair();

    // Open near wallet in default browser
    Account account = Account(accountId: accountId, keyPair: keyPair, provider: NEARTestNetRPCProvider());

    var wallet = Wallet(walletURL);
    wallet.connect(contractId, appTitle, signInSuccessUrl, signInFailureUrl, account.publicKey);

    return account; //connected account
  }

  static callViewMethod(Contract contract, String method, args) async {
    var result = await contract.callViewFuntion(method, args);
    return result;
  }
}
