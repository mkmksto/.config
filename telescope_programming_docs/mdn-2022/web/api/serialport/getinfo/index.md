---
title: SerialPort.getInfo()
slug: Web/API/SerialPort/getInfo
tags:
  - API
  - Method
  - Reference
  - getInfo()
  - SerialPort
browser-compat: api.SerialPort.getInfo
---
{{securecontext_header}}{{DefaultAPISidebar("Serial API")}}

The **`getInfo()`** method of the {{domxref("SerialPort")}} interface returns an object whose properties are the vendor ID and product ID of the device.

## Syntax

```js
var promise = SerialPort.getInfo();
```

### Parameters

None.

### Return value

An object containing the following values.

- `usbVendorId`
  - : If the port is part of a USB device, an unsigned short integer that identifies a USB device vendor, otherwise `undefined`.
- `usbProductId`
  - : If the port is part of a USB device, an unsigned short integer that identifies a USB device, otherwise `undefined`.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}
