---
name: "IMU"
date-created: 2026-03-06
---

A sensor package combining accelerometers and gyroscopes that measures an aircraft's linear acceleration and angular rate, the foundation of all UAV attitude estimation.

An inertial measurement unit (IMU) is a sensor package containing accelerometers (measuring linear acceleration along three axes) and gyroscopes (measuring angular rate around three axes). Together, these six measurements provide the raw data from which the [flight controller](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/flight-controller.md) estimates the aircraft&rsquo;s attitude (pitch, roll, yaw orientation) and, when fused with other sensors, its position and velocity.

A 6-axis IMU (3 accelerometers + 3 gyroscopes) is the minimum sensor set for stabilized flight. Many [flight controllers](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/flight-controller.md) include a 9-axis IMU (adding a 3-axis magnetometer for heading reference) or even a 10-axis unit (adding a barometric altimeter).

**MEMS IMUs** (microelectromechanical systems) are the standard for small and medium UAVs. They are cheap ($1–50), light (<1 g for the sensor chip), and small — but they drift. Gyroscope bias drift accumulates angular error at 0.5–10°/hour for consumer-grade MEMS, meaning that pure inertial navigation becomes useless within minutes. This is why UAVs fuse IMU data with GPS, magnetometer, barometer, and sometimes optical flow or visual odometry through estimation filters (typically extended Kalman filters or complementary filters).

**Fiber-optic gyroscopes (FOGs)** and **ring laser gyroscopes (RLGs)** provide orders-of-magnitude lower drift (0.001–0.01°/hour) and are used in military and high-precision UAVs, including cruise missiles and advanced [loitering munitions](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/loitering-munition.md). Their cost ($1,000–$100,000) and size restrict them to larger platforms.

The IMU&rsquo;s placement on the airframe matters: it should be as close to the center of gravity as possible to minimize the effect of rotational acceleration on the accelerometer readings, and it should be vibration-isolated (especially from propulsion sources) to prevent high-frequency noise from corrupting the measurements. On [3D-printed](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/additive-manufacturing-in-uav-airframes.md) airframes, the IMU mount&rsquo;s [infill density](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/infill-density.md) and damping characteristics directly affect sensor quality.
