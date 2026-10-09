---
type: reference
class: engineering-system
status: cited
authors: [OpenAI]
year: 2024
title: "OpenAI Assistants API and Function Calling Documentation"
venue: "OpenAI Platform Documentation"
description: OpenAI.
---

## Source

OpenAI. *Assistants API*, *Function Calling*, and *Tool Use* documentation.
OpenAI Platform Documentation, 2023–2024. <https://platform.openai.com/docs/assistants/> and <https://platform.openai.com/docs/guides/function-calling>.

## Form

Vendor documentation.
The mature operational specification of OpenAI's agent and tool-use surface, treated here as an engineering-system reference for the de facto standard the LLM-agent industry coalesced around in 2023–2024.

## Content summary

Specifies OpenAI's agent surface across two layers.
The *function-calling* layer: a chat-completion request can declare a list of *tools* (named functions with JSON-schema-typed parameters); the model may emit *tool-call* objects in its response naming a tool and arguments; the application executes the tool and returns the result as a *tool message*; the conversation continues with the tool result in context.
The *Assistants API* layer wraps function-calling with persistent state: an *Assistant* has a stable identity and a tool-and-instruction profile; *Threads* carry the conversation history and any uploaded files; *Runs* execute the Assistant against a Thread, producing a sequence of *Run Steps* (model thinking, tool invocations, tool results); *Vector Stores* attached to an Assistant enable retrieval-augmented generation.
The Code Interpreter, File Search, and custom-function tools are built-in.
The Realtime API and the Agents SDK extend the surface to streaming and multi-step orchestration.
