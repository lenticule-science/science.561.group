# Welcome!

If you're just getting started, you'll want to acquaint yourself with the flight controls first.
Right now you're reading this in the console, which lets you interact with your ship's onboard computer.
You can reach flight mode with `f1` and use `f2` to get back here to the console, so try that now.

You are currently orbiting a star, along with several other objects.
To visit any of those objects, you will need to adjust your trajectory to intercept that of the desired object.

To do this, accelerate along your orbit to widen/tighten the far side of your orbit.
To go from a circular orbit to a larger one, first accelerate to move the opposite side further out, and accelerate once more at the furthest point to also widen the point you started at.
By decelerating the orbit can be made smaller again in the same way.

You may notice that objects closer to the star orbit faster than those far away.
To intercept another object, you need to make your orbit slower and bigger to wait for the object, or smaller and faster to catch up on it.

Use the arrow keys to adjust your orbit, but keep an eye on the red fuel gauge in the upper left.
The faster you're going, the more fuel (and time) it will take to slow back down.
Your fuel will recharge, but it takes time.
You can't collide with anything, so don't fear.
Switch to flight mode now and try it out for a bit.

The green curve plots your estimated trajectory, and the box in the upper left shows your velocity vector.
Use the `equals` and `minus` keys, or the scroll wheel on your mouse, to zoom in and out.
The `tab` key cycles through all targets linearly, while `ctrl-tab` selects the closest target.

Once you've got a feel for the controls and instrumentation, run this:

    man("quickstart2")
