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

# An (almost) 1-to-1 copy of the raw data of a Stream Motion 'command'
# type packet.

# a ROS header (facilitates synchronisation with other data streams)
Header header

# header of the Stream Motion packet
uint32 packet_type
uint32 version

# sequence number
uint32 seq

# is this the last command packet of this session?
uint8 LAST_DATA_FALSE = 0
uint8 LAST_DATA_TRUE = 1
uint8 last_data

# IO read command
uint8  read_io_type   # see IoTypes.msg for IO type enum
uint16 read_io_index
uint16 read_io_mask

# should 'pose_data' (below) be interpreted as Cartesian or joint data?
uint8 DATA_STYLE_CARTESIAN = 0
uint8 DATA_STYLE_JOINT = 1
uint8 data_style

# IO write command
uint8  write_io_type   # see IoTypes.msg for IO type enum
uint16 write_io_index
uint16 write_io_mask
uint16 write_io_value

# reserved field
uint16 unused

# Pose data : either Cartesian or Joint 'style'
#
# Array contents:
#
#  - Cartesian:
#    * indices 0-2: XYZ (millimetres)
#    * indices 3-5: WPR (degrees)
#    * indices 6-8: E1, E2, E3 (if revolute: degrees, if linear: millimetres)
#
#    Note: pose is relative to controller's "World frame".
#
#  - Joint:
#    * indices 0-8: robot axes (if revolute: degrees, if linear: millimetres)
#
#    Note: Fanuc axis indices are 1-based, while the array is 0-based (so
#          element 0 == J1, 1 == J2, etc).
#
float32[9] pose_data
