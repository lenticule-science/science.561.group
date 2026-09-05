---
title: "Agentic AI in Industrial Control and Physical Infrastructure: A 2026 Survey"
description: "Survey of how AI agents interface with physical systems — manufacturing, SCADA, energy grids, agriculture, buildings, and homes — covering protocols, safety mechanisms, feedback loops, and the emerging MCP-OPC UA bridge."
text-type: survey
date-created: 2026-04-04
domain: computing
see-also:
  - "../../theories/artificial-intelligence/theories/agents/terms/agent.md"
sources:
  - title: "Kukapay OPC UA MCP Server"
    url: "https://github.com/kukapay/opcua-mcp"
    type: repository
  - title: "The Rise of A2A: Completing the Industrial AI Protocol Stack with OPC UA and MCP"
    url: "https://www.arcweb.com/blog/rise-a2a-completing-industrial-ai-protocol-stack-opc-ua-mcp"
    type: article
    year: 2025
  - title: "MCP over MQTT: Connect IoT Devices and AI, Empowering Agentic IoT"
    url: "https://www.iotforall.com/mcp-over-mqtt-iot-ai-explained"
    type: article
    year: 2025
  - title: "Agentic Artificial Intelligence for Smart Grids: A Comprehensive Review"
    url: "https://www.mdpi.com/1996-1073/19/3/617"
    type: paper
    year: 2025
  - title: "AI-Driven Digital Twins for Manufacturing: A Review"
    url: "https://www.mdpi.com/1424-8220/26/1/124"
    type: paper
    year: 2025
  - title: "AI-powered automated hydroponic system for smart agriculture"
    url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC12423342/"
    type: paper
    year: 2025
  - title: "Human-in-the-Loop Is Non-Negotiable: Leading AI Adoption in Safety-Critical Systems"
    url: "https://itrevolution.com/articles/human-in-the-loop-is-non-negotiable-leading-ai-adoption-in-safety-critical-systems/"
    type: article
    year: 2025
  - title: "Generative and Predictive AI for digital twin systems in manufacturing"
    url: "https://www.frontiersin.org/journals/artificial-intelligence/articles/10.3389/frai.2025.1655470/full"
    type: paper
    year: 2025
  - title: "Home Assistant: Building the AI-powered local smart home"
    url: "https://www.home-assistant.io/blog/2025/09/11/ai-in-home-assistant/"
    type: article
    year: 2025
  - title: "OPC UA in artificial intelligence: a systematic review"
    url: "https://mfr.edp-open.org/articles/mfreview/pdf/2025/01/mfreview250003.pdf"
    type: paper
    year: 2025
  - title: "Siemens Industrial Copilot"
    url: "https://www.siemens.com/global/en/products/automation/topic-areas/industrial-ai/industrial-copilot.html"
    type: product
    year: 2025
  - title: "UiPath Agentic Automation Platform"
    url: "https://www.uipath.com/platform/agentic-automation"
    type: product
    year: 2025
  - title: "Samsung AI-Driven Factories Strategy"
    url: "https://news.samsung.com/global/samsung-electronics-announces-strategy-to-transition-global-manufacturing-into-ai-driven-factories-by-2030"
    type: article
    year: 2026
  - title: "Gartner Manufacturing Predicts 2026: Digital Twins, AI Agents, and Autonomous Operations"
    url: "https://www.gartner.com/en/webinar/797437/1795012"
    type: report
    year: 2026
  - title: "Hitachi HMAX Industry Launch"
    url: "https://www.hitachi.com/New/cnews/month/2025/12/251222a.html"
    type: article
    year: 2025
  - title: "XMPRO: Complete Guide to Agentic AI in Industrial Operations"
    url: "https://xmpro.com/the-complete-guide-to-agentic-ai-in-industrial-operations-how-ai-agents-are-transforming-manufacturing-mining-and-asset-intensive-industries-in-2025/"
    type: article
    year: 2025
  - title: "EMQ: Bridging OPC-UA Data to MQTT for IIoT"
    url: "https://www.emqx.com/en/blog/bridging-opc-ua-data-to-mqtt-for-iiot"
    type: article
    year: 2025
  - title: "GridMind: Powering the Control Room of the Future with AI Agents"
    url: "https://www.anl.gov/article/gridmind-powering-the-control-room-of-the-future-with-ai-agents/"
    type: article
    year: 2025
  - title: "Honeywell AI-Powered Building Management Solution"
    url: "https://www.honeywell.com/us/en/press/2025/06/honeywell-unveils-ai-powered-building-management-solution/"
    type: article
    year: 2025
  - title: "Integrating AI in Safety-Critical Systems: ISO/IEC TS 22440"
    url: "https://www.automate.org/news/integrating-ai-in-safety-critical-systems-why-iso-iec-ts-22440-changes-the-game"
    type: article
    year: 2024
  - title: "Automation Anywhere Agentic Process Automation"
    url: "https://www.automationanywhere.com/rpa/agentic-process-automation"
    type: product
    year: 2025
  - title: "Digital Twin AI: From Large Language Models to World Models"
    url: "https://arxiv.org/html/2601.01321"
    type: paper
    year: 2026
---

AI agents are moving from software environments into the physical world.
As of early 2026, agentic systems — AI that autonomously perceives, decides, and acts — are interfacing with manufacturing lines, power grids, building systems, farms, and homes.
This survey maps what exists, how it works, and what safety mechanisms constrain it.

The motivation is practical: understanding the current state of AI-to-physical-system integration informs how any system intending to control physical infrastructure (printers, hydroponics, servers, networks) should be designed.

## The Protocol Stack: How AI Reaches Physical Systems

The fundamental architectural question is: how does an AI agent's decision become a physical action?
Three protocol layers have emerged as the dominant pattern.

### OPC UA: The Industrial Data Layer

OPC UA (Open Platform Communications Unified Architecture) is the established standard for machine-to-machine communication in industrial automation.
It provides typed, semantic data access to operational technology (OT) assets — PLCs, sensors, actuators, SCADA systems.
The OPC Foundation now has a dedicated working group on AI integration, exploring how to present OPC UA data in formats that AI models can consume directly.

OPC UA matters because it already connects millions of industrial devices.
Any AI system that wants to interact with factory equipment will almost certainly pass through OPC UA at some point.

### MQTT: The IoT Messaging Layer

MQTT is a lightweight publish-subscribe messaging protocol designed for constrained devices and low-bandwidth networks.
It dominates IoT deployments — smart homes, environmental sensors, small-scale automation.
Devices publish sensor readings to topics; controllers subscribe and issue commands.
QoS levels (0, 1, 2) provide delivery guarantees appropriate to criticality: QoS 2 for safety-critical alarms, QoS 0 for routine telemetry.

**Sparkplug B** is the MQTT payload standard for industrial use.
Where raw MQTT leaves payload format to the implementer, Sparkplug B defines typed, self-describing messages with birth/death certificates for devices, metric definitions, and state management.
The OPC UA + Sparkplug B combination — OPC UA for semantic data modeling, Sparkplug B/MQTT for lightweight distribution — is now the consensus industrial IoT data pipeline.

MQTT is the lingua franca of smaller-scale physical systems: hydroponic controllers, building sensors, home automation hubs.
At industrial scale, it carries Sparkplug B payloads.

### MCP: The Agent Interface Layer

The Model Context Protocol (MCP) standardizes how AI models interact with external tools and data sources.
Two developments in 2025-2026 have made MCP the bridge between AI agents and physical systems:

**OPC UA MCP Server** (Kukapay, open-source).
A Python application that connects to any OPC UA server on one side and presents itself as an MCP server on the other.
An MCP-compatible AI agent (running in Claude Desktop, for example) can discover tools that directly read from and write to industrial hardware.
The agent can browse OPC UA node hierarchies, read real-time sensor values, and write setpoints to actuators — all through natural language interaction mediated by MCP tool calls.

**MCP over MQTT** (EMQ, 2025).
Running MCP's tool-call protocol over MQTT transport allows low-power, intermittently connected IoT devices to participate in agentic workflows.
EMQ's MQTTX client already supports natural language interfaces where users issue commands to IoT devices through AI agents, with MQTT carrying the actual device communication.

The resulting three-layer stack is:

1. **OPC UA / MQTT** — secure, semantic access to physical devices
2. **MCP** — standardized agent-tool interface
3. **LLM agent** — reasoning, planning, tool selection

This stack means an AI agent can, today, read a temperature sensor on a factory floor via OPC UA, reason about whether the reading requires action, and write a new setpoint to a cooling system — all through the same tool-calling interface it uses to search the web or read files.

## Domain Survey

### Manufacturing and Industrial Control

**Siemens Industrial Copilot** (Siemens + Microsoft, 2025).
The most prominent production system.
Generates structured control language (SCL) code for programmable logic controllers (PLCs), integrates within the TIA Portal engineering environment, and generates machine visualizations.
As of 2025, thyssenkrupp is rolling it out globally across development and manufacturing.
Siemens plans to add multimodal capabilities (image analysis of equipment) and agent-based automation where the copilot autonomously manages complex tasks.

**Samsung AI-Driven Factories** (announced MWC 2026).
Samsung is transitioning all manufacturing to AI-driven operations by 2030, deploying specialized AI agents for quality control, production, and logistics, with digital twin-based simulations throughout.
This is a commitment to agent-per-function architecture: distinct agents for distinct physical concerns, coordinated through a shared digital twin.

**Hitachi HMAX Industry** (launched December 2025).
An AI agent platform for equipment maintenance that combines generative AI with Hitachi's operational technology expertise.
Targets predictive maintenance — detecting equipment degradation before failure — with agents that can autonomously generate and submit work orders.

**XMPRO** provides multi-agent systems for asset-intensive industries (mining, manufacturing, oil and gas).
Their architecture deploys specialized agents per function — one for anomaly detection, one for root cause analysis, one for work order generation — coordinated through a shared event bus.
Reported results: 250%+ ROI within 24 months for predictive maintenance deployments, 43% reduction in unplanned downtime.

**Gartner's projection**: by 2030, semi-autonomous AI agents will orchestrate 10% of key production operations, quality, and maintenance use cases — up from 2% in 2025.
Humans retain final approval.
Gartner also predicts 40% of agentic AI projects will be cancelled by 2027 due to unclear value and inadequate risk controls — a useful corrective to vendor optimism.

**The three-layer architecture** that has consolidated across industrial deployments separates concerns by latency: 1. **PLC/Safety layer** (microseconds) — deterministic control, IEC 61508 certified, AI never runs here 2. **Edge AI layer** (1-10ms) — ML inference on factory-floor gateways, continues operating when cloud is offline, handles time-critical decisions 3. **Cloud/planning layer** (seconds to hours) — LLM reasoning, multi-agent orchestration, strategic optimization

This separation is load-bearing: it means the AI can be wrong or slow or offline without the physical system becoming unsafe.

**Physical systems controlled**: PLCs, robotic arms, conveyor systems, CNC machines, quality inspection cameras, compressors, pumps. **Interfaces**: OPC UA for device communication, MQTT/Sparkplug B for data distribution, TIA Portal APIs for engineering tools, proprietary SCADA integrations. **Feedback loop**: sensor readings → edge inference (fast) → PLC setpoint adjustment → sensor readings, with parallel cloud path: sensor readings → digital twin update → LLM reasoning → optimization recommendations → edge layer → PLC.

### SCADA and Critical Infrastructure

SCADA (Supervisory Control and Data Acquisition) systems manage water treatment, power generation, oil and gas pipelines, and other critical infrastructure.
AI integration here is primarily defensive and analytical, not yet autonomous.

**Anomaly detection** dominates.
Deep learning architectures — autoencoders, hybrid ResNet-LSTM models, Deep Factorization Machines — analyze SCADA network traffic to detect intrusions and anomalous behavior.
The Sherlock dataset (2025) provides a benchmark specifically for process-aware intrusion detection in power grid networks.

**SPARK & SAD** (2026) are new deep learning intrusion detection systems designed specifically for SCADA networks in solar power plants, where SCADA oversees energy generation, monitors panel performance, optimizes output, and identifies faults.

AI is not autonomously controlling SCADA systems in production.
The safety requirements are too extreme and the regulatory environment too strict.
Instead, AI augments human operators: flagging anomalies, predicting equipment failures, optimizing schedules.
The human remains in the control loop for all actuation decisions.

**Physical systems monitored**: water treatment plants, power substations, oil pipelines, solar farms. **Interfaces**: SCADA-specific protocols (Modbus, DNP3), OPC UA bridges, proprietary historian databases. **Safety**: AI recommendations only — no autonomous actuation.
Intrusion detection runs alongside, not instead of, existing safety systems.

### Digital Twins

Digital twins have evolved from passive 3D visualizations to potential, AI-driven simulation environments.
The 2025-2026 shift is from descriptive twins (what happened) to prescriptive twins (what to do) to autonomous twins (doing it).

A digital twin receives real-time sensor data from physical equipment, maintains a synchronized virtual model, and provides a sandbox where AI agents can simulate actions before executing them on real hardware.
This is the strongest safety mechanism in industrial AI: the agent acts on the twin first, observes consequences in simulation, and only if outcomes are acceptable does the action propagate to physical systems.

**Gartner predicts** closed-loop digital twins — where the twin autonomously adjusts physical systems based on simulation results — will become standard in manufacturing by 2030.

**Physical systems modeled**: entire production lines, individual machines, building HVAC systems, power grid segments. **Interfaces**: real-time sensor feeds (OPC UA, MQTT), CAD/BIM models, physics simulation engines. **Safety mechanism**: simulation-before-execution.
The twin absorbs the risk of experimentation. **Learning**: AI models trained on twin data can explore operating conditions that would be dangerous or expensive to test on real equipment.

### Energy Grid Management

The energy grid is one of the most potential domains for agentic AI, driven by the complexity of balancing intermittent renewable sources with variable demand.

**Market size**: the agentic AI in energy market was $480 million in 2024, projected to reach $10.7 billion by 2034 (36.4% CAGR).

**Microsoft** launched an AI-powered energy optimization suite with multi-agent systems for grid balancing (December 2025). **IBM** introduced an agentic AI analytics engine for real-time energy demand forecasting (February 2026).

**GridMind** (Argonne National Laboratory).
A multi-agent system designed for power grid control rooms.
Multiple LLM-based agents coordinate across SCADA data, weather forecasting, and failure analysis, providing human operators with synthesized situational awareness and recommended actions.
This is one of the most technically sophisticated deployments of LLM agents in physical infrastructure — a national lab tackling a real operational problem with agentic architecture.

Core applications: - **Demand response**: AI agents incentivize consumers to shift electricity use to off-peak hours through automated pricing adjustments.
Real-time demand response improved up to 30% through dynamic load balancing and storage dispatch. - **Microgrid orchestration**: multi-agent systems coordinate wind, solar, battery storage, and grid tie-ins.
Each energy resource gets its own agent; a coordinator agent manages the portfolio. - **Self-healing grids**: agents detect outages, reroute power, and dispatch repair resources autonomously. - **EV charging optimization**: AI agents balance vehicle charging loads against grid capacity, using blockchain for transaction integrity.

**Physical systems controlled**: inverters, battery management systems, grid switches, EV chargers, demand response relays. **Interfaces**: SCADA for grid equipment, smart meter APIs, weather data feeds, market price APIs. **Safety**: grid operations are subject to NERC CIP standards.
AI systems operate within pre-defined operating envelopes — voltage limits, frequency bounds, thermal ratings.
Agents cannot exceed these bounds regardless of optimization objectives.

### Building Automation

Smart buildings integrate HVAC, lighting, access control, fire safety, and energy management.
AI agents are entering this space through existing Building Management Systems (BMS).
The market is substantial — $96 billion — and AI-driven optimization delivers 35% energy savings in documented deployments.

**Honeywell Connected Solutions** (June 2025) is an AI-powered building management platform that uses reinforcement learning agents to optimize HVAC operation.
The agents learn building thermal dynamics from historical data and weather forecasts, then adjust setpoints to minimize energy use while maintaining occupant comfort.
This is one of the few production systems where RL agents directly control physical equipment through a BMS API.

MQTT is the dominant protocol for building IoT sensors.
Commands flow to actuators (dampers, valves, lighting controllers) through BACnet, Modbus, or MQTT.
AI agents sit above the BMS, consuming sensor data and issuing high-level setpoint changes rather than direct actuator commands.

Critical alarms (fire, gas leak, intrusion) are prioritized via MQTT QoS 2 and processed through deterministic safety systems that AI cannot override.
Non-critical optimizations (energy use, comfort) use QoS 1 and are subject to AI control.

**Physical systems controlled**: HVAC dampers and chillers, lighting circuits, blind motors, door locks. **Interfaces**: BACnet, Modbus, MQTT, proprietary BMS APIs. **Safety**: fire and life safety systems remain fully deterministic — no AI in the loop.
AI controls comfort and efficiency only.

### Agriculture and Hydroponics

Precision agriculture deploys AI at two scales: field-level (drones, tractors, irrigation) and controlled-environment (greenhouses, hydroponics).

**Field-scale**: The agricultural drone market reached $5.4 billion in 2025 (projected $12 billion by 2030).
AI-powered drones autonomously survey fields, with machine learning models analyzing imagery for pest detection, nutrient deficiency, and irrigation needs.
Q-learning agents reduce water usage 18-34% through UAV-mediated precision irrigation.
Deep Q-Networks optimize fertilizer schedules, achieving 22% yield improvements at 31% input reduction.

**Controlled-environment**: Hydroponic systems are a particularly clean example of the sensor-AI-actuator loop.
Modern systems instrument reservoirs with pH, electrical conductivity (EC), dissolved oxygen (DO), and temperature sensors.
Data transmits via MQTT to a broker (EMQX is common), processed by a backend, stored in a database, and presented through a web dashboard.
AI analyzes correlations between environmental parameters and growth outcomes, predicts nutrient deficiencies, and automatically adjusts dosing pumps and LED lighting spectra.

The hydroponic case is notable because the system is physically contained, the variables are measurable, the feedback loops are fast (hours to days), and the consequences of AI error are economic (lost crop) rather than safety-critical (no human harm).
This makes hydroponics a natural proving ground for autonomous physical control.

**Physical systems controlled**: irrigation valves, dosing pumps, LED grow lights, ventilation fans, drone flight systems. **Interfaces**: MQTT for sensor data and actuator commands, REST APIs for drone fleet management, 5G for real-time field communication. **Feedback loop**: sensor → MQTT broker → AI model → actuator command → MQTT → actuator → sensor (typical cycle: minutes for hydroponics, hours for field crops).

### Home Automation

Home automation is where agentic AI has the broadest installed base and the most direct user interaction.

**Home Assistant** (600,000+ active installations in 2026) is the dominant open-source platform.
Its 2025 AI integration includes: - **Assist**: natural language voice control with conversation memory.
Local processing via Whisper (speech-to-text runs on user hardware, voice commands never leave the house).
Supports both cloud LLMs (OpenAI, Anthropic) and local models (Ollama). - **AI Tasks**: integration that generates data using AI — attach cameras, ask what's happening, get structured output. - **Automation suggestions**: AI proposes automations based on observed behavior patterns.

The Home Assistant architecture is significant: MQTT subscriptions provide instant state-change notifications to AI agents (no polling), enabling latency-sensitive automations for security, presence detection, and environmental control.

**Josh.ai** provides a commercial alternative focused on luxury homes, with a dedicated AI control system that integrates with major home automation platforms.

**Physical systems controlled**: lights, thermostats, locks, blinds, garage doors, irrigation, security cameras. **Interfaces**: MQTT, Zigbee, Z-Wave, Wi-Fi, Bluetooth, proprietary APIs (Hue, Nest, etc.) — Home Assistant integrates 2000+ device types. **Safety**: home systems are low-risk (worst case: lights on at 3am, thermostat too cold).
No life-safety integration — fire alarms, CO detectors remain independent. **Learning**: behavioral pattern recognition suggests automations; users approve before activation.

### Robotic Process Automation (RPA) → Agentic Automation

RPA — software robots that automate repetitive digital tasks — is undergoing a fundamental shift toward agentic AI.

**UiPath** (Gartner Magic Quadrant leader, 2025) launched its agentic automation platform, combining AI agents, traditional software robots, and human workers. **UiPath Maestro** is a new orchestration layer that models, operates, and optimizes complex processes end-to-end with embedded process intelligence and real-time KPI monitoring.

The shift from RPA to agentic automation means: traditional RPA follows rigid scripts (click here, type this, copy that); agentic RPA agents reason about goals, handle exceptions, and make judgment calls.
UiPath's 2025.10 release includes unified development for both robot scripts and AI agent logic.

This matters for physical infrastructure because RPA agents increasingly interface with operational systems — submitting work orders, adjusting schedules, managing inventory — that have downstream physical effects.
The boundary between "digital automation" and "physical control" blurs when an agent that processes a purchase order also triggers a warehouse robot to fulfill it.

**Systems controlled**: enterprise software (ERP, CRM, email), with downstream effects on physical logistics. **Interfaces**: screen scraping, API integration, database queries, message queues. **Safety**: Maestro provides centralized oversight for AI agent orchestration across systems and teams.

## Safety Mechanisms: A Cross-Domain Analysis

The single most important question in AI-controlled physical systems is: what prevents the AI from causing physical harm?

### The HITL/HOTL Spectrum

Industrial AI operates on a spectrum from **Human-in-the-Loop** (HITL) to **Human-on-the-Loop** (HOTL):

- **HITL**: the AI recommends; the human approves every action before execution.
  Current default for SCADA, critical infrastructure, and any system where failure harms people.
- **HOTL**: the AI acts autonomously; the human monitors and can override.
  Used for building HVAC optimization, agricultural irrigation, home automation — domains where failure is annoying or expensive but not dangerous.
- **Full autonomy**: the AI acts without human oversight.
  Only in contained, low-risk systems (hydroponic nutrient dosing within safe pH bounds, home lighting schedules).

The EU AI Act (Article 14) mandates that high-risk AI systems be designed for effective human oversight.
This is not optional for any system deployed in Europe.

### Functional Safety Standards

Industrial safety is governed by established standards that predate AI: - **IEC 61508** defines Safety Integrity Levels (SIL 1-4) for electrical/electronic safety-related systems.
SIL-rated components guarantee a maximum probability of dangerous failure per hour.
AI systems do not currently achieve SIL certification — they operate alongside SIL-rated safety systems, never replacing them. - **IEC 62061** applies IEC 61508 specifically to machinery safety. - **ISO 13849** covers safety of control systems for machinery using a Performance Level (PL) rating.

The implication: any AI agent controlling physical equipment must treat the SIL-rated safety layer as inviolable.
The AI optimizes within the envelope that the safety system defines.

### Operating Envelopes

The most robust safety pattern across domains is the **operating envelope**: the AI can do whatever it wants within predefined physical bounds, and hard limits prevent it from exceeding those bounds regardless of what the AI decides.

Examples: - Grid agents cannot command voltage or frequency outside regulatory limits - HVAC agents cannot set temperatures outside building code bounds - Hydroponic agents cannot dose nutrients outside safe pH/EC ranges - Manufacturing agents cannot exceed machine-rated speeds or pressures

The envelope is enforced at the actuator level, not the AI level.
The PLC, the relay, the valve controller — the dumb hardware — enforces the limit.
The AI can request anything; the physical system clips the request to safe bounds.

### Simulation-Before-Execution

Digital twins provide a safety mechanism where the AI tests actions in simulation before applying them to real equipment.
If the simulated outcome is outside acceptable parameters, the action is blocked.
This converts a safety problem (will this action harm the system?) into an engineering problem (is the simulation accurate enough?).

### Layered Defense

No single mechanism is sufficient.
Production systems stack: 1. **Input validation** — reject malformed or out-of-range commands 2. **Operating envelope** — hard physical limits at the actuator 3. **Simulation check** — test in digital twin first 4. **HITL/HOTL oversight** — human approval or monitoring 5. **Anomaly detection** — ML models watching for unexpected behavior 6. **Independent safety systems** — fire, emergency stop, pressure relief — that operate completely independently of the AI

The Korean vegetable processing plant incident (2023) — where an AI-driven robotic arm fatally injured a worker after misidentifying him as a box — demonstrates why layered defense is necessary.
No single layer would have caught the failure; the combination of better perception, physical barriers, and independent safety interlocks addresses the risk.

### Emerging Safety Standards for AI

Classical safety standards (IEC 61508) assume deterministic systems — the same input always produces the same output.
AI violates this assumption.
New standards are emerging:

- **ISO/IEC TS 22440** (2024) — the first AI-specific safety standard.
  Introduces requirements for learning phase constraints (when can the AI update its models?), continuous drift monitoring (is the AI's behavior changing?), explainability (can operators understand why the AI made a decision?), and human-in-the-loop governance.
- **EU Machinery Regulation** (effective 2027) — updates machinery safety requirements to address AI-driven control systems explicitly.

### Documented Failure Modes

Production deployments have revealed recurring failure patterns: - **Data distribution shift**: AI trained on spring/fall data fails during heatwaves or cold snaps because operating conditions exceed training distribution - **Integration brittleness**: BMS API changes, firmware updates, or protocol version mismatches break the AI's connection to physical systems - **Sensor spoofing**: compromised sensors feed false data to AI, causing inappropriate actuator commands - **Emergent multi-agent conflicts**: multiple agents optimizing independently create system-level problems (e.g., simultaneous battery charging across a microgrid strains the grid tie-in) - **RPA brittleness**: UI changes break software robot scripts; industry reports 30-50% RPA project failure rates from integration fragility

## Patterns and Gaps

### What Works Now

- **AI advising human operators** in manufacturing, SCADA, and grid management
- **AI autonomously controlling low-risk systems** — HVAC comfort, lighting, irrigation, hydroponic nutrient dosing
- **AI detecting anomalies** in SCADA networks, equipment telemetry, and quality inspection
- **MCP as an agent-to-physical-system bridge** via OPC UA and MQTT
- **Digital twins as safety sandboxes** for testing AI decisions before physical execution

### What Does Not Yet Exist

- **LLM agents with direct, unsupervised control of safety-critical systems**.
  No one is running GPT-4 or Claude with direct write access to a nuclear plant's control rods.
  The reasoning capabilities are not trusted enough, and the failure modes are not well enough understood.
- **Mature safety certification for AI agents in physical control**.
  ISO/IEC TS 22440 (2024) is a first step and the EU Machinery Regulation (2027) will add requirements, but specific certification processes for agentic LLM systems controlling physical infrastructure are still forming.
- **Cross-domain agent coordination for physical systems**.
  An AI agent that manages building HVAC, solar panels, EV charging, and grid interaction as a unified system — rather than isolated agents per domain — is a research topic, not a product.
- **Learning from physical consequences at scale**.
  Reinforcement learning works in simulation (digital twins) and contained environments (hydroponics).
  Learning from real-world consequences in complex, safety-critical environments remains an open problem.

### The Emerging Architecture

Across all domains surveyed, a common architecture is consolidating:

```
Sensors → Protocol (OPC UA / MQTT / BACnet)
  → Data layer (historian / broker / database)
    → AI reasoning layer (LLM agent with MCP tools)
      → Command layer (validated, bounded commands)
        → Protocol (OPC UA / MQTT / BACnet)
          → Actuators
```

With parallel, independent:
```
Sensors → Safety system (deterministic, not AI)
  → Emergency actuators (shutdown, relief, alarm)
```

The AI layer never bypasses the safety system.
The safety system never depends on the AI layer.
They share sensors but have independent actuation paths.

## Implications for the 561 System

The 561 system's physical infrastructure integration objective targets printers, hydroponic equipment, servers, and communication networks.
Based on this survey:

1. **MQTT is the right starting protocol** for the systems targeted.
  Hydroponic controllers, 3D printers (via OctoPrint/Klipper), and network equipment all support or can be bridged to MQTT.
  OPC UA is overkill for this scale.

2. **MCP is the right agent interface**.
  The system already uses MCP for its datastore.
  Extending MCP tools to cover MQTT-connected physical devices follows the established pattern — the agent uses the same tool-calling interface for files, knowledge graphs, and physical actuators.

3. **Hydroponics is the right first target**.
  It has fast feedback loops, measurable outcomes, contained failure modes, and no safety-critical human exposure.
  The sensor-AI-actuator pattern is clean and well-documented.

4. **Operating envelopes must be designed before agent access**.
  Before any AI agent gets write access to a physical system, hard limits on what it can command must be enforced at the device level.
  The AI can request pH adjustment; the dosing pump controller clips the request to safe bounds.
  This is non-negotiable.

5. **The safety system is independent**.
  If the AI crashes, the physical system must fail safe.
  Pumps stop, lights go to a known state, printers pause.
  The AI is an optimization layer on top of a system that works (conservatively) without it.

6. **Start HITL, earn HOTL**.
  Every new physical integration starts with the AI recommending and a human approving.
  Autonomous operation is earned by demonstrated reliability over time, never assumed.
