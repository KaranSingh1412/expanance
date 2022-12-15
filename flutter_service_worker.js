'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/COMMIT_EDITMSG": "42740426a9576973ab58de6335542b58",
".git/config": "912bcd80a57d228dbc086bcb906a002a",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "37ca089a1c83795a4f129738284ef8f7",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "959d63ad7280115f8a0d41cabb4e6262",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "afe753f68a5ba6446fc7d3ef6a8e132e",
".git/logs/refs/heads/main": "469cf6ab37a1710543139bc9233df52e",
".git/logs/refs/remotes/origin/main": "4b1aa0863c15af72abfbc46fe1060d8a",
".git/objects/03/eaddffb9c0e55fb7b5f9b378d9134d8d75dd37": "87850ce0a3dd72f458581004b58ac0d6",
".git/objects/0d/0df08f7c3e147a8ae36017cf81a96e35b73717": "106e868f28a72727fb6fb0fa71123633",
".git/objects/13/7f79b15df790855c8573dc002584cbc82cd293": "0c5700270167a7a5de4b314e8864636e",
".git/objects/24/b1f14dd348b07c9b8373758bde9ac14d16fd92": "dbf45d6c044044561758a334420e9569",
".git/objects/25/c6a6e710a03644ee98d9a51c3025b0abe9b0ef": "ae65b7adeafb9419226fd74e3a9e53d8",
".git/objects/27/4584cdd87aecf196ac0e07da66c9466cdfbabd": "8ed27ee491114270db7d233dcc343848",
".git/objects/29/2214367c0af9a2eee8f873b2944224e2fe3f0c": "902d6cf3d5ea70392a74bfc9ded583bb",
".git/objects/2d/cf3542c874e33cd8ab86ceb6f0ec444228aa78": "66baad0ae5d874f09b6eee790095bc65",
".git/objects/32/9f67ea7c2b49532945ab96213b9a46199a725e": "481be899f0f56e435603917d5ed1d70a",
".git/objects/36/53297174424de493613c63862a704ea4332ed1": "7a11001edd9e70ab94c67ef0003ac715",
".git/objects/3a/15ba0cd5f433650932ff3671a77bedf17948f9": "24700dacfba7135335ad5d5ef419cb0e",
".git/objects/3f/32651adc4dfa892983ecad5df034359507218f": "1ddf55ff9237364603d55b368060a5ff",
".git/objects/44/579aa66452c8f17b90f7e3fe791f72bc877260": "8fa931d64fcba7f6f7c5579623acd632",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4a/d9e1d977062ec02565cab15ea59ff692749fa6": "567dd5e20c22f1f59a8a4c1be6692e11",
".git/objects/4e/89617a3696bd10c155ec378f4a65a9f89e9e3a": "d8056e20bae90d092b619c895129e982",
".git/objects/50/6f8949a0c69a848fd4060faf16e4e8404efad7": "8c6372e65c6572886855feebc4b04317",
".git/objects/57/00df9258011948632f7399d1eaeca7debbd6b5": "096c912a30009b80f62830dc0c534b3a",
".git/objects/57/d002f632f8f758bb14ab74423e3eb4fe8c5cf6": "686fcd1ade4988f8b3cbf26cd295aea1",
".git/objects/57/dd3357df87993165db68f4f3c7b9482ade0b79": "da9a0083b7e6881efba952b8d7af419b",
".git/objects/62/af90ee5be024e4533ca19ae972a02d0228c6b2": "db7fa9c6c9503ddad829bfea5307ff4c",
".git/objects/66/45b2d63a68ea0125aa3f296e7208bbeea5dc20": "fea98f372ab4966294a3cb2760946420",
".git/objects/69/3eb4eff8d116219ab6c1bbe5a1c7fc49a9ce9f": "3f1731deee387c45e1427abb765e2320",
".git/objects/76/8651b2e249c2517c7b37bdbeea0a5d8bfbb707": "495b1c4fefa633f6afe4dc5840ebe18f",
".git/objects/77/05d6889bad547fac657c8c7a60c68f78395cc8": "802eb57c0413fa98a1e7df3b5287ac02",
".git/objects/79/ba7ea0836b93b3f178067bcd0a0945dbc26b3f": "f3e31aec622d6cf63f619aa3a6023103",
".git/objects/7c/9bc1937773c24076d1891283bb7031255dd5bd": "bf1aacd1a98fa40be61e445aa40bd878",
".git/objects/81/e45cf3f617880b64474265f5c05d5597f21d5a": "d788a6380d0a901c33ad3c5cb9c1c3ca",
".git/objects/86/450f5fe6af9fd89408b06de5a1c00a8db3a18d": "d6d71db98354821f717d150b5d62752a",
".git/objects/88/4f8582f8ea6937a1c17a2e4669c2849c3ddf18": "ef511bde02578c468bfaf15f5c5fae73",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/89/6e257c7f76619c229af19e14b84cfa5570a4bc": "bc5233d44d0404c0d8075ad52c513f2b",
".git/objects/89/cd324cc4b4310c0778db200ac40481f4944850": "c5f0743f060ddc4c8db424a694118bf8",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8b/0090e852e49a42bc92d0ee46de45f5491c2c6e": "dd5e2a8995f8cb460b2b7b1a4bd624ac",
".git/objects/91/a559776d02ef6ca7d0e61cdb2768600b4b922b": "2c906f21debbe3d596d5a6d17d209123",
".git/objects/a1/3837a12450aceaa5c8e807c32e781831d67a8f": "bfe4910ea01eb3d69e9520c3b42a0adf",
".git/objects/ab/0e98497a51ead7821d1da35a24968ff314e50f": "557c35fe3928eb2af403d1b3926bb9ba",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ba/000fcd3f029e250fa6280c0fd000714a96ee86": "f758b42446e58fd6ca0f4a6be44aa084",
".git/objects/bc/d4ab473915bff3013a23bbdcd870a3a5f26b29": "3c7367862b7c64be80d93438b4ca0ac5",
".git/objects/bd/7d2bdb87fafaceb707447f96a83670df36a8cd": "d18c9365976e04274c898db71e85fa5a",
".git/objects/c5/7b2b6c3efa1e8a030a359c902720dd13d44f09": "b963fbe2948d461d25832f1e209a4e58",
".git/objects/cd/22076013ce8b84475eae9bb4cd6c60b5460fbe": "81c620e2d6cbe5638d6c90ee25886389",
".git/objects/d4/b8dbf389eff952739a105fff38d23ce955278d": "407ecb074a69ec5bef350ab2c97c88e0",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/de/28db843d7df6ed23b8a7526f6b6b4a83425fe7": "797e4f7b3d8dced098c51679ff33e848",
".git/objects/de/89d528c588b116e4de09b5bc51c41225fae965": "e3deef77b8f5d33a3c7597798dfc525e",
".git/objects/e2/e609a592df93ce36f967a9a88ba3d796f989b1": "8912f9c84b0ae8ec93866ccefca85c91",
".git/objects/e5/951dfb943474a56e611d9923405cd06c2dd28d": "c6fa51103d8db5478e1a43a661f6c68d",
".git/objects/e9/e575d0b36ebd696294496017834c26b62e1505": "8eca52e53d59927cc7c00a13888ea67b",
".git/objects/ea/72eb928ac9f4558a272d1e5e6c34305cf0c800": "b7e918d395a9d8c92911efd2f378a849",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ee/49f675591d4a8010afe6689e2ade71711d648a": "0933ca16bc6d4163e97c9744b796f1ae",
".git/objects/f6/77c141068cf1568c929326b8e74b7a6a7af4c6": "42e594c9b5e7892ecd4fdfe7c8689074",
".git/objects/fb/13ef2873a67011ccf364da982331a255fd43d5": "9c74640e5a8060d2568d6be4ad71f281",
".git/objects/fb/6834a9e15ef76ab2e3d36de5dfb0b3fb098881": "c4fdd5cce87a1fc0736d3a7302db9625",
".git/objects/fd/94f27a930148b2ffd42391357833771fadc795": "1199af42c81d71308f43cf2960b98d85",
".git/ORIG_HEAD": "3260cde5f9c8de7272347a35c31f96a8",
".git/refs/heads/main": "3260cde5f9c8de7272347a35c31f96a8",
".git/refs/remotes/origin/main": "3260cde5f9c8de7272347a35c31f96a8",
"assets/AssetManifest.json": "4e25aebc6e15a110dc8e053b5609f045",
"assets/assets/fonts/poppins-bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/fonts/poppins-light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/assets/fonts/poppins-medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/assets/fonts/poppins-regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/fonts/quicksand-bold.ttf": "517b4a8fa3577cc7066e9bcfebe4beff",
"assets/assets/fonts/quicksand-light.ttf": "34d0d3091e4f3de26ff0f2c4a4f6bfb7",
"assets/assets/fonts/quicksand-medium.ttf": "890d9ed927bb7f0c6b9eed04f9c329e5",
"assets/assets/fonts/quicksand-regular.ttf": "3dfedd2b3e7b35ec3ac8a295a166a880",
"assets/assets/images/1024.png": "925e3897a79e270f84123bacd72367ed",
"assets/FontManifest.json": "59f3c66f4c08e4e3ddc1c0767b762e5f",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "1af177ce6548954a5fb6c2f3c74ed70e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "c2a637c113a77abca77e25fca96c6f92",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/Icon-192.png": "94bd5248eb7e2d9d51099f57ae9f2013",
"icons/Icon-512.png": "3666450c606d1a33bdb78dbddd51398d",
"icons/Icon-maskable-192.png": "94bd5248eb7e2d9d51099f57ae9f2013",
"icons/Icon-maskable-512.png": "3666450c606d1a33bdb78dbddd51398d",
"index.html": "c705675d6c115f44144e5176318632ce",
"/": "c705675d6c115f44144e5176318632ce",
"main.dart.js": "b38c8a19113db5ff1585715f8d06ac9e",
"manifest.json": "0ef0a7694cd5fac4db1b493fc9edcf4f",
"version.json": "af55e262e1998f0065bedac82ad8bda8"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
