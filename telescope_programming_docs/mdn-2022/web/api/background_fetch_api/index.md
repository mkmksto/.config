---
title: Background Fetch API
slug: Web/API/Background_Fetch_API
tags:
  - API
  - Overview
  - Reference
  - Background Fetch API
  - Experimental
browser-compat: api.BackgroundFetchManager
---
{{DefaultAPISidebar("Background Fetch API")}} {{SeeCompatTable}}

The **Background Fetch API** provides a method for managing downloads that may take a significant amount of time such as movies, audio files, and software.

## Concepts and Usage

When a web application requires the user to download large files, this often presents a problem in that the user needs to stay connected to the page for the download to complete. If they lose connectivity, close the tab or navigate away from the page the download stops.

The {{domxref("Background Synchronization API")}} provides a way for service workers to defer processing until a user is connected; however it can't be used for long running tasks such as downloading a large file. Background Sync requires that the service worker stays alive until the fetch is completed, and to conserve battery life and to prevent unwanted tasks happening in the background the browser will at some point terminate the task.

The Background Fetch API solves this problem. It creates a way for a web developer to tell the browser to perform some fetches in the background, for example when the user clicks a button to download a video file. The browser then performs the fetches in a user-visible way, displaying progress to the user and giving them a method to cancel the download. Once the download is complete the browser then opens the service worker, at which point your application can do something with the response if required.

The Background Fetch API will enable the fetch to happen if the user starts the process while offline. Once they are connected it will begin. If the user goes off line, the process pauses until the user is on again.

## Interfaces

- {{domxref("BackgroundFetchManager")}}
  - : A map where the keys are background fetch IDs and the values are {{domxref("BackgroundFetchRegistration")}} objects.
- {{domxref("BackgroundFetchRegistration")}}
  - : Represents a Background Fetch.
- {{domxref("BackgroundFetchRecord")}}
  - : Represents an individual fetch request and response.
- {{domxref("BackgroundFetchEvent")}}
  - : The event type passed to `onbackgroundfetchabort` and `onbackgroundfetchclick`.
- {{domxref("BackgroundFetchUpdateUIEvent")}}
  - : The event type passed to `onbackgroundfetchsuccess` and `onbackgroundfetchfail`.

## Examples

Before using Background Fetch, check for browser support.

```css
if (!('BackgroundFetchManager' in self)) {
  // Provide fallback downloading.
}
```

Using Background Fetch requires a registered service worker. Then call `backgroundFetch.fetch()` to perform a fetch. This
returns a promise that resolves with a {{domxref("BackgroundFetchRegistration")}}.

A background fetch may fetch a number of files. In our example the fetch requests an MP3 and a JPEG. This enables a package of files that the user sees as one item (for example a podcast and artwork) to be downloaded at once.

```js
navigator.serviceWorker.ready.then(async (swReg) => {
  const bgFetch = await swReg.backgroundFetch.fetch('my-fetch', ['/ep-5.mp3', 'ep-5-artwork.jpg'], {
    title: 'Episode 5: Interesting things.',
    icons: [{
      sizes: '300x300',
      src: '/ep-5-icon.png',
      type: 'image/png',
    }],
    downloadTotal: 60 * 1024 * 1024,
  });
});
```

You can find a demo application which implements Background Fetch [here](https://glitch.com/edit/#!/bgfetch-http203?path=public%2Fclient.js%3A191%3A45).

## Specifications

| Specification                                                |
| ------------------------------------------------------------ |
| [Background Fetch](https://wicg.github.io/background-fetch/) |

## Browser compatibility

{{Compat}}

## See also

- [Introducing Background Fetch](https://developers.google.com/web/updates/2018/12/background-fetch)
- [Background Fetch - HTTP 203](https://www.youtube.com/watch?v=cElAoxhQz6w)