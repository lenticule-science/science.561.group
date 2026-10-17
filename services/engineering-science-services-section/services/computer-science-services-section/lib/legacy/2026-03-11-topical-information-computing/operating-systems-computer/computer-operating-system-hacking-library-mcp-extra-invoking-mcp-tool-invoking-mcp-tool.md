---
name: invoking-mcp-tool
description: Receives an inbound MCP call, authenticates at the boundary, routes the call as a workitem.
category: sdk
inputs:
  - name: arg1
    type: mcp-server-record
  - name: arg2
    type: payload-record
output:
  type: mcp-tool-invocation-record
---
