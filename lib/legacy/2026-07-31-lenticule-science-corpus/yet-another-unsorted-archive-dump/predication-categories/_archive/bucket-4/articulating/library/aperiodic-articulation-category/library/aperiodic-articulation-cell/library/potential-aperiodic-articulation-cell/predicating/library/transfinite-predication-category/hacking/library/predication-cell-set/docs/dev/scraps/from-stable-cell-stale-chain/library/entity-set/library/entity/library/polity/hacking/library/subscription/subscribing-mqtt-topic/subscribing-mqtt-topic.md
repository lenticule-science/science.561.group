---
name: subscribing-mqtt-topic
description: Subscribes to an MQTT topic; each message lands as a reading cell on the named sensor.
category: industrial-control
inputs:
  - name: arg1
    type: mqtt-driver-record
  - name: arg2
    type: sensor-record
output:
  type: cell-record
---
