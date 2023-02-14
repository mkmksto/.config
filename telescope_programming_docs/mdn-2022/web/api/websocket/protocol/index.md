---
title: WebSocket.protocol
slug: Web/API/WebSocket/protocol
tags:
  - API
  - Property
  - Reference
  - Web API
  - WebSocket
browser-compat: api.WebSocket.protocol
---
{{APIRef("Web Sockets API")}}

The **`WebSocket.protocol`** read-only property returns the
name of the sub-protocol the server selected; this will be one of the strings specified
in the `protocols` parameter when creating the {{domxref("WebSocket")}}
object, or the empty string if no connection is established.

## Syntax

```js
const protocol = aWebSocket.protocol;
```

## Value

A [`DOMString`](/en-US/docs/Web/API/DOMString).

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}