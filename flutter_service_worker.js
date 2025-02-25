'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "ab1cacacfd0087ab749b4b10e30b23e5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/NOTICES": "4ab1752704fb94e6f06e257c283855ef",
"assets/assets/gifs/ant_thrower.gif": "fddaebab0fe5f59fc2a4d3175d5ec736",
"assets/assets/gifs/ant_scuba.gif": "1495c82327cd26d6114377c23394454f",
"assets/assets/gifs/ant_scary.gif": "33184415e16df49ea929ffec912ee12d",
"assets/assets/gifs/ant_tank.gif": "bdfd5ee5274e9864c94324cb4235ce23",
"assets/assets/gifs/ant_shortthrower.gif": "8173d61fdc6e82dd8575f16689c43723",
"assets/assets/gifs/ant_wall.gif": "707d379977a257d2be43b5dbc49ecfaa",
"assets/assets/gifs/ant_laser.gif": "fa6b6edb5b285fe481b54c48999675f5",
"assets/assets/gifs/ant_hungry.gif": "652d9490778896f4a07a8c05111fe500",
"assets/assets/gifs/ant_ninja.gif": "36678f74d97520af74f02d1c002ac8a0",
"assets/assets/gifs/bee.gif": "f54b21e0a9f855a1b3b559a554cb6e7e",
"assets/assets/gifs/ant_queen.gif": "bc415331ef50ffbd56746e7347d9d9a2",
"assets/assets/gifs/ant_longthrower.gif": "6017e4df248610b0b98353ff642af1fc",
"assets/assets/gifs/ant_fire.gif": "14ee524728d658fb9ef8435588396b78",
"assets/assets/gifs/ant_harvester.gif": "77b121458a35908013893f3c406eca7f",
"assets/assets/gifs/ant_slow.gif": "ded2812758c93a1ed61505dc6230d03f",
"assets/assets/gifs/ant_bodyguard.gif": "fe0abd4e86da52f55fc9225d580b6258",
"assets/assets/gifs/remove.png": "b98e0dc93c136bfcfc3b0b6ef239f19b",
"assets/assets/game_structure.json": "01b9d632436df0377c9e2f4a9eb03477",
"assets/assets/images/sky_2.png": "dfcf583e817e20b5fbc623c896023451",
"assets/assets/images/sky_1.png": "2cee66441611ce87c4cc1717dc09467d",
"assets/assets/images/sky_3.png": "ff8d90ef018f0e6201ff683efb628cf1",
"assets/assets/images/water.png": "81d9e3a3fd2e36a73855fb7be9be9ba1",
"assets/assets/images/ground_tile_2.png": "226735987be8ffc78385a851fa21bfb4",
"assets/assets/images/ground_tile_1.png": "7c3cbdfad27797a8b8b6b7cfacc239c2",
"assets/assets/images/splash.png": "fac697b07c87dcece3df26257dd09d24",
"assets/assets/images/ground_tile_3.png": "9367fa4ca4953e931e4864ad49b71098",
"assets/assets/images/swirl_pattern.png": "e756a00a1ec23a6f6b95dad00040455f",
"assets/assets/images/game_background.png": "3c1ab79b7e0eaebcab5dc86f53aea887",
"assets/AssetManifest.json": "6fdf3d96c5302ac0f0c11d2f2d3d0641",
"assets/AssetManifest.bin": "82ffd0c162fa79da4a38ef4af604aab2",
"assets/fonts/MaterialIcons-Regular.otf": "fd36a16819423120fc17ce4e8e081d88",
"assets/AssetManifest.bin.json": "9e1668ee70f93032978955fce7d056ab",
".git/logs/HEAD": "c517ae67b0247cefec534df135a86f27",
".git/logs/refs/heads/main": "20666176a719b15ea852557cf66330b5",
".git/logs/refs/remotes/origin/main": "86801decde143218d15c5fd893168a77",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/config": "251c2bf37a0b10a281fb03305e845a0b",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/index": "1128cd3e0f98d7e4e6fe50ac86896427",
".git/refs/heads/main": "c3e437010533ca5f826fb1591adac9f6",
".git/refs/remotes/origin/main": "c3e437010533ca5f826fb1591adac9f6",
".git/COMMIT_EDITMSG": "bb37081403fb4757ba407920fd21b00c",
".git/objects/37/424b9262077ae16f3a29e3ad043afcb9379c92": "b4a0a2d571d1a8675337571913d249cd",
".git/objects/f4/f6621a04e8d2ec59adfe5b64dc1dadaf173271": "3fd0963955690aefd2a6737cb57763bb",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/e9/59a43bf05ec4f7cee672cb0069897b5e9cc82f": "1e85c6886490601b40743d44a6f802e8",
".git/objects/76/9f2c0466afe213d1e0cdb277065e8929ae03cc": "88ecedcf801ae0b212aea332c79ff8e8",
".git/objects/24/c91817f4331bca5fe2a9a83466fd658f90b729": "ec229539595f647849325efab2a42fc9",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/88/6ec8cdcea7b48fc94bb0d081fd07a5d2ce93a6": "16a38d60be1ffd7e13befb4c43f9aa92",
".git/objects/0d/98c427484b4bc36e5f4dd33ad964213d93c99b": "3f18ae0671bcae39a0ea3a1e38ca2b39",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/80/f6bb488c9a2344cdacbb4b2abeeb546c91d735": "7b534c6ea8ba977e4a93e3c82c60a7af",
".git/objects/a8/3302a21f8c0baa9ca6643b1a44b3576d1dc532": "da74ced25eff12524201b9edf3810b3f",
".git/objects/f3/baf8145dcf52cbe121998aa832f10b9f246fc9": "a65b04cc8876e34d1968807797a97ac6",
".git/objects/61/b94592aaa9ceaf231328e7e7d25b5f168d6290": "e706cf087b57378b0950149d355c5a26",
".git/objects/d8/2dfbb5a3992fbc32cf53c95d47532c3a8c0ef2": "e214d8f01db3a982a57fba6f6d923d85",
".git/objects/a1/a6c8e345aca76b79d2c28d20b9d434538e83bc": "095eeb07007d76c3e6ed52953a47a854",
".git/objects/0a/76ccf5eca8be4e200f583995a01ca59289a12c": "5cf7e6c21d87a513f848af2a1b1431af",
".git/objects/8e/faf350967f4f268cd3e276e52c397dbfd9a808": "7ce285407edc3ac54aed902afb84ee74",
".git/objects/25/3668992249a31b77d08fe10a79a1486e20c07a": "0df2e23ea5d9379f24948e61e711a7ad",
".git/objects/25/8b3eee70f98b2ece403869d9fe41ff8d32b7e1": "05e38b9242f2ece7b4208c191bc7b258",
".git/objects/34/4dadb8c047f4bba041fda4f32b230341e5207a": "626081033b1b25f82ff298863c31a49e",
".git/objects/b2/ca630b92e2c2f42cba32000e986d064de3fc89": "517836013be27d26f72a0b64024cea9b",
".git/objects/5a/dbd235be7cb3595bc0922801d78d821126b664": "63ed143bcb8fdbdba807185cb371fecb",
".git/objects/a3/ecfe0766f807cd51957c8be31be764a3e77926": "793e62ee7cb938f336d82d4a28dee309",
".git/objects/b0/d49b6d1f436f6663dac76d70edb871e96739dc": "92cfdb934275b4a234da8bcba9e8e38f",
".git/objects/27/a297abdda86a3cbc2d04f0036af1e62ae008c7": "51d74211c02d96c368704b99da4022d5",
".git/objects/27/7d1ce44a3cfe7ee7a43251d0c37f7d7e89bd78": "a3199642be9e15f1fb0c5867b18d4ef7",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/42/bc323f1e7e88e574ccac1f0f0d2db47ebe47d0": "ff3df72788b4afdaf25a42bb8b20689c",
".git/objects/2d/6aa9e9519d2776324054ca157f5e0f24d7a982": "27e09e97b5929cbbf08cceca31406652",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/c4/4000362aed2912da847d1689012572f553eedf": "25de4443a88d7c7bfdeb795f3cc1d85e",
".git/objects/56/8ba4808690d1dfb00c24c8315c7f1bd6c890f0": "6f9b95272330020324ff3a1559472a3d",
".git/objects/cb/1afa17be34d52468a6c90b2ec2615563598ff5": "058d8d9e8be3351f0956240ef2395db8",
".git/objects/0b/cb2c7fe0094659d67f49e7536f9f7335d43843": "df65609f67a15dede9cd5ed6c605ce58",
".git/objects/67/c59845970d63c9c9cbaad724c14cfc0c267f96": "9e29af622bef8c352c8ec82b0abcd3bc",
".git/objects/ab/02d9052a7fbfbc1a39cf301d13624321ccccc6": "35a2b4c17c80d1a2276974621b34211e",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/32/91976b8fe07d722a02b331320df92bdf8b2626": "4f8e79955df573698192da82498a2168",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/c3/b57ec3e0cc13aa9c2cacf5373dd239b0a963da": "412a4c719680e66bfa40b3bd0799b261",
".git/objects/fd/c8e900b29347617128e8c32f491b731c5674c3": "48b13e3fdc61f988c4af9ec5c945f862",
".git/objects/ac/e49cb9ff4ac4edf5a75a4cfe5ef990ae234aed": "a0e083ca2121a00c516713562254309b",
".git/objects/2e/78aa4c22233e21f7dd571aaf029a145a543481": "67c3accb649b286fcd6c110ce2f71885",
".git/objects/07/ce58be5d46a6a089e14712c5b390f18404686d": "a97873df87ffd13be81e1a1abc4347e3",
".git/objects/16/0c41126142125a1e78e558f5e0d8f5400ee466": "2198da299ffd758a80f31699458ea699",
".git/objects/15/ac0dfe1e173f72b6900654c2c1ae77c6238636": "d030834db5d98799bf24be6686b210c3",
".git/objects/23/f3fe566ad14bb40ed3e475b39b2bb4a816c15a": "88a3544a86d118d04eeea4752b6ceb3d",
".git/objects/b7/3f060e66de27487e2da7fe4a88cdc9681a1bc8": "a6e2af204732d202f69d88b12820e9e1",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/e1/c168572e8edbd01ad3b5b182c2bda90e8778b2": "3b316261b51cff24b750292d67ac1e38",
".git/objects/f6/0aac3b704f6df7a0779443112a0b8318cab651": "35992567d0d3081238129999ba3dd18c",
".git/objects/d7/43168e222ea894a71070805c649855a0bc2d54": "5de772b58e6f97a3192ec3e6b0b79476",
".git/objects/52/338deb208f7ac099131b4437d6f3f465a78836": "ac137b93dd5c85c404288b9823db7ffe",
".git/objects/0c/41a66a1d6ac338a3bc5ccf5ed6c9a5698710b9": "4ec2aa22ec70dae4aaf4bf0d2c1956f3",
".git/objects/ec/361605e9e785c47c62dd46a67f9c352731226b": "d1eafaea77b21719d7c450bcf18236d6",
".git/objects/89/ff5f7ef6af57685f2c59c350730eb97dc50256": "27d0619a17b9410f56ade114a2169e36",
".git/objects/a5/25df9d1cfcb464c8552ab120fb438f46deda9e": "6c8089ffe5d211e95527616328bdb442",
".git/objects/1b/6064ba0391203725e3e799dafd9b36c52c2da6": "4a55927efa9de58a2df66c2ced9d040b",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ee/7f138b1578a2082c3b318dadc5c9c1adf5c540": "ba3b013dcb0937fe5059add02344ec01",
".git/objects/70/2e17466c4846bb2080777918e77dbcb9681cc0": "c5270788eaf5cdefb7d4dcaa1073f9e5",
".git/objects/f2/dba918af4b2b56cce15125e4cba49a766964ce": "a3277b8f9f8a11d7a28f2ac20232cc07",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8a/2266185b9ad062ec63ad059046fd0d2ffcd7a5": "3ef8cc71997ce1af94453cdbaaa85610",
".git/objects/b5/a2108eb5e6f88e3a8ee1c65294aaecae198ae4": "05286838f150b737b1ddf619b7608df4",
".git/objects/ca/65951ddb946020956ae69611cabec47a3e7e66": "5ac2fce9563f0e89b155785d1aba4e3a",
".git/objects/b4/1faff499af6a8367d4487731633f4037287bcc": "9cbb8d70fcd11e6db20ce356d010c263",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/86/5507975a45bfa0739aa076d32c93c316f5af4c": "62d817b0e1b1ae8f280181fe63ab3625",
".git/objects/da/d0c4c38bc31e9e07d8e300f255e3d9e6a130e7": "584b5f5c00ba7c9d53d66aa4f7d6c3f9",
".git/objects/06/e6dc561325b52f86baf7be517622b3794404eb": "83c035e62b6498c2ac1ee752348368df",
".git/objects/41/5340ba3d3bb01989faec77e7e732afd2104cf4": "98418671ad4ecee9c66bf901915f2d13",
".git/objects/a7/65c08e52366d0c77f63a3e3436854ff94737ba": "6a3b08f18a65222f174dbadecfe6dd1e",
".git/objects/3d/e76e34e46a2d45b10a0754c2674cea0f97467a": "7923bd8a8227bce7112294c0466a24e3",
".git/objects/62/81646d9c864076c7c0a16f03c62d2f3e0ae47b": "23d9bc5cb61c0a366900948fbef60d23",
"main.dart.js": "0ef3affed2a05d338deea726b79cd7ec",
"flutter_bootstrap.js": "18c2d653d4bdba79a76d88b27cbb479e",
"version.json": "16c7e3767583137292f15595a9883131",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"index.html": "ac2113a9b14ec41b049e9d3ce5378b04",
"/": "ac2113a9b14ec41b049e9d3ce5378b04",
"canvaskit/canvaskit.wasm": "e27b3442745a7282a5cf8572a3f0d5fe",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/canvaskit.js": "32cc31c7f950543ad75e035fcaeb2892",
"canvaskit/skwasm.js.symbols": "a6bd1b7f2562a04db7cc22d151ad85fa",
"canvaskit/skwasm.wasm": "06280586b0c7423eb031389a7e814c16",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/chromium/canvaskit.wasm": "ecad3c5afedfd5f27f6a559f4a4e5d75",
"canvaskit/chromium/canvaskit.js": "6a5bd08897043608cb8858ce71bcdd8a",
"canvaskit/chromium/canvaskit.js.symbols": "3d3bbf288ee82b5173c7b0ff77e94265",
"canvaskit/canvaskit.js.symbols": "e449cd46c52d2c804854790b396fd519"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
