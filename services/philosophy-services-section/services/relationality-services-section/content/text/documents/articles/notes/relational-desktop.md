---
title: Relational Desktop and Window Manager
status: someday
keywords:
  - idea
  - gui
  - desktop
description: Model windows, layouts, and workspaces as recognitions so your whole “desktop” is just another projection over the relational graph.
---
# Idea: Relational Desktop and Window Manager

Model windows, layouts, and workspaces as recognitions so your whole “desktop”
is just another projection over the relational graph.

## 1. Core recognitions

- `DesktopWorkspaceRecognition`
  - A named workspace (e.g. “Math”, “Writing”, “Ops”, “MUD”) with associated
    contexts, policies, and default views.
- `WindowRecognition`
  - A window/pane: type (browser, editor, dashboard, chat), bound resource
    (URL, recognition slice, idea/spec/arch doc), geometry, and z‑order.
- `LayoutRecognition`
  - Tiling/stacking layouts over windows (rows, columns, grids, tabs), with
    rules for resizing, snapping, and focus transitions.
- `FocusStateRecognition`
  - Current focus: which window/workspace is “active”, and what that implies
    for notifications and input.

## 2. Topology and measurement

- **Topology**
  - Workspaces linked to slices of the internal graph (acts/specs/ideas,
    project recognitions).
  - Windows bound to resources (docs, dashboards, MUD sessions, notebooks) and
    grouped by layouts.
  - Focus states form a time‑ordered path through workspaces and windows.
- **Measurement**
  - Time spent per workspace/window, switching frequency, interruption rate.
  - “Cognitive load” proxies: number of open windows, notifications pending,
    context switches per unit time.

## 3. Runbooks and flows

- `run_switch_workspace`
  - Change active workspace; bring relevant windows and layouts into focus.
- `run_save_restore_layout`
  - Persist and restore sets of `WindowRecognition`s and `LayoutRecognition`s
    for a workspace or project.
- `run_recommend_focus`
  - Suggest which workspace/window to attend to based on tasks, deadlines,
    notifications, and measurements of overload.

## 4. Cross-domain connections

- Integrates GUI workbench, notebook, browser, and MUD ideas into a single
  coherent surface.
- Enables “desktop hygiene” as a measurable, steerable property rather than
  ad‑hoc window juggling.
