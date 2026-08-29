# = emsenn's Subtle configuration
# Author::  Morgan Sennhauser <emsenn@emsenn.com>
# License:: WTFPL (http://emsenn.com/wtfpl.txt)
#
# This is my configuration for the Subtle tiling Window Manager, written for version 0.9.2773


# == Options
    # Window move/resize steps in pixel per keypress
set :step, 5
    # Window screen border snapping
set :snap, 10
    # Default starting gravity for windows (0 = gravity of last client)
set :gravity, :center
    # Make transient windows urgent
set :urgent, false
    # Honor resize size hints globally
set :resize, false
    # Font string either take from e.g. xfontsel or use xft
set :font, "xft:Dejavu Sans Mono:pixelsize=12"
    # Separator between sublets
set :separator, "|"
    # Set the WM_NAME of subtle (Java quirk)
    # set :wmname, "LG3D"


# == Screen
screen 1 do
  top    [ :views, :center, :title, :center, :tray ]
end
    # Example for a second screen:
    #screen 2 do
    #  top    [ :views, :title, :spacer ]
    #  bottom [ ]
    #end

style :all do
  background  "#202020"
  border      "#303030", 0
  padding     0, 3
end

# Style for the views
style :views do

  # Style for the active views
  style :focus do
    foreground  "#fecf35"
  end

  # Style for urgent window titles and views
  style :urgent do
    foreground  "#ff9800"
  end

  # Style for occupied views (views with clients)
  style :occupied do
    foreground  "#b8b8b8"
  end

  # Style for unoccupied views (views without clients)
  style :unoccupied do
    foreground  "#757575"
  end
end

# Style for sublets
style :sublets do
  foreground  "#757575"
end

# Style for separator
style :separator do
  foreground  "#757575"
end

# Style for focus window title
style :title do
  foreground  "#fecf35"
end

# Style for active/inactive windows
style :clients do
  active      "#303030", 2
  inactive    "#202020", 2
  margin      0
end

style :subtle do
    margin  0,0,0,0
    panel "#202020"
    background "#3d3d3d"
    stipple "#757575"
end

# == Gravities
    # Top left
gravity :top_left,       [   0,   0,  50,  50 ]
gravity :top_left66,     [   0,   0,  50,  66 ]
gravity :top_left33,     [   0,   0,  50,  34 ]
    # Top
gravity :top,            [   0,   0, 100,  50 ]
gravity :top66,          [   0,   0, 100,  66 ]
gravity :top33,          [   0,   0, 100,  34 ]
    # Top right
gravity :top_right,      [  50,   0,  50,  50 ]
gravity :top_right66,    [  50,   0,  50,  66 ]
gravity :top_right33,    [  50,   0,  50,  34 ]
    # Left
gravity :left,           [   0,   0,  50, 100 ]
gravity :left66,         [   0,   0,  66, 100 ]
gravity :left33,         [   0,   0,  33, 100 ]
    # Center
gravity :center,         [   0,   0, 100, 100 ]
gravity :center66,       [  17,  17,  66,  66 ]
gravity :center33,       [  33,  33,  33,  33 ]
    # Right
gravity :right,          [  50,   0,  50, 100 ]
gravity :right66,        [  34,   0,  66, 100 ]
gravity :right33,        [  66,   0,  34, 100 ]
    # Bottom left
gravity :bottom_left,    [   0,  50,  50,  50 ]
gravity :bottom_left66,  [   0,  34,  50,  66 ]
gravity :bottom_left33,  [   0,  66,  50,  34 ]
    # Bottom
gravity :bottom,         [   0,  50, 100,  50 ]
gravity :bottom66,       [   0,  34, 100,  66 ]
gravity :bottom33,       [   0,  66, 100,  34 ]
    # Bottom right
gravity :bottom_right,   [  50,  50,  50,  50 ]
gravity :bottom_right66, [  50,  34,  50,  66 ]
gravity :bottom_right33, [  50,  66,  50,  34 ]


# == Grabs
    # Jump to view1, view2, ...
grab "W-S-1", :ViewJump1
grab "W-S-2", :ViewJump2
grab "W-S-3", :ViewJump3
grab "W-S-4", :ViewJump4
    # Switch current view
grab "W-1", :ViewSwitch1
grab "W-2", :ViewSwitch2
grab "W-3", :ViewSwitch3
grab "W-4", :ViewSwitch4
    # Select next and prev view
grab "C-A-Right",      :ViewNext
grab "C-A-Left", :ViewPrev
    # Move mouse to screen1, screen2, ...
grab "W-A-1", :ScreenJump1
grab "W-A-2", :ScreenJump2
grab "W-A-3", :ScreenJump3
grab "W-A-4", :ScreenJump4
    # Force reload of config and sublets
grab "W-C-r", :SubtleReload
    # Force restart of subtle
grab "W-C-S-r", :SubtleRestart
    # Quit subtle
grab "W-C-q", :SubtleQuit
    # Move current window
grab "W-B1", :WindowMove
    # Resize current window
grab "W-B3", :WindowResize
    # Toggle floating mode of window
grab "W-f", :WindowFloat
    # Toggle fullscreen mode of window
grab "W-space", :WindowFull
    # Toggle sticky mode of window (will be visible on all views)
grab "W-S-s", :WindowStick
    # Raise window
grab "W-k", :WindowRaise
    # Lower window
grab "W-j", :WindowLower
    # Select next windows
grab "W-Left",  :WindowLeft
grab "W-Down",  :WindowDown
grab "W-Up",    :WindowUp
grab "W-Right", :WindowRight
    # Kill current window
grab "W-S-k", :WindowKill
    # Cycle between given gravities
grab "W-q", [ :top_left,     :top_left66,     :top_left33     ]
grab "W-w", [ :top,          :top66,          :top33          ]
grab "W-e", [ :top_right,    :top_right66,    :top_right33    ]
grab "W-a", [ :left,         :left66,         :left33         ]
grab "W-s", [ :center,       :center66,       :center33       ]
grab "W-d", [ :right,        :right66,        :right33        ]
grab "W-z", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
grab "W-x", [ :bottom,       :bottom66,       :bottom33       ]
grab "W-c", [ :bottom_right, :bottom_right66, :bottom_right33 ]
    # Exec programs
grab "W-A-t", "urxvt -name local_term2"
grab "W-A-b", "chromium"
grab "W-A-S-t", "urxvt -name remote_term2"
    # Run Ruby lambdas
grab "S-F2" do |c|
  puts c.name
end
grab "S-F3" do
  puts Subtlext::VERSION
end


# == Tags
    # Placement
tag "fixed" do
  geometry [ 10, 10, 100, 100 ]
  stick    true
end
tag "resize" do
  match  "sakura|gvim"
  resize true
end
tag "gravity" do
  gravity :center
end
    # Modes
tag "stick" do
  match "mplayer"
  float true
  stick true
end
tag "float" do
  match "display"
  float true
end

tag "www_chromium" do
  match "chromium"
  gravity :left
end
tag "www_uzbl" do
  match "uzbl-browser"
  gravity :right
end
tag "term_1" do
    match instance: "term_1"
    gravity :left
end
tag "term_2" do
  match instance: "term_2"
  gravity :right
end

# == Views
view "term" do
  match "term.*"
end
view "all", "default"


# == Sublets


# == Hooks
    # Startup applications
on :start do
  term_1 =          Subtlext::Subtle.spawn "urxvt -name term_1"
  term_2 =          Subtlext::Subtle.spawn "urxvt -name term_2"
  www_chromium =    Subtlext::Subtle.spawn "chromium"
  www_uzbl =       Subtlext::Subtle.spawn "uzbl-browser"
  xbindkeys = Subtlext::Subtle.spawn "xbindkeys"
end

on :view_jump do |v|
  if v.name == "rem"
  end
end
