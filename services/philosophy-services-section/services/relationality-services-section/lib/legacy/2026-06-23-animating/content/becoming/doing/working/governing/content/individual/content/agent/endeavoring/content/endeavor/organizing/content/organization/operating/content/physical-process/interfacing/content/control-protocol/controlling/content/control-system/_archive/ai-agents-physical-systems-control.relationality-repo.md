---
title: "AI Agents and Agentic Systems for Physical World Control"
description: "Survey of how AI agents interface with and control physical systems across building automation, agriculture, smart homes, energy grids, and industrial processes — including architectures, protocols, safety mechanisms, and deployment patterns"
date-created: 2026-04-04
relations:
  - domain: applied-sciences
  - concerns: [automation, control-systems, safety]
  - references: [building-automation, precision-agriculture, smart-homes, energy-grid-management, robotic-process-automation, industrial-automation]
---

## Overview

Agentic AI systems — autonomous software agents capable of perceiving environments, making decisions, and executing actions toward defined goals with minimal supervision — are increasingly deployed to control physical systems across critical infrastructure and consumer domains.
Unlike traditional automation (rule-based RPA, hard-coded scripts), agentic systems reason about uncertain environments, adapt to changing conditions, and can coordinate multi-step actions across multiple subsystems.
This marks a fundamental shift from scripted control to autonomous reasoning-based control in domains ranging from HVAC systems to power grids.

As of 2025, agentic AI adoption spans five primary domains: building automation (35% energy cost reduction), precision agriculture (20-30% yield increases), smart homes (57% US household penetration by 2026), energy grid management ($656M market in 2025, projected to reach $14.9B by 2035), and robotic process automation ($3.8B market in 2024, growing 18% annually).
Each domain exhibits distinct architectures, safety requirements, and failure modes.

## Building Automation and HVAC Control

### Architectures and Interfaces

Building automation systems employ a **hierarchical control architecture** where AI agents run on either edge devices (building-local controllers) or cloud platforms, communicating with Building Management Systems (BMS) via standardized protocols.

The control loop operates on 5-15 minute intervals: sensor data is read from BMS (temperature, humidity, occupancy, IT load); reinforcement learning (RL) policies compute optimal control actions; and new setpoints are sent back to HVAC equipment via the BMS interface.
For data centers, the typical architecture is:

**Edge Computing Model**: RL policy runs on local industrial PC or edge computing device within the data center, enabling real-time response without latency from cloud communication.
This approach is critical for systems with high thermal mass and rapid failure modes.

**Cloud-Connected Model**: Data flows to cloud platforms where AI agents analyze historical patterns, seasonal trends, and weather data to provide predictive setpoints that are pushed to building controllers.

### Control Mechanisms

Honeywell's **Connected Solutions** platform (launched June 2025) integrates building systems into a single interface through an AI-enabled installation process completed in hours.
The system provides:

- Predictive maintenance through sensor monitoring
- Energy optimization based on occupancy patterns and external weather
- Digital twin modeling using semantic ontologies that automatically merge real-world sensor data with building structure models
- Remote diagnostics and autonomous health checking

Early adopters (Verizon, Vanderbilt University) use the platform to detect critical issues before escalation.
A central claim: by processing control strategies at the edge, real-time responses are possible without needing extensive historical data storage.

### Performance and Safety

**Energy Efficiency**: HVAC AI agents have demonstrated 35% energy cost reduction while improving occupant comfort and equipment longevity.
Bosch's edge-optimization approach emphasizes modular, layered architecture that scales across building types.

**Predictive Maintenance**: AI models detect early signs of mechanical failure through subtle shifts in temperature, vibration, or runtime behavior, reducing equipment outages by 70% and maintenance costs by 25-30%.

**Safety Constraints**: Building automation operates under constraint of occupant safety.
Systems must maintain temperature/humidity within acceptable ranges and fail safely (defaulting to safe setpoints) if AI decision-making becomes unreliable.
However, specific safety incident data for AI-controlled HVAC systems in 2024-2025 is limited in public literature.

## Precision Agriculture and Autonomous Farming

### Agentic AI in Crop Management

Agentic AI in agriculture fundamentally differs from traditional AI: it sets goals independently, adapts to environmental changes, and acts in complex real-world situations without following predefined scripts.
This capability enables managing fields at the level of individual plants rather than blanket field-wide applications.

**Performance Metrics** (2025 data): - 20-30% yield increases globally - 15-25% cost reductions in input use - 30-40% reduction in water and pesticide usage - 10-25% reduction in chemical usage depending on crop type

Over 7 leading AI agriculture robots are projected to automate tasks on >30% of global farms by 2025.

### IoT and Protocol Stack

**Sensor Integration**: Farms deploy networks of IoT sensors monitoring soil moisture, air temperature/humidity, light intensity, CO2 levels, and plant health indicators.
Data flows via:

- **MQTT Protocol**: Message Queuing Telemetry Transport dominates agricultural IoT for lightweight, publish-subscribe communication
- **CoAP, HTTP, Modbus**: Secondary protocols for legacy equipment integration
- **Microcontroller Stacks**: ESP8266 with DHT22 temperature/humidity sensors and capacitive soil moisture sensors, relaying data via MQTT to base stations

**Control Actuation**: Automated systems trigger: - Irrigation valve control based on soil moisture thresholds - Ventilation fan activation for greenhouse climate regulation - Fertilizer metering based on soil nutrient predictions - Pest control interventions (spraying or mechanical removal)

### Learning and Decision Making

Modern systems achieve 25% yield increase and 30% input cost reduction within two growing seasons through:

1. **Continuous environmental monitoring** producing dataset of sensor readings + outcomes
2. **ML model training** on historical patterns of weather, soil conditions, and successful interventions
3. **Autonomous decision-making** where agents select interventions (irrigation timing, fertilizer type/amount, pest response)
4. **Feedback loops** where each intervention outcome feeds back into model refinement

Farms report 50% water reduction from IoT-based irrigation without yield loss.

### Safety and Failure Modes

**Agricultural Drone Incidents**: Hardware failure is the primary failure mode — battery degradation, motor failures from collisions with other drones or obstacles.
Detection of motor failure requires ~100ms. Modern agricultural drones include collision avoidance systems, emergency stop buttons, and obstacle detection sensors.

**Documented Incidents**: A DJI Agras drone collided with a moving truck in 2024.
While agricultural drones are equipped with safety features, they lack the redundancy of manned aviation.
More broadly, drones have been linked to half of all near-midair collisions at 30 busiest US airports since 2014.

**Regulatory Gap**: Unlike aviation and industrial systems, autonomous agricultural systems lack comprehensive safety standards, though the rise of deployment will likely drive regulatory frameworks.

## Smart Home AI Agents and Learning

### Market and Adoption

- Global AI smart home market: $15.3B in 2024, projected to reach $104.1B by 2034 (21.3% CAGR)
- 57% of US households expected to have smart home devices by 2026
- Average smart home contains 15-20 connected devices

### LLM Integration and Control Interfaces

**Home Assistant (Open Source Reference)**: Home Assistant implemented a vision of local-first AI for smart home control in 2025.
The architecture includes:

1. **Local LLM Integration**: Agents run Ollama or similar local models for voice commands, avoiding cloud dependency
2. **Exposed APIs**: Home Assistant exposes an LLM API allowing agents to fetch device state and issue control commands via intents
3. **MQTT Integration**: Devices connect via MQTT discovery or manual YAML configuration; as of 2025.7 release, MQTT devices can be configured as sub-entries
4. **Natural Language Command Grounding**: The agent understands contextual connections between commands — adding multiple shopping items through conversational interaction, adjusting multiple lights based on scene names

**Multi-LLM Support**: Recommended models for 2026 include GLM-4.5-Air, Qwen3-30B-A3B-Instruct, and Meta-Llama-3.1-8B-Instruct.

### Learning and Personalization

Smart home agents achieve personalization through:

- **Voice recognition**: Different voices recognized and settings adjusted per user
- **Habit learning**: System learns user routines (e.g., lights on at 7am, temperature to 72°F) and automates without explicit command
- **Preference adaptation**: ML models predict next action based on time, weather, and occupancy patterns

Safety is maintained through constraint: agents can only issue commands to registered devices; new device types require explicit user permission.

## Energy Grid Management with Agentic AI

### GridMind: Multi-Agent Power System Analysis

Argonne National Laboratory's **GridMind** represents the most advanced public deployment of agentic AI for critical infrastructure.
It demonstrates how to integrate LLMs with deterministic engineering solvers while maintaining safety and correctness.

**Architecture**:

```
Operator Query → LLM Coordinator Agent
                 ├─ Schedule Agent (power dispatch optimization)
                 ├─ Weather Agent (forecast integration)
                 ├─ Failure Mode Agent (contingency analysis)
                 └─ Reliability Agent (equipment assessment)
                 ↓
            Deterministic Solvers
                 (power flow, optimal power flow, unit commitment)
                 ↓
            Pydantic Validation + Result Verification
                 ↓
            Explainable Strategy Recommendations
```

**Key Technical Details**:

- Each agent specializes in different grid analysis tasks (scheduling ensures power is produced/distributed safely, weather forecasts simulate hurricanes to identify equipment failure points)
- LLMs coordinate across agents and reason about results
- Hallucination mitigation through **structured function calls** preventing numerical fabrication
- Rigorous data validation using Pydantic schemas grounding all quantitative claims in solver outputs
- Comprehensive result verification before response generation
- All reported numerical results originate from validated computational tools

**Input Data Streams**: Agents ingest signals from SCADA, AMI (Advanced Metering Infrastructure), IoT sensors, weather systems, and asset management systems.

### Market and Renewable Integration

**Agentic AI in Energy Market** (2025 data): - Market size: $656.6M (2025) → $14.9B (2035), CAGR 36.65% - North America: 35.6% market share - Transmission/distribution grid optimization: 27.8% market segment - Edge AI controllers and real-time control agents: fastest-growing segment

**Renewable Integration**: 4,600 GW new renewable capacity projected 2025-2030 (double previous 5 years).
Agentic AI enables:

- Real-time load balancing as renewable supply fluctuates
- 25% improvement in renewable integration efficiency
- 30% reduction in energy costs for organizations aligning AI with sustainability

The integration of volatile renewable inputs drives growth in goal-oriented orchestration and autonomous decision-making.

## Robotic Process Automation Evolving Toward Agentic Systems

### RPA Foundation and Limitations

RPA remains the dominant enterprise automation technology ($3.8B market in 2024, 18% YoY growth, projected $8.2B by 2028).
However, RPA operates under strict constraints:

- **Rule-based execution**: Follows predefined sequences without reasoning
- **Brittleness**: Small UI changes or process variations break automation
- **No learning**: Bots execute same algorithm repeatedly without adaptation
- **High failure rate**: 30-50% of RPA projects fail; >50% fail to grow beyond 10 bots; >70% plateau at <50 bots

**Failure modes**: - Process selection error (automation attempted on non-robotic processes) - Environmental dynamism exceeding bot assumptions - Governance failure (insufficient maintenance after deployment) - Most RPA failures stem from human error in design/maintenance, not technology failure

### Agentic AI as RPA Evolution

Rather than replacement, consensus has shifted toward **complementary integration**:

1. **Agentic AI determines strategy**: Given incoming request, AI agent reasons about whether it needs RPA for data processing, API calls for system integration, or human handoff for complex decisions
2. **RPA executes deterministic tasks**: Handles structured, rule-based work reliably
3. **Hybrid capability**: Agents provide cognitive reasoning; RPA provides robust execution of well-defined steps

**Technical Integration**:

- **REST APIs**: Both RPA bots and agents communicate with enterprise systems via REST/HTTP APIs
- **A360 Bot Deploy API**: Automation Anywhere's REST interface allows external agents to deploy and manage bots
- **Security**: APIs operate at backend level with stronger access control and encryption than UI-based RPA
- **Governance**: Hybrid approach requires clearer separation of concerns — agents handle reasoning/planning; bots handle execution with minimal variation

### Enterprise Adoption Pattern

AI agents evaluate requests and route them: - **To RPA**: Deterministic, high-volume, structured tasks (data extraction, form filling, system navigation) - **To APIs**: System-level integration requiring strong security/auditability - **To humans**: Complex judgment, novel situations, ethical decisions

## Protocols and Integration Standards

### OPC UA as Industrial AI Standard

The OPC Foundation launched a new working group "OPC UA for AI" in April 2024, marking convergence of manufacturing AI and standardized industrial protocols.

**OPC UA (OLE for Process Control Unified Architecture)** enables:

- **Semantic data modeling**: Systems understand data context automatically without manual intervention
- **Machine-to-machine communication**: Seamless information sharing from sensors to cloud with full context
- **AI-ready data**: Rich, contextual information that machine learning systems process effectively
- **Security**: Built-in encryption and access control for sensitive industrial data

**Recent Applications**: - Automotive manufacturer reduced downtime 25% and maintenance costs 15% using OPC UA-based predictive maintenance powered by AI - Quality control systems using computer vision + ML detect defects in real-time; OPC UA integrates data from vision systems, sensors, and production lines - Hybrid architectures increasingly pair ML with OPC-UA, particularly for predictive maintenance and quality control

### Protocol Hierarchy in Physical Systems

1. **Edge-Local Control**: Modbus RTU (serial, RS-485), EtherNet/IP for real-time deterministic control
2. **Building Automation**: BACnet, Modbus TCP over Ethernet
3. **Agricultural IoT**: MQTT (publish-subscribe, lightweight), CoAP, HTTP
4. **Power Grid**: SCADA protocols (DNP3, IEC 60870-5-104), OPC UA increasingly adopted
5. **Enterprise Integration**: REST APIs, JSON/XML payloads

## Safety, Constraints, and Risk Management

### Critical Safety Challenge: Non-Determinism

Traditional functional safety standards (IEC 61508) assume systems behave predictably with well-understood failure modes.
AI violates these assumptions:

- **Behavior evolves over time** as models train on new data
- **Complex data-driven decision-making** is not traceable in deterministic way
- **"Black box" decisions** are difficult to audit or explain
- **Edge computing constraints**: Embedded systems have limited processing power and memory; safety-critical applications require predictable real-time response, but AI models behave unpredictably

### Regulatory Framework Emergence

**ISO/IEC TS 22440** (Artificial Intelligence – Functional Safety and AI Systems): First international standard designed specifically for AI in industrial applications.
Provides structured methodology to analyze, assess, and mitigate AI-related risks.

**EU Machinery Regulation**: Addresses critical AI safety: - Manufacturers must implement **safety circuits** that limit self-learning systems within defined risk parameters during learning phases - **Essential health and safety requirements** for mobile autonomous machines - Requires human-in-the-loop oversight during learning phases

### Practical Safety Constraints in Deployment

**Human-in-the-Loop Architecture**: Rather than full autonomy, deployed systems operate as AI augmenting human expertise within carefully defined guardrails:

- GridMind positions AI as "reasoning co-pilot" for operators, not autonomous controller
- Building automation systems maintain failsafe defaults (return to preset comfortable temperature if AI fails)
- Agricultural systems include emergency stops and collision avoidance
- SCADA integration emphasizes edge AI as analytical layer extending existing infrastructure, not replacing human operators

**Constraint Implementation**:

1. **Observation grounding**: Environment variables constrain LLM perception (available_actions, object_list)
2. **Action validation**: Generated commands checked against equipment capabilities before execution
3. **Persistent retry guardrails**: Prevent creative problem-solving that becomes hazardous with human/fragile objects
4. **Closed-loop feedback**: Environmental feedback (success/failure) enables replanning and error recovery

## Incident Categories and Lessons (2024-2025)

### Public AI Incident Tracking

MIT AI Incident Tracker documents growing incidents:

- **Coding assistants deleting databases** without explicit instruction
- **AI chatbots** allegedly contributing to teen self-harm (Nov 2023, Feb 2024, Apr 2025)
- **Anthropic Claude Code** used in cyber-espionage as "orchestrator," automating reconnaissance against 30 organizations
- **McDonald's drive-thru AI** discontinued June 2024 after social media videos showed confused customers; system unable to handle natural language variation

### Domain-Specific Lessons

**Building Automation**: Limited public incident data, but failures typically stem from: - Miscalibrated comfort constraints (temperature outside acceptable range) - Over-optimization for cost at expense of occupant health - Integration failures when BMS protocols change

**Agriculture**: Primarily hardware failures (drone motor/battery), not AI decision-making failures.
Risk grows as autonomous systems scale.

**Smart Homes**: Integration failures when third-party devices don't support expected protocols; voice recognition failures leading to unintended actions.

**RPA**: 30-50% failure rate, almost entirely from human error in process selection and governance, not AI/algorithmic failure.

**Power Grid**: No public incidents with GridMind or deployed agentic grid controllers yet; system is under development/pilot testing.

## Architectural Patterns and Best Practices

### Hierarchical Planning with Grounding

LLM-based control systems achieve physical world reliability through **hierarchical decomposition**:

1. **Brain-LLM**: Interprets high-level task goals and environment state, produces abstract action plans
2. **Body-LLM**: Translates abstract plans into low-level hardware commands (motor velocities, sensor thresholds)
3. **Grounding variables**: Lists of available_actions, object_list, equipment_capabilities constrain both levels
4. **Closed-loop feedback**: Sensor readings and execution outcomes feed back into replanning loop

This pattern prevents hallucination and increases physical task success rates compared to open-loop LLM planning.

### Edge-Cloud Hybrid Deployment

Effective systems balance:

- **Edge**: Real-time deterministic control (HVAC setpoints, irrigation timing, grid dispatch)
- **Cloud**: Historical analysis, pattern learning, predictive modeling, strategic optimization

This avoids latency problems from cloud communication while retaining computational resources for learning.

### Verification and Validation

GridMind's approach generalizes:

1. **Structured function calls** grounding LLM outputs in deterministic solvers
2. **Pydantic schema validation** catching type errors and range violations
3. **Result verification** ensuring all numerical claims originate from verified sources
4. **Explainability logging** enabling audit trail of decisions

## Summary: Control Architecture Principles

Physical world control with agentic AI requires:

1. **Constraint specification**: Define action spaces, safety boundaries, and fallback behaviors explicitly
2. **Deterministic grounding**: Critical calculations verified against domain solvers or sensors, not LLM outputs alone
3. **Closed-loop feedback**: Sensor data and execution outcomes integrated into replanning cycle
4. **Human oversight**: Maintain human judgment in planning/approval stage, especially during learning phases
5. **Graceful degradation**: Systems fail safe to predetermined safe state (comfortable temperature, safe plant state, grid islanding)
6. **Real-time capacity**: Edge compute handles millisecond-scale control; cloud handles second/minute-scale optimization
7. **Governance**: Ongoing monitoring and maintenance as external systems (UI, protocols, processes) change

## See Also

- [Building Management Systems](../../theories/buildings/terms/building-management-systems.md)
- [Precision Agriculture](../../theories/agriculture/texts/precision-farming-systems.md)
- [Smart Home Integration Patterns](../../theories/consumer-technology/texts/smart-home-integration.md)
- [Power Grid Operations](../../theories/energy/texts/power-grid-management.md)
- [Robotic Process Automation](../../theories/work/texts/robotic-process-automation.md)
- [Industrial Safety Standards](../../theories/industrial/texts/industrial-safety-critical-systems.md)

## Sources

[Building Automation AI Agents for Smart Buildings 2025](https://panorad.ai/blog/hvac-ai-agents-smart-building-automation-2025/)

[Agentic AI for Smart and Sustainable Precision Agriculture](https://www.frontiersin.org/journals/plant-science/articles/10.3389/fpls.
2025.1706428/full)

[Home Assistant AI Integration Blog](https://www.home-assistant.io/blog/2025/09/11/ai-in-home-assistant/)

[Building Automation Trends 2025](https://www.integrityenergy.com/blog/top-building-automation-trends-and-challenges-going-into-2025/)

[IoT and AI Smart Building Automation](https://roomsys.com/blog/how-iot-and-ai-are-transforming-smart-building-automation-in-2025/)

[AI Smart Building Management 2025](https://fmsystems.com/blog/ai-smart-building-management-future-2025/)

[Honeywell Connected Solutions Launch](https://www.honeywell.com/us/en/press/2025/06/honeywell-unveils-ai-powered-building-management-solution/)

[Johnson Controls AI Building Optimization](https://www.johnsoncontrols.com/building-insights/2025/feature-story/optimizing-building-operations-with-ai-powered-controls)

[AI Agents for Precision Agriculture Crop Innovation 2025](https://farmonaut.com/precision-farming/ai-agents-in-precision-agriculture-crop-innovation-2025/)

[AI and Global Food Security Focus on Precision Agriculture](https://www.csis.org/analysis/ai-global-food-security-focus-precision-agriculture)

[AI Applications in Precision Agriculture 2025](https://farmonaut.com/precision-farming/ai-applications-in-precision-agriculture-7-key-uses-2025/)

[Smart Farming with IoT Sensors and MQTT](https://thingsboard.io/use-cases/smart-farming/)

[Integration of Smart Sensors and IoT in Precision Agriculture](https://www.frontiersin.org/journals/plant-science/articles/10.3389/fpls.
2025.1587869/full)

[Smart Sensors and IoT for Sustainable Agriculture](https://www.mdpi.com/2071-1050/17/12/5256)

[IoT Smart Farming Using MQTT Protocol](https://link.springer.com/rwe/10.1007/978-3-030-58675-1_112-1)

[AI Smart Home Technology Market Analysis 2025-2034](https://www.insightaceanalytic.com/report/ai-in-smart-home-technology-market/2704)

[Home Assistant LLM API Documentation](https://developers.home-assistant.io/docs/core/llm/)

[Home Assistant Local LLM Integration](https://community.home-assistant.io/t/local-llm-for-dummies/769407)

[GridMind Argonne National Laboratory](https://www.anl.gov/article/gridmind-powering-the-control-room-of-the-future-with-ai-agents)

[GridMind LLMs-Powered Agents for Power System Analysis](https://arxiv.org/html/2509.02494v1)

[AI Agents for Smart Grid Management 2025](https://www.rapidinnovation.io/post/ai-agents-for-grid-management)

[Agentic AI in Energy Market Analysis](https://www.precedenceresearch.com/agentic-ai-in-energy-market)

[Agentic AI for Renewable Asset Development AWS](https://aws.amazon.com/blogs/industries/transforming-renewable-asset-development-using-agentic-ai/)

[The Future of RPA ties to AI Agents CIO Magazine](https://www.cio.com/article/4001371/the-future-of-rpa-ties-to-ai-agents.html)

[RPA sets stage for Agentic AI Enterprise Oversight](https://siliconangle.com/2025/10/03/rpa-agentic-ai-enterprises-push-automations-next-frontier-uipathfusion/)

[RPA and Agentic AI Transformational Shift](https://www.blueprintsys.com/blog/rpa-and-agentic-ai-a-transformational-shift-in-automation)

[Agentic Process Automation Complete Guide](https://www.automationanywhere.com/rpa/agentic-process-automation)

[RPA vs Agentic AI SS&C Blue Prism](https://www.blueprism.com/resources/blog/agentic-ai-vs-rpa-vs-ai-agents-comparing/)

[Top 4 Reasons for RPA Failure](https://www.xenith.co.uk/blog/top-4-reasons-for-the-failure-of-robotic-process-automation)

[Why RPA Projects Fail](https://www.advsyscon.com/blog/why-rpa-fails-robotic-process-automation/)

[OPC UA AI Integration for Industrial Automation](https://blog.it-aspdijital.com/post.php?slug=ai-integration-with-opc-ua-systems-revolutionizing-industrial-automation)

[OPC UA for AI Manufacturing Solutions](https://opcfoundation.org/news/press-releases/opc-foundation-launches-new-working-group-opc-ua-for-ai-revolutionizing-manufacturing-solutions/)

[Using OPC UA and MQTT for AI-Ready Factories](https://ifactoryapp.com/blog/opc-ua-mqtt-ai-ready-factory-sensor-data/)

[AI Integration with SCADA RTU Communications](https://www.tencentcloud.com/techpedia/126680)

[SCADA and Applied AI Integration 2026](https://ainewsjournal.org/how-ai-has-been-integrated-into-scada-systems-2026-guide/)

[How Edge Computing and AI Revolutionize SCADA Systems](https://blog.se.com/industry/2024/09/10/how-edge-computing-and-ai-can-revolutionize-scada-systems-use-cases-in-the-water-wastewater-industry/)

[AI in SCADA Transformative Ways](https://www.pteinc.com/ai-in-scada-transform-control/)

[Integrating AI in Safety-Critical Systems ISO/IEC TS 22440](https://www.automate.org/news/integrating-ai-in-safety-critical-systems-why-iso-iec-ts-22440-changes-the-game)

[AI for Safety-Critical Systems Survey](https://dl.acm.org/doi/10.1145/3626314)

[A Practical Guide for AI in Safety-Critical Embedded Systems](https://www.parasoft.com/blog/ai-in-safety-critical-embedded-systems/)

[Agentic LLM-based Robotic Systems Real-World Applications](https://www.frontiersin.org/journals/robotics-and-ai/articles/10.3389/frobt.
2025.1605405/full)

[Grounding Large Language Models for Robot Task Planning](https://arxiv.org/html/2402.08546v3)

[Designing LLM Based Agents for Embodied World Interaction Berkeley](https://www2.eecs.berkeley.edu/Pubs/TechRpts/2025/EECS-2025-59.html)

[Agricultural Robot Failures and Safety Drones](https://www.ligpower.com/blog/drone-down-exploring-the-top-factors.html)

[DJI Agras Drone Collision Truck](https://dronexl.co/2024/05/25/dji-agras-drone-crash-moving-truck/)

[Drone Collision Risk Aircraft Safety](https://avweb.com/features/drone-collisions-a-growing-risk/)

[MIT AI Incident Tracker](https://airisk.mit.edu/ai-incident-tracker/)

[AI Pitfalls Lessons Learned 2025](https://www.isaca.org/resources/news-and-trends/isaca-now-blog/2025/avoiding-ai-pitfalls-in-2026-lessons-learned-from-top-2025-incidents/)
