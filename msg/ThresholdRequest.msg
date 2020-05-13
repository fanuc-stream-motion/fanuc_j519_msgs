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
# 'threshold request' type packet.

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
