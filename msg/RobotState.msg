# Copyright (c) 2019, G.A. vd. Hoorn
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Author G.A. vd. Hoorn

# An (almost) 1-to-1 copy of the raw data of a Stream Motion 'robot state'
# type packet.

# a ROS header (facilitates synchronisation with other data streams)
Header header

# header of the Stream Motion packet
uint32 packet_type
uint32 version

# sequence number
uint32 seq

# status byte (bitfield)
uint8 STATUS_READY_FOR_COMMANDS = 1
uint8 STATUS_COMMAND_RECEIVED   = 2
uint8 STATUS_SYSRDY             = 4
uint8 STATUS_IN_MOTION          = 8
uint8 status

# Result of the last IO read command
uint8  read_io_type   # see IoTypes.msg for IO type enum
uint16 read_io_index
uint16 read_io_mask
uint16 read_io_value

# controller time in milliseconds (2ms resolution)
#
# Note: by default this will not be synchronised with (nor comparable to) ROS time!
#
uint32 time_stamp

# Pose data - Cartesian
#
# Array contents:
#
#  * indices 0-2: XYZ (millimetres)
#  * indices 3-5: WPR (degrees)
#  * indices 6-8: E1, E2, E3 (if revolute: degrees, if linear: millimetres)
#
# Note: pose is relative to 'World' frame.
#
float32[9] cart_pose

# Pose data - Joint
#
# Array contents:
#
#  * indices 0-8: robot axes (if revolute: degrees, if linear: millimetres)
#
#    Note: Fanuc axis indices are 1-based, while the array is 0-based (so
#          element 0 == J1, 1 == J2, etc).
#
float32[9] joint_pose

# motor current for all robot axes (amperes)
float32[9] motor_current
