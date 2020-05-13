# Copyright (c) 2020, G.A. vd. Hoorn
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

# An (almost) 1-to-1 copy of the raw data of a Stream Motion
# 'threshold response' type packet.

# a ROS header (facilitates synchronisation with other data streams)
Header header

# header of the Stream Motion packet
uint32 packet_type
uint32 version

# axis number
uint32 axis_number

# which threshold was requested?
# see ThresholdTypes.msg for threshold_type enum
uint8 threshold_type

# maximum Cartesian speed (Vmax in mm/s)
uint32 cart_vmax

# unknown field
uint32 unknown0

# Threshold tables
#
# These contain the speed and payload dependent joint limits for the joint
# with ID 'axis_number' (so for J2, axis_number == 2).
#
# Units for each of the elements depends on 'threshold_type':
#
#  VELOCITY       deg/s    or  mm/s
#  ACCELERATION   deg/s^2  or  mm/s^2
#  JERK           deg/s^3  or  mm/s^3
#
# Refer to the Stream Motion documentation for further information on how
# to interpret and use the information encoded in these tables.
#
float32[20] no_payload
float32[20] max_payload
