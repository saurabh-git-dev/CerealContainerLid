; HEADER_BLOCK_START
; BambuStudio 02.08.02.61
; model printing time: 9m 29s; total estimated time: 16m 28s
; total layer number: 64
; total filament length [mm] : 292.57
; total filament volume [cm^3] : 703.70
; total filament weight [g] : 0.87
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 13.00
; filament: 1
; support_material_on_wipe_tower: 0
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; additional_fan_full_speed_layer = 0
; alternate_extra_wall = 0
; ams_filament_load_time_ams = 0
; ams_filament_load_time_ams_lite = 0
; ams_filament_load_time_n3f_s = 0
; ams_filament_unload_time_ams = 0
; ams_filament_unload_time_ams_lite = 0
; ams_filament_unload_time_n3f_s = 0
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 0
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; bed_heat_soak_area = 
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.7,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 4
; bottom_shell_thickness = 0
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0
; change_filament_gcode = ;===== A1mini 20251031 =====\nG392 S0\nM1007 S0\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n\nG1 X180 F18000\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F1200\n{else}\nM620.11 S0\n{endif}\nM400\n\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nM620.10 A0 F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\nM620.10 A1 F{flush_volumetric_speeds[next_extruder]/2.4053*60} L[flush_length] H[nozzle_diameter] T{flush_temperatures[next_extruder]}\n\nG1 Y90 F9000\n\n{if next_extruder < 255}\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\n\nM400\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[flush_temperatures[next_extruder]]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S[new_filament_temp]\nG1 E5 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S7\n  G1 X0 F18000\n  G1 X-13.5 F3000\n  G1 X0 F18000 ;wipe and shake\n  G1 X-13.5 F3000\n  G1 X0 F12000 ;wipe and shake\n  G1 X-13.5 F3000\n  G1 X0 F12000 ;wipe and shake\n  M400\n  M106 P1 S0 \nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_additional_fan_first_x_layers = 1
; close_fan_the_first_x_layers = 1
; compatible_printers_condition = 
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 30
; cool_plate_temp_initial_layer = 30
; cooling_filter_enabled = 0
; cooling_perimeter_transition_distance = 10
; cooling_slowdown_logic = uniform_cooling
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; counterbore_hole_bridging = none
; curr_bed_type = Textured PEI Plate
; default_acceleration = 6000
; default_ams_type = -1
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL A1M"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1M
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; different_settings_to_system = ;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_filament_dynamic_map = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_mixed_color_sublayer = 0
; enable_order_independent_overlap_carving = 0
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 1
; enable_support = 0
; enable_support_ironing = 0
; enable_tower_interface_features = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 30
; eng_plate_temp_initial_layer = 30
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 
; extruder_clearance_dist_to_rod = 56.5
; extruder_clearance_height_to_lid = 180
; extruder_clearance_height_to_rod = 25
; extruder_clearance_max_radius = 73
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = 
; extruder_offset = 0x0
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 100
; fan_direction = undefine
; fan_max_speed = 100
; fan_min_speed = 100
; farthest_point_timelapse = 0
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 600
; filament_bridge_speed = 25
; filament_change_length = 10
; filament_change_length_nc = 10
; filament_colour = #00AE42
; filament_cooling_before_tower = 0
; filament_cost = 20
; filament_density = 1.24
; filament_dev_ams_drying_ams_limitations = 1
; filament_dev_ams_drying_heat_distortion_temperature = 45
; filament_dev_ams_drying_temperature = 65
; filament_dev_ams_drying_time = 12
; filament_dev_chamber_drying_bed_temperature = 90
; filament_dev_chamber_drying_time = 16
; filament_dev_drying_cooling_temperature = 40
; filament_dev_drying_softening_temperature = 50
; filament_diameter = 1.75
; filament_enable_overhang_speed = 1
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_compatibility = 0
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 1
; filament_flush_temp = 0
; filament_flush_temp_fast = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFU99
; filament_is_mixed = 0
; filament_is_support = 0
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 3
; filament_metal_stickiness = High
; filament_minimal_purge_on_wipe_tower = 15
; filament_mixed_components = ""
; filament_mixed_gradient = 0
; filament_mixed_gradient_curve = ""
; filament_mixed_gradient_per_part = 0
; filament_mixed_gradient_range = ""
; filament_mixed_sublayer_ratios = ""
; filament_notes = 
; filament_nozzle_map = 0
; filament_overhang_1_4_speed = 0
; filament_overhang_2_4_speed = 50
; filament_overhang_3_4_speed = 30
; filament_overhang_4_4_speed = 10
; filament_overhang_totally_speed = 10
; filament_pre_cooling_temperature = 0
; filament_pre_cooling_temperature_nc = 0
; filament_preheat_temperature_delta = 0
; filament_prime_volume = 45
; filament_prime_volume_nc = 60
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_travel_time_nc = 0
; filament_ramming_volumetric_speed = -1
; filament_ramming_volumetric_speed_nc = -1
; filament_retract_length_nc = 14
; filament_retraction_length = 0.4
; filament_scarf_gap = 0%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Generic TPU @BBL A1M"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if (bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >30)||(bed_temperature_initial_layer[current_extruder] >30)}M106 P3 S180\n{endif} \n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_tower_interface_pre_extrusion_dist = 10
; filament_tower_interface_pre_extrusion_length = 0
; filament_tower_interface_print_temp = -1
; filament_tower_interface_purge_volume = 20
; filament_tower_ironing_area = 4
; filament_type = TPU
; filament_velocity_adaptation_factor = 1
; filament_vendor = eSUN
; filament_volume_map = 0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0
; first_x_layer_part_fan_speed = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_multiplier_fast = 1.2
; flush_volumes_matrix = 0,280,280,280,280,0,280,280,280,280,0,280,280,280,280,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_first_layer = 0
; fuzzy_skin_mode = displacement
; fuzzy_skin_noise_type = classic
; fuzzy_skin_octaves = 4
; fuzzy_skin_persistence = 0.5
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_scale = 1
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 17.4
; group_algo_with_time = 0
; has_filament_switcher = 0
; has_scarf_joint_seam = 1
; head_wrap_detect_zone = 156x152,180x152,180x180,156x180
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; hot_plate_temp = 30
; hot_plate_temp_initial_layer = 30
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = ;;
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_fan_speed = -1
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
; machine_bed_mass_Y = 0
; machine_end_gcode = ;===== date: 20260513 =====================\n;turn off nozzle clog detect\nG392 S0\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG90\nG1 Z{max_layer_z + 0.4} F900 ; lower z a little\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\n{if !spiral_mode && print_sequence != \"by object\"}\nM1002 judge_flag timelapse_record_flag\nM622 J1\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM991 S0 P-1 ;end timelapse at safe pos\nM623\n{endif}\n\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n;G1 X27 F15000 ; wipe\n\n; pull back filament to AMS\nM620 S255\nG1 X181 F12000\nT255\nG1 X0 F18000\nG1 X-13.0 F3000\nG1 X0 F18000 ; wipe\nM621 S255\n\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 180}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z180 F600\n    G1 Z180\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X-13 Y180 F3600\n\nG91\nG1 Z-1 F600\nG90\nM83\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A0 B20 L100 C37 D20 M100 E42 F20 N100\nM1006 A0 B10 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C46 D10 M100 E46 F10 N100\nM1006 A44 B20 L100 C39 D20 M100 E48 F20 N100\nM1006 A0 B10 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B10 L100 C39 D10 M100 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B10 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B10 L100 C39 D10 M100 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B10 L100 C0 D10 M100 E48 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B20 L100 C41 D20 M100 E49 F20 N100\nM1006 A0 B20 L100 C0 D20 M100 E0 F20 N100\nM1006 A0 B20 L100 C37 D20 M100 E37 F20 N100\nM1006 W\n;=====printer finish  sound=========\nM400 S1\nM18 X Y Z\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 28
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 6000,6000
; machine_max_acceleration_x = 6000,6000
; machine_max_acceleration_y = 6000,6000
; machine_max_acceleration_z = 1500,1500
; machine_max_force_Y = 0
; machine_max_jerk_e = 3,3
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 5,5
; machine_max_printed_mass = 0
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: A1 mini =========================\n;===== date: 20260513 ==================\n\n;===== start to heat heatbead&hotend==========\nM1002 gcode_claim_action : 2\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM104 S170\nM140 S[bed_temperature_initial_layer_single]\nG392 S0 ;turn off clog detect\nM9833.2\n;=====start printer sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B0 L100 C37 D10 M100 E37 F10 N100\nM1006 A0 B0 L100 C41 D10 M100 E41 F10 N100\nM1006 A0 B0 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A43 B10 L100 C39 D10 M100 E46 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C39 D10 M100 E43 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C41 D10 M100 E41 F10 N100\nM1006 A0 B0 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B0 L100 C49 D10 M100 E49 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B10 L100 C39 D10 M100 E48 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C39 D10 M100 E44 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A43 B10 L100 C39 D10 M100 E46 F10 N100\nM1006 W\nM18\n;=====avoid end stop =================\nG91\nG380 S2 Z30 F1200\nG380 S3 Z-20 F1200\nG1 Z5 F1200\nG90\n\n;===== reset machine status =================\nM204 S6000\n\nM630 S0 P0\nG91\nM17 Z0.3 ; lower the z-motor current\n\nG90\nM17 X0.7 Y0.9 Z0.5 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM83\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\n;===== prepare print temperature and material ==========\nM400\nM18\nM109 S100 H170\nM104 S170\nM400\nM17\nM400\nG28 X\n\nM211 X0 Y0 Z0 ;turn off soft endstop ; turn off soft endstop to prevent protential logic problem\n\nM975 S1 ; turn on\n\nG1 X0.0 F30000\nG1 X-13.5 F3000\n\nM620 M ;enable remap\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    G392 S0 ;turn on clog detect\n    M1002 gcode_claim_action : 4\n    M400\n    M1002 set_filament_type:UNKNOWN\n    M109 S[nozzle_temperature_initial_layer]\n{if (filament_type[initial_no_support_extruder] == \"PLA\") && (nozzle_diameter != 0.2)}\n    M104 S220\n{else}\n    M104 S250\n{endif}\n    M400\n    T[initial_no_support_extruder]\n    G1 X-13.5 F3000\n    M400\n{if (filament_type[initial_no_support_extruder] == \"PLA\") && (nozzle_diameter != 0.2)}\n    M620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T220\n    M109 S220 ;set nozzle to common flush temp\n{else}\n    M620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n    M109 S250 ;set nozzle to common flush temp\n{endif}\n    M106 P1 S0\n    G92 E0\n    G1 E50 F200\n    M400\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n{if (filament_type[initial_no_support_extruder] == \"PLA\") && (nozzle_diameter != 0.2)}\n    M104 S220\n{else}\n    M104 S{flush_temperatures[initial_no_support_extruder]}\n{endif}\n    G92 E0\n    G1 E50 F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60}\n    M400\n    M106 P1 S178\n    G92 E0\n    G1 E5 F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60}\n    M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20} ; drop nozzle temp, make filament shink a bit\n    M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-40}\n    G92 E0\n    G1 E-0.5 F300\n\n    G1 X0 F30000\n    G1 X-13.5 F3000\n    G1 X0 F30000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X0 F30000\n    G1 X-13.5 F3000\n    M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-40}\n    G392 S0 ;turn off clog detect\nM621 S[initial_no_support_extruder]A\n\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== mech mode fast check============================\nM1002 gcode_claim_action : 3\nG0 X25 Y175 F20000 ; find a soft place to home\n;M104 S0\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nM104 S170\n\n; build plate detect\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n  G39.4\n  M400\nM623\n\nG1 Z5 F3000\nG1 X90 Y-1 F30000\nM400 P200\nM970.3 Q1 A7 K0 O2\nM974 Q1 S2 P0\n\nG1 X90 Y0 Z5 F30000\nM400 P200\nM970 Q0 A10 B50 C90 H15 K0 M20 O3\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X-1 Y10\nG28 X ; re-home XY\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\n\nM104 S170 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\nM211 S; push soft endstop status\nM211 X0 Y0 Z0 ;turn off Z axis endstop\n\nM83\nG1 E-1 F500\nG90\nM83\n\nM109 S170\nM104 S140\nG0 X90 Y-4 F30000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X91 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X92 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X93 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X94 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X95 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X96 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X97 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X98 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\n\nG1 Z5 F30000\n;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\nG1 X25 Y175 F30000.1 ;Brush material\nG1 Z0.2 F30000.1\nG1 Y185\nG91\nG1 X-30 F30000\nG1 Y-2\nG1 X27\nG1 Y1.5\nG1 X-28\nG1 Y-2\nG1 X30\nG1 Y1.5\nG1 X-30\nG90\nM83\n\nG1 Z5 F3000\nG0 X50 Y175 F20000 ; find a soft place to home\nG28 Z P0 T300; home z with low precision, permit 300deg temperature\nG29.2 S0 ; turn off ABL\n\nG0 X85 Y185 F10000 ;move to exposed steel surface and stop the nozzle\nG0 Z-1.01 F10000\nG91\n\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nG90\nG1 Z5 F30000\nG1 X25 Y175 F30000.1 ;Brush material\nG1 Z0.2 F30000.1\nG1 Y185\nG91\nG1 X-30 F30000\nG1 Y-2\nG1 X27\nG1 Y1.5\nG1 X-28\nG1 Y-2\nG1 X30\nG1 Y1.5\nG1 X-30\nG90\nM83\n\nG1 Z5\nG0 X55 Y175 F20000 ; find a soft place to home\nG28 Z P0 T300; home z with low precision, permit 300deg temperature\nG29.2 S0 ; turn off ABL\n\nG1 Z10\nG1 X85 Y185\nG1 Z-1.01\nG1 X95\nG1 X90\n\nM211 R; pop softend status\n\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== wait heatbed  ====================\nM1002 gcode_claim_action:54\nM104 S0\nM190 S[bed_temperature_initial_layer_single];set bed temp\nM109 S140\n\nG1 Z5 F3000\nG29.2 S1\nG1 X10 Y10 F20000\n\n;===== bed leveling ==================================\n;M1002 set_flag g29_before_print_flag=1\nM1002 judge_flag g29_before_print_flag\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29 A1 X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28 T145\n\nM623\n\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\n\nG1 X-13.5 Y0 Z10 F10000\nG1 E1.2 F500\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S{nozzle_temperature[initial_extruder]}\nM400\n\nM412 S1 ;    ===turn on  filament runout detection===\nM400 P10\n\nG392 S0 ;turn on clog detect\n\nM620.3 W1; === turn on filament tangle detection===\nM400 S2\n\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n;M1002 set_flag extrude_cali_flag=1\nM1002 judge_flag extrude_cali_flag\nM622 J1\n    M1002 gcode_claim_action : 8\n    \n    M400\n    M900 K0.0 L1000.0 M1.0\n    G90\n    M83\n    G0 X68 Y-4 F30000\n    G0 Z0.3 F18000 ;Move to start position\n    M400\n    G0 X88 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X93 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X98 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X103 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X108 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X113 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 Y0 Z0 F20000\n    M400\n    \n    G1 X-13.5 Y0 Z10 F10000\n    M400\n    \n    G1 E10 F{outer_wall_volumetric_speed/2.4*60}\n    M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n    M106 P1 S178\n    M400 S7\n    G1 X0 F18000\n    G1 X-13.5 F3000\n    G1 X0 F18000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X-13.5 F3000\n    M400\n    M106 P1 S0\n\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n        M106 P1 S178\n        M400 S7\n        G1 X0 F18000\n        G1 X-13.5 F3000\n        G1 X0 F18000 ;wipe and shake\n        G1 X-13.5 F3000\n        G1 X0 F12000 ;wipe and shake\n        M400\n        M106 P1 S0\n    M623\n    \n    G1 X-13.5 F3000\n    M400\n    M984 A0.1 E1 S1 F{outer_wall_volumetric_speed/2.4} H[nozzle_diameter]\n    M106 P1 S178\n    M400 S7\n    G1 X0 F18000\n    G1 X-13.5 F3000\n    G1 X0 F18000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X-13.5 F3000\n    M400\n    M106 P1 S0\n\nM623 ; end of \"draw extrinsic para cali paint\"\n\n;===== extrude cali test ===============================\nM104 S{nozzle_temperature_initial_layer[initial_extruder]}\nG90\nM83\nG0 X68 Y-2.5 F30000\nG0 Z0.3 F18000 ;Move to start position\nG0 X88 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\nG0 X93 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X98 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 X103 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X108 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 X113 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X115 Z0 F20000\nG0 Z5\nM400\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\n\nM400 ; wait all motion done before implement the emprical L parameters\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type==\"Textured PEI Plate\"}\nG29.1 Z{-0.02} ; for Textured PEI Plate\n{endif}\n\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n\nM211 X0 Y0 Z0 ;turn off soft endstop\nM1007 S1\n\n\n\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 34
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; monotonic_travel_into_wall = 0%
; no_slow_down_for_cooling_on_outwalls = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.76
; nozzle_temperature = 230
; nozzle_temperature_initial_layer = 235
; nozzle_temperature_range_high = 250
; nozzle_temperature_range_low = 200
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 95%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; override_process_overhang_speed = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; prime_volume_mode = Default
; print_compatible_printers = "Bambu Lab A1 mini 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_in_clockwise = 0
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL A1M
; printable_area = 0x0,180x0,180x180,0x180
; printable_height = 180
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab A1 mini
; printer_notes = 
; printer_settings_id = Bambu Lab A1 mini 0.4 nozzle
; printer_structure = i3
; printer_technology = FFF
; printer_variant = 0.4
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction_mode = Auto
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 179
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = back
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = all
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; skirt_per_object = 1
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 8
; slow_down_min_speed = 10
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = gyroid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 0
; supertack_plate_temp_initial_layer = 0
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_cooling_filter = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_fast_purge_mode = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_ironing_direction = 0
; support_ironing_flow = 10%
; support_ironing_inset = 0
; support_ironing_pattern = zig-zag
; support_ironing_spacing = 0.15
; support_ironing_speed = 30
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 30
; template_custom_gcode = 
; textured_plate_temp = 30
; textured_plate_temp_initial_layer = 30
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != \"by object\"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X187 Y178 F20000\n      G39 S1 X187 Y178\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n\n\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_density = 100%
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_short_distance_acceleration = 250
; travel_speed = 700
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab P1S 0.4 nozzle";"Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle";"Bambu Lab X2D 0.4 nozzle";"Bambu Lab A2L 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = classic
; wall_loops = 4
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 15
; wipe_tower_y = 220
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R16
M201 X6000 Y6000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z5.00 E3.00
M106 S0
; FEATURE: Custom
;===== machine: A1 mini =========================
;===== date: 20260513 ==================

;===== start to heat heatbead&hotend==========
M1002 gcode_claim_action : 2
M1002 set_filament_type:TPU
M104 S170
M140 S30
G392 S0 ;turn off clog detect
M9833.2
;=====start printer sound ===================
M17
M400 S1
M1006 S1
M1006 A0 B0 L100 C37 D10 M100 E37 F10 N100
M1006 A0 B0 L100 C41 D10 M100 E41 F10 N100
M1006 A0 B0 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A43 B10 L100 C39 D10 M100 E46 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B0 L100 C39 D10 M100 E43 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B0 L100 C41 D10 M100 E41 F10 N100
M1006 A0 B0 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B0 L100 C49 D10 M100 E49 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A44 B10 L100 C39 D10 M100 E48 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B0 L100 C39 D10 M100 E44 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A43 B10 L100 C39 D10 M100 E46 F10 N100
M1006 W
M18
;=====avoid end stop =================
G91
G380 S2 Z30 F1200
G380 S3 Z-20 F1200
G1 Z5 F1200
G90

;===== reset machine status =================
M204 S6000

M630 S0 P0
G91
M17 Z0.3 ; lower the z-motor current

G90
M17 X0.7 Y0.9 Z0.5 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M83
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

;===== prepare print temperature and material ==========
M400
M18
M109 S100 H170
M104 S170
M400
M17
M400
G28 X

M211 X0 Y0 Z0 ;turn off soft endstop ; turn off soft endstop to prevent protential logic problem

M975 S1 ; turn on

G1 X0.0 F30000
G1 X-13.5 F3000

M620 M ;enable remap
M620 S0A   ; switch material if AMS exist
    G392 S0 ;turn on clog detect
    M1002 gcode_claim_action : 4
    M400
    M1002 set_filament_type:UNKNOWN
    M109 S235

    M104 S250

    M400
    T0
    G1 X-13.5 F3000
    M400

    M620.1 E F74.8347 T250
    M109 S250 ;set nozzle to common flush temp

    M106 P1 S0
    G92 E0
M73 P2 R15
    G1 E50 F200
    M400
    M1002 set_filament_type:TPU

    M104 S250

    G92 E0
    G1 E50 F74.8347
    M400
    M106 P1 S178
    G92 E0
M73 P4 R15
    G1 E5 F74.8347
    M109 S215 ; drop nozzle temp, make filament shink a bit
    M104 S195
    G92 E0
M73 P8 R15
    G1 E-0.5 F300

    G1 X0 F30000
    G1 X-13.5 F3000
M73 P9 R15
    G1 X0 F30000 ;wipe and shake
M73 P9 R14
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X0 F30000
    G1 X-13.5 F3000
    M109 S195
    G392 S0 ;turn off clog detect
M621 S0A

M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== mech mode fast check============================
M1002 gcode_claim_action : 3
G0 X25 Y175 F20000 ; find a soft place to home
;M104 S0
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
M104 S170

; build plate detect
M1002 judge_flag build_plate_detect_flag
M622 S1
  G39.4
  M400
M623

G1 Z5 F3000
G1 X90 Y-1 F30000
M400 P200
M970.3 Q1 A7 K0 O2
M974 Q1 S2 P0

G1 X90 Y0 Z5 F30000
M400 P200
M970 Q0 A10 B50 C90 H15 K0 M20 O3
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X-1 Y10
G28 X ; re-home XY

;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1

M104 S170 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)
M211 S; push soft endstop status
M211 X0 Y0 Z0 ;turn off Z axis endstop

M83
G1 E-1 F500
G90
M83

M109 S170
M104 S140
G0 X90 Y-4 F30000
G380 S3 Z-5 F1200
M73 P35 R10
G1 Z2 F1200
G1 X91 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X92 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X93 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X94 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X95 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X96 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X97 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X98 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200

G1 Z5 F30000
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
G1 X25 Y175 F30000.1 ;Brush material
G1 Z0.2 F30000.1
G1 Y185
G91
G1 X-30 F30000
G1 Y-2
G1 X27
G1 Y1.5
G1 X-28
G1 Y-2
G1 X30
G1 Y1.5
G1 X-30
G90
M83

G1 Z5 F3000
G0 X50 Y175 F20000 ; find a soft place to home
G28 Z P0 T300; home z with low precision, permit 300deg temperature
G29.2 S0 ; turn off ABL

G0 X85 Y185 F10000 ;move to exposed steel surface and stop the nozzle
G0 Z-1.01 F10000
G91

G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

G90
M73 P36 R10
G1 Z5 F30000
G1 X25 Y175 F30000.1 ;Brush material
G1 Z0.2 F30000.1
G1 Y185
G91
G1 X-30 F30000
G1 Y-2
G1 X27
G1 Y1.5
G1 X-28
G1 Y-2
G1 X30
G1 Y1.5
G1 X-30
G90
M83

G1 Z5
G0 X55 Y175 F20000 ; find a soft place to home
G28 Z P0 T300; home z with low precision, permit 300deg temperature
G29.2 S0 ; turn off ABL

G1 Z10
G1 X85 Y185
G1 Z-1.01
G1 X95
G1 X90

M211 R; pop softend status

M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== wait heatbed  ====================
M1002 gcode_claim_action:54
M104 S0
M190 S30;set bed temp
M109 S140

G1 Z5 F3000
G29.2 S1
G1 X10 Y10 F20000

;===== bed leveling ==================================
;M1002 set_flag g29_before_print_flag=1
M1002 judge_flag g29_before_print_flag
M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X70.2725 Y81.7015 I39.4549 J16.5967
    M400
    M500 ; save cali data
M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28 T145

M623

;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression
;===== nozzle load line ===============================
M975 S1
G90
M83
T1000

G1 X-13.5 Y0 Z10 F10000
G1 E1.2 F500
M400
M1002 set_filament_type:UNKNOWN
M109 S230
M400

M412 S1 ;    ===turn on  filament runout detection===
M400 P10

G392 S0 ;turn on clog detect

M620.3 W1; === turn on filament tangle detection===
M400 S2

M1002 set_filament_type:TPU
;M1002 set_flag extrude_cali_flag=1
M1002 judge_flag extrude_cali_flag
M622 J1
    M1002 gcode_claim_action : 8
    
    M400
    M900 K0.0 L1000.0 M1.0
    G90
    M83
    G0 X68 Y-4 F30000
    G0 Z0.3 F18000 ;Move to start position
    M400
    G0 X88 E10  F180
    G0 X93 E.3742  F300
    G0 X98 E.3742  F1200
    G0 X103 E.3742  F300
    G0 X108 E.3742  F1200
    G0 X113 E.3742  F300
    G0 Y0 Z0 F20000
    M400
    
    G1 X-13.5 Y0 Z10 F10000
    M400
    
    G1 E10 F75
    M983 F1.25 A0.3 H0.4; cali dynamic extrusion compensation
    M106 P1 S178
    M400 S7
    G1 X0 F18000
    G1 X-13.5 F3000
    G1 X0 F18000 ;wipe and shake
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X-13.5 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F1.25 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S178
        M400 S7
        G1 X0 F18000
        G1 X-13.5 F3000
        G1 X0 F18000 ;wipe and shake
        G1 X-13.5 F3000
        G1 X0 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
M73 P37 R10
    G1 X-13.5 F3000
    M400
    M984 A0.1 E1 S1 F1.25 H0.4
    M106 P1 S178
    M400 S7
    G1 X0 F18000
M73 P38 R10
    G1 X-13.5 F3000
    G1 X0 F18000 ;wipe and shake
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X-13.5 F3000
    M400
    M106 P1 S0

M623 ; end of "draw extrinsic para cali paint"

;===== extrude cali test ===============================
M104 S235
G90
M83
G0 X68 Y-2.5 F30000
G0 Z0.3 F18000 ;Move to start position
G0 X88 E10  F180
G0 X93 E.3742  F300
G0 X98 E.3742  F1200
G0 X103 E.3742  F300
G0 X108 E.3742  F1200
G0 X113 E.3742  F300
G0 X115 Z0 F20000
G0 Z5
M400

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0

M400 ; wait all motion done before implement the emprical L parameters

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.02 ; for Textured PEI Plate


M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000

M211 X0 Y0 Z0 ;turn off soft endstop
M1007 S1



; MACHINE_START_GCODE_END
; filament start gcode
 
;VT0 H-1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.4 F1800
; layer num/total_layer_count: 1/65
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 25
G1 X81.556 Y93.076 F42000
M204 S6000
G1 Z.4
M73 P39 R9
G1 Z.2
M73 P40 R9
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1969.022
M204 S500
G1 X81.265 Y93.055 E.0111
G3 X81.432 Y86.926 I.385 J-3.056 E.34484
G3 X82.918 Y87.192 I.183 J3.268 E.0579
G3 X81.682 Y93.079 I-1.268 J2.807 E.31686
G1 X81.616 Y93.077 E.00251
M204 S6000
M73 P41 R9
G1 X81.585 Y92.62 F42000
G1 F1969.022
M204 S500
G1 X81.319 Y92.601 E.01011
G3 X81.467 Y87.383 I.331 J-2.602 E.29357
G3 X82.731 Y87.609 I.154 J2.78 E.04923
G3 X81.68 Y92.622 I-1.081 J2.39 E.26966
G1 X81.645 Y92.621 E.00136
M204 S6000
G1 X81.613 Y92.164 F42000
G1 F1969.022
M204 S500
G1 X81.373 Y92.147 E.00913
G3 X81.502 Y87.84 I.277 J-2.147 E.24231
G3 X82.543 Y88.027 I.124 J2.291 E.04057
G3 X81.678 Y92.164 I-.893 J1.972 E.22247
G1 X81.673 Y92.164 E.00021
M204 S6000
M73 P42 R9
G1 X81.627 Y91.705 F42000
; FEATURE: Outer wall
G1 F1969.022
M204 S500
G1 X81.262 Y91.66 E.014
G3 X81.537 Y88.296 I.389 J-1.661 E.18447
G3 X81.955 Y88.32 I.102 J1.9 E.01593
G3 X81.687 Y91.704 I-.304 J1.679 E.1907
; WIPE_START
G1 X81.262 Y91.66 E-.0813
G1 X81.023 Y91.59 E-.04736
G1 X80.735 Y91.44 E-.06157
G1 X80.523 Y91.285 E-.04997
G1 X80.245 Y90.972 E-.07946
G1 X80.118 Y90.757 E-.04745
G1 X80.091 Y90.695 E-.0129
; WIPE_END
G1 E-.02 F1800
M204 S6000
G1 X81.667 Y96.57 Z.6 F42000
G1 Z.2
G1 E.4 F1800
; FEATURE: Inner wall
G1 F1969.022
M204 S500
G1 X81.506 Y96.567 E.00609
G3 X78.413 Y95.72 I.14 J-6.582 E.12312
G3 X76.18 Y93.65 I3.309 J-5.812 E.11674
G1 X75.186 Y91.958 E.07459
G1 X72.961 Y92.325 E.08571
G3 X72.675 Y90.59 I-.181 J-.861 E.10796
G1 X74.9 Y90.224 E.0857
G1 X75.298 Y88.302 E.07459
G3 X82.405 Y83.47 I6.357 J1.708 E.3559
G3 X87.433 Y86.871 I-.803 J6.604 E.23957
G1 X88.378 Y88.892 E.08481
G1 X88.132 Y91.11 E.08483
G3 X82.208 Y96.544 I-6.486 J-1.126 E.32864
G1 X81.726 Y96.567 E.01832
; WIPE_START
G1 X81.506 Y96.567 E-.04185
G1 X80.701 Y96.508 E-.15336
G1 X79.878 Y96.333 E-.15995
G1 X79.754 Y96.29 E-.02484
; WIPE_END
G1 E-.02 F1800
M204 S6000
G1 X86.768 Y93.281 Z.6 F42000
G1 X102.369 Y86.586 Z.6
G1 Z.2
G1 E.4 F1800
G1 F1969.022
M204 S500
G1 X102.834 Y85.133 E.05796
G3 X105.767 Y83.459 I2.506 J.985 E.13874
G3 X103.275 Y87.813 I-.439 J2.638 E.39147
G1 X102.405 Y86.634 E.05568
; WIPE_START
G1 X102.834 Y85.133 E-.29655
G1 X102.958 Y84.863 E-.05647
G1 X103.032 Y84.743 E-.02698
; WIPE_END
G1 E-.02 F1800
M204 S6000
G1 X96.416 Y88.547 Z.6 F42000
G1 X81.669 Y97.025 Z.6
G1 Z.2
G1 E.4 F1800
G1 F1969.022
M204 S500
G1 X81.502 Y97.023 E.00634
G3 X78.17 Y96.106 I.153 J-7.073 E.13271
G3 X75.799 Y93.905 I3.582 J-6.234 E.12401
G1 X74.951 Y92.46 E.06369
G1 X73.022 Y92.778 E.0743
G3 X72.588 Y90.142 I-.24 J-1.314 E.16127
G1 X74.516 Y89.824 E.07429
G1 X74.856 Y88.183 E.06369
G3 X84.04 Y83.393 I6.796 J1.832 E.44238
G1 X84.159 Y83.43 E.00473
G3 X85.578 Y84.167 I-2.628 J6.796 E.06088
G1 X86.288 Y84.713 E.03404
G3 X87.836 Y86.653 I-5.21 J5.746 E.09473
G1 X88.589 Y88.264 E.06759
G1 X102.063 Y86.043 E.51901
G1 X102.407 Y84.967 E.0429
G3 X105.819 Y83.005 I2.933 J1.152 E.16158
G3 X102.924 Y88.107 I-.492 J3.093 E.45923
G1 X102.254 Y87.199 E.0429
G1 X88.78 Y89.42 E.51902
G1 X88.583 Y91.188 E.06759
G3 X86.136 Y95.419 I-7.103 J-1.285 E.18951
G1 X85.411 Y95.945 E.03406
G3 X82.367 Y96.989 I-3.756 J-5.995 E.12341
G1 X81.729 Y97.022 E.02427
M204 S6000
G1 X81.695 Y97.484 F42000
G1 F1969.022
M204 S500
G1 X81.498 Y97.487 E.00749
G3 X80.565 Y97.414 I.125 J-7.611 E.03558
G1 X79.635 Y97.216 E.03613
G3 X75.419 Y94.16 I2.09 J-7.32 E.20203
G1 X74.716 Y92.962 E.05278
G1 X73.083 Y93.231 E.06289
G3 X72.5 Y89.693 I-.309 J-1.766 E.21541
G1 X74.132 Y89.424 E.06289
G1 X74.414 Y88.064 E.05278
G3 X77.429 Y83.813 I7.382 J2.042 E.20211
G3 X78.243 Y83.33 I21.492 J35.272 E.03597
G3 X84.175 Y82.957 I3.4 J6.709 E.23226
G1 X84.321 Y83.002 E.0058
G3 X85.835 Y83.788 I-2.848 J7.337 E.06497
G1 X86.589 Y84.368 E.03612
G3 X88.239 Y86.435 I-5.555 J6.126 E.10095
G1 X88.857 Y87.757 E.05545
G1 X101.713 Y85.637 E.49522
G3 X101.985 Y84.791 I8.573 J2.288 E.03379
M73 P43 R9
G3 X105.871 Y82.551 I3.354 J1.329 E.18397
G3 X102.563 Y88.387 I-.544 J3.547 E.5277
G1 X102.052 Y87.695 E.03269
G1 X89.196 Y89.815 E.49522
G1 X89.035 Y91.265 E.05545
G3 X86.427 Y95.773 I-7.514 J-1.339 E.20199
G1 X85.658 Y96.331 E.03613
G3 X82.278 Y97.46 I-4.034 J-6.455 E.1367
G1 X81.755 Y97.482 E.01988
M204 S6000
G1 X81.709 Y97.941 F42000
; FEATURE: Outer wall
G1 F1969.022
M204 S500
G1 X81.494 Y97.945 E.00819
G3 X80.497 Y97.867 I.129 J-8.071 E.03802
G1 X79.514 Y97.658 E.0382
G3 X75.038 Y94.414 I2.223 J-7.778 E.21442
G1 X74.48 Y93.464 E.04188
G1 X73.144 Y93.684 E.05149
G3 X72.412 Y89.244 I-.37 J-2.219 E.26894
G1 X73.748 Y89.024 E.05149
G1 X73.971 Y87.945 E.04188
G3 X76.385 Y84.051 I7.888 J2.193 E.17647
G3 X78.785 Y82.592 I5.291 J6.001 E.10731
G1 X79.736 Y82.287 E.03794
G3 X80.721 Y82.106 I3.538 J16.502 E.03806
G3 X84.312 Y82.521 I.878 J8.166 E.13854
G1 X84.483 Y82.574 E.0068
G3 X86.093 Y83.41 I-3.069 J7.879 E.06907
G1 X86.889 Y84.023 E.0382
G3 X88.641 Y86.217 I-5.901 J6.507 E.10718
G1 X89.124 Y87.249 E.04331
G1 X101.363 Y85.232 E.47143
G3 X103.549 Y82.461 I4.102 J.99 E.1384
G3 X105.924 Y82.097 I1.792 J3.764 E.0926
G3 X102.202 Y88.668 I-.596 J4.002 E.59609
G1 X101.851 Y88.192 E.0225
G1 X89.612 Y90.209 E.47143
G1 X89.486 Y91.342 E.04331
G3 X88.531 Y93.982 I-8.634 J-1.629 E.10719
G1 X87.973 Y94.818 E.0382
G3 X86.717 Y96.126 I-6.69 J-5.167 E.06905
G1 X85.904 Y96.717 E.0382
G3 X82.313 Y97.916 I-4.281 J-6.843 E.14526
G1 X81.769 Y97.938 E.02066
; WIPE_START
G1 X81.494 Y97.945 E-.05232
G1 X80.497 Y97.867 E-.18993
G1 X79.788 Y97.716 E-.13775
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X88.622 Y89.214 F42000
G1 Z.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.624696
G1 F1546.987
M204 S500
G1 X88.708 Y89.11 E.00655
; LINE_WIDTH: 0.662664
G1 F1452.214
G1 X88.794 Y89.005 E.00697
; LINE_WIDTH: 0.700631
G1 F1368.383
G1 X88.879 Y88.9 E.0074
; LINE_WIDTH: 0.738598
G1 F1293.702
G1 X88.965 Y88.796 E.00783
; LINE_WIDTH: 0.757589
G1 F1259.326
G1 X101.763 Y86.686 E.7708
; WIPE_START
G1 X99.79 Y87.011 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G1 X105.428 Y83.608 Z.6 F42000
G1 Z.2
G1 E.4 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50009
G1 F1968.633
M204 S500
G1 X107.591 Y85.771 E.11629
G3 X107.59 Y86.416 I-2.219 J.317 E.0246
G1 X105.012 Y83.839 E.13854
G2 X104.5 Y83.973 I.274 J2.098 E.0202
G1 X107.455 Y86.928 E.15885
G3 X107.237 Y87.356 I-2.081 J-.788 E.01831
G1 X104.071 Y84.191 E.17019
G2 X103.718 Y84.484 I1.594 J2.274 E.01747
G1 X106.946 Y87.712 E.17352
G3 X106.59 Y88.003 I-2.524 J-2.719 E.01748
G1 X103.428 Y84.841 E.17001
G2 X103.202 Y85.262 I1.64 J1.151 E.0182
G1 X106.165 Y88.224 E.15928
G3 X105.652 Y88.358 I-.882 J-2.329 E.02018
G1 X103.044 Y85.75 E.14021
G1 X102.888 Y86.24 E.01955
G1 X105.231 Y88.583 E.12597
; WIPE_START
G1 X103.817 Y87.169 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G1 X96.186 Y86.997 Z.6 F42000
G1 X87.17 Y86.793 Z.6
G1 Z.2
G1 E.4 F1800
; LINE_WIDTH: 0.5084
G1 F1933.488
M204 S500
G1 X85.721 Y85.344 E.07931
M73 P44 R9
G1 X85.101 Y84.867 E.03026
G2 X84.01 Y84.291 I-3.09 J4.533 E.04785
G1 X87.369 Y87.65 E.18382
G1 X87.947 Y88.886 E.05282
G1 X83.037 Y83.976 E.26875
G1 X82.252 Y83.849 E.03079
G1 X87.918 Y89.516 E.31018
G1 X87.853 Y90.108 E.02307
G1 X81.566 Y83.822 E.34408
G1 X80.942 Y83.856 E.0242
G1 X87.787 Y90.701 E.37465
G3 X87.696 Y91.268 I-2.372 J-.09 E.02229
G1 X80.383 Y83.956 E.40026
G2 X79.858 Y84.089 I.311 J2.324 E.02101
G1 X82.387 Y86.617 E.13838
G1 X82.257 Y86.582 E.0052
G2 X81.647 Y86.536 I-.514 J2.737 E.02374
G1 X79.371 Y84.26 E.12459
G1 X78.912 Y84.459 E.01937
G1 X81.043 Y86.59 E.11665
G2 X80.517 Y86.723 I.706 J3.895 E.02099
G1 X78.491 Y84.697 E.11091
G2 X78.086 Y84.95 I.868 J1.837 E.01853
G1 X80.058 Y86.922 E.10793
G2 X79.65 Y87.173 I.809 J1.772 E.01857
G1 X77.713 Y85.235 E.10603
G2 X77.37 Y85.551 I1.228 J1.68 E.01807
G1 X79.291 Y87.471 E.10512
G2 X78.97 Y87.808 I.848 J1.129 E.0181
G1 X77.043 Y85.881 E.10549
G1 X76.748 Y86.245 E.01812
G1 X78.694 Y88.191 E.1065
G2 X78.469 Y88.625 I1.58 J1.092 E.01896
G1 X76.475 Y86.63 E.10917
G1 X76.223 Y87.037 E.01851
G1 X78.298 Y89.111 E.11355
G2 X78.2 Y89.672 I2.265 J.684 E.02208
G1 X76.009 Y87.481 E.11994
G2 X75.824 Y87.955 I1.936 J1.026 E.01972
G1 X78.44 Y90.57 E.14317
; WIPE_START
G1 X77.026 Y89.156 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G1 X84.656 Y88.979 Z.6 F42000
G1 X84.746 Y88.977 Z.6
G1 Z.2
G1 E.4 F1800
G1 F1933.488
M204 S500
G1 X87.569 Y91.8 E.15453
G1 X87.395 Y92.284 E.0199
G1 X85.116 Y90.005 E.1247
G3 X85.058 Y90.605 I-2.091 J.099 E.0234
G1 X87.187 Y92.735 E.11656
G3 X86.961 Y93.166 I-1.81 J-.676 E.01892
G1 X84.93 Y91.136 E.11112
G3 X84.724 Y91.588 I-2.437 J-.839 E.01926
G1 X86.697 Y93.561 E.10799
G3 X86.414 Y93.936 I-1.746 J-1.024 E.01823
G1 X84.48 Y92.002 E.10585
G3 X84.185 Y92.365 I-1.842 J-1.197 E.01815
G1 X86.107 Y94.287 E.10521
G1 X85.767 Y94.606 E.01803
G1 X83.843 Y92.682 E.1053
G3 X83.46 Y92.957 I-1.457 J-1.624 E.01829
G1 X85.407 Y94.904 E.10654
G1 X85.025 Y95.181 E.01824
G1 X83.025 Y93.181 E.10946
G3 X82.543 Y93.356 I-1.035 J-2.095 E.01992
G1 X84.608 Y95.422 E.11307
G3 X84.172 Y95.644 I-1.194 J-1.801 E.01898
G1 X81.972 Y93.444 E.12042
G3 X81.321 Y93.451 I-.345 J-1.942 E.02534
G1 X83.705 Y95.836 E.13053
G1 X83.193 Y95.981 E.02062
G1 X80.473 Y93.261 E.14888
G3 X78.385 Y91.173 I1.201 J-3.289 E.11798
G1 X75.663 Y88.452 E.14897
G1 X75.551 Y88.997 E.02156
G1 X82.649 Y96.096 E.38853
G3 X82.064 Y96.169 I-.609 J-2.476 E.02286
G1 X75.438 Y89.543 E.36271
G1 X75.325 Y90.088 E.02156
G1 X81.415 Y96.178 E.33333
G1 X80.686 Y96.108 E.02832
G1 X75.154 Y90.575 E.30284
G1 X74.589 Y90.669 E.02217
G1 X79.826 Y95.906 E.28667
G1 X79.365 Y95.75 E.01884
G1 X78.699 Y95.437 E.02845
G1 X76.229 Y92.967 E.1352
G1 X75.387 Y91.532 E.06442
G1 X74.876 Y91.614 E.02002
G1 X74.024 Y90.762 E.04666
G1 X73.458 Y90.855 E.02217
G1 X74.309 Y91.705 E.04656
G1 X73.742 Y91.797 E.02223
G1 X72.893 Y90.948 E.04645
G2 X72.421 Y91.134 I.003 J.702 E.0201
G1 X73.175 Y91.888 E.04127
G1 X72.792 Y91.95 E.01502
G3 X72.479 Y91.851 I-.004 J-.531 E.01289
G1 X72.082 Y91.454 E.02172
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F1933.488
G1 X72.479 Y91.851 E-.10663
G1 X72.563 Y91.904 E-.01892
G1 X72.674 Y91.94 E-.02221
G1 X72.792 Y91.95 E-.02233
G1 X73.175 Y91.888 E-.07375
G1 X72.668 Y91.381 E-.13616
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 2/65
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
; open powerlost recovery
M1003 S1
M104 S230 ; set nozzle temperature
; OBJECT_ID: 25
M204 S10000
G17
G3 Z.6 I-.183 J1.203 P1  F42000
G1 X81.836 Y92.777 Z.6
G1 Z.4
M73 P45 R9
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G1 X81.694 Y92.788 E.00483
G3 X81.462 Y87.213 I-.045 J-2.79 E.29196
G3 X83.393 Y87.817 I.16 J2.873 E.06996
G3 X84.413 Y89.546 I-1.92 J2.299 E.06929
G1 X84.439 Y90.043 E.01684
G3 X82.232 Y92.726 I-2.79 J-.046 E.12696
G1 X81.896 Y92.77 E.01146
M204 S10000
G1 X81.593 Y92.38 F42000
G1 F2210.87
M204 S6000
G1 X81.285 Y92.353 E.01045
G3 X81.497 Y87.62 I.364 J-2.355 E.23587
G3 X82.645 Y87.832 I.135 J2.479 E.03989
G3 X84.009 Y89.613 I-1.078 J2.239 E.07877
G1 X84.032 Y90.049 E.01479
G3 X81.695 Y92.381 I-2.383 J-.051 E.12344
G1 X81.653 Y92.38 E.00142
M204 S10000
G1 X81.609 Y91.971 F42000
G1 F2210.87
M204 S6000
G1 X81.22 Y91.923 E.01329
G3 X81.531 Y88.027 I.432 J-1.926 E.19106
G3 X82.887 Y88.458 I.069 J2.133 E.04912
G3 X81.695 Y91.97 I-1.236 J1.539 E.16322
G1 X81.669 Y91.97 E.00088
M204 S250
G1 X81.652 Y91.583 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G1 X81.384 Y91.563 E.00843
G1 X81.313 Y91.55 E.00225
G1 X81.016 Y91.453 E.00982
G1 X80.952 Y91.424 E.0022
G3 X80.685 Y91.257 I4.758 J-7.914 E.00988
G1 X80.629 Y91.213 E.00224
G1 X80.411 Y90.988 E.00982
G1 X80.367 Y90.931 E.00225
G1 X80.21 Y90.661 E.00982
G1 X80.181 Y90.595 E.00225
G1 X80.093 Y90.295 E.00982
G1 X80.081 Y90.224 E.00225
G1 X80.068 Y89.911 E.00983
G1 X80.074 Y89.84 E.00224
G1 X80.136 Y89.533 E.00982
G1 X80.16 Y89.465 E.00224
G1 X80.294 Y89.182 E.00982
G1 X80.333 Y89.122 E.00225
G1 X80.531 Y88.879 E.00982
G1 X80.583 Y88.831 E.00223
G3 X80.836 Y88.642 I4.566 J5.837 E.00989
G1 X80.897 Y88.608 E.00219
G1 X81.185 Y88.486 E.00982
G1 X81.254 Y88.468 E.00225
G1 X81.564 Y88.418 E.00982
G1 X81.635 Y88.418 E.00225
G1 X81.947 Y88.444 E.00982
G1 X82.016 Y88.461 E.00223
G3 X82.317 Y88.563 I-1.122 J3.789 E.00995
G1 X82.376 Y88.594 E.00212
G3 X82.644 Y88.766 I-1.771 J3.053 E.00996
G1 X82.694 Y88.811 E.00212
G1 X82.91 Y89.038 E.00982
G1 X82.95 Y89.097 E.00225
G1 X83.105 Y89.37 E.00982
G1 X83.129 Y89.437 E.00225
G3 X83.232 Y90.061 I-1.327 J.539 E.02001
G3 X83.221 Y90.192 I-.535 J.022 E.00413
G1 X83.171 Y90.441 E.00796
G1 X83.154 Y90.505 E.00208
G3 X83.021 Y90.795 I-2.974 J-1.191 E.00999
G1 X82.986 Y90.856 E.00221
G1 X82.79 Y91.101 E.00982
G1 X82.741 Y91.153 E.00224
G1 X82.492 Y91.343 E.00982
G1 X82.432 Y91.381 E.00225
G1 X82.144 Y91.506 E.00982
G1 X82.079 Y91.528 E.00216
G3 X81.767 Y91.581 I-1.025 J-5.051 E.00992
G1 X81.712 Y91.585 E.00174
; WIPE_START
M204 S6000
G1 X81.384 Y91.563 E-.06244
G1 X81.313 Y91.55 E-.01362
G1 X81.016 Y91.453 E-.05949
G1 X80.952 Y91.424 E-.01333
G1 X80.685 Y91.257 E-.05984
G1 X80.629 Y91.213 E-.01355
G1 X80.411 Y90.988 E-.0595
G1 X80.367 Y90.931 E-.01363
G1 X80.21 Y90.661 E-.0595
G1 X80.181 Y90.595 E-.01361
G1 X80.164 Y90.537 E-.01149
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X81.688 Y96.579 Z.8 F42000
G1 Z.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G1 X81.657 Y96.577 E.00104
G3 X81.159 Y96.556 I.005 J-5.958 E.01688
G3 X79.802 Y96.317 I.703 J-7.977 E.04671
G3 X78.559 Y95.811 I2.744 J-8.514 E.04545
G1 X77.749 Y95.301 E.03242
G3 X76.753 Y94.395 I5.512 J-7.063 E.04561
G3 X76.173 Y93.65 I14.762 J-12.083 E.03195
G1 X75.284 Y92.149 E.05904
G1 X72.989 Y92.528 E.07874
G3 X72.636 Y90.389 I-.208 J-1.064 E.11747
G1 X74.931 Y90.011 E.07873
G1 X75.292 Y88.304 E.05904
G3 X75.782 Y87.029 I8.694 J2.614 E.04628
G3 X77.872 Y84.614 I6.086 J3.154 E.10913
G3 X79.951 Y83.645 I3.972 J5.811 E.07795
G3 X81.313 Y83.441 I1.694 J6.66 E.0467
G3 X82.728 Y83.516 I.396 J5.946 E.04809
G1 X83.146 Y83.593 E.01438
G1 X84.06 Y83.878 E.03241
G3 X85.253 Y84.495 I-3.505 J8.238 E.0455
G3 X86.923 Y86.066 I-3.931 J5.852 E.07795
G3 X87.431 Y86.854 I-11.594 J8.028 E.03176
G1 X88.244 Y88.576 E.06446
G1 X102.468 Y86.231 E.48796
G3 X102.847 Y85.087 I12.986 J3.668 E.04083
G3 X105.585 Y83.438 I2.477 J1.016 E.11594
G3 X106.019 Y83.507 I-.13 J2.201 E.0149
G1 X106.501 Y83.687 E.01741
G1 X106.617 Y83.747 E.00442
G1 X107.043 Y84.035 E.01741
G3 X103.218 Y87.75 I-1.713 J2.062 E.30441
G1 X102.576 Y86.89 E.03631
G1 X88.352 Y89.235 E.48796
G1 X88.135 Y91.127 E.06446
G3 X87.763 Y92.435 I-8.846 J-1.81 E.04609
G3 X86.555 Y94.383 I-6.561 J-2.719 E.07792
G3 X85.898 Y95.028 I-6.349 J-5.817 E.03117
G1 X85.124 Y95.591 E.03241
G3 X83.914 Y96.18 I-4.515 J-7.738 E.04557
G3 X82.575 Y96.507 I-2.41 J-6.963 E.04675
G3 X82.081 Y96.562 I-.912 J-5.888 E.01683
M73 P45 R8
G1 X81.748 Y96.577 E.01127
M204 S10000
G1 X81.701 Y96.986 F42000
G1 F2210.87
M204 S6000
G1 X81.654 Y96.984 E.00159
G3 X81.132 Y96.962 I.009 J-6.365 E.01769
G3 X80.202 Y96.823 I.116 J-3.95 E.0319
G3 X78.774 Y96.365 I1.219 J-6.249 E.05087
G1 X78.362 Y96.168 E.01544
G1 X77.511 Y95.632 E.03406
G3 X76.446 Y94.664 I5.821 J-7.47 E.04875
G3 X75.834 Y93.878 I15.588 J-12.757 E.03373
G1 X75.076 Y92.596 E.0504
G1 X73.043 Y92.931 E.06974
G3 X72.558 Y89.989 I-.26 J-1.468 E.15975
G1 X74.591 Y89.654 E.06973
G1 X74.898 Y88.197 E.0504
G3 X75.42 Y86.842 I9.156 J2.75 E.04923
G3 X75.922 Y85.997 I9.819 J5.268 E.03326
G1 X76.557 Y85.217 E.03405
G3 X77.642 Y84.277 I6.722 J6.666 E.04864
G3 X78.5 Y83.763 I22.996 J37.393 E.03386
G3 X79.849 Y83.251 I4.035 J8.597 E.04889
G3 X81.294 Y83.035 I1.797 J7.081 E.04952
G3 X82.792 Y83.114 I.415 J6.354 E.05089
G1 X83.244 Y83.197 E.01554
G1 X84.204 Y83.496 E.03406
G3 X85.48 Y84.156 I-3.7 J8.716 E.04867
G3 X86.275 Y84.761 I-19.547 J26.512 E.0338
G3 X87.252 Y85.825 I-6.494 J6.941 E.04895
G3 X87.789 Y86.66 I-12.269 J8.492 E.03359
G1 X88.481 Y88.125 E.05484
G1 X102.157 Y85.87 E.46918
G3 X102.471 Y84.93 I10.68 J3.042 E.03357
G3 X105.632 Y83.033 I2.853 J1.173 E.13372
G3 X106.136 Y83.117 I-.164 J2.56 E.01733
G1 X106.666 Y83.314 E.01912
G1 X106.825 Y83.396 E.00607
G1 X107.293 Y83.713 E.01912
G3 X102.898 Y88.001 I-1.963 J2.384 E.35111
G1 X102.398 Y87.332 E.02825
G1 X88.722 Y89.587 E.46918
G1 X88.537 Y91.196 E.05485
G3 X88.14 Y92.59 I-9.333 J-1.906 E.04909
G3 X86.857 Y94.657 I-6.944 J-2.878 E.08273
G3 X86.157 Y95.343 I-6.754 J-6.194 E.03317
G1 X85.343 Y95.935 E.03406
G3 X84.05 Y96.564 I-4.78 J-8.178 E.04872
G3 X82.63 Y96.91 I-2.55 J-7.377 E.04956
G3 X82.111 Y96.968 I-.967 J-6.291 E.01766
G1 X81.761 Y96.983 E.01189
M204 S10000
G1 X81.713 Y97.393 F42000
G1 F2210.87
M204 S6000
G1 X81.65 Y97.395 E.00214
G3 X78.166 Y96.525 I.038 J-7.567 E.12273
G1 X77.273 Y95.963 E.0357
G3 X76.14 Y94.933 I6.136 J-7.883 E.05189
G3 X75.496 Y94.105 I16.439 J-13.449 E.03551
G1 X74.867 Y93.043 E.04176
G1 X73.097 Y93.335 E.06073
G3 X72.48 Y89.59 I-.323 J-1.87 E.20285
G1 X74.25 Y89.298 E.06073
G1 X74.504 Y88.091 E.04176
G3 X75.059 Y86.654 I9.618 J2.886 E.05218
G3 X75.591 Y85.76 I10.401 J5.584 E.03522
G1 X76.256 Y84.942 E.0357
G3 X77.412 Y83.94 I7.096 J7.027 E.05183
G3 X78.314 Y83.4 I24.069 J39.136 E.03558
G3 X79.748 Y82.856 I4.255 J9.054 E.05198
G3 X81.275 Y82.628 I1.899 J7.5 E.05234
G3 X82.856 Y82.712 I.434 J6.761 E.05369
G1 X83.341 Y82.801 E.01671
G1 X84.348 Y83.115 E.0357
G3 X85.707 Y83.818 I-3.896 J9.197 E.05184
G3 X86.543 Y84.454 I-20.584 J27.916 E.03555
G3 X87.581 Y85.585 I-6.832 J7.309 E.05201
G3 X88.147 Y86.465 I-12.939 J8.953 E.03543
G1 X88.718 Y87.673 E.04523
G1 X101.847 Y85.509 E.45041
G3 X102.663 Y83.842 I4.389 J1.117 E.06325
G3 X105.679 Y82.629 I2.659 J2.253 E.11446
G3 X106.254 Y82.726 I-.197 J2.918 E.01978
G1 X106.831 Y82.941 E.02083
G1 X107.033 Y83.045 E.00772
G1 X107.543 Y83.391 E.02084
G3 X107.765 Y88.606 I-2.239 J2.708 E.19917
G1 X107.287 Y88.995 E.02083
G3 X102.577 Y88.252 I-1.954 J-2.914 E.17745
G1 X102.22 Y87.774 E.02018
G1 X89.091 Y89.938 E.45041
G1 X88.938 Y91.266 E.04523
G3 X88.517 Y92.744 I-9.818 J-2.002 E.05209
G3 X87.787 Y94.104 I-6.874 J-2.814 E.05235
G3 X86.777 Y95.323 I-5.686 J-3.682 E.05369
G1 X86.416 Y95.658 E.01667
G1 X85.563 Y96.278 E.0357
G3 X84.186 Y96.948 I-5.045 J-8.618 E.05188
G3 X83.179 Y97.239 I-7.431 J-23.879 E.03548
G3 X82.142 Y97.37 I-1.78 J-9.857 E.0354
G1 X81.773 Y97.39 E.0125
M204 S250
G1 X81.726 Y97.785 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
M73 P46 R8
G1 X81.647 Y97.787 E.00248
G3 X79.477 Y97.48 I.149 J-8.879 E.06889
G3 X77.976 Y96.869 I3.195 J-9.99 E.05085
G1 X77.044 Y96.282 E.03454
G3 X75.845 Y95.192 I6.438 J-8.28 E.05087
G3 X74.666 Y93.474 I7.456 J-6.377 E.06544
G1 X73.149 Y93.724 E.04823
G3 X72.404 Y89.205 I-.376 J-2.259 E.22577
G1 X73.922 Y88.955 E.04822
G1 X74.125 Y87.988 E.03098
G3 X74.711 Y86.473 I10.067 J3.019 E.05096
G3 X75.271 Y85.531 I10.958 J5.886 E.03439
G1 X75.966 Y84.677 E.03453
G3 X77.191 Y83.616 I7.456 J7.373 E.05085
G3 X78.135 Y83.05 I25.08 J40.777 E.0345
G3 X79.651 Y82.476 I4.466 J9.494 E.0509
G3 X80.729 Y82.266 I4.075 J18.126 E.03444
G3 X82.353 Y82.249 I.927 J10.464 E.05095
G3 X83.435 Y82.42 I-1.252 J11.436 E.03438
G1 X84.487 Y82.747 E.03454
G3 X85.926 Y83.492 I-4.085 J9.659 E.05085
G3 X86.801 Y84.158 I-21.535 J29.204 E.03449
G3 X87.897 Y85.354 I-7.16 J7.666 E.05091
G3 X88.946 Y87.238 I-7.735 J5.537 E.06776
G1 X101.548 Y85.161 E.40047
G3 X105.44 Y82.21 I3.807 J.98 E.16524
G1 X105.724 Y82.239 E.00894
G3 X106.367 Y82.35 I-.228 J3.262 E.02049
G1 X106.989 Y82.582 E.02083
G1 X107.234 Y82.708 E.00863
G1 X107.784 Y83.081 E.02083
G3 X108.03 Y88.896 I-2.481 J3.018 E.20587
G1 X107.515 Y89.315 E.02083
G3 X102.049 Y88.2 I-2.181 J-3.262 E.19456
G1 X89.447 Y90.277 E.40047
G1 X89.325 Y91.333 E.03331
G3 X88.88 Y92.893 I-10.288 J-2.094 E.05093
G3 X88.404 Y93.882 I-14.204 J-6.218 E.03442
G3 X87.789 Y94.794 I-30.317 J-19.789 E.03449
G3 X86.665 Y95.961 I-8.092 J-6.669 E.05086
G1 X85.774 Y96.609 E.03454
G3 X84.317 Y97.318 I-5.301 J-9.044 E.05087
G3 X83.261 Y97.623 I-7.777 J-24.993 E.03447
G3 X82.172 Y97.761 I-1.868 J-10.329 E.03444
G1 X81.786 Y97.782 E.01213
; WIPE_START
M204 S6000
G1 X81.647 Y97.787 E-.02643
G1 X80.552 Y97.713 E-.20846
G1 X79.805 Y97.551 E-.14511
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.8
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X76.971 Y89.587 F42000
G1 Z.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.407879
G1 F2466.033
M204 S6000
G1 X77.13 Y88.814 E.02395
G1 X77.355 Y88.141 E.02153
G1 X77.701 Y87.5 E.0221
G1 X77.935 Y87.164 E.01243
G1 X78.42 Y86.624 E.02201
G3 X79.409 Y85.895 I3.415 J3.596 E.0374
G1 X80.189 Y85.562 E.02572
G1 X80.781 Y85.41 E.01854
G1 X81.504 Y85.33 E.0221
G3 X83.774 Y85.836 I.152 J4.667 E.07131
G1 X84.435 Y86.244 E.02357
G1 X84.748 Y86.493 E.01214
G1 X85.212 Y86.963 E.02004
G3 X86.009 Y88.283 I-4.619 J3.689 E.04693
; LINE_WIDTH: 0.42346
G1 F2365.06
G1 X86.063 Y88.421 E.0047
; LINE_WIDTH: 0.44914
G1 F2215.548
G1 X86.116 Y88.56 E.00501
; WIPE_START
G1 X86.063 Y88.421 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X78.849 Y90.914 Z.8 F42000
G1 X77.161 Y91.498 Z.8
G1 Z.4
G1 E.4 F1800
; LINE_WIDTH: 0.493882
G1 F1995.735
M204 S6000
G1 X77.137 Y91.32 E.00673
; LINE_WIDTH: 0.454765
G1 F2185.288
G1 X77.113 Y91.142 E.00614
; LINE_WIDTH: 0.407902
G1 F2465.877
G2 X76.992 Y90.373 I-14.297 J1.854 E.02364
G2 X76.971 Y89.587 I-43.745 J.747 E.02386
G3 X76.696 Y90.733 I-93.306 J-21.766 E.03578
G1 X76.646 Y90.826 E.0032
; LINE_WIDTH: 0.415649
G1 F2414.627
G1 X76.806 Y91.034 E.00812
; LINE_WIDTH: 0.454765
G1 F2185.288
G1 X76.965 Y91.242 E.00897
; LINE_WIDTH: 0.493882
G1 F1995.735
G1 X77.125 Y91.45 E.00982
; WIPE_START
G1 X76.965 Y91.242 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X84.537 Y90.28 Z.8 F42000
G1 X84.827 Y90.243 Z.8
G1 Z.4
G1 E.4 F1800
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X84.728 Y90.806 E.01791
G3 X84.328 Y91.73 I-3.414 J-.928 E.03169
G1 X83.829 Y92.327 E.02438
G1 X83.413 Y92.65 E.01653
G1 X82.832 Y92.943 E.0204
G1 X82.32 Y93.109 E.01687
G1 X81.733 Y93.186 E.01856
G3 X81.169 Y93.148 I-.046 J-3.531 E.01776
G1 X80.451 Y92.95 E.02334
G3 X79.574 Y92.417 I1.486 J-3.432 E.03228
G1 X79.054 Y91.845 E.02422
G1 X78.686 Y91.164 E.02427
G3 X78.488 Y90.37 I12.049 J-3.428 E.02568
G1 X78.486 Y89.646 E.0227
G1 X78.669 Y88.888 E.02444
G1 X79.026 Y88.201 E.02426
G3 X80.17 Y87.184 I3.058 J2.288 E.04832
G3 X80.943 Y86.899 I4.77 J11.75 E.02586
G1 X81.667 Y86.82 E.02283
G1 X82.194 Y86.861 E.01657
G1 X82.784 Y87.031 E.01924
G1 X83.366 Y87.332 E.02054
G1 X83.683 Y87.555 E.01216
G1 X84.153 Y88.026 E.02084
G3 X84.571 Y88.723 I-9.355 J6.09 E.02551
G1 X84.795 Y89.455 E.024
G1 X84.824 Y90.183 E.02284
M204 S10000
G1 X85.194 Y89.937 F42000
G1 F2386.825
M204 S6000
G1 X85.195 Y90.35 E.01294
G3 X84.665 Y91.901 I-4.166 J-.558 E.05171
G1 X84.117 Y92.571 E.02712
G1 X83.643 Y92.95 E.01904
G1 X83 Y93.281 E.02266
G1 X82.419 Y93.473 E.01921
G1 X81.781 Y93.56 E.02017
G1 X81.167 Y93.528 E.01929
G1 X80.351 Y93.313 E.02646
G1 X79.864 Y93.075 E.01698
G1 X79.36 Y92.727 E.01922
G1 X78.774 Y92.097 E.02696
G1 X78.353 Y91.341 E.02713
G3 X78.111 Y90.37 I6.33 J-2.095 E.03139
G1 X78.109 Y89.647 E.0227
G3 X78.357 Y88.659 I6.881 J1.198 E.03195
G1 X78.692 Y88.025 E.0225
G3 X79.389 Y87.261 I4.673 J3.557 E.03246
G1 X79.957 Y86.873 E.02158
G3 X80.902 Y86.524 I2.79 J6.112 E.03161
G1 X81.626 Y86.445 E.02283
G1 X82.226 Y86.485 E.01884
G1 X82.891 Y86.669 E.02163
G3 X83.825 Y87.181 I-1.229 J3.352 E.03352
G1 X84.417 Y87.756 E.02587
G3 X84.932 Y88.613 I-4.93 J3.549 E.03137
G1 X85.156 Y89.345 E.024
G1 X85.19 Y89.878 E.01674
M204 S10000
G1 X85.571 Y89.926 F42000
G1 F2386.825
M204 S6000
G3 X85.47 Y90.941 I-3.027 J.211 E.03214
G1 X85.314 Y91.434 E.01622
G3 X84.879 Y92.255 I-4.374 J-1.79 E.02917
G1 X84.404 Y92.814 E.02301
G1 X83.872 Y93.249 E.02156
G3 X82.887 Y93.737 I-3.456 J-5.734 E.03449
G3 X81.009 Y93.885 I-1.253 J-3.922 E.05959
G1 X80.25 Y93.676 E.02468
G3 X78.98 Y92.891 I1.937 J-4.552 E.04699
G1 X78.493 Y92.349 E.02285
G1 X78.02 Y91.518 E.02999
G1 X77.809 Y90.785 E.02392
G1 X77.734 Y90.371 E.01318
G1 X77.732 Y89.647 E.0227
G3 X78.018 Y88.492 I6.18 J.917 E.03737
G1 X78.359 Y87.848 E.02284
G3 X79.176 Y86.949 I4.441 J3.213 E.03817
G1 X79.745 Y86.561 E.02158
G1 X80.45 Y86.271 E.02391
G1 X80.861 Y86.15 E.01344
G1 X81.585 Y86.07 E.02283
G1 X82.258 Y86.109 E.02111
G1 X82.998 Y86.308 E.02403
G1 X83.467 Y86.511 E.01604
G1 X84.031 Y86.865 E.02087
G1 X84.684 Y87.49 E.02834
G1 X85.123 Y88.166 E.02527
G1 X85.292 Y88.503 E.01182
G1 X85.516 Y89.234 E.024
G1 X85.567 Y89.866 E.01986
M204 S10000
G1 X85.957 Y90.208 F42000
G1 F2386.825
M204 S6000
G3 X85.337 Y92.242 I-4.708 J-.323 E.06727
G3 X84.692 Y93.058 I-5.935 J-4.028 E.03265
G1 X84.101 Y93.549 E.02408
G1 X83.336 Y93.956 E.02718
G1 X82.985 Y94.101 E.01189
G3 X81.866 Y94.309 I-1.445 J-4.668 E.03576
G1 X81.111 Y94.28 E.02371
G3 X79.901 Y93.943 I1.325 J-7.109 E.03943
G3 X78.475 Y92.893 I1.816 J-3.96 E.05591
G1 X78.06 Y92.393 E.02038
G1 X77.687 Y91.695 E.02482
G1 X77.443 Y90.876 E.02678
G1 X77.357 Y90.372 E.01603
G1 X77.355 Y89.648 E.0227
G1 X77.394 Y89.328 E.01011
G1 X77.571 Y88.616 E.02301
G3 X78.058 Y87.615 I7.152 J2.864 E.03492
G3 X78.933 Y86.659 I5.102 J3.788 E.04072
G1 X79.532 Y86.25 E.02276
G1 X79.82 Y86.102 E.01013
G1 X80.508 Y85.848 E.02299
G3 X81.772 Y85.69 I1.486 J6.762 E.04002
G1 X82.289 Y85.734 E.01626
G1 X83.105 Y85.946 E.02642
G1 X83.623 Y86.168 E.01768
G1 X84.236 Y86.549 E.02264
G1 X84.95 Y87.224 E.03081
G1 X85.147 Y87.475 E.01
G1 X85.522 Y88.098 E.02279
G1 X85.653 Y88.392 E.01011
; LINE_WIDTH: 0.442268
G1 F2253.676
G1 X85.786 Y88.752 E.01273
; LINE_WIDTH: 0.486823
G1 F2027.472
G1 X85.92 Y89.111 E.01415
; LINE_WIDTH: 0.52189
G1 F1879.032
G1 X85.989 Y89.417 E.01248
; LINE_WIDTH: 0.515565
G1 F1904.178
G1 X85.979 Y89.66 E.00958
; LINE_WIDTH: 0.477335
G1 F2071.752
G1 X85.969 Y89.904 E.00881
; LINE_WIDTH: 0.439105
G1 F2271.666
G1 X85.96 Y90.148 E.00803
M204 S10000
G1 X86.344 Y89.902 F42000
; LINE_WIDTH: 0.442605
G1 F2251.773
M204 S6000
G1 X86.328 Y90.171 E.00898
; LINE_WIDTH: 0.407465
G1 F2468.832
G1 X86.312 Y90.441 E.00819
G3 X84.694 Y93.562 I-4.831 J-.526 E.10903
G1 X84.29 Y93.863 E.01527
G1 X83.504 Y94.294 E.02718
G3 X81.923 Y94.676 I-2.091 J-5.187 E.04946
G1 X81.084 Y94.646 E.02547
G1 X80.338 Y94.486 E.02312
G1 X79.733 Y94.271 E.01945
G3 X77.866 Y92.753 I2.06 J-4.443 E.0737
G1 X77.344 Y91.877 E.03091
; LINE_WIDTH: 0.460145
G1 F2157.11
G1 X77.266 Y91.714 E.00626
; LINE_WIDTH: 0.495675
G1 F1987.83
G1 X77.187 Y91.552 E.00679
; WIPE_START
G1 X77.266 Y91.714 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X84.745 Y90.191 Z.8 F42000
G1 X86.756 Y89.781 Z.8
G1 Z.4
G1 E.4 F1800
; LINE_WIDTH: 0.439105
G1 F2271.666
M204 S6000
G1 X86.662 Y89.634 E.00575
; LINE_WIDTH: 0.477335
G1 F2071.752
G1 X86.567 Y89.488 E.0063
; LINE_WIDTH: 0.519628
G1 F1887.95
G1 X86.473 Y89.341 E.00692
G1 X86.446 Y89.029 E.01242
; LINE_WIDTH: 0.486823
G1 F2027.472
G1 X86.509 Y88.816 E.00819
; LINE_WIDTH: 0.42015
G1 F2385.816
G1 X86.572 Y88.603 E.00696
G1 X86.096 Y87.595 E.03497
G1 X85.684 Y86.956 E.02386
G1 X85.014 Y86.232 E.03092
G1 X84.414 Y85.771 E.02374
G2 X83.502 Y85.3 I-4.652 J7.882 E.03222
G1 X82.799 Y85.08 E.0231
G1 X82.069 Y84.966 E.02319
G2 X80.319 Y85.126 I-.331 J6.033 E.05532
G1 X79.551 Y85.416 E.02575
G1 X78.748 Y85.865 E.02885
G2 X77.507 Y87.109 I3.647 J4.88 E.05533
G1 X77.129 Y87.745 E.0232
G2 X76.757 Y88.735 I8.406 J3.717 E.0332
G1 X76.393 Y90.461 E.05533
G1 X76.198 Y90.9 E.01508
G1 X76.524 Y91.253 E.01508
G1 X77.434 Y92.791 E.05605
G1 X77.905 Y93.396 E.02404
G2 X79.296 Y94.474 I4.402 J-4.24 E.05539
G2 X80.943 Y95.005 I2.75 J-5.71 E.05446
G1 X81.685 Y95.055 E.02331
G1 X82.534 Y94.968 E.0268
G2 X84.929 Y93.849 I-.948 J-5.15 E.08383
G1 X85.609 Y93.139 E.03082
G2 X86.633 Y90.853 I-4.179 J-3.245 E.07931
G1 X86.749 Y89.841 E.03197
M204 S10000
G1 X87.149 Y89.667 F42000
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X87.004 Y89.5 E.00692
G1 X86.877 Y89.148 E.01174
G1 X86.892 Y88.794 E.01111
G1 X86.983 Y88.591 E.00695
G1 X86.426 Y87.412 E.04091
G1 X85.991 Y86.735 E.02523
G1 X85.284 Y85.969 E.03269
G2 X84.383 Y85.31 I-5.594 J6.705 E.03501
G1 X83.753 Y85.002 E.02199
G1 X82.938 Y84.728 E.02697
G2 X81.876 Y84.576 I-1.927 J9.631 E.03364
G1 X81.062 Y84.605 E.02555
G2 X79.969 Y84.838 I1.236 J8.486 E.03507
G2 X78.483 Y85.589 I2.629 J7.041 E.05229
G2 X77.197 Y86.893 I4.123 J5.357 E.0576
G1 X76.795 Y87.568 E.02462
G2 X76.398 Y88.61 I9.592 J4.25 E.035
G1 X76.024 Y90.383 E.05681
G1 X75.848 Y90.765 E.01317
G1 X75.402 Y91.032 E.01631
G1 X75.91 Y91.141 E.01631
G1 X76.199 Y91.446 E.01317
G1 X77.122 Y93.004 E.05678
G1 X77.62 Y93.643 E.02541
G2 X79.113 Y94.805 I4.78 J-4.603 E.05954
G2 X80.123 Y95.214 I5.012 J-10.937 E.03417
G1 X80.89 Y95.38 E.0246
G1 X81.678 Y95.433 E.02475
G1 X82.585 Y95.342 E.02859
G2 X84.398 Y94.677 I-1.03 J-5.613 E.06084
G1 X85.134 Y94.166 E.02807
G2 X85.925 Y93.352 I-5.866 J-6.494 E.03562
G1 X86.362 Y92.704 E.02452
G1 X86.704 Y91.991 E.02479
G2 X87.005 Y90.921 I-8.748 J-3.034 E.03487
G1 X87.142 Y89.726 E.03772
M204 S10000
G1 X87.531 Y89.645 F42000
M73 P47 R8
G1 F2386.825
M204 S6000
G1 X87.545 Y89.524 E.00382
G1 X87.327 Y89.304 E.00973
G1 X87.244 Y89.018 E.00934
G1 X87.259 Y88.88 E.00434
G1 X87.406 Y88.602 E.00985
G1 X86.757 Y87.228 E.04763
G1 X86.297 Y86.515 E.0266
G1 X85.554 Y85.705 E.03448
G2 X84.577 Y84.987 I-5.611 J6.604 E.03805
G1 X83.917 Y84.662 E.02305
G1 X83.05 Y84.368 E.02871
G2 X81.9 Y84.199 I-1.966 J9.38 E.03647
G1 X81.044 Y84.229 E.02683
G2 X79.859 Y84.477 I1.17 J8.526 E.03801
G2 X78.305 Y85.251 I2.935 J7.841 E.05451
G2 X76.887 Y86.676 I4.422 J5.82 E.06325
G1 X76.462 Y87.39 E.02605
G2 X76.034 Y88.509 I10.017 J4.471 E.03757
G1 X75.655 Y90.306 E.05756
G1 X75.55 Y90.534 E.0079
; LINE_WIDTH: 0.44101
G1 F2260.795
G1 X75.434 Y90.626 E.00487
; LINE_WIDTH: 0.48305
G1 F2044.851
G1 X75.319 Y90.718 E.00538
; LINE_WIDTH: 0.545367
G1 F1791.235
G1 X75.204 Y90.809 E.00615
G1 X72.852 Y91.197 E.09962
G1 X72.612 Y91.291 E.01074
G1 X72.532 Y91.449 E.00738
G2 X72.667 Y91.681 I.237 J.018 E.01193
G1 X72.933 Y91.693 E.01116
G1 X75.286 Y91.306 E.09962
; LINE_WIDTH: 0.52509
G1 F1866.562
G1 X75.424 Y91.355 E.0059
; LINE_WIDTH: 0.48305
G1 F2044.851
G1 X75.563 Y91.405 E.00538
; LINE_WIDTH: 0.420168
G1 F2385.698
G1 X75.701 Y91.455 E.00461
G1 X75.875 Y91.638 E.00791
G1 X76.81 Y93.216 E.05755
G1 X77.334 Y93.891 E.0268
G2 X78.206 Y94.68 I6.443 J-6.238 E.0369
G1 X78.931 Y95.136 E.02688
G2 X80.017 Y95.576 I5.273 J-11.437 E.03676
G1 X80.837 Y95.754 E.02635
G1 X81.671 Y95.81 E.02621
G1 X82.636 Y95.715 E.03041
G2 X84.573 Y95.011 I-1.087 J-6.007 E.06497
G1 X85.355 Y94.471 E.02981
G2 X86.69 Y92.892 I-4.294 J-4.984 E.06513
G1 X87.052 Y92.137 E.02626
G2 X87.377 Y90.989 I-9.275 J-3.237 E.03746
G1 X87.524 Y89.705 E.04054
M204 S10000
G1 X87.906 Y89.688 F42000
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X87.943 Y89.363 E.01026
G1 X87.649 Y89.108 E.01222
G1 X87.626 Y88.967 E.00448
G1 X87.841 Y88.64 E.01224
G1 X87.087 Y87.045 E.05532
G1 X86.604 Y86.295 E.02798
G2 X85.033 Y84.82 I-5.473 J4.256 E.06784
G2 X83.919 Y84.244 I-5.98 J10.21 E.03934
G1 X83.057 Y83.976 E.0283
G1 X82.192 Y83.84 E.02744
G2 X80.917 Y83.857 I-.504 J9.987 E.04002
G1 X80.045 Y84.026 E.02783
G1 X79.117 Y84.371 E.03105
G2 X78.093 Y84.938 I3.263 J7.099 E.03674
G2 X77.146 Y85.759 I8.333 J10.572 E.0393
G1 X76.577 Y86.46 E.02831
G1 X76.129 Y87.213 E.02748
G2 X75.67 Y88.408 I10.464 J4.701 E.04014
G1 X75.286 Y90.228 E.05831
G1 X75.251 Y90.304 E.00263
G1 X75.133 Y90.375 E.00433
G1 X72.722 Y90.772 E.0766
G1 X72.421 Y90.876 E.01
G1 X72.193 Y91.103 E.01007
G1 X72.087 Y91.417 E.01038
G1 X72.145 Y91.735 E.01014
G1 X72.342 Y92.001 E.01038
G1 X72.619 Y92.123 E.0095
G1 X72.947 Y92.137 E.01028
G1 X75.358 Y91.74 E.07661
G1 X75.54 Y91.813 E.00615
G3 X76.498 Y93.429 I-427.794 J254.768 E.05889
G1 X77.049 Y94.138 E.02816
G2 X77.982 Y94.984 I6.914 J-6.682 E.03951
G1 X78.749 Y95.467 E.02842
G2 X79.91 Y95.939 I4.178 J-8.607 E.03932
G1 X80.785 Y96.129 E.02807
G1 X81.664 Y96.188 E.02765
G1 X82.687 Y96.089 E.0322
G2 X83.785 Y95.809 I-1.222 J-7.088 E.03559
G1 X84.748 Y95.345 E.03351
G2 X85.649 Y94.724 I-5.169 J-8.461 E.03432
G2 X86.519 Y93.82 I-7.071 J-7.677 E.03936
G1 X87.018 Y93.08 E.02799
G1 X87.401 Y92.284 E.02771
G2 X87.748 Y91.056 I-9.808 J-3.443 E.04001
G1 X87.899 Y89.748 E.04129
M204 S10000
G1 X88.187 Y89.056 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.261401
G1 F4119.353
M204 S6000
G1 X88.249 Y88.98 E.00179
; LINE_WIDTH: 0.289406
G1 F3651.332
G1 X88.312 Y88.903 E.00202
; LINE_WIDTH: 0.303411
G1 F3455.015
G1 X102.449 Y86.573 E.31034
; WIPE_START
G1 X100.475 Y86.898 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.349 Y86.06 Z.8 F42000
G1 Z.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42284
G1 F2368.92
M204 S6000
G1 X105.277 Y86.101 E.0026
G1 X105.338 Y86.136 E.0022
M204 S10000
G1 X104.882 Y86.172 F42000
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X105.087 Y86.404 E.00969
G1 X105.329 Y86.482 E.00798
G1 X105.512 Y86.442 E.00589
G1 X105.673 Y86.277 E.00723
G1 X105.719 Y86.035 E.00771
G1 X105.608 Y85.824 E.00746
G1 X105.411 Y85.73 E.00686
G1 X105.198 Y85.736 E.0067
G1 X105.002 Y85.886 E.00774
G1 X104.906 Y86.116 E.00782
M204 S10000
G1 X104.463 Y86.241 F42000
G1 F2386.825
M204 S6000
G1 X104.791 Y86.648 E.01639
G1 X105.056 Y86.814 E.0098
G1 X105.415 Y86.86 E.01134
G1 X105.704 Y86.771 E.00949
G1 X105.986 Y86.497 E.01232
G2 X106.095 Y86.01 I-1.256 J-.536 E.01574
G2 X105.84 Y85.527 I-1.074 J.257 E.0173
G1 X105.553 Y85.366 E.01033
G1 X105.149 Y85.353 E.01266
G1 X104.841 Y85.508 E.01081
G1 X104.618 Y85.793 E.01137
G1 X104.483 Y86.184 E.01296
M204 S10000
G1 X104.044 Y86.31 F42000
G1 F2386.825
M204 S6000
G1 X104.4 Y86.785 E.01861
G1 X104.663 Y87.032 E.01131
G1 X105.053 Y87.202 E.01336
G1 X105.457 Y87.238 E.01271
G1 X105.903 Y87.094 E.01469
G1 X106.221 Y86.809 E.01338
G1 X106.412 Y86.474 E.01208
G1 X106.471 Y85.985 E.01545
G1 X106.424 Y85.754 E.00738
G1 X106.169 Y85.318 E.01585
G1 X105.876 Y85.089 E.01165
G1 X105.515 Y84.983 E.01182
G1 X105.096 Y84.972 E.01313
G1 X104.709 Y85.144 E.01326
G1 X104.398 Y85.427 E.0132
G2 X104.063 Y86.253 I2.465 J1.482 E.02806
M204 S10000
G1 X103.625 Y86.379 F42000
G1 F2386.825
M204 S6000
G1 X104.107 Y87.024 E.02525
G1 X104.451 Y87.347 E.01477
G2 X105.499 Y87.615 I.928 J-1.444 E.03452
G1 X105.984 Y87.473 E.01585
G1 X106.407 Y87.18 E.01613
G2 X106.776 Y86.585 I-1.038 J-1.055 E.02216
G1 X106.856 Y86.09 E.01573
G2 X106.778 Y85.616 I-1.819 J.056 E.01511
G1 X106.538 Y85.163 E.01605
G1 X106.209 Y84.863 E.01398
G1 X105.906 Y84.695 E.01086
G2 X105.126 Y84.589 I-.651 J1.87 E.02483
G1 X104.663 Y84.725 E.01514
G1 X104.355 Y84.924 E.01148
G1 X104.013 Y85.335 E.01677
G1 X103.856 Y85.672 E.01167
G1 X103.644 Y86.322 E.02144
M204 S10000
G1 X103.208 Y86.442 F42000
G1 F2386.825
M204 S6000
G1 X103.768 Y87.2 E.02957
G1 X104.085 Y87.532 E.01436
G2 X104.648 Y87.877 I2.033 J-2.677 E.02075
G1 X105.087 Y87.989 E.01422
G1 X105.541 Y87.992 E.01422
G1 X105.992 Y87.887 E.01452
G2 X106.674 Y87.45 I-1.176 J-2.59 E.02549
G1 X106.957 Y87.093 E.01427
G1 X107.14 Y86.696 E.01372
G1 X107.235 Y86.107 E.01869
G2 X107.131 Y85.477 I-2.417 J.075 E.02009
G1 X106.849 Y84.945 E.01888
G2 X106.24 Y84.422 I-2.073 J1.799 E.02526
G1 X105.829 Y84.259 E.01387
G1 X105.248 Y84.194 E.01832
G2 X104.496 Y84.384 I.267 J2.651 E.02441
G1 X104.113 Y84.631 E.01431
G1 X103.794 Y84.968 E.01451
G1 X103.552 Y85.409 E.01579
G1 X103.227 Y86.385 E.03224
M204 S10000
G1 X102.836 Y86.509 F42000
G1 F2386.825
M204 S6000
G1 X102.908 Y86.679 E.0058
G1 X103.522 Y87.501 E.03218
G1 X104.026 Y87.975 E.02169
G1 X104.511 Y88.232 E.0172
G1 X105.039 Y88.365 E.01706
G1 X105.583 Y88.37 E.01706
G1 X106.117 Y88.245 E.01721
G1 X106.499 Y88.063 E.01327
G1 X106.942 Y87.72 E.01753
G1 X107.281 Y87.292 E.01712
G1 X107.504 Y86.807 E.01675
G1 X107.614 Y86.125 E.02165
G1 X107.6 Y85.909 E.00679
G1 X107.485 Y85.339 E.01825
G1 X107.16 Y84.727 E.02171
G1 X106.876 Y84.413 E.01327
G1 X106.422 Y84.089 E.01751
G1 X105.921 Y83.89 E.0169
G1 X105.246 Y83.815 E.02128
G1 X104.838 Y83.864 E.01289
G1 X104.329 Y84.043 E.01693
G1 X103.87 Y84.339 E.01714
G1 X103.493 Y84.738 E.0172
G1 X103.209 Y85.25 E.01835
G1 X102.85 Y86.325 E.03553
G1 X102.84 Y86.449 E.00391
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2386.825
G1 X102.85 Y86.325 E-.02371
G1 X103.209 Y85.25 E-.21529
G1 X103.493 Y84.738 E-.11121
G1 X103.6 Y84.624 E-.02979
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 3/65
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z.8 I-.419 J-1.143 P1  F42000
G1 X81.572 Y92.702 Z.8
G1 Z.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G1 X81.113 Y92.666 E.0156
G1 X80.491 Y92.46 E.02218
G1 X79.936 Y92.111 E.02218
G1 X79.481 Y91.639 E.02218
G1 X79.152 Y91.073 E.02219
G1 X78.968 Y90.444 E.02218
G1 X78.94 Y89.789 E.02218
G1 X79.07 Y89.147 E.02218
G1 X79.35 Y88.554 E.02218
G1 X79.763 Y88.045 E.02218
G1 X80.286 Y87.65 E.02218
G1 X80.888 Y87.392 E.02218
G1 X81.127 Y87.353 E.0082
G1 X81.535 Y87.286 E.01398
G1 X82.188 Y87.337 E.02219
G1 X82.81 Y87.543 E.02218
G1 X83.365 Y87.892 E.02218
G1 X83.82 Y88.364 E.02218
G1 X84.149 Y88.93 E.02218
G1 X84.332 Y89.559 E.02218
G1 X84.36 Y90.214 E.02218
G1 X84.231 Y90.856 E.02218
G1 X83.951 Y91.449 E.02218
G1 X83.538 Y91.958 E.02218
G1 X83.208 Y92.206 E.01398
G1 X83.015 Y92.352 E.0082
G1 X82.413 Y92.611 E.02218
G1 X81.766 Y92.717 E.02218
G1 X81.632 Y92.707 E.00456
M204 S10000
G1 X81.604 Y92.296 F42000
G1 F2210.87
M204 S6000
G1 X81.194 Y92.264 E.01392
G1 X80.666 Y92.089 E.01883
G1 X80.195 Y91.793 E.01884
G1 X79.808 Y91.392 E.01883
G1 X79.529 Y90.911 E.01884
G1 X79.373 Y90.377 E.01883
G1 X79.349 Y89.821 E.01884
G1 X79.459 Y89.276 E.01883
G1 X79.697 Y88.772 E.01884
G1 X80.048 Y88.34 E.01883
G1 X80.492 Y88.005 E.01884
G1 X81.003 Y87.786 E.01884
G1 X81.193 Y87.754 E.00653
G1 X81.552 Y87.695 E.01231
G1 X82.107 Y87.739 E.01884
G1 X82.635 Y87.914 E.01883
G1 X83.106 Y88.21 E.01883
G1 X83.493 Y88.611 E.01884
G1 X83.772 Y89.092 E.01884
G1 X83.928 Y89.626 E.01883
G1 X83.952 Y90.182 E.01884
G1 X83.841 Y90.727 E.01884
G1 X83.604 Y91.231 E.01883
G1 X83.253 Y91.662 E.01884
G1 X82.963 Y91.882 E.01231
G1 X82.809 Y91.998 E.00653
G1 X82.298 Y92.217 E.01883
G1 X81.749 Y92.308 E.01883
G1 X81.664 Y92.301 E.00289
M204 S10000
G1 X81.636 Y91.89 F42000
G1 F2210.87
M204 S6000
G1 X81.275 Y91.862 E.01225
G1 X80.841 Y91.718 E.01549
G1 X80.453 Y91.474 E.01549
G1 X80.136 Y91.145 E.01549
G1 X79.906 Y90.749 E.01549
G1 X79.778 Y90.31 E.01549
G1 X79.758 Y89.853 E.01549
G1 X79.849 Y89.404 E.01549
G1 X80.044 Y88.991 E.01549
G1 X80.332 Y88.636 E.01549
G1 X80.698 Y88.36 E.01549
G1 X81.118 Y88.179 E.01549
G1 X81.26 Y88.156 E.00485
G1 X81.57 Y88.105 E.01063
G1 X82.026 Y88.141 E.01549
G1 X82.46 Y88.285 E.01549
G1 X82.848 Y88.528 E.01549
G1 X83.165 Y88.858 E.01549
G1 X83.395 Y89.253 E.01549
G1 X83.523 Y89.693 E.01549
G1 X83.543 Y90.15 E.01549
G1 X83.452 Y90.598 E.01549
G1 X83.257 Y91.012 E.01549
G1 X82.968 Y91.367 E.01549
G1 X82.718 Y91.557 E.01064
G1 X82.603 Y91.643 E.00486
G1 X82.183 Y91.823 E.01549
G1 X81.731 Y91.898 E.01549
G1 X81.695 Y91.895 E.00121
M204 S250
G1 X81.666 Y91.5 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G1 X81.355 Y91.466 E.00982
G3 X81.229 Y88.559 I.295 J-1.469 E.12495
G1 X81.323 Y88.543 E.003
G1 X81.586 Y88.5 E.00836
G3 X81.726 Y91.494 I.063 J1.497 E.14722
; WIPE_START
M204 S6000
G1 X81.355 Y91.466 E-.07072
G1 X81.009 Y91.361 E-.06868
G1 X80.702 Y91.168 E-.06885
G1 X80.451 Y90.907 E-.06885
G1 X80.269 Y90.594 E-.06886
G1 X80.219 Y90.422 E-.03405
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X81.81 Y96.38 Z1 F42000
G1 Z.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G3 X80.797 Y96.325 I.19 J-12.972 E.03437
G1 X79.772 Y96.1 E.03552
G1 X79.653 Y96.06 E.00424
G3 X78.719 Y95.669 I2.944 J-8.361 E.03428
G1 X77.83 Y95.112 E.03552
G3 X76.981 Y94.35 I13.904 J-16.341 E.03862
G3 X76.337 Y93.536 I16.19 J-13.468 E.03517
G1 X75.488 Y92.116 E.05599
G1 X72.989 Y92.528 E.08572
G3 X72.636 Y90.389 I-.213 J-1.063 E.11787
G1 X75.135 Y89.977 E.08572
G1 X75.483 Y88.36 E.05599
G3 X75.886 Y87.267 I20.188 J6.821 E.03944
G3 X76.392 Y86.387 I10.207 J5.278 E.03435
G1 X77.055 Y85.574 E.03551
G3 X77.915 Y84.828 I14.538 J15.885 E.03857
G3 X78.93 Y84.235 I4.915 J7.243 E.03981
G1 X79.876 Y83.873 E.03429
G3 X80.884 Y83.666 I4.001 J16.996 E.03482
G3 X82.044 Y83.634 I1.178 J21.416 E.0393
G3 X83.048 Y83.775 I-.975 J10.567 E.03432
G1 X84.049 Y84.088 E.03551
G3 X85.063 Y84.609 I-9.301 J19.34 E.03858
G3 X85.892 Y85.234 I-20.31 J27.833 E.03516
G3 X86.679 Y86.074 I-15.119 J14.95 E.03895
G3 X87.248 Y86.936 I-12.61 J8.938 E.03497
G1 X88.047 Y88.609 E.06275
G1 X102.65 Y86.201 E.50096
G1 X103.057 Y85.102 E.03968
G1 X103.366 Y84.584 E.02042
G3 X103.761 Y84.177 I5.597 J5.021 E.01921
G1 X104.242 Y83.868 E.01935
G1 X104.781 Y83.678 E.01935
G3 X105.38 Y83.62 I1.711 J14.443 E.02037
G1 X105.922 Y83.689 E.01849
G1 X106.468 Y83.894 E.01974
G1 X106.951 Y84.221 E.01974
G3 X107.34 Y84.643 I-9.059 J8.729 E.01942
G3 X107.621 Y85.145 I-6.498 J3.974 E.01948
G1 X107.779 Y85.694 E.01936
G1 X107.806 Y86.265 E.01934
G3 X107.69 Y86.856 I-13.869 J-2.415 E.0204
G1 X107.467 Y87.358 E.01858
G3 X107.116 Y87.819 I-32.813 J-24.616 E.01964
G1 X106.664 Y88.189 E.01976
G3 X106.148 Y88.44 I-5.402 J-10.439 E.01941
G3 X105.587 Y88.566 I-1.824 J-6.834 E.01948
G1 X105.015 Y88.559 E.01935
G1 X104.461 Y88.421 E.01934
G3 X103.956 Y88.162 I3.187 J-6.814 E.01921
G1 X103.497 Y87.77 E.02042
G1 X102.758 Y86.86 E.03968
G1 X88.155 Y89.267 E.50096
G1 X87.935 Y91.108 E.06274
G3 X87.63 Y92.227 I-20.54 J-5.004 E.03926
G3 X87.198 Y93.155 I-13.344 J-5.648 E.03467
G3 X86.531 Y94.11 I-18.013 J-11.882 E.03943
G3 X85.82 Y94.832 I-7.101 J-6.276 E.0343
G1 X84.972 Y95.45 E.03551
G3 X83.949 Y95.954 I-10.001 J-19.003 E.0386
G3 X82.957 Y96.247 I-7.483 J-23.462 E.03502
G3 X81.87 Y96.374 I-3.009 J-21.071 E.03705
M204 S10000
G1 X81.789 Y96.786 F42000
G1 F2210.87
M204 S6000
G1 X80.735 Y96.728 E.03574
G1 X79.663 Y96.493 E.03716
G1 X79.511 Y96.441 E.00543
G3 X78.523 Y96.027 I3.126 J-8.838 E.03629
G1 X77.592 Y95.444 E.03716
G3 X76.675 Y94.619 I12.735 J-15.091 E.04177
G3 X75.999 Y93.763 I16.993 J-14.124 E.03691
G1 X75.281 Y92.563 E.04736
G1 X73.043 Y92.931 E.07676
G3 X72.558 Y89.989 I-.268 J-1.467 E.16031
G1 X74.795 Y89.621 E.07675
G1 X75.09 Y88.253 E.04737
G3 X75.525 Y87.079 I18.701 J6.26 E.04236
G3 X76.06 Y86.15 I10.803 J5.602 E.03633
G1 X76.754 Y85.299 E.03715
G3 X77.685 Y84.491 I13.435 J14.545 E.04174
G3 X78.773 Y83.859 I5.137 J7.587 E.04262
G1 X79.775 Y83.478 E.03628
G3 X80.836 Y83.261 I4.203 J17.902 E.03666
G3 X82.084 Y83.229 I1.143 J19.766 E.04226
G3 X83.146 Y83.379 I-1.045 J11.178 E.03631
G1 X84.193 Y83.707 E.03715
G3 X85.29 Y84.271 I-8.481 J17.838 E.04174
G3 X86.161 Y84.927 I-21.305 J29.18 E.03691
G3 X87.008 Y85.833 I-13.951 J13.888 E.04201
G3 X87.605 Y86.74 I-13.276 J9.397 E.03677
G1 X88.282 Y88.157 E.05315
G1 X102.35 Y85.838 E.48261
G1 X102.698 Y84.91 E.03356
G1 X103.05 Y84.326 E.02308
G3 X103.528 Y83.842 I2.992 J2.479 E.02304
G3 X104.063 Y83.502 I3.475 J4.871 E.02149
G3 X104.75 Y83.271 I3.649 J9.74 E.02453
G3 X105.366 Y83.209 I.676 J3.609 E.02098
G1 X105.427 Y83.215 E.00208
G1 X106.029 Y83.295 E.02054
G1 X106.648 Y83.527 E.02238
G1 X107.226 Y83.918 E.02363
G3 X107.683 Y84.422 I-2.803 J3 E.02304
G3 X108.009 Y85.018 I-3.137 J2.102 E.02303
G3 X108.181 Y85.628 I-5.527 J1.894 E.02147
G3 X108.205 Y86.353 I-10.232 J.695 E.02455
G3 X108.088 Y86.96 I-3.594 J-.376 E.02095
G3 X107.772 Y87.63 I-6.903 J-2.847 E.02509
M73 P48 R8
G1 X107.403 Y88.11 E.02049
G1 X106.875 Y88.539 E.02304
G3 X106.261 Y88.832 I-2.008 J-3.418 E.02305
G3 X105.596 Y88.973 I-1.093 J-3.515 E.02303
G3 X104.963 Y88.963 I-.23 J-5.694 E.02144
G3 X104.262 Y88.777 I2.235 J-9.863 E.02458
G1 X103.722 Y88.497 E.0206
G1 X103.218 Y88.068 E.02238
G1 X102.591 Y87.3 E.03356
G1 X88.523 Y89.619 E.48261
G1 X88.337 Y91.178 E.05315
G3 X88.007 Y92.381 I-19.09 J-4.588 E.04223
G3 X87.551 Y93.36 I-14.051 J-5.959 E.03656
G3 X86.832 Y94.384 I-16.621 J-10.902 E.04235
G3 X86.079 Y95.147 I-7.506 J-6.653 E.0363
G1 X85.192 Y95.793 E.03716
G3 X84.085 Y96.338 I-9.277 J-17.45 E.04176
G3 X83.042 Y96.646 I-7.869 J-24.708 E.03681
G3 X81.849 Y96.783 I-2.843 J-19.469 E.04067
M204 S10000
G1 X81.767 Y97.192 F42000
G1 F2210.87
M204 S6000
G1 X80.673 Y97.131 E.03709
G1 X79.553 Y96.885 E.03881
G1 X79.368 Y96.823 E.00661
G3 X78.326 Y96.384 I3.314 J-9.33 E.03829
G1 X77.355 Y95.775 E.03881
G3 X76.368 Y94.888 I12.095 J-14.433 E.04493
G3 X75.661 Y93.991 I17.755 J-14.747 E.03866
G1 X75.073 Y93.009 E.03874
G1 X73.097 Y93.335 E.0678
G3 X72.48 Y89.59 I-.322 J-1.87 E.20275
G1 X74.456 Y89.264 E.0678
G1 X74.697 Y88.145 E.03874
G3 X75.163 Y86.892 I17.864 J5.932 E.04527
G3 X75.729 Y85.912 I11.391 J5.922 E.03831
G1 X76.453 Y85.024 E.0388
G3 X77.455 Y84.155 I12.84 J13.79 E.04491
G3 X78.616 Y83.483 I5.38 J7.964 E.04543
G1 X79.486 Y83.14 E.03166
G1 X79.674 Y83.083 E.00663
G3 X80.789 Y82.856 I4.399 J18.784 E.03851
G3 X82.124 Y82.823 I1.135 J18.842 E.04521
G3 X83.243 Y82.983 I-1.117 J11.803 E.0383
G1 X84.337 Y83.325 E.0388
G3 X85.517 Y83.932 I-8.026 J17.047 E.04491
G3 X86.429 Y84.62 I-22.29 J30.514 E.03866
G3 X87.337 Y85.593 I-13.281 J13.301 E.04507
G3 X87.963 Y86.545 I-13.935 J9.851 E.03858
G1 X88.518 Y87.706 E.04355
G1 X102.051 Y85.475 E.46425
G1 X102.337 Y84.72 E.02735
G1 X102.745 Y84.056 E.02636
G3 X103.296 Y83.508 I3.142 J2.606 E.02635
G3 X103.884 Y83.136 I3.803 J5.357 E.02356
G3 X104.699 Y82.867 I1.998 J4.704 E.0291
G3 X105.383 Y82.802 I.733 J4.023 E.02326
G1 X105.474 Y82.811 E.00311
G1 X106.147 Y82.904 E.02299
G1 X106.813 Y83.154 E.0241
G1 X107.511 Y83.627 E.02854
G3 X108.029 Y84.207 I-3.462 J3.611 E.02634
G3 X108.396 Y84.892 I-3.329 J2.225 E.02635
G3 X108.584 Y85.562 I-6.068 J2.062 E.02355
G3 X108.606 Y86.42 I-5.156 J.565 E.0291
G3 X108.473 Y87.093 I-3.989 J-.437 E.02325
G3 X108.155 Y87.798 I-14.926 J-6.325 E.02617
G3 X107.68 Y88.41 I-13.903 J-10.303 E.02624
G1 X107.072 Y88.896 E.02634
G3 X106.367 Y89.225 I-2.414 J-4.246 E.02635
G3 X105.606 Y89.38 I-1.16 J-3.757 E.02635
G3 X104.911 Y89.368 I-.237 J-6.235 E.02354
G3 X104.082 Y89.143 I.954 J-5.156 E.02912
G3 X103.48 Y88.825 I1.521 J-3.614 E.02306
G1 X102.938 Y88.364 E.0241
G1 X102.424 Y87.74 E.02735
G1 X88.891 Y89.971 E.46425
G1 X88.739 Y91.249 E.04355
G3 X88.384 Y92.536 I-18.29 J-4.344 E.04519
G3 X87.903 Y93.565 I-14.767 J-6.275 E.03845
G3 X87.133 Y94.658 I-15.836 J-10.337 E.04526
G3 X86.338 Y95.462 I-7.905 J-7.023 E.0383
G1 X85.412 Y96.137 E.0388
G3 X84.221 Y96.722 I-8.9 J-16.594 E.04492
G3 X83.128 Y97.045 I-8.243 J-25.915 E.03859
G3 X81.827 Y97.193 I-2.766 J-18.594 E.04431
M204 S250
G1 X81.745 Y97.584 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G1 X80.614 Y97.52 E.03554
G1 X79.448 Y97.264 E.03741
G1 X79.231 Y97.19 E.00719
G3 X78.137 Y96.728 I3.489 J-9.789 E.03725
G1 X77.126 Y96.095 E.03742
G3 X76.073 Y95.147 I11.756 J-14.111 E.04443
G3 X75.335 Y94.211 I18.56 J-15.403 E.03737
G1 X74.874 Y93.439 E.02819
G1 X73.149 Y93.724 E.05481
G3 X72.404 Y89.205 I-.374 J-2.259 E.22568
G1 X74.129 Y88.92 E.05481
G1 X74.318 Y88.042 E.02819
G3 X74.815 Y86.711 I17.432 J5.75 E.04454
G3 X75.41 Y85.683 I11.961 J6.232 E.03726
G1 X76.164 Y84.758 E.03741
G3 X77.234 Y83.83 I12.559 J13.398 E.04443
G3 X78.465 Y83.121 I5.623 J8.342 E.04459
G1 X79.357 Y82.77 E.03005
G1 X79.577 Y82.703 E.00719
G3 X80.743 Y82.466 I4.588 J19.63 E.03732
G3 X82.162 Y82.433 I1.128 J17.725 E.04452
G3 X83.338 Y82.602 I-1.186 J12.405 E.03726
G1 X84.476 Y82.958 E.03741
G3 X85.736 Y83.606 I-7.77 J16.64 E.04442
G3 X86.687 Y84.324 I-23.16 J31.695 E.03736
G3 X87.654 Y85.362 I-12.924 J13.008 E.04447
G3 X88.308 Y86.357 I-14.613 J10.316 E.03734
G1 X88.745 Y87.271 E.03178
G1 X101.762 Y85.125 E.41366
G3 X101.99 Y84.537 I3.931 J1.183 E.01981
G1 X102.38 Y83.884 E.02385
G3 X103.819 Y82.738 I3.143 J2.471 E.0582
G3 X104.533 Y82.496 I2.118 J5.067 E.02364
G3 X105.399 Y82.409 I1.738 J13.013 E.0273
G1 X105.519 Y82.422 E.0038
G1 X106.26 Y82.528 E.02347
G1 X106.972 Y82.795 E.02385
G1 X107.702 Y83.272 E.02733
G1 X107.786 Y83.346 E.00352
G3 X108.362 Y84 I-3.633 J3.785 E.02736
G3 X108.769 Y84.77 I-3.643 J2.415 E.02736
G3 X108.971 Y85.498 I-6.599 J2.227 E.02368
G3 X108.993 Y86.485 I-5.464 J.614 E.03101
G3 X108.845 Y87.222 I-4.361 J-.495 E.02359
G3 X108.483 Y88.014 I-12.23 J-5.106 E.0273
G3 X107.946 Y88.699 I-10.851 J-7.958 E.02731
G1 X107.357 Y89.18 E.02385
G1 X107.261 Y89.24 E.00352
G3 X106.47 Y89.604 I-2.541 J-4.477 E.02736
G3 X105.615 Y89.772 I-1.254 J-4.117 E.02736
G3 X104.86 Y89.757 I-.243 J-6.772 E.02367
G3 X103.908 Y89.494 I.996 J-5.464 E.03102
G3 X103.247 Y89.142 I1.689 J-3.967 E.02353
G1 X102.668 Y88.649 E.02385
G3 X102.263 Y88.164 I2.935 J-2.864 E.01981
G1 X89.245 Y90.31 E.41366
G1 X89.125 Y91.317 E.03178
G3 X88.747 Y92.685 I-17.857 J-4.198 E.04451
G3 X88.243 Y93.762 I-15.466 J-6.584 E.0373
G3 X87.572 Y94.747 I-32.815 J-21.625 E.03736
G1 X87.424 Y94.921 E.00719
G3 X86.588 Y95.765 I-8.297 J-7.387 E.03726
G1 X85.623 Y96.468 E.03741
G3 X84.352 Y97.092 I-8.718 J-16.138 E.04443
G3 X83.209 Y97.429 I-8.587 J-27.024 E.03734
G3 X81.805 Y97.586 I-2.74 J-18.138 E.04431
; WIPE_START
M204 S6000
G1 X80.614 Y97.52 E-.22678
G1 X79.826 Y97.347 E-.15322
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    
      M400
      G90
      M83
      M204 S5000
      G0 Z2 F4000
      G0 X187 Y178 F20000
      G39 S1 X187 Y178
      G0 Z2 F4000
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END




G1 Z1.000
G1 X77.253 Y91.36 F42000
G1 Z.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.449825
G1 F2211.818
M204 S6000
G1 X77.194 Y91.226 E.00496
; LINE_WIDTH: 0.498315
G1 F1976.306
G1 X77.136 Y91.092 E.00555
; LINE_WIDTH: 0.546805
G1 F1786.122
G1 X77.077 Y90.958 E.00614
; LINE_WIDTH: 0.595295
G1 F1629.328
G1 X77.018 Y90.824 E.00673
; WIPE_START
G1 X77.077 Y90.958 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X84.678 Y90.274 Z1 F42000
G1 X84.75 Y90.267 Z1
G1 Z.6
G1 E.4 F1800
; LINE_WIDTH: 0.41999
G1 F2386.827
M204 S6000
G1 X84.61 Y90.958 E.0221
G1 X84.295 Y91.639 E.02351
G1 X83.827 Y92.224 E.02351
G1 X83.231 Y92.68 E.02352
G3 X81.805 Y93.108 I-1.84 J-3.542 E.04695
G1 X81.149 Y93.062 E.02064
G1 X80.344 Y92.824 E.02631
G1 X79.706 Y92.43 E.02351
G1 X79.182 Y91.894 E.02351
G1 X78.801 Y91.248 E.02351
G3 X78.577 Y90.458 I9.51 J-3.122 E.02576
G1 X78.548 Y89.781 E.02124
G1 X78.67 Y89.148 E.02022
G3 X79.03 Y88.326 I4.964 J1.684 E.02817
G1 X79.476 Y87.777 E.02218
G1 X80.069 Y87.323 E.02343
G1 X80.756 Y87.022 E.02351
G3 X81.541 Y86.893 I2.232 J11.095 E.02493
G1 X82.243 Y86.948 E.0221
G1 X82.905 Y87.161 E.0218
G1 X83.594 Y87.573 E.02518
G1 X84.119 Y88.109 E.02351
G3 X84.518 Y88.797 I-10.767 J6.71 E.02493
G1 X84.716 Y89.473 E.02209
G3 X84.748 Y90.207 I-12.386 J.915 E.02305
M204 S10000
G1 X85.119 Y89.959 F42000
; LINE_WIDTH: 0.41999
G1 F2386.827
M204 S6000
G1 X85.119 Y90.342 E.01201
G1 X84.98 Y91.033 E.0221
G1 X84.636 Y91.799 E.02634
G1 X84.119 Y92.462 E.02635
G1 X83.458 Y92.981 E.02635
G3 X82.562 Y93.366 I-2.936 J-5.611 E.03061
G1 X81.867 Y93.48 E.02209
G1 X81.119 Y93.438 E.02347
G3 X80.109 Y93.129 I.955 J-4.919 E.03319
G1 X79.504 Y92.748 E.02242
G3 X78.828 Y92.047 I4.738 J-5.244 E.03055
G1 X78.474 Y91.437 E.0221
G3 X78.201 Y90.501 I6.656 J-2.452 E.0306
G1 X78.171 Y89.797 E.0221
G1 X78.3 Y89.073 E.02305
G1 X78.364 Y88.841 E.00756
G1 X78.665 Y88.203 E.0221
G1 X79.182 Y87.541 E.02634
G3 X80.608 Y86.676 I2.909 J3.185 E.05264
G3 X81.57 Y86.517 I1.488 J6.031 E.03062
G1 X82.273 Y86.572 E.0221
G1 X83.024 Y86.803 E.02463
G3 X83.901 Y87.34 I-2.567 J5.183 E.03227
G1 X84.396 Y87.853 E.02238
G3 X84.88 Y88.691 I-5.696 J3.849 E.03035
G1 X85.078 Y89.367 E.02209
M73 P49 R8
G1 X85.115 Y89.899 E.01671
M204 S10000
G1 X85.496 Y89.943 F42000
; LINE_WIDTH: 0.41999
G1 F2386.827
M204 S6000
G1 X85.489 Y90.417 E.01485
G1 X85.349 Y91.107 E.0221
G1 X84.977 Y91.96 E.02917
G3 X84.248 Y92.857 I-5.081 J-3.384 E.0363
G1 X83.686 Y93.282 E.0221
G1 X83.006 Y93.603 E.02356
G1 X82.623 Y93.738 E.01272
G1 X81.928 Y93.852 E.02209
G1 X81.09 Y93.814 E.02631
G1 X80.776 Y93.762 E.00998
G1 X80.107 Y93.54 E.02209
G1 X79.305 Y93.068 E.02919
G3 X78.502 Y92.236 I3.877 J-4.544 E.03629
G1 X78.148 Y91.627 E.0221
G3 X77.836 Y90.63 I7.286 J-2.831 E.03276
G1 X77.794 Y89.813 E.02566
G1 X77.931 Y88.999 E.02589
G1 X78.023 Y88.68 E.0104
G1 X78.324 Y88.042 E.0221
G1 X78.889 Y87.303 E.02918
G3 X79.812 Y86.607 I4.007 J4.348 E.0363
G1 X80.459 Y86.329 E.02209
G1 X81.207 Y86.178 E.02392
G1 X81.6 Y86.141 E.01237
G1 X82.302 Y86.196 E.0221
G1 X83.142 Y86.446 E.02747
G1 X83.4 Y86.56 E.00883
G1 X83.996 Y86.935 E.02209
G1 X84.662 Y87.585 E.02918
G3 X85.242 Y88.585 I-4.671 J3.38 E.0363
G1 X85.44 Y89.262 E.02209
G1 X85.491 Y89.883 E.01955
M204 S10000
G1 X85.946 Y90.171 F42000
; LINE_WIDTH: 0.539104
G1 F1813.846
M204 S6000
G3 X85.756 Y91.27 I-6.08 J-.489 E.04607
G1 X85.372 Y92.147 E.03948
G3 X83.948 Y93.629 I-4.049 J-2.464 E.08551
G1 X83.179 Y94.007 E.03533
G1 X82.694 Y94.166 E.02107
G1 X81.999 Y94.28 E.02907
G3 X79.883 Y93.917 I-.28 J-4.708 E.08933
G1 X79.072 Y93.437 E.03889
G1 X78.506 Y92.913 E.03183
G1 X78.125 Y92.455 E.02458
G1 X77.767 Y91.848 E.02908
G1 X77.644 Y91.539 E.01373
; LINE_WIDTH: 0.511532
G1 F1920.567
G1 X77.635 Y91.444 E.00371
; LINE_WIDTH: 0.474915
G1 F2083.358
G1 X77.627 Y91.349 E.00342
; LINE_WIDTH: 0.422562
G1 F2370.66
G1 X77.618 Y91.254 E.00301
G1 X77.464 Y90.692 E.01841
; LINE_WIDTH: 0.443338
G1 F2247.654
G1 X77.417 Y90.261 E.01441
; LINE_WIDTH: 0.490033
G1 F2012.916
G1 X77.371 Y89.831 E.01609
; LINE_WIDTH: 0.538553
G1 F1815.861
G1 X77.347 Y89.719 E.00471
G1 X77.5 Y88.912 E.03388
G1 X77.631 Y88.495 E.018
G1 X77.933 Y87.858 E.02904
G1 X78.106 Y87.575 E.01368
G1 X78.563 Y87.013 E.02987
G1 X79.152 Y86.519 E.03165
G1 X79.64 Y86.207 E.02389
G1 X80.289 Y85.931 E.02904
G3 X81.634 Y85.71 I1.511 J4.996 E.05633
G1 X82.336 Y85.764 E.02905
G1 X82.662 Y85.828 E.01368
G1 X83.28 Y86.03 E.02679
G1 X83.912 Y86.361 E.02938
G1 X84.486 Y86.774 E.02915
G1 X84.974 Y87.284 E.02911
G1 X85.173 Y87.549 E.01367
G1 X85.53 Y88.157 E.02904
; LINE_WIDTH: 0.55319
G1 F1763.772
G1 X85.752 Y88.723 E.0258
; LINE_WIDTH: 0.545308
G1 F1791.446
G1 X85.816 Y89.078 E.01507
; LINE_WIDTH: 0.507005
G1 F1939.303
G3 X85.941 Y90.111 I-5.897 J1.237 E.0402
M204 S10000
G1 X86.48 Y89.833 F42000
; LINE_WIDTH: 0.56609
G1 F1720.282
M204 S6000
G1 X86.43 Y89.775 E.00334
; LINE_WIDTH: 0.543613
G1 F1797.511
G1 X86.368 Y89.571 E.00888
; LINE_WIDTH: 0.516475
G1 F1900.519
G1 X86.306 Y89.367 E.0084
G1 X86.26 Y88.712 E.02585
; LINE_WIDTH: 0.538758
G1 F1815.109
G1 X86.292 Y88.641 E.00319
G1 X86.024 Y88.043 E.02701
G1 X85.59 Y87.291 E.03581
G1 X85.33 Y86.946 E.01782
G1 X84.845 Y86.432 E.02913
G1 X84.198 Y85.945 E.03339
G2 X82.813 Y85.359 I-2.692 J4.429 E.06222
G1 X81.976 Y85.226 E.03494
G2 X79.079 Y85.97 I-.3 J4.844 E.12534
G2 X78.166 Y86.715 I3.633 J5.383 E.04867
G1 X77.704 Y87.282 E.03015
G1 X77.291 Y88.023 E.03499
G1 X77.049 Y88.677 E.02875
G1 X76.884 Y89.396 E.03039
; LINE_WIDTH: 0.527215
G1 F1858.371
G1 X76.788 Y89.742 E.01446
; LINE_WIDTH: 0.484325
G1 F2038.944
G1 X76.691 Y90.087 E.01318
; LINE_WIDTH: 0.424486
G1 F2358.704
G3 X76.398 Y90.867 I-2.208 J-.386 E.02659
G1 X76.713 Y91.197 E.01449
G1 X76.927 Y91.555 E.01324
; LINE_WIDTH: 0.442915
G1 F2250.028
G1 X77.018 Y91.656 E.00449
; LINE_WIDTH: 0.488765
G1 F2018.639
G1 X77.108 Y91.756 E.005
; LINE_WIDTH: 0.538856
G1 F1814.752
G1 X77.198 Y91.857 E.00557
G1 X77.636 Y92.619 E.03625
G1 X77.959 Y93.04 E.02189
G2 X78.808 Y93.858 I5.058 J-4.407 E.04867
G1 X79.408 Y94.234 E.0292
G1 X80.226 Y94.572 E.03648
G1 X80.892 Y94.727 E.02822
G1 X81.637 Y94.782 E.03081
G2 X83.179 Y94.534 I-.018 J-5.035 E.06465
G2 X84.242 Y94.025 I-2.038 J-5.625 E.04865
G1 X84.76 Y93.645 E.02651
G1 X85.364 Y93.023 E.03575
G2 X86.116 Y91.714 I-3.778 J-3.044 E.06249
G1 X86.369 Y90.828 E.03801
G1 X86.447 Y90.19 E.0265
; LINE_WIDTH: 0.556085
G1 F1753.822
G1 X86.475 Y89.893 E.01276
M204 S10000
G1 X86.95 Y89.695 F42000
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X86.812 Y89.538 E.00655
G3 X86.785 Y88.628 I.759 J-.478 E.02996
G1 X86.247 Y87.501 E.03913
G1 X85.776 Y86.786 E.02686
G1 X85.123 Y86.09 E.02991
G1 X84.422 Y85.562 E.02754
G2 X82.795 Y84.897 I-3.32 J5.805 E.05524
G1 X81.98 Y84.782 E.02582
G1 X81.015 Y84.809 E.03025
G1 X80.201 Y84.976 E.02606
G1 X79.315 Y85.321 E.02983
G1 X78.592 Y85.758 E.02646
G1 X77.881 Y86.375 E.02954
G1 X77.342 Y87.035 E.0267
G1 X76.879 Y87.859 E.02963
G1 X76.589 Y88.673 E.02708
G1 X76.226 Y90.354 E.05393
G1 X76.038 Y90.748 E.01371
G1 X75.61 Y90.997 E.01551
G1 X76.095 Y91.096 E.01551
G1 X76.4 Y91.409 E.01372
G1 X77.259 Y92.844 E.05245
G2 X78.522 Y94.193 I5.23 J-3.631 E.05815
G1 X79.244 Y94.646 E.02671
G1 X80.114 Y95.001 E.02947
G1 X80.946 Y95.184 E.02671
G1 X81.891 Y95.226 E.02965
G1 X82.722 Y95.122 E.02625
G1 X83.53 Y94.882 E.02644
G1 X84.377 Y94.465 E.02959
G1 X85.065 Y93.964 E.02671
G1 X85.721 Y93.286 E.02956
G1 X86.195 Y92.591 E.02639
G1 X86.589 Y91.722 E.02991
G1 X86.807 Y90.894 E.02687
G1 X86.943 Y89.755 E.03595
M204 S10000
G1 X87.332 Y89.672 F42000
G1 F2386.825
M204 S6000
G1 X87.346 Y89.554 E.00372
G1 X87.133 Y89.34 E.00949
G1 X87.049 Y89.058 E.00923
G1 X87.065 Y88.908 E.00472
G1 X87.208 Y88.637 E.00961
G1 X86.576 Y87.315 E.04593
G1 X86.073 Y86.552 E.02868
G1 X85.376 Y85.808 E.03194
G1 X84.632 Y85.248 E.02919
G2 X82.878 Y84.528 I-3.605 J6.284 E.05962
G1 X82.001 Y84.405 E.02778
G1 X80.972 Y84.433 E.03228
G1 X80.094 Y84.613 E.02809
G1 X79.147 Y84.982 E.03186
G1 X78.37 Y85.452 E.02849
G1 X77.609 Y86.112 E.03157
G1 X77.03 Y86.822 E.02874
G1 X76.534 Y87.702 E.03166
G1 X76.225 Y88.569 E.02886
G1 X75.856 Y90.283 E.05498
G1 X75.745 Y90.511 E.00795
; LINE_WIDTH: 0.44101
G1 F2260.795
G1 X75.632 Y90.599 E.00473
; LINE_WIDTH: 0.48305
G1 F2044.851
G1 X75.52 Y90.687 E.00523
; LINE_WIDTH: 0.545613
G1 F1790.358
G1 X75.407 Y90.776 E.00597
G1 X72.853 Y91.197 E.10821
G1 X72.608 Y91.289 E.01092
G1 X72.533 Y91.449 E.00738
G1 X72.563 Y91.584 E.00577
G1 X72.703 Y91.697 E.00756
G1 X72.935 Y91.693 E.00966
G1 X75.489 Y91.272 E.10822
; LINE_WIDTH: 0.52509
G1 F1866.562
G1 X75.624 Y91.32 E.00573
; LINE_WIDTH: 0.48305
G1 F2044.851
G1 X75.759 Y91.367 E.00523
; LINE_WIDTH: 0.42017
G1 F2385.69
G1 X75.893 Y91.414 E.00448
G1 X76.077 Y91.602 E.00823
G1 X76.935 Y93.038 E.05247
G2 X78.294 Y94.496 I5.665 J-3.919 E.06274
G1 X79.071 Y94.983 E.02876
G1 X80.002 Y95.363 E.03152
G1 X80.897 Y95.56 E.02876
G1 X81.906 Y95.604 E.03169
G1 X82.799 Y95.492 E.02823
G1 X83.668 Y95.235 E.02843
G1 X84.573 Y94.789 E.03163
G1 X85.314 Y94.249 E.02876
G1 X86.014 Y93.525 E.0316
G1 X86.525 Y92.777 E.02844
G1 X86.946 Y91.849 E.03195
G1 X87.178 Y90.964 E.0287
G1 X87.325 Y89.732 E.03893
M204 S10000
G1 X87.707 Y89.717 F42000
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X87.745 Y89.394 E.01019
G1 X87.454 Y89.141 E.0121
G1 X87.431 Y88.998 E.00457
G1 X87.644 Y88.674 E.01213
G1 X86.905 Y87.129 E.05369
G1 X86.37 Y86.318 E.0305
G1 X85.629 Y85.527 E.03397
G1 X84.843 Y84.935 E.03085
G2 X82.961 Y84.159 I-3.889 J6.763 E.06401
G1 X82.022 Y84.027 E.02974
G1 X80.929 Y84.057 E.0343
G1 X79.987 Y84.25 E.03013
G1 X78.98 Y84.642 E.03388
G1 X78.147 Y85.146 E.03053
G1 X77.337 Y85.848 E.03361
G1 X76.717 Y86.609 E.03077
G1 X76.19 Y87.545 E.03368
G1 X75.862 Y88.466 E.03064
G1 X75.488 Y90.198 E.05557
G1 X75.451 Y90.274 E.00265
G1 X75.335 Y90.341 E.0042
G1 X72.722 Y90.772 E.08305
G1 X72.356 Y90.924 E.01241
G1 X72.148 Y91.177 E.01027
G1 X72.087 Y91.417 E.00775
G1 X72.145 Y91.735 E.01014
G1 X72.342 Y92.001 E.01038
G1 X72.633 Y92.138 E.01009
G1 X73.006 Y92.128 E.0117
G1 X75.561 Y91.706 E.08117
G1 X75.738 Y91.775 E.00597
G3 X76.612 Y93.231 I-290.576 J175.141 E.05325
G2 X77.268 Y94.081 I18.609 J-13.699 E.03366
G1 X78.067 Y94.798 E.03366
G1 X78.899 Y95.319 E.03078
G1 X79.889 Y95.724 E.03354
G1 X80.848 Y95.935 E.03078
G1 X81.922 Y95.982 E.0337
G1 X82.877 Y95.862 E.03018
G1 X83.806 Y95.587 E.03039
G1 X84.769 Y95.113 E.03364
G1 X85.562 Y94.535 E.03078
G1 X86.308 Y93.765 E.03361
G1 X86.855 Y92.962 E.03046
G1 X87.303 Y91.976 E.03396
G1 X87.549 Y91.035 E.0305
G1 X87.7 Y89.776 E.03973
M204 S10000
G1 X87.99 Y89.088 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.260878
G1 F4129.25
M204 S6000
G1 X88.053 Y89.012 E.00179
; LINE_WIDTH: 0.289233
G1 F3653.897
G1 X88.116 Y88.936 E.00202
; LINE_WIDTH: 0.303418
G1 F3454.928
G1 X102.619 Y86.545 E.31837
M204 S10000
G1 X103.018 Y86.558 F42000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X103.778 Y87.495 E.03783
G1 X104.176 Y87.834 E.01637
G1 X104.6 Y88.052 E.01494
G1 X105.065 Y88.168 E.01505
G1 X105.546 Y88.173 E.01506
G1 X106.018 Y88.067 E.01518
G1 X106.451 Y87.856 E.0151
G1 X106.832 Y87.545 E.01542
G1 X107.127 Y87.157 E.0153
G1 X107.324 Y86.714 E.0152
G1 X107.41 Y86.257 E.01458
G1 X107.39 Y85.758 E.01563
G1 X107.249 Y85.28 E.01564
G1 X107.021 Y84.875 E.01458
G1 X106.694 Y84.52 E.01512
G1 X106.287 Y84.245 E.0154
G1 X105.827 Y84.072 E.0154
G1 X105.374 Y84.014 E.01432
G1 X104.867 Y84.064 E.01599
G1 X104.415 Y84.222 E.015
G1 X104.011 Y84.482 E.01506
G1 X103.68 Y84.824 E.01494
G1 X103.412 Y85.272 E.01637
G1 X102.993 Y86.404 E.03783
G1 X103.008 Y86.499 E.00303
M204 S10000
G1 X103.39 Y86.418 F42000
G1 F2386.825
M204 S6000
G1 X104.049 Y87.231 E.03283
G1 X104.387 Y87.518 E.01391
G2 X107.023 Y86.029 I.943 J-1.409 E.11735
G1 X107.015 Y85.82 E.00656
G1 X106.899 Y85.428 E.01283
G2 X105.368 Y84.394 I-1.609 J.732 E.06094
G1 X104.949 Y84.435 E.01322
G2 X103.981 Y85.055 I.489 J1.827 E.03661
G1 X103.703 Y85.572 E.01841
G1 X103.41 Y86.361 E.02639
M204 S10000
G1 X103.818 Y86.347 F42000
G1 F2386.825
M204 S6000
G1 X104.32 Y86.966 E.02499
G1 X104.732 Y87.272 E.01609
G1 X105.162 Y87.415 E.0142
G1 X105.618 Y87.384 E.01433
G1 X106.042 Y87.217 E.01428
G1 X106.381 Y86.892 E.01473
G1 X106.599 Y86.488 E.01438
G1 X106.646 Y86.045 E.01399
G1 X106.59 Y85.713 E.01053
G1 X106.406 Y85.321 E.01358
G1 X106.067 Y85.006 E.01451
G1 X105.644 Y84.809 E.01462
G1 X105.182 Y84.791 E.0145
G1 X104.748 Y84.905 E.01406
G1 X104.387 Y85.178 E.01422
G1 X104.095 Y85.6 E.01606
G1 X103.839 Y86.291 E.02312
M204 S10000
G1 X104.246 Y86.277 F42000
G1 F2386.825
M204 S6000
G1 X104.591 Y86.702 E.01716
G1 X104.905 Y86.937 E.01229
G1 X105.21 Y87.038 E.01009
G1 X105.536 Y87.016 E.01023
G1 X105.837 Y86.897 E.01016
G1 X106.081 Y86.664 E.01059
G1 X106.236 Y86.376 E.01026
G1 X106.27 Y86.06 E.00996
G1 X106.2 Y85.723 E.01079
G1 X105.951 Y85.383 E.01319
G1 X105.647 Y85.213 E.01094
G1 X105.357 Y85.153 E.00928
G1 X105.012 Y85.212 E.01097
G1 X104.733 Y85.363 E.00996
G1 X104.476 Y85.698 E.01324
G1 X104.268 Y86.221 E.01763
M204 S10000
G1 X104.675 Y86.206 F42000
G1 F2386.825
M204 S6000
G1 X105.021 Y86.572 E.01581
G1 X105.259 Y86.661 E.00796
G1 X105.516 Y86.634 E.00813
G1 X105.739 Y86.49 E.00832
G1 X105.874 Y86.263 E.00828
G1 X105.893 Y86.075 E.00592
G1 X105.822 Y85.819 E.00832
G1 X105.645 Y85.631 E.00809
G1 X105.406 Y85.539 E.00804
G1 X105.137 Y85.567 E.00846
G1 X104.929 Y85.703 E.00779
G2 X104.695 Y86.15 I.958 J.784 E.01592
M204 S10000
G1 X105.101 Y86.136 F42000
; LINE_WIDTH: 0.41614
G1 F2411.446
M204 S6000
G1 X105.287 Y86.282 E.00734
G1 X105.429 Y86.259 E.00447
G1 X105.519 Y86.119 E.00518
G2 X105.457 Y85.957 I-.228 J-.005 E.00551
G1 X105.301 Y85.914 E.00503
G2 X105.129 Y86.083 I.042 J.215 E.00793
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2411.446
G1 X105.185 Y85.977 E-.04001
G1 X105.301 Y85.914 E-.04436
G1 X105.457 Y85.957 E-.05428
G1 X105.519 Y86.119 E-.05799
G1 X105.429 Y86.259 E-.05591
G1 X105.287 Y86.282 E-.04821
G1 X105.101 Y86.136 E-.07925
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 4/65
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z1 I-.323 J-1.173 P1  F42000
G1 X81.579 Y92.62 Z1
G1 Z.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G1 X81.129 Y92.584 E.01528
G1 X80.89 Y92.505 E.00854
G1 X80.526 Y92.385 E.01296
G1 X79.989 Y92.046 E.02151
G1 X79.548 Y91.589 E.0215
G1 X79.229 Y91.04 E.0215
G1 X79.051 Y90.43 E.0215
G1 X79.024 Y89.795 E.0215
G1 X79.149 Y89.173 E.0215
G1 X79.42 Y88.598 E.0215
G1 X79.821 Y88.105 E.0215
G1 X80.328 Y87.723 E.0215
G1 X80.912 Y87.472 E.02151
G1 X81.289 Y87.41 E.01296
G1 X81.538 Y87.369 E.00854
G1 X82.172 Y87.419 E.02151
G1 X82.774 Y87.618 E.02149
G1 X83.312 Y87.957 E.02151
G1 X83.753 Y88.414 E.0215
G1 X84.072 Y88.963 E.0215
G1 X84.25 Y89.573 E.0215
G1 X84.277 Y90.208 E.0215
G1 X84.152 Y90.83 E.0215
G1 X83.881 Y91.405 E.0215
G1 X83.722 Y91.6 E.00854
G1 X83.48 Y91.898 E.01296
G1 X82.973 Y92.28 E.0215
G1 X82.389 Y92.531 E.0215
G1 X81.763 Y92.634 E.0215
G1 X81.639 Y92.624 E.0042
M204 S10000
G1 X81.611 Y92.214 F42000
G1 F2210.87
M204 S6000
G1 X81.21 Y92.182 E.0136
G1 X81.018 Y92.119 E.00687
G1 X80.701 Y92.014 E.01129
G1 X80.247 Y91.728 E.01816
G1 X79.875 Y91.342 E.01815
G1 X79.605 Y90.878 E.01816
G1 X79.455 Y90.363 E.01815
G1 X79.432 Y89.827 E.01816
G1 X79.538 Y89.302 E.01816
G1 X79.767 Y88.817 E.01815
G1 X80.106 Y88.4 E.01816
G1 X80.534 Y88.077 E.01815
G1 X81.027 Y87.866 E.01816
G1 X81.356 Y87.812 E.01129
G1 X81.556 Y87.779 E.00687
G1 X82.091 Y87.821 E.01816
G1 X82.6 Y87.989 E.01815
G1 X83.054 Y88.275 E.01816
G1 X83.426 Y88.661 E.01815
G1 X83.695 Y89.125 E.01816
G1 X83.846 Y89.64 E.01815
G1 X83.868 Y90.175 E.01816
G1 X83.762 Y90.701 E.01815
G1 X83.534 Y91.186 E.01815
G1 X83.406 Y91.344 E.00687
G1 X83.195 Y91.603 E.01129
G1 X82.767 Y91.926 E.01816
G1 X82.274 Y92.137 E.01815
G1 X81.745 Y92.224 E.01815
G1 X81.671 Y92.218 E.00252
M204 S10000
G1 X81.643 Y91.808 F42000
G1 F2210.87
M204 S6000
G1 X81.291 Y91.78 E.01193
G1 X81.146 Y91.732 E.00519
G1 X80.876 Y91.643 E.00961
G1 X80.506 Y91.41 E.01481
G1 X80.202 Y91.095 E.01481
G1 X79.982 Y90.717 E.01481
G1 X79.86 Y90.297 E.01481
G1 X79.841 Y89.86 E.01481
G1 X79.928 Y89.431 E.01481
G1 X80.114 Y89.035 E.01481
G1 X80.39 Y88.695 E.01481
G1 X80.739 Y88.432 E.01481
G1 X81.142 Y88.259 E.01481
G1 X81.422 Y88.213 E.00961
G1 X81.573 Y88.188 E.00519
G1 X82.009 Y88.222 E.01481
G1 X82.425 Y88.36 E.01481
G1 X82.795 Y88.593 E.01481
G1 X83.099 Y88.908 E.01481
G1 X83.318 Y89.286 E.01481
G1 X83.441 Y89.706 E.01481
G1 X83.46 Y90.143 E.01481
G1 X83.373 Y90.572 E.01481
G1 X83.186 Y90.968 E.01481
G1 X82.911 Y91.307 E.01481
G1 X82.561 Y91.571 E.01481
G1 X82.159 Y91.743 E.01481
G1 X81.728 Y91.815 E.01481
G1 X81.703 Y91.813 E.00085
M204 S250
G1 X81.674 Y91.417 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G1 X81.372 Y91.383 E.00953
G3 X81.252 Y88.639 I.278 J-1.387 E.11795
G1 X81.486 Y88.6 E.00741
G1 X81.59 Y88.583 E.00332
G3 X81.733 Y91.409 I.06 J1.413 E.13861
; WIPE_START
M204 S6000
G1 X81.372 Y91.383 E-.06878
G1 X81.269 Y91.36 E-.01997
G1 X81.045 Y91.286 E-.04492
G1 X80.755 Y91.103 E-.06504
G1 X80.517 Y90.857 E-.06503
G1 X80.345 Y90.561 E-.06505
G1 X80.27 Y90.302 E-.05121
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X81.825 Y96.174 Z1.2 F42000
G1 Z.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G1 X80.826 Y96.125 E.03385
G1 X79.803 Y95.898 E.03547
G1 X78.833 Y95.501 E.03547
G1 X77.944 Y94.945 E.03548
G1 X77.162 Y94.248 E.03546
G1 X76.491 Y93.406 E.03644
G1 X75.692 Y92.082 E.05235
G1 X72.989 Y92.528 E.09274
G3 X72.636 Y90.389 I-.208 J-1.064 E.11747
G1 X75.34 Y89.943 E.09273
G1 X75.672 Y88.433 E.05234
G1 X76.037 Y87.42 E.03644
G1 X76.554 Y86.509 E.03547
G1 X77.217 Y85.698 E.03547
G1 X78.009 Y85.01 E.03548
G1 X78.904 Y84.467 E.03547
G1 X79.879 Y84.082 E.03547
G1 X80.905 Y83.868 E.03547
G1 X81.952 Y83.83 E.03548
G1 X82.991 Y83.97 E.03547
G1 X83.991 Y84.283 E.03547
G1 X84.924 Y84.761 E.03547
G1 X85.762 Y85.39 E.03547
G1 X86.483 Y86.151 E.03547
G1 X87.076 Y87.041 E.03622
G1 X87.847 Y88.642 E.06013
G1 X102.857 Y86.167 E.51492
G1 X103.223 Y85.228 E.03413
G1 X103.523 Y84.718 E.02001
G1 X103.889 Y84.339 E.01782
G1 X104.333 Y84.054 E.01787
G1 X104.831 Y83.879 E.01787
G1 X105.356 Y83.824 E.01788
G1 X105.88 Y83.891 E.01787
G1 X106.374 Y84.077 E.01788
G1 X106.812 Y84.372 E.01787
G1 X107.17 Y84.76 E.01787
G1 X107.429 Y85.22 E.01787
G1 X107.575 Y85.728 E.01787
G1 X107.6 Y86.255 E.01787
M73 P50 R8
G1 X107.502 Y86.774 E.01787
G1 X107.287 Y87.257 E.01788
G1 X106.967 Y87.677 E.01787
G1 X106.559 Y88.012 E.01787
G1 X106.085 Y88.243 E.01788
G1 X105.57 Y88.359 E.01787
G1 X105.042 Y88.353 E.01787
G1 X104.529 Y88.226 E.01787
G1 X104.061 Y87.984 E.01782
G1 X103.614 Y87.598 E.02002
G1 X102.966 Y86.826 E.03413
G1 X87.956 Y89.3 E.5149
G1 X87.739 Y91.063 E.06013
G1 X87.463 Y92.097 E.03623
G1 X87.025 Y93.049 E.03547
G1 X86.433 Y93.914 E.03547
G1 X85.703 Y94.666 E.03547
G1 X84.856 Y95.284 E.03548
G1 X83.917 Y95.749 E.03547
G1 X82.913 Y96.05 E.03548
G1 X81.885 Y96.175 E.03506
M204 S10000
G1 X81.805 Y96.58 F42000
G1 F2210.87
M204 S6000
G1 X80.772 Y96.53 E.03503
G1 X79.681 Y96.287 E.03782
G1 X78.647 Y95.864 E.03782
G1 X77.699 Y95.272 E.03782
G1 X76.866 Y94.529 E.03781
G1 X76.157 Y93.639 E.03851
G1 X75.486 Y92.529 E.0439
G1 X73.043 Y92.931 E.08382
G3 X72.558 Y89.989 I-.26 J-1.468 E.15975
G1 X75.001 Y89.587 E.08381
G1 X75.28 Y88.32 E.0439
G1 X75.666 Y87.25 E.03851
G1 X76.217 Y86.278 E.03782
G1 X76.924 Y85.413 E.03782
G1 X77.768 Y84.68 E.03782
G1 X78.723 Y84.101 E.03781
G1 X79.762 Y83.691 E.03782
G1 X80.856 Y83.462 E.03782
G1 X81.972 Y83.422 E.03782
G1 X83.08 Y83.571 E.03781
G1 X84.146 Y83.905 E.03782
G1 X85.14 Y84.415 E.03782
G1 X86.034 Y85.085 E.03782
G1 X86.802 Y85.896 E.03781
G1 X87.43 Y86.839 E.03835
G1 X88.082 Y88.19 E.05077
G1 X102.562 Y85.803 E.49675
G1 X102.855 Y85.049 E.02739
G1 X103.197 Y84.47 E.02275
G1 X103.629 Y84.023 E.02106
G1 X104.153 Y83.686 E.02109
G1 X104.741 Y83.479 E.02109
G1 X105.361 Y83.414 E.0211
G1 X105.979 Y83.493 E.02109
G1 X106.562 Y83.713 E.0211
G1 X107.079 Y84.061 E.02109
G1 X107.501 Y84.519 E.02109
G1 X107.807 Y85.062 E.02109
G1 X107.979 Y85.661 E.02109
G1 X108.008 Y86.284 E.02109
G1 X107.893 Y86.896 E.02109
G1 X107.64 Y87.466 E.0211
G1 X107.262 Y87.961 E.02109
G1 X106.781 Y88.356 E.02109
G1 X106.221 Y88.63 E.0211
G1 X105.613 Y88.767 E.02109
G1 X104.99 Y88.76 E.0211
G1 X104.385 Y88.609 E.02109
G1 X103.832 Y88.324 E.02106
G1 X103.323 Y87.885 E.02276
G1 X102.803 Y87.265 E.02739
G1 X88.323 Y89.652 E.49674
G1 X88.14 Y91.141 E.05077
G1 X87.847 Y92.236 E.03836
G1 X87.38 Y93.251 E.03782
G1 X86.749 Y94.173 E.03782
G1 X85.971 Y94.974 E.03782
G1 X85.068 Y95.633 E.03782
G1 X84.067 Y96.129 E.03781
G1 X82.997 Y96.45 E.03782
G1 X81.888 Y96.584 E.03781
G1 X81.865 Y96.583 E.00076
M204 S10000
G1 X81.785 Y96.987 F42000
G1 F2210.87
M204 S6000
G1 X80.717 Y96.935 E.0362
G1 X79.559 Y96.677 E.04016
G1 X78.461 Y96.228 E.04016
G1 X77.454 Y95.599 E.04017
G1 X76.569 Y94.809 E.04016
G1 X75.822 Y93.872 E.04057
G1 X75.28 Y92.975 E.03546
G1 X73.097 Y93.335 E.0749
G3 X72.48 Y89.59 I-.323 J-1.87 E.20285
G1 X74.663 Y89.23 E.0749
G1 X74.888 Y88.207 E.03546
G1 X75.294 Y87.079 E.04057
G1 X75.88 Y86.047 E.04017
G1 X76.631 Y85.128 E.04016
G1 X77.527 Y84.35 E.04017
G1 X78.541 Y83.735 E.04016
G1 X79.645 Y83.299 E.04016
G1 X80.807 Y83.057 E.04016
G1 X81.992 Y83.014 E.04017
G1 X83.168 Y83.172 E.04016
G1 X84.301 Y83.527 E.04016
G1 X85.357 Y84.068 E.04016
G1 X86.306 Y84.78 E.04017
G1 X87.121 Y85.642 E.04016
G1 X87.785 Y86.637 E.04049
G1 X88.316 Y87.739 E.04142
G1 X102.267 Y85.439 E.47858
G1 X102.488 Y84.871 E.02064
G1 X102.87 Y84.222 E.02549
G1 X103.369 Y83.706 E.0243
G1 X103.973 Y83.318 E.02431
G1 X104.651 Y83.08 E.02432
G1 X105.365 Y83.004 E.02432
G1 X106.078 Y83.095 E.02432
G1 X106.75 Y83.349 E.02432
G1 X107.346 Y83.75 E.02431
G1 X107.833 Y84.278 E.02432
G1 X108.185 Y84.904 E.02432
G1 X108.383 Y85.594 E.02431
G1 X108.417 Y86.312 E.02432
G1 X108.285 Y87.018 E.02432
G1 X107.993 Y87.675 E.02432
G1 X107.557 Y88.246 E.02431
G1 X107.002 Y88.701 E.02431
G1 X106.356 Y89.017 E.02432
G1 X105.656 Y89.174 E.02431
G1 X104.937 Y89.166 E.02432
G1 X104.24 Y88.993 E.02431
G1 X103.603 Y88.664 E.02429
G1 X103.032 Y88.172 E.02549
G1 X102.64 Y87.705 E.02065
G1 X88.69 Y90.004 E.47857
G1 X88.54 Y91.219 E.04142
G1 X88.231 Y92.374 E.04048
G1 X87.736 Y93.452 E.04016
G1 X87.065 Y94.431 E.04016
G1 X86.238 Y95.283 E.04016
G1 X85.28 Y95.982 E.04017
G1 X84.217 Y96.509 E.04016
G1 X83.08 Y96.85 E.04017
G1 X81.902 Y96.993 E.04016
G1 X81.845 Y96.99 E.00194
M204 S250
G1 X81.766 Y97.379 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G1 X80.665 Y97.325 E.03458
G1 X79.441 Y97.053 E.0393
G1 X78.281 Y96.578 E.03929
G1 X77.218 Y95.914 E.0393
G1 X76.283 Y95.08 E.03929
G1 X75.499 Y94.096 E.03943
G1 X75.082 Y93.405 E.02532
G1 X73.149 Y93.724 E.06143
G3 X72.404 Y89.205 I-.376 J-2.259 E.22577
G1 X74.337 Y88.886 E.06142
G1 X74.51 Y88.097 E.02532
G1 X74.937 Y86.915 E.03942
G1 X75.555 Y85.824 E.0393
G1 X76.349 Y84.854 E.03929
G1 X77.295 Y84.032 E.0393
G1 X78.366 Y83.382 E.0393
G1 X79.532 Y82.922 E.0393
G1 X80.759 Y82.666 E.0393
G1 X82.012 Y82.621 E.0393
G1 X83.254 Y82.788 E.0393
G1 X84.45 Y83.163 E.0393
G1 X85.565 Y83.734 E.0393
G1 X86.568 Y84.486 E.0393
G1 X87.429 Y85.396 E.03929
G1 X88.126 Y86.442 E.0394
G1 X88.542 Y87.305 E.03002
G1 X101.982 Y85.089 E.4271
G1 X102.134 Y84.699 E.01311
G1 X102.556 Y83.983 E.02606
G1 X103.118 Y83.4 E.02539
G1 X103.8 Y82.963 E.02539
G1 X104.564 Y82.694 E.0254
G1 X105.381 Y82.611 E.02574
G1 X106.173 Y82.712 E.02505
G1 X106.931 Y82.998 E.0254
G1 X107.603 Y83.45 E.0254
G1 X108.152 Y84.046 E.0254
G1 X108.549 Y84.752 E.0254
G1 X108.773 Y85.53 E.0254
G1 X108.811 Y86.339 E.0254
G1 X108.661 Y87.136 E.0254
G1 X108.332 Y87.876 E.0254
G1 X107.841 Y88.52 E.0254
G1 X107.215 Y89.034 E.0254
G1 X106.487 Y89.389 E.0254
G1 X105.697 Y89.567 E.0254
G1 X104.887 Y89.558 E.0254
G1 X104.101 Y89.362 E.0254
G1 X103.382 Y88.991 E.02539
G1 X102.752 Y88.448 E.02606
G1 X102.483 Y88.128 E.01311
G1 X89.043 Y90.344 E.4271
G1 X88.926 Y91.294 E.03002
G1 X88.602 Y92.508 E.0394
G1 X88.078 Y93.647 E.0393
G1 X87.37 Y94.68 E.0393
G1 X86.497 Y95.58 E.0393
G1 X85.484 Y96.318 E.0393
G1 X84.361 Y96.875 E.03929
G1 X83.161 Y97.235 E.0393
G1 X81.917 Y97.386 E.0393
G1 X81.826 Y97.381 E.00284
; WIPE_START
M204 S6000
G1 X80.665 Y97.325 E-.22093
G1 X79.847 Y97.143 E-.15907
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.2
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.2 F4000
            G39.3 S1
            G0 Z1.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X77.161 Y90.696 F42000
G1 Z.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50502
G1 F1947.63
M204 S6000
G2 X77.159 Y90.796 I-.029 J.049 E.00914
; WIPE_START
G1 X77.103 Y90.796 E-.09221
G1 X77.074 Y90.746 E-.09593
G1 X77.103 Y90.696 E-.09593
G1 X77.161 Y90.696 E-.09593
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X84.67 Y90.215 Z1.2 F42000
G1 Z.8
G1 E.4 F1800
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X84.531 Y90.932 E.02288
G1 X84.23 Y91.583 E.0225
G1 X83.769 Y92.164 E.02325
M73 P51 R8
G1 X83.19 Y92.608 E.02288
G3 X81.802 Y93.025 I-1.832 J-3.581 E.04568
G1 X81.172 Y92.981 E.0198
G1 X80.38 Y92.749 E.02588
G1 X79.759 Y92.365 E.02289
G1 X79.248 Y91.844 E.02288
G1 X78.877 Y91.215 E.02288
G1 X78.682 Y90.565 E.02128
G1 X78.631 Y89.787 E.02444
G3 X78.777 Y89.044 I17.186 J3.001 E.02375
G1 X79.076 Y88.409 E.02202
G1 X79.532 Y87.839 E.02288
G1 X80.111 Y87.395 E.02288
G1 X80.78 Y87.102 E.02288
G1 X81.345 Y87.003 E.018
G3 X82.26 Y87.035 I.313 J4.164 E.02874
G1 X82.883 Y87.241 E.02057
G1 X83.542 Y87.638 E.02413
G1 X84.053 Y88.159 E.02288
G3 X84.442 Y88.83 I-9.872 J6.178 E.0243
G1 X84.634 Y89.487 E.02146
G1 X84.667 Y90.156 E.021
M204 S10000
G1 X85.037 Y89.97 F42000
G1 F2386.825
M204 S6000
G1 X85.036 Y90.335 E.01147
G1 X84.901 Y91.007 E.02147
G1 X84.571 Y91.744 E.02533
G3 X83.931 Y92.521 I-4.607 J-3.145 E.03161
G1 X83.409 Y92.915 E.02048
G3 X82.539 Y93.286 I-3.041 J-5.931 E.0297
G1 X81.863 Y93.397 E.02147
G1 X81.142 Y93.357 E.02264
G1 X80.911 Y93.322 E.00734
G1 X80.261 Y93.107 E.02146
G1 X79.558 Y92.684 E.02572
G3 X78.895 Y91.997 I4.619 J-5.12 E.02997
G1 X78.551 Y91.405 E.02147
G1 X78.32 Y90.671 E.02412
G1 X78.254 Y89.803 E.02728
G3 X78.423 Y88.916 I8.606 J1.175 E.02833
G1 X78.735 Y88.248 E.02314
G1 X79.24 Y87.601 E.02572
G3 X80.002 Y87.025 I4.464 J5.12 E.02998
G1 X80.631 Y86.756 E.02147
G3 X81.574 Y86.6 I1.426 J5.713 E.02999
G1 X82.257 Y86.654 E.02147
G1 X83.001 Y86.883 E.02443
G3 X83.857 Y87.413 I-2.5 J4.99 E.03161
G1 X84.328 Y87.901 E.02126
G3 X84.804 Y88.724 I-5.269 J3.598 E.02982
G1 X84.995 Y89.381 E.02146
G1 X85.033 Y89.91 E.01663
M204 S10000
G1 X85.414 Y89.954 F42000
G1 F2386.825
M204 S6000
G1 X85.406 Y90.41 E.01431
G1 X85.27 Y91.081 E.02147
G1 X84.912 Y91.905 E.02817
G3 X84.19 Y92.798 I-4.792 J-3.136 E.03604
G1 X83.644 Y93.21 E.02147
G3 X82.6 Y93.658 I-2.717 J-4.895 E.03567
G1 X81.925 Y93.769 E.02147
G1 X81.113 Y93.733 E.02547
G1 X80.792 Y93.68 E.01019
G1 X80.142 Y93.465 E.02146
G1 X79.357 Y93.003 E.02856
G3 X78.569 Y92.186 I3.809 J-4.465 E.03566
G1 X78.225 Y91.594 E.02147
G1 X77.958 Y90.777 E.02696
G1 X77.904 Y90.453 E.0103
G1 X77.877 Y89.82 E.01987
G3 X78.068 Y88.788 I7.188 J.795 E.03291
G1 X78.394 Y88.087 E.02426
G1 X78.947 Y87.363 E.02856
G3 X79.853 Y86.679 I3.935 J4.27 E.03567
G1 X80.483 Y86.409 E.02147
G1 X81.223 Y86.259 E.02367
G1 X81.603 Y86.224 E.01198
G1 X82.286 Y86.278 E.02147
G1 X83.12 Y86.525 E.02727
G3 X84.12 Y87.143 I-2.308 J4.855 E.03693
G1 X84.602 Y87.642 E.02175
G3 X85.166 Y88.618 I-4.527 J3.267 E.03539
G1 X85.357 Y89.275 E.02146
G1 X85.409 Y89.894 E.01946
M204 S10000
G1 X85.834 Y89.936 F42000
; LINE_WIDTH: 0.48026
G1 F2057.899
M204 S6000
G1 X85.805 Y90.491 E.0202
G1 X85.665 Y91.161 E.0249
G1 X85.566 Y91.47 E.01181
G1 X85.28 Y92.079 E.02446
G3 X84.435 Y93.122 I-4.356 J-2.666 E.04895
G1 X83.888 Y93.533 E.0249
G1 X83.176 Y93.887 E.02891
G1 X82.666 Y94.057 E.01955
G1 X81.99 Y94.167 E.0249
G3 X80.665 Y94.063 I-.254 J-5.237 E.04845
G1 X80.016 Y93.847 E.02489
G1 X79.721 Y93.712 E.01181
G1 X79.129 Y93.34 E.02543
G3 X78.218 Y92.39 I3.265 J-4.041 E.04798
G3 X77.726 Y91.504 I4.59 J-3.128 E.03688
; LINE_WIDTH: 0.493745
G1 F1996.34
G1 X77.661 Y91.193 E.01191
; LINE_WIDTH: 0.430588
G1 F2321.575
G3 X77.528 Y90.469 I8.3 J-1.902 E.02376
; LINE_WIDTH: 0.433718
G1 F2302.983
G1 X77.5 Y90.153 E.0103
; LINE_WIDTH: 0.478845
G1 F2064.576
G3 X77.602 Y88.972 I2.849 J-.35 E.04328
G1 X77.69 Y88.652 E.01201
G1 X78.03 Y87.915 E.02942
G1 X78.2 Y87.638 E.01178
G1 X78.635 Y87.104 E.02498
G1 X79.194 Y86.629 E.0266
G1 X79.694 Y86.306 E.02155
G1 X80.323 Y86.037 E.02482
G3 X81.635 Y85.822 I1.502 J5.04 E.04831
G1 X82.318 Y85.876 E.02482
G1 X82.636 Y85.938 E.01177
G1 X83.248 Y86.138 E.02333
G1 X83.86 Y86.462 E.02511
G1 X84.413 Y86.861 E.02468
G1 X84.887 Y87.354 E.02481
G1 X85.335 Y88.037 E.02959
G1 X85.56 Y88.503 E.01877
; LINE_WIDTH: 0.472413
G1 F2095.496
G1 X85.641 Y88.836 E.01224
; LINE_WIDTH: 0.440438
G1 F2264.051
G1 X85.722 Y89.169 E.01133
; LINE_WIDTH: 0.44522
G1 F2237.137
G1 X85.773 Y89.523 E.01196
; LINE_WIDTH: 0.48676
G1 F2027.758
G1 X85.825 Y89.876 E.0132
M204 S10000
G1 X86.309 Y89.855 F42000
; LINE_WIDTH: 0.486005
G1 F2031.213
M204 S6000
G1 X86.226 Y89.64 E.00848
; LINE_WIDTH: 0.431339
G1 F2317.089
G3 X86.095 Y89.11 I1.138 J-.562 E.01775
; LINE_WIDTH: 0.445808
G1 F2233.874
G1 X86.095 Y88.926 E.00619
; LINE_WIDTH: 0.47948
G1 F2061.573
G1 X86.094 Y88.741 E.00671
G1 X86.123 Y88.677 E.00256
G1 X85.867 Y88.108 E.02264
G1 X85.445 Y87.388 E.03031
G1 X85.201 Y87.054 E.015
G1 X84.738 Y86.567 E.02441
G1 X84.111 Y86.097 E.02841
G2 X82.769 Y85.526 I-2.564 J4.162 E.05316
G1 X81.895 Y85.392 E.0321
G1 X81.268 Y85.406 E.02277
G1 X80.556 Y85.524 E.02618
G2 X79.173 Y86.116 I1.026 J4.309 E.05488
G2 X78.295 Y86.832 I3.069 J4.66 E.0412
G1 X77.839 Y87.39 E.02614
G1 X77.465 Y88.056 E.02774
G2 X77.051 Y89.419 I5.26 J2.343 E.05182
; LINE_WIDTH: 0.473765
G1 F2088.918
G1 X76.924 Y89.912 E.01824
; LINE_WIDTH: 0.426422
G1 F2346.794
G3 X76.74 Y90.596 I-8.587 J-1.944 E.02259
G1 X76.599 Y90.834 E.00884
G1 X76.904 Y91.143 E.01383
; LINE_WIDTH: 0.444575
G1 F2240.729
G1 X77.099 Y91.418 E.01127
; LINE_WIDTH: 0.481124
G1 F2053.839
G1 X77.294 Y91.694 E.0123
G1 X77.764 Y92.503 E.03408
G2 X78.909 Y93.717 I5.626 J-4.156 E.06095
G1 X79.494 Y94.083 E.02514
G1 X80.253 Y94.4 E.02997
G1 X80.919 Y94.556 E.02495
G1 X81.638 Y94.612 E.02628
G2 X83.124 Y94.369 I-.061 J-5.029 E.05505
G1 X83.786 Y94.084 E.02627
G2 X84.665 Y93.499 I-1.99 J-3.939 E.03854
G1 X85.21 Y92.938 E.02852
G2 X85.959 Y91.653 I-3.784 J-3.065 E.0544
G1 X86.203 Y90.781 E.03301
G2 X86.303 Y89.914 I-13.75 J-2.033 E.03178
M204 S10000
G1 X86.749 Y89.725 F42000
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X86.619 Y89.578 E.00616
G3 X86.503 Y88.845 I.87 J-.514 E.02384
G1 X86.586 Y88.664 E.00622
G1 X86.078 Y87.611 E.03667
G1 X85.583 Y86.868 E.028
G1 X84.997 Y86.248 E.02674
G1 X84.314 Y85.737 E.02674
G1 X83.555 Y85.348 E.02674
G1 X82.741 Y85.093 E.02674
G1 X81.896 Y84.979 E.02674
G1 X81.044 Y85.01 E.02674
G1 X80.209 Y85.184 E.02675
G1 X79.416 Y85.497 E.02674
G1 X78.687 Y85.939 E.02674
G1 X78.043 Y86.499 E.02674
G1 X77.503 Y87.159 E.02674
G1 X77.082 Y87.901 E.02673
G1 X76.775 Y88.752 E.02836
G1 X76.429 Y90.324 E.05048
G1 X76.229 Y90.73 E.0142
G1 X75.819 Y90.963 E.01477
G1 X76.282 Y91.051 E.01477
G1 X76.602 Y91.372 E.01421
G1 X77.434 Y92.75 E.05047
G1 X77.998 Y93.457 E.02837
G1 X78.634 Y94.025 E.02673
G1 X79.358 Y94.477 E.02675
G1 X80.147 Y94.8 E.02674
G1 X80.98 Y94.985 E.02674
G1 X81.832 Y95.027 E.02675
G1 X82.678 Y94.924 E.02674
G1 X83.495 Y94.679 E.02675
G1 X84.259 Y94.3 E.02673
G1 X84.948 Y93.797 E.02675
G1 X85.542 Y93.185 E.02674
G1 X86.024 Y92.482 E.02674
G1 X86.381 Y91.707 E.02674
G1 X86.611 Y90.844 E.028
G1 X86.742 Y89.785 E.03346
M204 S10000
G1 X87.132 Y89.699 F42000
G1 F2386.825
M204 S6000
G1 X87.146 Y89.585 E.00358
G1 X86.938 Y89.377 E.00923
G1 X86.851 Y89.091 E.00938
G1 X86.869 Y88.937 E.00485
G1 X87.009 Y88.673 E.00937
G1 X86.406 Y87.423 E.0435
G1 X85.879 Y86.632 E.02982
G1 X85.249 Y85.966 E.02875
G1 X84.515 Y85.416 E.02875
M73 P51 R7
G1 X83.699 Y84.998 E.02876
G1 X82.823 Y84.723 E.02876
G1 X81.915 Y84.601 E.02875
G1 X80.998 Y84.634 E.02875
G1 X80.1 Y84.822 E.02876
G1 X79.247 Y85.158 E.02875
G1 X78.463 Y85.634 E.02875
G1 X77.771 Y86.235 E.02876
G1 X77.19 Y86.945 E.02876
G1 X76.738 Y87.743 E.02875
G1 X76.412 Y88.647 E.03014
G1 X76.061 Y90.243 E.05124
G1 X75.941 Y90.487 E.00852
; LINE_WIDTH: 0.441009
G1 F2260.805
G1 X75.831 Y90.572 E.0046
; LINE_WIDTH: 0.483045
G1 F2044.874
G1 X75.721 Y90.657 E.00509
; LINE_WIDTH: 0.545484
G1 F1790.819
G1 X75.611 Y90.742 E.00581
G1 X72.831 Y91.2 E.11776
G1 X72.572 Y91.326 E.01202
G1 X72.537 Y91.492 E.00707
G1 X72.593 Y91.62 E.00583
G1 X72.73 Y91.698 E.00657
G1 X72.933 Y91.693 E.00852
G1 X75.693 Y91.239 E.11687
; LINE_WIDTH: 0.525082
G1 F1866.594
G1 X75.824 Y91.284 E.00557
; LINE_WIDTH: 0.483045
G1 F2044.874
G1 X75.956 Y91.329 E.00509
; LINE_WIDTH: 0.420171
G1 F2385.679
G1 X76.087 Y91.374 E.00436
G1 X76.279 Y91.567 E.00853
G1 X77.124 Y92.966 E.05127
G1 X77.723 Y93.718 E.03016
G1 X78.407 Y94.328 E.02876
G1 X79.185 Y94.814 E.02877
G1 X80.034 Y95.161 E.02877
G1 X80.929 Y95.36 E.02876
G1 X81.845 Y95.405 E.02877
G1 X82.755 Y95.294 E.02876
G1 X83.634 Y95.031 E.02877
G1 X84.455 Y94.624 E.02876
G1 X85.196 Y94.083 E.02877
G1 X85.835 Y93.425 E.02877
G1 X86.353 Y92.669 E.02876
G1 X86.737 Y91.835 E.02877
G1 X86.982 Y90.916 E.02984
G1 X87.125 Y89.758 E.0366
M204 S10000
G1 X87.506 Y89.745 F42000
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X87.546 Y89.426 E.01008
G1 X87.257 Y89.176 E.01196
G1 X87.234 Y89.03 E.00466
G1 X87.445 Y88.709 E.01202
G1 X86.735 Y87.236 E.05127
G1 X86.175 Y86.396 E.03165
G1 X85.5 Y85.683 E.03076
G1 X84.715 Y85.095 E.03076
G1 X83.842 Y84.647 E.03077
G1 X82.906 Y84.354 E.03077
G1 X81.933 Y84.223 E.03076
G1 X80.953 Y84.258 E.03076
G1 X79.992 Y84.459 E.03077
G1 X79.079 Y84.819 E.03076
G1 X78.24 Y85.328 E.03076
G1 X77.5 Y85.972 E.03077
G1 X76.878 Y86.731 E.03077
G1 X76.394 Y87.585 E.03076
G1 X76.049 Y88.542 E.03191
G1 X75.692 Y90.168 E.05219
G3 X75.539 Y90.308 I-.183 J-.046 E.00686
G1 X72.722 Y90.772 E.08952
G1 X72.42 Y90.876 E.01001
G1 X72.193 Y91.103 E.01006
G1 X72.087 Y91.417 E.01038
G1 X72.145 Y91.735 E.01014
G1 X72.342 Y92.001 E.01038
G1 X72.619 Y92.123 E.0095
G1 X72.947 Y92.137 E.01028
G1 X75.764 Y91.673 E.08954
G1 X75.94 Y91.738 E.00588
G3 X76.814 Y93.182 I-220.175 J134.279 E.0529
G1 X77.448 Y93.978 E.03192
G1 X78.18 Y94.63 E.03075
G1 X79.013 Y95.15 E.03077
G1 X79.921 Y95.522 E.03076
G1 X80.879 Y95.735 E.03076
G1 X81.859 Y95.783 E.03077
G1 X82.833 Y95.665 E.03076
G1 X83.773 Y95.383 E.03077
G1 X84.652 Y94.947 E.03076
G1 X85.445 Y94.369 E.03077
G1 X86.128 Y93.665 E.03077
G1 X86.683 Y92.855 E.03076
G1 X87.093 Y91.964 E.03077
G1 X87.353 Y90.988 E.03166
G1 X87.499 Y89.804 E.0374
M204 S10000
G1 X87.792 Y89.121 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.259594
G1 F4153.719
M204 S6000
G1 X87.855 Y89.045 E.00178
; LINE_WIDTH: 0.288829
G1 F3659.889
G1 X87.918 Y88.968 E.00202
; LINE_WIDTH: 0.303446
G1 F3454.554
G1 X102.821 Y86.511 E.3272
; WIPE_START
G1 X100.848 Y86.837 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.353 Y86.061 Z1.2 F42000
G1 Z.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38162
G1 F2657.219
M204 S6000
G1 X105.289 Y86.098 E.00206
G1 X105.337 Y86.126 E.00157
M204 S10000
G1 X104.895 Y86.17 F42000
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X105.168 Y86.417 E.01155
G1 X105.369 Y86.457 E.00641
G1 X105.558 Y86.375 E.00647
G1 X105.675 Y86.205 E.00646
G1 X105.689 Y86.081 E.00392
G1 X105.623 Y85.885 E.00647
G1 X105.457 Y85.762 E.00647
G1 X105.251 Y85.746 E.00647
G1 X105.074 Y85.847 E.0064
G1 X104.925 Y86.117 E.00967
M204 S10000
G1 X104.463 Y86.241 F42000
G1 F2386.825
M204 S6000
G1 X104.851 Y86.654 E.01779
G1 X105.07 Y86.791 E.00807
G1 X105.409 Y86.834 E.01071
G1 X105.731 Y86.721 E.01071
G1 X105.968 Y86.475 E.01071
G1 X106.07 Y86.149 E.01071
G2 X105.813 Y85.536 I-.854 J-.003 E.0214
G1 X105.51 Y85.379 E.01071
G1 X105.168 Y85.375 E.01071
G1 X104.861 Y85.525 E.0107
G1 X104.598 Y85.895 E.01425
G1 X104.485 Y86.185 E.00975
M204 S10000
G1 X104.031 Y86.312 F42000
G1 F2386.825
M204 S6000
G1 X104.432 Y86.791 E.01959
G1 X104.822 Y87.087 E.01536
G1 X105.188 Y87.209 E.0121
G1 X105.575 Y87.183 E.01216
G1 X105.936 Y87.04 E.01215
G1 X106.216 Y86.772 E.01216
G1 X106.4 Y86.431 E.01216
G1 X106.442 Y86.045 E.01216
G1 X106.364 Y85.666 E.01215
G1 X106.148 Y85.343 E.01216
G1 X105.845 Y85.102 E.01215
G1 X105.472 Y84.994 E.01216
G1 X105.085 Y85.005 E.01216
G1 X104.728 Y85.163 E.01222
G1 X104.442 Y85.417 E.01201
G2 X104.052 Y86.256 I2.924 J1.867 E.0291
M204 S10000
G1 X103.598 Y86.383 F42000
G1 F2386.825
M204 S6000
G1 X104.163 Y87.056 E.02755
G1 X104.495 Y87.343 E.01375
G2 X104.048 Y85.342 I.834 J-1.236 E.22296
G1 X103.879 Y85.663 E.0114
G1 X103.62 Y86.327 E.02235
M204 S10000
G1 X103.219 Y86.519 F42000
G1 F2386.825
M204 S6000
G1 X103.894 Y87.322 E.03288
G1 X104.282 Y87.657 E.0161
G1 X104.668 Y87.857 E.01362
G1 X105.092 Y87.962 E.01368
G1 X105.528 Y87.967 E.01368
G1 X105.954 Y87.871 E.01368
G1 X106.346 Y87.679 E.01368
G1 X106.683 Y87.403 E.01369
G1 X106.948 Y87.056 E.01368
G1 X107.125 Y86.657 E.01368
G1 X107.206 Y86.228 E.01368
G1 X107.185 Y85.792 E.01368
G1 X107.065 Y85.373 E.01368
G1 X106.851 Y84.992 E.01369
G1 X106.555 Y84.672 E.01368
G1 X106.193 Y84.428 E.01368
G1 X105.785 Y84.274 E.01368
G1 X105.352 Y84.218 E.01368
G1 X104.918 Y84.264 E.01369
G1 X104.506 Y84.409 E.01368
G1 X104.139 Y84.645 E.01368
G1 X103.837 Y84.957 E.01362
G1 X103.577 Y85.4 E.0161
G1 X103.196 Y86.377 E.03288
G1 X103.21 Y86.459 E.00263
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2386.825
G1 X103.196 Y86.377 E-.01591
G1 X103.577 Y85.4 E-.19925
G1 X103.837 Y84.957 E-.09754
G1 X104.083 Y84.702 E-.0673
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 5/65
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z1.2 I-.4 J-1.149 P1  F42000
G1 X81.592 Y92.539 Z1.2
G1 Z1
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G1 X81.272 Y92.514 E.01088
G3 X81.476 Y87.463 I.383 J-2.514 E.25137
G3 X83.336 Y88.097 I.147 J2.614 E.06821
G1 X83.687 Y88.465 E.01721
G1 X83.995 Y88.993 E.02069
G1 X84.166 Y89.581 E.02071
G3 X83.803 Y91.371 I-2.781 J.367 E.06298
G1 X83.414 Y91.845 E.02075
G3 X81.745 Y92.55 I-1.85 J-2.054 E.06251
G1 X81.652 Y92.543 E.00314
M204 S10000
G1 X81.623 Y92.133 F42000
G1 F2210.87
M204 S6000
G1 X81.323 Y92.11 E.01018
G3 X81.51 Y87.869 I.331 J-2.11 E.21096
G3 X83.359 Y88.711 I.121 J2.185 E.07151
G1 X83.618 Y89.155 E.01739
G3 X83.457 Y91.15 I-2.071 J.837 E.07024
G1 X83.131 Y91.549 E.01744
G1 X82.72 Y91.856 E.01737
G3 X82.133 Y92.079 I-1.011 J-1.781 E.02132
G3 X81.729 Y92.141 I-.473 J-1.741 E.01388
G1 X81.683 Y92.137 E.00157
M204 S10000
G1 X81.653 Y91.727 F42000
G1 F2210.87
M204 S6000
G1 X81.373 Y91.707 E.0095
G3 X81.545 Y88.276 I.28 J-1.706 E.17064
G3 X83.032 Y88.958 I.092 J1.763 E.05756
G1 X83.241 Y89.317 E.0141
G1 X83.358 Y89.717 E.0141
G3 X81.713 Y91.729 I-1.705 J.284 E.09953
M204 S250
G1 X81.683 Y91.336 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G1 X81.423 Y91.316 E.00818
G1 X81.367 Y91.306 E.00177
G1 X81.107 Y91.221 E.00859
G1 X81.029 Y91.18 E.00275
G1 X80.835 Y91.058 E.00721
G1 X80.791 Y91.023 E.00176
G1 X80.605 Y90.831 E.00839
G1 X80.57 Y90.786 E.00176
G1 X80.436 Y90.555 E.00839
G1 X80.413 Y90.503 E.00176
G1 X80.338 Y90.246 E.00839
G1 X80.329 Y90.191 E.00176
M73 P52 R7
G1 X80.319 Y89.961 E.00723
G1 X80.321 Y89.874 E.00273
G1 X80.376 Y89.605 E.00859
G1 X80.394 Y89.552 E.00176
G1 X80.508 Y89.31 E.00839
G1 X80.539 Y89.263 E.00176
G1 X80.708 Y89.055 E.00839
G1 X80.749 Y89.017 E.00175
G1 X80.933 Y88.879 E.00722
G1 X81.007 Y88.832 E.00273
G1 X81.259 Y88.725 E.0086
G1 X81.313 Y88.711 E.00176
G1 X81.578 Y88.668 E.00839
G3 X82.173 Y88.775 I.001 J1.703 E.01905
G1 X82.253 Y88.811 E.00276
G1 X82.453 Y88.937 E.00742
G1 X82.522 Y88.991 E.00275
G3 X82.983 Y90.063 I-.844 J.998 E.03794
G1 X82.976 Y90.151 E.00275
G1 X82.929 Y90.383 E.00742
G1 X82.9 Y90.466 E.00275
G3 X82.057 Y91.273 I-1.233 J-.444 E.03793
G1 X81.971 Y91.295 E.00277
G3 X81.743 Y91.334 I-.32 J-1.179 E.00729
; WIPE_START
M204 S6000
G1 X81.423 Y91.316 E-.06086
G1 X81.367 Y91.306 E-.0107
G1 X81.107 Y91.221 E-.05207
G1 X81.029 Y91.18 E-.01665
G1 X80.835 Y91.058 E-.04369
G1 X80.791 Y91.023 E-.01065
G1 X80.605 Y90.831 E-.05086
G1 X80.57 Y90.786 E-.01067
G1 X80.436 Y90.555 E-.05086
G1 X80.413 Y90.503 E-.01068
G1 X80.338 Y90.246 E-.05083
G1 X80.329 Y90.191 E-.0107
G1 X80.329 Y90.187 E-.0008
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X81.846 Y95.975 Z1.4 F42000
G1 Z1
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G1 X80.853 Y95.927 E.03364
G1 X79.863 Y95.707 E.03432
G1 X78.891 Y95.309 E.03553
G1 X77.227 Y91.904 E.12827
G1 X77.006 Y91.27 E.02274
G3 X76.85 Y89.619 I5.485 J-1.348 E.05635
G1 X77.334 Y85.86 E.12826
G1 X78.126 Y85.172 E.03554
G1 X78.993 Y84.646 E.03432
G1 X79.936 Y84.274 E.03432
G1 X80.929 Y84.066 E.03433
G1 X81.943 Y84.03 E.03433
G1 X82.948 Y84.165 E.03432
G1 X83.915 Y84.468 E.03433
G1 X84.818 Y84.931 E.03432
G1 X84.886 Y84.982 E.00288
G1 X86.211 Y88.448 E.1256
G3 X86.468 Y90.01 I-4.731 J1.582 E.05382
G1 X86.326 Y93.717 E.12559
G1 X86.278 Y93.787 E.00287
G1 X85.571 Y94.515 E.03433
G1 X84.752 Y95.113 E.03433
G1 X83.844 Y95.563 E.03432
G1 X82.872 Y95.854 E.03433
G1 X81.905 Y95.971 E.03297
M204 S10000
G1 X81.826 Y96.382 F42000
G1 F2210.87
M204 S6000
G1 X80.798 Y96.332 E.03482
G1 X79.741 Y96.097 E.03667
G1 X78.738 Y95.686 E.03667
G1 X78.197 Y95.348 E.02162
G1 X78.438 Y95.308 E.00828
G1 X76.851 Y92.062 E.12232
G1 X76.614 Y91.383 E.02435
G3 X76.444 Y89.591 I5.986 J-1.471 E.06114
G1 X76.904 Y86.007 E.12231
G1 X76.663 Y86.047 E.00827
G1 X77.068 Y85.552 E.02162
G1 X77.885 Y84.842 E.03667
G1 X78.812 Y84.28 E.03667
G1 X79.819 Y83.882 E.03667
G1 X80.88 Y83.661 E.03667
G1 X81.963 Y83.622 E.03667
G1 X83.036 Y83.766 E.03667
G1 X84.07 Y84.09 E.03667
G1 X85.034 Y84.584 E.03667
G1 X85.956 Y85.275 E.03898
G1 X85.465 Y85.356 E.01684
G1 X86.597 Y88.318 E.10733
G3 X86.875 Y90.009 I-5.131 J1.714 E.05827
G1 X86.754 Y93.177 E.10732
G1 X87.245 Y93.096 E.01685
G1 X86.594 Y94.046 E.03897
G1 X85.839 Y94.823 E.03667
G1 X84.964 Y95.462 E.03667
G1 X83.994 Y95.943 E.03667
G1 X82.956 Y96.254 E.03667
G1 X81.886 Y96.384 E.03649
M204 S10000
G1 X81.806 Y96.788 F42000
G1 F2210.87
M204 S6000
G1 X80.744 Y96.736 E.03599
G1 X79.619 Y96.486 E.03901
G1 X78.552 Y96.05 E.03901
G1 X77.574 Y95.439 E.03902
G1 X77.195 Y95.1 E.01722
G1 X77.832 Y94.995 E.02187
G1 X76.475 Y92.219 E.10462
G1 X76.222 Y91.495 E.02595
G3 X76.037 Y89.563 I5.7 J-1.52 E.06599
G1 X76.431 Y86.497 E.10462
G1 X75.794 Y86.602 E.02186
G1 X76.045 Y86.16 E.01722
G1 X76.775 Y85.268 E.03902
G1 X77.645 Y84.512 E.03902
G1 X78.63 Y83.914 E.03902
G1 X79.702 Y83.491 E.03901
G1 X80.831 Y83.255 E.03902
G1 X81.983 Y83.214 E.03902
G1 X83.125 Y83.368 E.03901
G1 X84.225 Y83.712 E.03902
G1 X85.251 Y84.238 E.03902
G1 X86.173 Y84.929 E.03902
G1 X86.764 Y85.554 E.02912
G1 X86.023 Y85.676 E.02544
G1 X86.983 Y88.188 E.091
G3 X87.283 Y90.008 I-5.531 J1.847 E.06272
G1 X87.18 Y92.694 E.09099
G1 X87.921 Y92.572 E.02544
G1 X87.562 Y93.354 E.02913
G1 X86.91 Y94.305 E.03901
G1 X86.107 Y95.132 E.03902
G1 X85.176 Y95.811 E.03902
G1 X84.144 Y96.323 E.03901
G1 X83.039 Y96.654 E.03902
G1 X81.895 Y96.793 E.03901
G1 X81.866 Y96.791 E.001
; WIPE_START
G1 X80.744 Y96.736 E-.21341
G1 X79.888 Y96.546 E-.16659
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X86.961 Y93.678 Z1.4 F42000
G1 X104.536 Y86.552 Z1.4
G1 Z1
G1 E.4 F1800
G1 F2210.87
M204 S6000
G3 X104.432 Y85.923 I.908 J-.472 E.02193
G1 X105.031 Y84.058 E.06631
G1 X105.354 Y84.024 E.01099
G1 X105.437 Y84.034 E.00283
G1 X105.832 Y84.085 E.01347
G1 X106.282 Y84.255 E.0163
G1 X106.682 Y84.524 E.0163
G1 X107.008 Y84.878 E.0163
G1 X107.244 Y85.298 E.0163
G1 X107.377 Y85.76 E.0163
G1 X107.4 Y86.241 E.0163
G1 X107.311 Y86.715 E.0163
G1 X107.115 Y87.155 E.0163
G1 X106.824 Y87.538 E.0163
G1 X106.451 Y87.843 E.0163
G1 X106.018 Y88.055 E.0163
G1 X105.702 Y88.126 E.01099
G1 X104.571 Y86.6 E.06429
M204 S10000
G1 X104.196 Y86.777 F42000
G1 F2210.87
M204 S6000
G3 X104.038 Y85.819 I1.231 J-.695 E.03353
G1 X104.725 Y83.681 E.07602
G1 X105.358 Y83.614 E.02158
G1 X105.489 Y83.631 E.00444
G1 X105.931 Y83.687 E.01508
G1 X106.47 Y83.891 E.01952
G1 X106.949 Y84.213 E.01952
G1 X107.34 Y84.637 E.01952
G1 X107.623 Y85.139 E.01953
G1 X107.782 Y85.694 E.01952
G1 X107.809 Y86.27 E.01952
G1 X107.702 Y86.837 E.01952
G1 X107.468 Y87.364 E.01952
G1 X107.118 Y87.822 E.01952
G1 X106.673 Y88.188 E.01952
G1 X106.154 Y88.441 E.01952
G1 X105.532 Y88.581 E.02157
G1 X104.232 Y86.825 E.07398
M204 S10000
G1 X103.855 Y87 F42000
G1 F2210.87
M204 S6000
G3 X103.643 Y85.717 I1.571 J-.918 E.04503
G1 X104.393 Y83.381 E.08305
G1 X104.695 Y83.275 E.01081
G1 X105.363 Y83.204 E.02274
G1 X105.54 Y83.227 E.00605
G1 X106.03 Y83.29 E.01669
G1 X106.658 Y83.526 E.02274
G1 X107.216 Y83.902 E.02274
G1 X107.671 Y84.396 E.02274
G1 X108.001 Y84.981 E.02275
G1 X108.186 Y85.627 E.02274
G1 X108.218 Y86.298 E.02274
G1 X108.094 Y86.959 E.02274
G1 X107.821 Y87.573 E.02274
G1 X107.413 Y88.107 E.02274
G1 X106.894 Y88.533 E.02274
G1 X106.29 Y88.828 E.02274
G1 X105.635 Y88.976 E.02274
G1 X105.315 Y88.972 E.01081
G1 X103.891 Y87.049 E.08102
; WIPE_START
G1 X103.684 Y86.627 E-.08917
G1 X103.605 Y86.225 E-.07796
G1 X103.624 Y85.814 E-.078
G1 X103.643 Y85.717 E-.01896
G1 X103.83 Y85.136 E-.11592
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X97.132 Y88.795 Z1.4 F42000
G1 X81.787 Y97.18 Z1.4
G1 Z1
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G1 X80.691 Y97.126 E.03438
G1 X79.501 Y96.862 E.03823
G1 X78.373 Y96.4 E.03823
G1 X77.338 Y95.754 E.03824
G1 X76.428 Y94.942 E.03823
G1 X75.665 Y93.985 E.03838
G1 X75.291 Y93.371 E.02256
G1 X73.149 Y93.724 E.06806
G3 X72.404 Y89.205 I-.376 J-2.259 E.22577
G1 X74.546 Y88.852 E.06805
G1 X74.703 Y88.15 E.02257
G1 X75.119 Y86.998 E.03838
G1 X75.72 Y85.937 E.03823
G1 X76.492 Y84.994 E.03823
G1 X77.413 Y84.194 E.03823
G1 X78.455 Y83.561 E.03823
G1 X79.589 Y83.114 E.03823
G1 X80.783 Y82.865 E.03823
G1 X82.002 Y82.821 E.03823
G1 X83.21 Y82.983 E.03823
G1 X84.374 Y83.348 E.03823
G1 X85.459 Y83.904 E.03823
G1 X86.435 Y84.635 E.03823
G1 X87.273 Y85.521 E.03823
G1 X87.951 Y86.539 E.03835
G1 X88.34 Y87.338 E.02786
G1 X102.208 Y85.052 E.44069
G3 X102.409 Y84.647 I1.366 J.428 E.01423
G1 X102.717 Y84.103 E.01959
G1 X103.245 Y83.555 E.02387
G1 X103.888 Y83.143 E.02394
G1 X104.608 Y82.89 E.02394
G1 X105.367 Y82.809 E.02394
G1 X105.59 Y82.838 E.00704
G1 X106.125 Y82.906 E.0169
G1 X106.839 Y83.176 E.02394
G1 X107.473 Y83.602 E.02394
G1 X107.99 Y84.163 E.02394
G1 X108.365 Y84.829 E.02394
G1 X108.576 Y85.563 E.02394
G1 X108.611 Y86.326 E.02394
G1 X108.471 Y87.076 E.02394
G1 X108.16 Y87.774 E.02394
G1 X107.697 Y88.381 E.02394
G1 X107.107 Y88.865 E.02394
G1 X106.421 Y89.2 E.02394
G1 X105.676 Y89.368 E.02394
G1 X104.913 Y89.36 E.02394
G1 X104.172 Y89.175 E.02394
G1 X103.495 Y88.826 E.02387
G2 X102.843 Y88.249 I-14.324 J15.543 E.0273
G1 X102.709 Y88.091 E.00651
G1 X88.841 Y90.377 E.44069
G1 X88.729 Y91.259 E.02786
G1 X88.413 Y92.44 E.03835
G1 X87.904 Y93.548 E.03823
G1 X87.215 Y94.554 E.03823
G1 X86.365 Y95.429 E.03823
G1 X85.38 Y96.147 E.03823
G1 X84.288 Y96.689 E.03823
G1 X83.12 Y97.039 E.03823
G1 X81.909 Y97.186 E.03823
G1 X81.847 Y97.183 E.00197
; WIPE_START
M204 S6000
G1 X80.691 Y97.126 E-.21975
G1 X79.868 Y96.943 E-.16025
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.4
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.4 F4000
            G39.3 S1
            G0 Z1.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X77.353 Y94.7 F42000
G1 Z1
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F2647.059
M204 S6000
G1 X77.289 Y94.737 E.00208
G1 X77.338 Y94.765 E.00159
; WIPE_START
G1 X77.289 Y94.737 E-.16438
G1 X77.353 Y94.7 E-.21562
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X77.23 Y89.399 Z1.4 F42000
G1 Z1
G1 E.4 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G1 X77.438 Y87.784 E.05512
G3 X77.817 Y87.2 I2.198 J1.013 E.02365
G3 X78.644 Y86.957 I.59 J.477 E.03104
G3 X80.059 Y87.605 I-.559 J3.088 E.05326
G2 X78.977 Y91.098 I1.561 J2.398 E.13427
G2 X77.918 Y92.524 I4.039 J4.107 E.06036
G1 X78.526 Y93.769 E.0469
G1 X78.609 Y93.694 E.0038
G2 X85.895 Y92.145 I2.997 J-3.812 E.28746
G1 X86.036 Y92.185 E.00497
G1 X86.069 Y91.002 E.04006
G2 X84.759 Y92.769 I4.341 J4.588 E.07485
G1 X84.322 Y93.054 E.01765
G1 X83.885 Y93.043 E.01479
G1 X83.012 Y92.755 E.03113
G1 X82.816 Y92.638 E.00772
G2 X84.036 Y88.372 I-1.211 J-2.653 E.17061
G2 X84.759 Y87.231 I-8.879 J-6.421 E.04578
G1 X85.264 Y86.947 E.01961
G1 X85.103 Y86.526 E.01526
G1 X84.982 Y86.609 E.00497
G2 X84.295 Y86.065 I-3.014 J3.101 E.02973
G1 X83.885 Y86.054 E.01387
G3 X82.371 Y85.314 I.51 J-2.961 E.05784
G2 X80.753 Y85.346 I-.675 J6.827 E.0549
; WIPE_START
G1 X81.891 Y85.255 E-.21699
G1 X82.371 Y85.314 E-.09177
M73 P53 R7
G1 X82.677 Y85.53 E-.07124
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X84.825 Y85.963 Z1.4 F42000
G1 Z1
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.451131
G1 F2204.746
M204 S6000
G1 X84.554 Y85.253 E.0258
G1 X83.861 Y84.897 E.02643
G1 X83.104 Y84.638 E.02716
G2 X81.877 Y84.44 I-1.947 J8.145 E.04221
G1 X81.142 Y84.465 E.02498
G1 X80.071 Y84.663 E.03696
G1 X79.252 Y84.981 E.02982
G1 X78.545 Y85.391 E.02774
G2 X77.719 Y86.067 I9.895 J12.957 E.03623
G1 X77.625 Y86.793 E.02487
G1 X77.952 Y86.404 E.01727
G1 X78.626 Y85.832 E.02999
G1 X79.37 Y85.373 E.02966
G1 X80.11 Y85.079 E.02703
G1 X81.045 Y84.883 E.03243
G1 X81.89 Y84.848 E.0287
G1 X82.776 Y84.976 E.03041
G1 X83.616 Y85.233 E.02981
G1 X84.298 Y85.579 E.02594
G1 X84.776 Y85.927 E.0201
; WIPE_START
G1 X84.298 Y85.579 E-.11252
G1 X83.616 Y85.233 E-.14522
G1 X83.001 Y85.045 E-.12227
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.063 Y91.506 Z1.4 F42000
G1 X87.541 Y92.266 Z1.4
G1 Z1
G1 E.4 F1800
; LINE_WIDTH: 0.38292
G1 F2647.059
M204 S6000
G1 X87.477 Y92.303 E.00208
G1 X87.526 Y92.331 E.00159
; WIPE_START
G1 X87.477 Y92.303 E-.16438
G1 X87.541 Y92.266 E-.21562
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X85.952 Y92.83 Z1.4 F42000
G1 Z1
G1 E.4 F1800
; LINE_WIDTH: 0.451656
G1 F2201.914
M204 S6000
G1 X85.634 Y93.279 E.01869
G1 X85.016 Y93.893 E.02963
G1 X84.315 Y94.416 E.02971
G1 X83.56 Y94.794 E.02872
G1 X82.689 Y95.045 E.03079
G1 X81.823 Y95.157 E.02969
G1 X81.011 Y95.12 E.02763
G1 X80.095 Y94.914 E.0319
G1 X79.418 Y94.644 E.02477
G1 X78.866 Y94.33 E.02158
G1 X79.189 Y94.991 E.025
G1 X79.816 Y95.25 E.02305
G1 X80.884 Y95.515 E.0374
G1 X81.751 Y95.564 E.02951
G1 X82.562 Y95.484 E.02771
G1 X83.639 Y95.199 E.03785
G1 X84.409 Y94.83 E.02904
G2 X85.312 Y94.189 I-4.231 J-6.919 E.03765
G2 X85.924 Y93.567 I-43.879 J-43.764 E.02966
G1 X85.95 Y92.89 E.02302
; WIPE_START
G1 X85.924 Y93.567 E-.1287
G1 X85.312 Y94.189 E-.16579
G1 X85.076 Y94.375 E-.05713
G1 X84.952 Y94.459 E-.02838
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X78.933 Y89.767 Z1.4 F42000
G1 X76.073 Y87.538 Z1.4
G1 Z1
G1 E.4 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S2000
G1 X75.424 Y86.889 E.02877
G1 X75.249 Y87.247
G1 X76.012 Y88.01 E.03383
G1 X75.951 Y88.483
G1 X75.108 Y87.639 E.0374
G1 X74.966 Y88.031
G1 X75.891 Y88.955 E.04098
G1 X75.83 Y89.428
G1 X74.849 Y88.447 E.04349
G1 X74.751 Y88.882
G1 X75.811 Y89.942 E.04698
G1 X75.822 Y90.487
G1 X74.418 Y89.083 E.06225
G1 X73.961 Y89.158
G1 X75.905 Y91.103 E.08622
G1 X76.105 Y91.836
G1 X73.503 Y89.234 E.11539
G1 X73.045 Y89.309
G1 X76.488 Y92.752 E.15265
G1 X76.998 Y93.795
G1 X72.587 Y89.385 E.19556
G1 X72.15 Y89.48
G1 X77.264 Y94.595 E.22677
G1 X77.016 Y94.88
G1 X75.575 Y93.439 E.06386
G1 X75.296 Y93.16
G1 X71.775 Y89.639 E.15609
G1 X71.457 Y89.854
G1 X74.838 Y93.235 E.14992
G1 X74.38 Y93.311
G1 X71.187 Y90.117 E.1416
G1 X70.967 Y90.431
G1 X73.922 Y93.386 E.13103
G1 X73.465 Y93.462
G1 X70.8 Y90.797 E.11817
G1 X70.704 Y91.235
G1 X73 Y93.531 E.10181
G1 X72.456 Y93.52
G1 X70.713 Y91.777 E.07728
; WIPE_START
M204 S6000
G1 X72.128 Y93.191 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X77.227 Y94.264 Z1.4 F42000
G1 Z1
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.109562
G1 F13504.991
M204 S6000
G1 X77.13 Y94.128 E.00092
; LINE_WIDTH: 0.152337
G1 F8225.456
G1 X77.033 Y93.992 E.00152
; LINE_WIDTH: 0.195111
G1 F5913.629
G1 X76.936 Y93.857 E.00211
; WIPE_START
G1 X77.033 Y93.992 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X76.784 Y94.962 Z1.4 F42000
G1 Z1
G1 E.4 F1800
; LINE_WIDTH: 0.11167
G1 F13090.889
M204 S6000
G3 X76.364 Y94.524 I2.361 J-2.688 E.00347
; WIPE_START
G1 X76.596 Y94.784 E-.21801
G1 X76.784 Y94.962 E-.16199
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X72.06 Y93.433 Z1.4 F42000
G1 Z1
G1 E.4 F1800
; LINE_WIDTH: 0.177547
G1 F6685.174
M204 S6000
G1 X71.881 Y93.299 E.00251
; LINE_WIDTH: 0.212522
G1 F5306.542
G1 X71.701 Y93.164 E.00316
; LINE_WIDTH: 0.264855
G1 F4055.255
G3 X71.181 Y92.665 I2.821 J-3.466 E.01332
; LINE_WIDTH: 0.236738
G1 F4643.55
G1 X71.027 Y92.477 E.00392
; LINE_WIDTH: 0.19274
G1 F6007.222
G1 X70.917 Y92.325 E.00234
; LINE_WIDTH: 0.153067
G1 F8170.895
G1 X70.807 Y92.173 E.00172
; WIPE_START
G1 X70.917 Y92.325 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X76.013 Y86.915 Z1.4 F42000
G1 Z1
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.39202
G1 F2578.058
M204 S6000
G1 X75.947 Y86.953 E.00219
G1 X75.999 Y86.983 E.00172
; WIPE_START
G1 X75.947 Y86.953 E-.16693
G1 X76.013 Y86.915 E-.21307
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X83.603 Y86.116 Z1.4 F42000
G1 X103.97 Y83.972 Z1.4
G1 Z1
G1 E.4 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S2000
G1 X103.582 Y83.585 E.01718
G1 X103.281 Y83.817
G1 X103.84 Y84.376 E.0248
G1 X103.711 Y84.78
G1 X103.019 Y84.088 E.03066
G1 X102.791 Y84.393
G1 X103.581 Y85.183 E.03503
G1 X103.451 Y85.587
G1 X102.598 Y84.734 E.03782
G1 X102.417 Y85.086
G1 X103.383 Y86.052 E.04284
G1 X103.463 Y86.665
G1 X102.081 Y85.283 E.0613
G1 X101.623 Y85.358
G1 X104.473 Y88.208 E.12637
G1 X104.806 Y89.075
G1 X101.165 Y85.434 E.16145
G1 X100.707 Y85.509
G1 X104.106 Y88.908 E.1507
; WIPE_START
M204 S6000
G1 X102.692 Y87.494 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X102.568 Y87.904 Z1.4 F42000
G1 Z1
G1 E.4 F1800
G1 F2386.764
M204 S2000
G1 X100.249 Y85.585 E.10283
G1 X99.792 Y85.66
G1 X102.111 Y87.979 E.10283
G1 X101.653 Y88.055
G1 X99.334 Y85.736 E.10283
G1 X98.876 Y85.811
G1 X101.195 Y88.13 E.10283
G1 X100.737 Y88.206
G1 X98.418 Y85.887 E.10283
G1 X97.961 Y85.962
G1 X100.279 Y88.281 E.10283
G1 X99.822 Y88.357
G1 X97.503 Y86.038 E.10283
G1 X97.045 Y86.113
G1 X99.364 Y88.432 E.10283
G1 X98.906 Y88.507
G1 X96.587 Y86.189 E.10283
G1 X96.129 Y86.264
G1 X98.448 Y88.583 E.10283
G1 X97.991 Y88.658
G1 X95.672 Y86.339 E.10283
G1 X95.214 Y86.415
G1 X97.533 Y88.734 E.10283
G1 X97.075 Y88.809
G1 X94.756 Y86.49 E.10283
G1 X94.298 Y86.566
G1 X96.617 Y88.885 E.10283
G1 X96.159 Y88.96
G1 X93.84 Y86.641 E.10283
G1 X93.383 Y86.717
G1 X95.702 Y89.036 E.10283
G1 X95.244 Y89.111
G1 X92.925 Y86.792 E.10283
G1 X92.467 Y86.868
G1 X94.786 Y89.187 E.10283
G1 X94.328 Y89.262
G1 X92.009 Y86.943 E.10283
G1 X91.551 Y87.019
G1 X93.87 Y89.338 E.10283
G1 X93.413 Y89.413
G1 X91.094 Y87.094 E.10283
G1 X90.636 Y87.17
G1 X92.955 Y89.489 E.10283
G1 X92.497 Y89.564
G1 X90.178 Y87.245 E.10283
G1 X89.72 Y87.321
G1 X92.039 Y89.639 E.10283
G1 X91.581 Y89.715
G1 X89.263 Y87.396 E.10283
G1 X88.805 Y87.471
G1 X91.124 Y89.79 E.10283
G1 X90.666 Y89.866
G1 X88.347 Y87.547 E.10283
G1 X88.082 Y87.282
G1 X86.608 Y85.808 E.06536
G1 X86.458 Y86.191
G1 X90.208 Y89.941 E.16629
G1 X89.75 Y90.017
G1 X86.788 Y87.054 E.13136
G1 X87.118 Y87.917
G1 X89.292 Y90.092 E.09643
G1 X88.835 Y90.168
G1 X87.352 Y88.685 E.06573
G1 X87.462 Y89.328
G1 X88.618 Y90.484 E.05126
G1 X88.558 Y90.958
G1 X87.501 Y89.9 E.04688
G1 X87.49 Y90.422
G1 X88.475 Y91.408 E.04368
G1 X88.362 Y91.828
G1 X87.47 Y90.936 E.03957
G1 X87.45 Y91.449
G1 X88.25 Y92.249 E.03546
; WIPE_START
M204 S6000
G1 X87.45 Y91.449 E-.21487
G1 X87.47 Y90.936 E-.09764
G1 X87.721 Y91.187 E-.06749
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X95.208 Y89.705 Z1.4 F42000
G1 X103.052 Y88.152 Z1.4
G1 Z1
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0902799
G1 F15000
M204 S6000
G3 X102.945 Y88.044 I.622 J-.729 E.0006
; WIPE_START
G1 X103.052 Y88.152 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X103.649 Y87.09 Z1.4 F42000
G1 Z1
G1 E.4 F1800
; LINE_WIDTH: 0.0970122
G1 F15000
M204 S6000
G1 X103.593 Y87.017 E.00041
; LINE_WIDTH: 0.123134
G1 F11220.059
M73 P54 R7
G1 X103.528 Y86.921 E.00077
; LINE_WIDTH: 0.156734
G1 F7907.654
G1 X103.464 Y86.825 E.00109
; LINE_WIDTH: 0.190334
G1 F6105.253
G1 X103.399 Y86.729 E.00142
; WIPE_START
G1 X103.464 Y86.825 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X103.442 Y85.621 Z1.4 F42000
G1 Z1
G1 E.4 F1800
; LINE_WIDTH: 0.0969498
G1 F15000
M204 S6000
G2 X103.36 Y85.762 I2.316 J1.44 E.00074
; WIPE_START
G1 X103.442 Y85.621 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X95.828 Y86.151 Z1.4 F42000
G1 X87.804 Y86.711 Z1.4
G1 Z1
G1 E.4 F1800
; LINE_WIDTH: 0.0970488
G1 F15000
M204 S6000
G1 X87.76 Y86.648 E.00034
; LINE_WIDTH: 0.126509
G1 F10767.005
G1 X87.608 Y86.463 E.00167
; LINE_WIDTH: 0.167652
G1 F7215.504
G1 X87.456 Y86.278 E.00249
; LINE_WIDTH: 0.208795
G1 F5425.801
G1 X87.304 Y86.092 E.00331
; LINE_WIDTH: 0.249937
G1 F4347.473
G1 X87.152 Y85.907 E.00413
; LINE_WIDTH: 0.29108
G1 F3626.699
G1 X87 Y85.722 E.00495
; WIPE_START
G1 X87.152 Y85.907 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.419 Y88.619 Z1.4 F42000
G1 Z1
G1 E.4 F1800
; LINE_WIDTH: 0.127889
G1 F10592.135
M204 S6000
G1 X87.26 Y88.351 E.0022
M204 S10000
G1 X87.402 Y88.469 F42000
; LINE_WIDTH: 0.094414
G1 F15000
M204 S6000
G1 X87.338 Y88.7 E.00103
; WIPE_START
G1 X87.402 Y88.469 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X88.007 Y92.352 Z1.4 F42000
G1 Z1
G1 E.4 F1800
; LINE_WIDTH: 0.217485
G1 F5155.684
M204 S6000
G3 X87.83 Y92.235 I2.115 J-3.41 E.00307
; LINE_WIDTH: 0.256209
G1 F4219.636
G1 X87.747 Y92.175 E.00182
; LINE_WIDTH: 0.295294
G1 F3566.143
G3 X87.627 Y92.087 I1.64 J-2.346 E.00312
; LINE_WIDTH: 0.326121
G1 F3177.956
G1 X87.556 Y92.029 E.00216
G1 X87.411 Y92.104 E.00384
; WIPE_START
G1 X87.556 Y92.029 E-.24297
G1 X87.627 Y92.087 E-.13703
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X95.143 Y90.757 Z1.4 F42000
G1 X104.988 Y89.015 Z1.4
G1 Z1
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F2647.059
M204 S6000
G1 X104.925 Y89.052 E.00208
G1 X104.973 Y89.08 E.00159
; WIPE_START
G1 X104.925 Y89.052 E-.16437
G1 X104.988 Y89.015 E-.21563
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.659 Y86.044 Z1.4 F42000
G1 Z1
G1 E.4 F1800
; LINE_WIDTH: 0.53818
G1 F1817.227
M204 S6000
G1 X106.047 Y86.568 E.02686
G1 X106.155 Y86.339 E.01043
G1 X106.181 Y85.987 E.01453
G1 X106.113 Y85.745 E.01034
G1 X105.859 Y85.423 E.01691
G1 X105.678 Y85.986 E.02438
M204 S10000
G1 X105.193 Y86.07 F42000
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X105.257 Y86.234 E.0055
G1 X105.984 Y87.215 E.0383
G1 X106.288 Y86.972 E.0122
G2 X105.591 Y84.83 I-.963 J-.871 E.08548
G1 X105.211 Y86.013 E.03898
M204 S10000
G1 X104.853 Y86.254 F42000
G1 F2386.825
M204 S6000
G1 X104.954 Y86.458 E.00715
G1 X105.865 Y87.687 E.04797
G1 X106.277 Y87.479 E.01448
G1 X106.588 Y87.2 E.01308
G1 X106.816 Y86.864 E.01275
G2 X106.994 Y85.948 I-1.489 J-.764 E.02963
G1 X106.88 Y85.45 E.01603
G1 X106.614 Y85.029 E.01562
G2 X105.32 Y84.44 I-1.25 J1.03 E.04614
G1 X104.82 Y85.998 E.05133
G1 X104.845 Y86.194 E.00619
; WIPE_START
G1 X104.82 Y85.998 E-.03753
G1 X105.32 Y84.44 E-.31105
G1 X105.485 Y84.45 E-.03142
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X104.006 Y83.45 Z1.4 F42000
G1 Z1
G1 E.4 F1800
; LINE_WIDTH: 0.38292
G1 F2647.059
M204 S6000
G1 X103.942 Y83.486 E.00208
G1 X103.991 Y83.514 E.00159
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2647.059
G1 X103.942 Y83.486 E-.16437
G1 X104.006 Y83.45 E-.21563
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 6/65
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z1.4 I-.457 J-1.128 P1  F42000
G1 X81.748 Y92.457 Z1.4
G1 Z1.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G1 X81.675 Y92.458 E.00247
G3 X81.475 Y87.547 I-.025 J-2.458 E.25637
G3 X82.663 Y87.759 I.147 J2.608 E.04122
G3 X81.927 Y92.442 I-1.013 J2.24 E.21668
G1 X81.808 Y92.452 E.00407
M204 S10000
G1 X81.719 Y92.051 F42000
G1 F2210.87
M204 S6000
G1 X81.673 Y92.05 E.00154
G3 X81.506 Y87.953 I-.023 J-2.051 E.21403
G3 X82.496 Y88.131 I.121 J2.173 E.03434
G3 X81.88 Y92.038 I-.846 J1.869 E.1808
G1 X81.779 Y92.046 E.00343
M204 S10000
G1 X81.696 Y91.644 F42000
G1 F2210.87
M204 S6000
G1 X81.672 Y91.641 E.00081
G3 X81.538 Y88.36 I-.021 J-1.642 E.17157
G3 X81.94 Y88.382 I.101 J1.865 E.01365
G3 X81.938 Y91.616 I-.289 J1.617 E.15505
G1 X81.755 Y91.637 E.00623
M204 S250
G1 X81.682 Y91.244 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G1 X81.482 Y91.241 E.00626
G1 X81.366 Y91.221 E.0037
G1 X81.187 Y91.164 E.00591
G1 X81.08 Y91.116 E.00368
G3 X80.918 Y91.016 I2.958 J-4.98 E.00597
G1 X80.826 Y90.943 E.00367
G1 X80.694 Y90.808 E.00592
G1 X80.622 Y90.715 E.0037
G1 X80.527 Y90.552 E.00591
G1 X80.48 Y90.444 E.0037
G1 X80.426 Y90.263 E.00591
G1 X80.407 Y90.147 E.0037
G1 X80.399 Y89.958 E.00592
G1 X80.409 Y89.841 E.0037
G1 X80.447 Y89.656 E.00591
G1 X80.485 Y89.544 E.0037
G1 X80.567 Y89.374 E.00591
G1 X80.631 Y89.275 E.0037
G1 X80.752 Y89.13 E.00591
G1 X80.837 Y89.051 E.00366
G3 X80.991 Y88.937 I2.731 J3.548 E.00598
G1 X81.093 Y88.881 E.00367
G1 X81.268 Y88.809 E.00591
G1 X81.382 Y88.779 E.0037
G1 X81.568 Y88.752 E.00591
G1 X81.687 Y88.751 E.0037
G3 X82.168 Y88.861 I-.102 J1.547 E.01556
G1 X82.271 Y88.915 E.00365
G3 X82.086 Y91.174 I-.626 J1.086 E.08876
G1 X81.975 Y91.211 E.00366
G1 X81.869 Y91.231 E.0034
G1 X81.787 Y91.245 E.00261
G1 X81.742 Y91.244 E.0014
; WIPE_START
M204 S6000
G1 X81.482 Y91.241 E-.04933
G1 X81.366 Y91.221 E-.02243
G1 X81.187 Y91.164 E-.0358
G1 X81.08 Y91.116 E-.02231
G1 X80.918 Y91.016 E-.03615
G1 X80.826 Y90.943 E-.02223
G1 X80.694 Y90.808 E-.03585
G1 X80.622 Y90.715 E-.0224
G1 X80.527 Y90.552 E-.03584
G1 X80.48 Y90.444 E-.02242
G1 X80.426 Y90.263 E-.03583
G1 X80.407 Y90.147 E-.02239
G1 X80.404 Y90.057 E-.01702
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X81.859 Y95.776 Z1.6 F42000
G1 Z1.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G1 X80.88 Y95.728 E.03318
G1 X79.923 Y95.516 E.03317
G1 X79.016 Y95.145 E.03318
G1 X78.184 Y94.625 E.03318
G1 X77.453 Y93.973 E.03317
G1 X76.821 Y93.18 E.03432
G3 X76.056 Y88.541 I4.892 J-3.189 E.16378
G1 X76.4 Y87.587 E.03432
G1 X76.884 Y86.735 E.03318
G1 X77.504 Y85.976 E.03317
G1 X78.244 Y85.333 E.03318
G1 X79.082 Y84.825 E.03317
G1 X79.994 Y84.465 E.03318
G1 X80.953 Y84.265 E.03318
G1 X81.933 Y84.23 E.03318
G1 X82.575 Y84.316 E.02191
G1 X82.904 Y84.36 E.01126
G1 X83.839 Y84.653 E.03318
G1 X84.712 Y85.1 E.03318
G1 X85.496 Y85.688 E.03318
G1 X86.17 Y86.4 E.03317
G1 X86.728 Y87.237 E.03405
G3 X87.346 Y90.99 I-5.122 J2.772 E.13114
G1 X87.087 Y91.962 E.03405
G1 X86.677 Y92.852 E.03318
G1 X86.123 Y93.661 E.03317
G1 X85.44 Y94.364 E.03318
G1 X84.648 Y94.942 E.03318
G1 X83.77 Y95.377 E.03317
G1 X82.831 Y95.658 E.03318
G1 X81.918 Y95.769 E.03114
M204 S10000
G1 X81.846 Y96.183 F42000
G1 F2210.87
M204 S6000
G1 X80.825 Y96.133 E.03461
G1 X79.801 Y95.906 E.03552
G1 X78.829 Y95.508 E.03552
G1 X77.939 Y94.952 E.03552
G1 X77.156 Y94.254 E.03552
G1 X76.487 Y93.414 E.03634
G3 X75.665 Y88.427 I5.232 J-3.424 E.17614
G1 X76.029 Y87.417 E.03634
G1 X76.547 Y86.504 E.03552
G1 X77.211 Y85.692 E.03552
G1 X78.003 Y85.003 E.03553
G1 X78.9 Y84.459 E.03552
G1 X79.877 Y84.074 E.03552
G1 X80.904 Y83.859 E.03552
G1 X81.953 Y83.822 E.03552
G1 X82.629 Y83.913 E.02309
G1 X82.993 Y83.962 E.01243
G1 X83.994 Y84.275 E.03552
G1 X84.928 Y84.754 E.03552
G1 X85.768 Y85.383 E.03552
G1 X86.489 Y86.146 E.03552
G1 X87.081 Y87.034 E.03615
G3 X87.747 Y91.069 I-5.497 J2.978 E.141
G1 X87.471 Y92.1 E.03614
G1 X87.032 Y93.054 E.03552
G1 X86.439 Y93.919 E.03552
G1 X85.708 Y94.672 E.03552
G1 X84.86 Y95.291 E.03552
G1 X83.92 Y95.757 E.03552
G1 X82.915 Y96.058 E.03552
G1 X81.906 Y96.181 E.0344
M204 S10000
G1 X81.826 Y96.59 F42000
G1 F2210.87
M204 S6000
G1 X80.77 Y96.538 E.03579
G1 X79.679 Y96.296 E.03786
G1 X78.643 Y95.872 E.03787
G1 X77.694 Y95.279 E.03787
G1 X76.859 Y94.535 E.03786
G1 X76.153 Y93.648 E.03836
G3 X75.273 Y88.312 I5.572 J-3.659 E.1885
G1 X75.658 Y87.246 E.03836
G1 X76.21 Y86.273 E.03787
G1 X76.918 Y85.407 E.03787
G1 X77.763 Y84.673 E.03787
G1 X78.719 Y84.093 E.03787
G1 X79.76 Y83.683 E.03787
G1 X80.855 Y83.454 E.03787
G1 X81.973 Y83.414 E.03787
G1 X82.683 Y83.509 E.02426
G1 X83.081 Y83.563 E.0136
G1 X84.149 Y83.897 E.03787
G1 X85.145 Y84.407 E.03787
G1 X86.04 Y85.078 E.03787
G1 X86.809 Y85.891 E.03787
G1 X87.435 Y86.831 E.03824
G3 X88.147 Y91.147 I-5.872 J3.185 E.15086
G1 X87.855 Y92.239 E.03824
G1 X87.388 Y93.255 E.03787
G1 X86.755 Y94.178 E.03786
G1 X85.976 Y94.981 E.03787
G1 X85.072 Y95.64 E.03787
G1 X84.07 Y96.137 E.03787
G1 X82.998 Y96.458 E.03787
G1 X81.888 Y96.593 E.03787
G1 X81.886 Y96.593 E.00005
M204 S250
G1 X81.807 Y96.982 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G1 X80.718 Y96.928 E.03419
G1 X79.561 Y96.671 E.03717
G1 X78.464 Y96.222 E.03717
G1 X77.458 Y95.594 E.03717
G1 X76.573 Y94.805 E.03717
G1 X75.832 Y93.874 E.03733
G3 X74.755 Y88.897 I5.904 J-3.882 E.16334
G3 X74.896 Y88.202 I7.388 J1.141 E.02225
G1 X75.3 Y87.082 E.03733
G1 X75.885 Y86.05 E.03717
G1 X76.636 Y85.133 E.03717
G1 X77.531 Y84.355 E.03717
G1 X78.544 Y83.74 E.03717
G1 X79.647 Y83.306 E.03717
G1 X80.807 Y83.063 E.03717
G1 X81.992 Y83.021 E.03717
G1 X82.735 Y83.121 E.02352
G1 X83.167 Y83.179 E.01365
G1 X84.298 Y83.533 E.03717
G1 X85.353 Y84.074 E.03717
G1 X86.302 Y84.785 E.03717
G1 X87.116 Y85.646 E.03717
G1 X87.776 Y86.635 E.03729
G3 X88.532 Y91.223 I-6.232 J3.384 E.14854
G1 X88.225 Y92.372 E.03729
G1 X87.73 Y93.449 E.03717
G1 X87.06 Y94.427 E.03717
G1 X86.234 Y95.278 E.03717
G1 X85.277 Y95.976 E.03717
G1 X84.215 Y96.503 E.03717
G1 X83.079 Y96.843 E.03717
G1 X81.902 Y96.986 E.03717
G1 X81.867 Y96.984 E.00109
; WIPE_START
M204 S6000
G1 X80.718 Y96.928 E-.2186
G1 X79.889 Y96.744 E-.1614
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.6
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.6 F4000
            G39.3 S1
            G0 Z1.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X87.018 Y89.569 F42000
G1 Z1.2
G1 E.4 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G2 X86.779 Y88.355 I-6.786 J.709 E.03885
G2 X86.323 Y87.338 I-9.273 J3.538 E.03497
G1 X85.862 Y86.645 E.02609
G1 X85.234 Y85.982 E.02863
G1 X84.503 Y85.434 E.02864
G1 X83.69 Y85.018 E.02864
G1 X82.819 Y84.745 E.02864
G1 X81.914 Y84.623 E.02863
G1 X81.001 Y84.656 E.02864
G1 X80.107 Y84.842 E.02864
G1 X79.257 Y85.177 E.02864
G1 X78.476 Y85.651 E.02863
G1 X77.787 Y86.25 E.02864
G1 X77.208 Y86.957 E.02864
G1 X76.758 Y87.752 E.02863
G1 X76.436 Y88.644 E.02975
G1 X76.279 Y89.583 E.02985
G1 X76.272 Y90.314 E.02292
G2 X77.204 Y93.032 I5.419 J-.34 E.09117
G1 X77.739 Y93.703 E.02689
G1 X78.42 Y94.31 E.02863
G1 X79.195 Y94.794 E.02864
G1 X80.04 Y95.14 E.02864
G1 X80.932 Y95.338 E.02863
G1 X81.844 Y95.383 E.02864
G1 X82.751 Y95.273 E.02863
G1 X83.626 Y95.011 E.02864
G1 X84.444 Y94.605 E.02863
G1 X85.182 Y94.067 E.02864
G1 X85.818 Y93.411 E.02864
G1 X86.335 Y92.658 E.02863
G1 X86.716 Y91.828 E.02864
G1 X86.959 Y90.919 E.0295
G1 X87.04 Y90.005 E.02876
G1 X87.021 Y89.629 E.01182
; WIPE_START
G1 X87.04 Y90.005 E-.07162
G1 X86.959 Y90.919 E-.17427
M73 P55 R7
G1 X86.777 Y91.601 E-.13411
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X79.892 Y88.306 Z1.6 F42000
G1 X77.52 Y87.171 Z1.6
G1 Z1.2
G1 E.4 F1800
G1 F2386.825
M204 S6000
G1 X78.058 Y86.514 E.02663
G1 X78.699 Y85.957 E.02663
G1 X79.425 Y85.516 E.02662
G1 X80.215 Y85.205 E.02662
G1 X81.047 Y85.031 E.02663
G1 X81.895 Y85.001 E.02662
G1 X82.737 Y85.114 E.02662
G1 X83.547 Y85.368 E.02663
G1 X84.303 Y85.755 E.02663
G1 X84.982 Y86.264 E.02663
G1 X85.566 Y86.881 E.02662
G1 X86.01 Y87.547 E.02508
G3 X86.416 Y88.458 I-10.06 J5.031 E.03129
G3 X86.662 Y89.998 I-6.339 J1.805 E.04902
G1 X86.587 Y90.853 E.02691
G1 X86.36 Y91.7 E.02747
G1 X86.006 Y92.471 E.02663
G1 X85.526 Y93.172 E.02662
G1 X84.934 Y93.781 E.02663
G1 X84.248 Y94.282 E.02663
G1 X83.487 Y94.659 E.02662
G1 X82.674 Y94.903 E.02663
G1 X81.831 Y95.005 E.02662
G1 X80.982 Y94.963 E.02663
G1 X80.154 Y94.779 E.02662
G1 X79.368 Y94.457 E.02663
G1 X78.647 Y94.008 E.02663
G1 X78.014 Y93.443 E.02662
G1 X77.499 Y92.797 E.02588
G3 X76.655 Y89.616 I4.21 J-2.819 E.10508
G1 X76.802 Y88.74 E.02785
G1 X77.101 Y87.91 E.02767
G1 X77.491 Y87.223 E.02474
; WIPE_START
G1 X77.101 Y87.91 E-.14992
G1 X76.802 Y88.74 E-.16769
G1 X76.748 Y89.064 E-.0624
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X77.168 Y88.836 Z1.6 F42000
G1 Z1.2
G1 E.4 F1800
; Slow Down Start
G1 F2386.825;_EXTRUDE_SET_SPEED
M204 S6000
G1 X77.445 Y88.068 E.0256
G1 X77.833 Y87.385 E.02461
G1 X78.33 Y86.778 E.02461
G1 X78.922 Y86.263 E.02462
G1 X79.593 Y85.855 E.02461
G1 X80.324 Y85.567 E.02461
G1 X81.092 Y85.407 E.02462
G1 X81.877 Y85.379 E.02461
G1 X82.655 Y85.483 E.02461
G1 X83.404 Y85.718 E.02461
G1 X84.102 Y86.076 E.02462
G1 X84.731 Y86.547 E.02461
G3 X85.8 Y87.973 I-3.817 J3.976 E.05613
G1 X86.053 Y88.561 E.02007
G3 X86.284 Y89.991 I-5.828 J1.677 E.04553
G1 X86.214 Y90.787 E.02507
G1 X86.004 Y91.571 E.02544
G1 X85.676 Y92.285 E.02462
G1 X85.233 Y92.932 E.02461
G1 X84.686 Y93.495 E.02462
G1 X84.052 Y93.958 E.02461
G1 X83.349 Y94.307 E.02461
G1 X82.596 Y94.532 E.02462
G1 X81.817 Y94.627 E.02461
G1 X81.033 Y94.588 E.02462
G1 X80.267 Y94.418 E.02461
G1 X79.54 Y94.121 E.02462
G1 X78.874 Y93.705 E.02461
G1 X78.321 Y93.211 E.02324
G3 X77.751 Y92.498 I11.019 J-9.399 E.02863
G1 X77.395 Y91.834 E.02362
G3 X77.159 Y88.895 I4.435 J-1.837 E.09397
; Slow Down End
; WIPE_START
G1 X77.032 Y89.649 E-.1453
G1 X77.026 Y90.27 E-.11793
G1 X77.103 Y90.877 E-.11622
G1 X77.104 Y90.88 E-.00055
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X83.086 Y86.139 Z1.6 F42000
G1 X83.225 Y86.029 Z1.6
G1 Z1.2
G1 E.4 F1800
; Slow Down Start
; LINE_WIDTH: 0.367331
G1 F2774.262;_EXTRUDE_SET_SPEED
M204 S6000
G3 X84.505 Y86.821 I-2.071 J4.778 E.04073
G3 X85.481 Y88.113 I-3.308 J3.511 E.04389
G3 X85.861 Y90.739 I-3.901 J1.906 E.07274
G1 X85.625 Y91.562 E.02308
G1 X85.321 Y92.185 E.01871
G1 X84.948 Y92.717 E.01752
G1 X84.4 Y93.271 E.021
G1 X83.849 Y93.668 E.01832
G1 X83.205 Y93.981 E.01932
G1 X82.51 Y94.188 E.01955
G3 X81.067 Y94.233 I-.868 J-4.655 E.03912
G1 X80.36 Y94.075 E.01954
G1 X79.571 Y93.73 E.02322
G3 X77.386 Y89.668 I2.109 J-3.753 E.13132
G1 X77.489 Y89.04 E.01714
G3 X78.134 Y87.575 I4.623 J1.16 E.0434
G1 X78.678 Y86.936 E.02262
G1 X79.142 Y86.54 E.01647
G3 X80.597 Y85.866 I2.688 J3.901 E.04346
G1 X81.149 Y85.759 E.01518
G1 X81.914 Y85.736 E.02063
G1 X82.578 Y85.827 E.01809
G1 X83.168 Y86.011 E.01667
; Slow Down End
; WIPE_START
G1 X82.578 Y85.827 E-.11744
G1 X81.914 Y85.736 E-.12742
G1 X81.203 Y85.757 E-.13513
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X83.887 Y88.23 Z1.6 F42000
G1 Z1.2
G1 E.4 F1800
; Slow Down Start
; LINE_WIDTH: 0.41999
G1 F2386.825;_EXTRUDE_SET_SPEED
M204 S6000
G3 X84.471 Y89.561 I-3.079 J2.144 E.04585
G1 X84.494 Y90.234 E.0211
G1 X84.357 Y90.9 E.02133
G1 X84.084 Y91.475 E.01995
G1 X83.602 Y92.082 E.0243
G1 X83.045 Y92.488 E.0216
G1 X82.402 Y92.752 E.0218
G1 X81.705 Y92.853 E.02208
G1 X81.007 Y92.78 E.02201
G1 X80.357 Y92.543 E.02168
G3 X79.493 Y91.866 I1.883 J-3.295 E.03454
G1 X79.11 Y91.296 E.02154
G1 X78.877 Y90.653 E.02144
G3 X78.803 Y89.884 I6.506 J-1.008 E.02423
G1 X78.899 Y89.253 E.02002
G3 X79.581 Y88.037 I3.58 J1.211 E.04397
G3 X81.263 Y87.193 I2.077 J2.039 E.06009
G1 X81.763 Y87.152 E.0157
G1 X82.169 Y87.197 E.01283
G1 X82.806 Y87.394 E.02091
G1 X83.39 Y87.741 E.02129
G1 X83.844 Y88.188 E.01999
; Slow Down End
; WIPE_START
G1 X83.39 Y87.741 E-.12115
G1 X82.806 Y87.394 E-.12903
G1 X82.169 Y87.197 E-.12673
G1 X82.153 Y87.195 E-.0031
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X78.441 Y90.155 Z1.6 F42000
G1 Z1.2
G1 E.4 F1800
; Slow Down Start
G1 F2386.825;_EXTRUDE_SET_SPEED
M204 S6000
G1 X78.43 Y89.828 E.01027
G1 X78.527 Y89.191 E.02021
G3 X78.882 Y88.344 I5.575 J1.842 E.0288
G1 X79.274 Y87.819 E.02057
G1 X79.692 Y87.441 E.01765
G1 X80.186 Y87.127 E.01836
G3 X81.052 Y86.832 I2.279 J5.285 E.02873
G1 X81.701 Y86.777 E.02042
G1 X82.28 Y86.836 E.01825
G1 X82.915 Y87.033 E.02085
G3 X84.154 Y87.964 I-1.786 J3.666 E.04888
G3 X84.63 Y88.76 I-4.395 J3.169 E.02911
G1 X84.824 Y89.404 E.0211
G3 X84.858 Y90.359 I-5.963 J.693 E.02997
G1 X84.726 Y90.979 E.0199
G1 X84.423 Y91.64 E.02277
G3 X83.805 Y92.407 I-4.105 J-2.675 E.03095
G1 X83.265 Y92.795 E.02083
G1 X82.541 Y93.103 E.02467
G1 X81.756 Y93.227 E.02492
G3 X80.83 Y93.122 I.223 J-6.128 E.02925
G1 X80.225 Y92.896 E.02025
G1 X79.692 Y92.551 E.01991
G1 X79.298 Y92.207 E.0164
G3 X78.515 Y90.762 I2.878 J-2.495 E.05195
G1 X78.448 Y90.215 E.01727
; Slow Down End
M204 S10000
G1 X78.065 Y90.191 F42000
; Slow Down Start
G1 F2386.825;_EXTRUDE_SET_SPEED
M204 S6000
G1 X78.058 Y89.772 E.01314
G1 X78.152 Y89.143 E.01992
G1 X78.396 Y88.485 E.02202
G1 X78.58 Y88.119 E.01282
G1 X78.972 Y87.593 E.02057
G1 X79.446 Y87.155 E.02024
G1 X79.987 Y86.806 E.02018
G3 X81.02 Y86.457 I2.162 J4.685 E.03427
G1 X81.669 Y86.401 E.02042
G1 X82.206 Y86.438 E.01688
G1 X83.025 Y86.672 E.02671
G3 X83.96 Y87.236 I-2.27 J4.82 E.03428
G1 X84.421 Y87.698 E.02044
G1 X84.82 Y88.31 E.0229
G1 X84.991 Y88.651 E.01198
G1 X85.185 Y89.296 E.0211
G3 X85.227 Y90.438 I-5.215 J.764 E.0359
G1 X85.094 Y91.058 E.0199
G1 X84.762 Y91.804 E.0256
G1 X84.601 Y92.07 E.00974
G1 X84.177 Y92.569 E.02054
G1 X83.485 Y93.101 E.02736
G3 X82.46 Y93.511 I-2.472 J-4.691 E.03467
G1 X81.807 Y93.6 E.02067
G3 X80.698 Y93.475 I.04 J-5.339 E.03507
G1 X80.093 Y93.249 E.02025
G3 X79.21 Y92.656 I2.8 J-5.119 E.0334
G1 X78.842 Y92.256 E.01704
G1 X78.482 Y91.713 E.02043
G1 X78.166 Y90.905 E.0272
G1 X78.074 Y90.25 E.02073
; Slow Down End
; WIPE_START
G1 X78.166 Y90.905 E-.12562
G1 X78.482 Y91.713 E-.16485
G1 X78.742 Y92.105 E-.08953
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X85.079 Y91.958 Z1.6 F42000
G1 Z1.2
G1 E.4 F1800
; Slow Down Start
; LINE_WIDTH: 0.366924
G1 F2777.748;_EXTRUDE_SET_SPEED
M204 S6000
G3 X84.251 Y92.981 I-4.019 J-2.408 E.03558
G1 X83.69 Y93.386 E.01864
G3 X82.508 Y93.858 I-2.349 J-4.167 E.03439
G1 X81.855 Y93.946 E.01776
G1 X81.121 Y93.908 E.01979
G1 X80.576 Y93.802 E.01497
G1 X79.971 Y93.575 E.0174
G1 X79.693 Y93.431 E.00843
G1 X79.154 Y93.061 E.01761
G1 X78.778 Y92.715 E.01377
G1 X78.342 Y92.144 E.01937
G1 X78.047 Y91.623 E.01612
G1 X77.833 Y91.022 E.01718
G3 X77.709 Y89.719 I4.789 J-1.112 E.03538
G1 X77.807 Y89.091 E.01712
G1 X78.07 Y88.349 E.02122
G1 X78.3 Y87.911 E.01332
G1 X78.693 Y87.385 E.01767
G1 X79.219 Y86.891 E.01944
G1 X79.803 Y86.51 E.01878
G1 X80.526 Y86.222 E.02098
G1 X80.991 Y86.11 E.01287
G1 X81.639 Y86.055 E.01754
G1 X82.24 Y86.094 E.01622
G1 X83.129 Y86.338 E.02483
G1 X83.741 Y86.659 E.01862
G1 X84.207 Y86.99 E.01539
G1 X84.667 Y87.452 E.01757
G3 X85.418 Y91.194 I-3.075 J2.564 E.10718
G1 X85.103 Y91.903 E.02091
; Slow Down End
; WIPE_START
G1 X85.418 Y91.194 E-.14748
G1 X85.54 Y90.662 E-.1036
G1 X85.596 Y90.196 E-.08919
G1 X85.591 Y89.987 E-.03973
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X93.184 Y89.216 Z1.6 F42000
G1 X105.528 Y87.962 Z1.6
G1 Z1.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G1 X105.092 Y87.957 E.01473
G1 X104.67 Y87.852 E.01472
G1 X104.297 Y87.659 E.01423
G3 X103.729 Y87.083 I1.536 J-2.081 E.02748
G3 X103.612 Y85.372 I1.538 J-.964 E.06043
G1 X103.85 Y84.951 E.01637
G1 X104.142 Y84.649 E.01423
G1 X104.508 Y84.414 E.01473
G1 X104.919 Y84.269 E.01473
G1 X105.352 Y84.224 E.01473
G1 X105.647 Y84.262 E.01006
G1 X105.783 Y84.279 E.00466
G1 X106.191 Y84.432 E.01473
G1 X106.551 Y84.676 E.01473
G1 X106.846 Y84.995 E.01473
G1 X107.06 Y85.375 E.01473
G1 X107.18 Y85.793 E.01472
G1 X107.2 Y86.228 E.01473
G1 X107.12 Y86.655 E.01473
G1 X106.943 Y87.053 E.01472
G1 X106.68 Y87.399 E.01473
G1 X106.343 Y87.675 E.01473
G1 X105.952 Y87.866 E.01473
G1 X105.586 Y87.948 E.0127
M204 S10000
G1 X105.568 Y88.369 F42000
G1 F2210.87
M204 S6000
G1 X105.04 Y88.363 E.01785
G1 X104.526 Y88.235 E.01795
G1 X104.064 Y87.997 E.0176
G2 X103.584 Y87.57 I-10.571 J11.418 E.02173
G3 X103.204 Y85.264 I1.778 J-1.478 E.08296
G2 X103.521 Y84.706 I-13.298 J-7.943 E.02173
G1 X103.882 Y84.332 E.01759
G1 X104.329 Y84.045 E.01795
G1 X104.829 Y83.87 E.01795
G1 X105.356 Y83.814 E.01795
G1 X105.698 Y83.858 E.01167
G1 X105.882 Y83.881 E.00627
G1 X106.379 Y84.068 E.01795
G1 X106.818 Y84.365 E.01795
G1 X107.178 Y84.754 E.01795
G1 X107.438 Y85.217 E.01795
G1 X107.584 Y85.726 E.01795
G1 X107.609 Y86.256 E.01795
G1 X107.511 Y86.777 E.01795
G1 X107.296 Y87.262 E.01795
G1 X106.975 Y87.684 E.01795
G1 X106.565 Y88.02 E.01795
G1 X106.088 Y88.253 E.01795
G1 X105.626 Y88.357 E.01602
M204 S10000
G1 X105.563 Y88.776 F42000
G1 F2210.87
M204 S6000
G1 X104.988 Y88.77 E.01946
G1 X104.381 Y88.619 E.02117
G1 X103.831 Y88.335 E.02096
G2 X103.284 Y87.849 I-12.021 J13.002 E.02475
G3 X102.83 Y85.096 I2.092 J-1.759 E.09914
G2 X103.192 Y84.461 I-15.126 J-9.051 E.02475
G1 X103.622 Y84.015 E.02096
G1 X104.149 Y83.677 E.02117
G1 X104.739 Y83.47 E.02117
G1 X105.361 Y83.404 E.02117
G1 X105.75 Y83.454 E.01328
G1 X105.981 Y83.484 E.00788
G1 X106.567 Y83.704 E.02117
G1 X107.085 Y84.054 E.02117
G1 X107.509 Y84.513 E.02117
G1 X107.816 Y85.058 E.02117
G1 X107.989 Y85.66 E.02117
G1 X108.018 Y86.284 E.02117
G1 X107.903 Y86.899 E.02117
G1 X107.649 Y87.471 E.02117
G1 X107.269 Y87.968 E.02117
G1 X106.786 Y88.365 E.02117
G1 X106.224 Y88.639 E.02117
G1 X105.623 Y88.775 E.02085
M204 S250
G1 X105.559 Y89.168 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G1 X104.938 Y89.161 E.01946
G1 X104.242 Y88.988 E.02248
G1 X103.607 Y88.66 E.02242
G2 X102.995 Y88.118 I-13.476 J14.595 E.02562
G3 X102.47 Y84.934 I2.395 J-2.03 E.10628
G2 X102.876 Y84.224 I-16.928 J-10.141 E.02562
G1 X103.372 Y83.71 E.02242
G1 X103.976 Y83.322 E.02249
G1 X104.652 Y83.085 E.02249
G1 X105.365 Y83.009 E.02248
G1 X105.8 Y83.065 E.01374
G1 X106.077 Y83.101 E.00874
G1 X106.748 Y83.353 E.02249
G1 X107.342 Y83.754 E.02248
G1 X107.829 Y84.281 E.02248
G1 X108.18 Y84.906 E.02249
G1 X108.378 Y85.595 E.02248
G1 X108.412 Y86.312 E.02248
G1 X108.28 Y87.017 E.02249
G1 X107.988 Y87.672 E.02248
G1 X107.554 Y88.242 E.02249
G1 X106.999 Y88.697 E.02248
G1 X106.355 Y89.012 E.02249
G1 X105.655 Y89.169 E.02248
G1 X105.619 Y89.169 E.00114
; WIPE_START
M204 S6000
G1 X104.938 Y89.161 E-.12934
G1 X104.242 Y88.988 E-.13625
G1 X103.707 Y88.712 E-.11441
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.091 Y86.229 Z1.6 F42000
G1 Z1.2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.56523
G1 F1723.115
M204 S6000
G1 X105.272 Y86.357 E.00964
G1 X105.448 Y86.336 E.00772
G1 X105.574 Y86.205 E.00786
G1 X105.596 Y86.085 E.00533
G1 X105.525 Y85.917 E.0079
G1 X105.363 Y85.834 E.00793
G1 X105.192 Y85.871 E.00759
G1 X105.061 Y86.051 E.00964
G1 X105.081 Y86.17 E.00525
M204 S10000
G1 X104.613 Y86.216 F42000
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X104.75 Y86.527 E.01066
G1 X105.077 Y86.772 E.01281
G1 X105.407 Y86.814 E.01041
G1 X105.72 Y86.704 E.01041
G1 X105.95 Y86.465 E.01042
G1 X106.049 Y86.148 E.01041
G2 X105.8 Y85.551 I-.83 J-.003 E.02081
G1 X105.505 Y85.399 E.01041
G1 X105.172 Y85.395 E.01042
G1 X104.874 Y85.541 E.01042
G1 X104.642 Y85.877 E.0128
G1 X104.619 Y86.156 E.00878
M204 S10000
G1 X104.228 Y86.194 F42000
G1 F2386.825
M204 S6000
G1 X104.355 Y86.619 E.01393
G1 X104.63 Y86.925 E.01289
G1 X104.943 Y87.127 E.01169
G1 X105.322 Y87.19 E.01203
G1 X105.695 Y87.135 E.01184
G1 X106.024 Y86.942 E.01197
G1 X106.277 Y86.658 E.01191
G1 X106.404 Y86.299 E.01195
G1 X106.422 Y86.046 E.00795
G1 X106.345 Y85.674 E.01192
G1 X106.133 Y85.356 E.01197
G1 X105.835 Y85.121 E.01191
G1 X105.468 Y85.014 E.01199
G1 X105.089 Y85.025 E.01188
G1 X104.728 Y85.187 E.01241
G1 X104.471 Y85.416 E.01078
G1 X104.265 Y85.826 E.01439
G1 X104.234 Y86.134 E.00972
M204 S10000
G1 X103.889 Y86.461 F42000
G1 F2386.825
M204 S6000
G1 X104.098 Y86.911 E.01556
G1 X104.394 Y87.221 E.01343
G1 X104.67 Y87.41 E.0105
G1 X105.143 Y87.565 E.01558
G2 X104.524 Y84.87 I.185 J-1.461 E.17754
G1 X104.167 Y85.188 E.015
G1 X103.942 Y85.584 E.01429
G1 X103.859 Y85.995 E.01315
G1 X103.885 Y86.401 E.01274
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2386.825
G1 X103.859 Y85.995 E-.0772
G1 X103.942 Y85.584 E-.07971
G1 X104.167 Y85.188 E-.08661
G1 X104.524 Y84.87 E-.09093
G1 X104.739 Y84.763 E-.04555
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 7/65
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z1.6 I-.384 J-1.155 P1  F42000
G1 X81.74 Y92.416 Z1.6
G1 Z1.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G1 X81.673 Y92.418 E.00227
G3 X81.479 Y87.589 I-.022 J-2.417 E.25203
G1 X81.777 Y87.586 E.01008
G3 X81.97 Y92.397 I-.126 J2.414 E.24197
G1 X81.8 Y92.411 E.00578
M204 S10000
G1 X81.711 Y92.009 F42000
G1 F2210.87
M204 S6000
G1 X81.669 Y92.01 E.00142
G3 X81.508 Y87.995 I-.019 J-2.01 E.20951
G1 X81.755 Y87.993 E.00838
G3 X81.916 Y91.992 I-.105 J2.007 E.20115
G1 X81.771 Y92.004 E.00493
M204 S10000
G1 X81.682 Y91.603 F42000
G1 F2210.87
M204 S6000
G1 X81.665 Y91.602 E.00057
G3 X81.537 Y88.402 I-.015 J-1.602 E.16701
G1 X81.734 Y88.4 E.00668
G3 X81.862 Y91.588 I-.084 J1.6 E.16034
G1 X81.742 Y91.598 E.00408
M204 S250
G1 X81.663 Y91.212 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G3 X81.497 Y91.201 I.135 J-3.435 E.00522
G1 X81.368 Y91.178 E.00409
G3 X81.21 Y91.128 I.967 J-3.317 E.0052
G1 X81.091 Y91.075 E.0041
G3 X80.95 Y90.988 I1.751 J-3 E.00518
G1 X80.847 Y90.907 E.00412
G3 X80.732 Y90.788 I2.388 J-2.452 E.00518
G1 X80.651 Y90.684 E.00412
G3 X80.568 Y90.542 I2.926 J-1.81 E.00517
G1 X80.516 Y90.421 E.00413
G3 X80.469 Y90.263 I3.285 J-1.05 E.00517
G1 X80.448 Y90.133 E.00413
G3 X80.441 Y89.968 I3.407 J-.223 E.00517
G1 X80.452 Y89.837 E.00413
G3 X80.485 Y89.676 I3.439 J.625 E.00516
G1 X80.528 Y89.551 E.00413
G3 X80.597 Y89.406 I.616 J.204 E.00505
G1 X80.599 Y89.402 E.00014
G1 X80.671 Y89.292 E.00412
G3 X80.774 Y89.167 I.553 J.35 E.00509
G1 X80.776 Y89.165 E.00011
G1 X80.872 Y89.076 E.00411
G3 X81.004 Y88.978 I.455 J.478 E.00514
G1 X81.006 Y88.977 E.00007
G1 X81.12 Y88.914 E.00409
G3 X81.273 Y88.852 I.33 J.583 E.00519
G1 X81.274 Y88.851 E.00004
G1 X81.399 Y88.818 E.00407
G3 X81.564 Y88.794 I.18 J.653 E.00525
G1 X81.694 Y88.793 E.00406
M73 P56 R7
G3 X81.851 Y88.808 I.016 J.642 E.00497
G3 X81.986 Y88.84 I-.059 J.56 E.00435
G3 X82.047 Y88.86 I-.051 J.254 E.002
G3 X82.257 Y88.956 I-.281 J.897 E.00727
G3 X82.381 Y89.038 I-.27 J.54 E.00466
G3 X82.492 Y89.134 I-.331 J.499 E.00464
G3 X82.59 Y89.241 I-.385 J.449 E.00457
G3 X82.677 Y89.364 I-.451 J.413 E.00472
G3 X82.746 Y89.49 I-.479 J.34 E.00452
G3 X82.801 Y89.631 I-.543 J.295 E.00477
G3 X82.837 Y89.769 I-.539 J.211 E.00447
G3 X82.848 Y89.841 I-.282 J.083 E.00227
G3 X82.859 Y89.982 I-.569 J.115 E.00447
G3 X82.852 Y90.134 I-.614 J.047 E.00476
G3 X82.828 Y90.276 I-.586 J-.026 E.00453
G3 X82.753 Y90.497 I-.931 J-.193 E.00734
G3 X82.727 Y90.552 I-.237 J-.078 E.00193
G3 X82.652 Y90.679 I-.551 J-.24 E.00464
G3 X82.561 Y90.797 I-.522 J-.308 E.00468
G3 X82.461 Y90.899 I-.46 J-.351 E.00448
G3 X82.341 Y90.994 I-.444 J-.438 E.00482
G3 X82.224 Y91.067 I-.351 J-.437 E.00432
G3 X82.08 Y91.132 I-.335 J-.548 E.00498
G1 X81.957 Y91.172 E.00405
G3 X81.793 Y91.202 I-.704 J-3.377 E.00523
G1 X81.723 Y91.207 E.0022
; WIPE_START
M204 S6000
G1 X81.497 Y91.201 E-.04292
G1 X81.368 Y91.178 E-.02479
G1 X81.21 Y91.128 E-.03151
G1 X81.091 Y91.075 E-.02487
G1 X80.95 Y90.988 E-.0314
G1 X80.847 Y90.907 E-.02494
G1 X80.732 Y90.788 E-.03139
G1 X80.651 Y90.684 E-.02498
G1 X80.568 Y90.542 E-.03134
G1 X80.516 Y90.421 E-.02504
G1 X80.469 Y90.263 E-.03133
G1 X80.448 Y90.133 E-.025
G1 X80.441 Y89.973 E-.03049
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X81.851 Y95.577 Z1.8 F42000
G1 Z1.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G1 X80.906 Y95.53 E.03203
G1 X79.983 Y95.325 E.03203
G1 X79.107 Y94.967 E.03203
G1 X78.304 Y94.465 E.03203
G1 X77.598 Y93.836 E.03203
G1 X77.007 Y93.094 E.03208
G1 X76.554 Y92.274 E.03173
G1 X76.239 Y91.367 E.0325
G1 X76.087 Y90.445 E.03161
G1 X76.094 Y89.485 E.03251
G1 X76.26 Y88.563 E.03172
G1 X76.582 Y87.671 E.03209
G1 X77.049 Y86.848 E.03203
G1 X77.648 Y86.115 E.03203
G1 X78.362 Y85.495 E.03203
G1 X79.171 Y85.004 E.03203
G1 X80.051 Y84.657 E.03203
G1 X80.977 Y84.464 E.03203
G1 X81.923 Y84.429 E.03203
G1 X82.861 Y84.556 E.03202
G1 X83.764 Y84.839 E.03203
G1 X84.606 Y85.27 E.03202
G1 X85.363 Y85.837 E.03203
G1 X86.013 Y86.525 E.03203
G1 X86.546 Y87.325 E.03254
G1 X86.924 Y88.174 E.03144
G3 X87.231 Y90.039 I-5.827 J1.919 E.06425
G1 X87.143 Y90.978 E.03192
G1 X86.898 Y91.894 E.03209
G1 X86.503 Y92.753 E.03203
G1 X85.968 Y93.534 E.03202
G1 X85.309 Y94.213 E.03203
G1 X84.545 Y94.771 E.03203
G1 X83.697 Y95.191 E.03203
G1 X82.791 Y95.462 E.03202
G1 X81.911 Y95.569 E.03
M204 S10000
G1 X81.866 Y95.985 F42000
G1 F2210.87
M204 S6000
G1 X80.852 Y95.935 E.03438
G1 X79.86 Y95.715 E.03437
G1 X78.921 Y95.33 E.03437
G1 X78.059 Y94.792 E.03437
G1 X77.301 Y94.116 E.03437
G1 X76.668 Y93.321 E.03441
G1 X76.18 Y92.44 E.03407
G1 X75.843 Y91.467 E.03487
G1 X75.68 Y90.477 E.03396
G1 X75.687 Y89.447 E.03487
G1 X75.866 Y88.457 E.03407
G1 X76.211 Y87.5 E.03442
G1 X76.712 Y86.617 E.03437
G1 X77.355 Y85.831 E.03437
G1 X78.121 Y85.165 E.03437
G1 X78.989 Y84.638 E.03437
G1 X79.934 Y84.266 E.03437
G1 X80.928 Y84.058 E.03438
G1 X81.943 Y84.021 E.03438
G1 X82.949 Y84.157 E.03437
G1 X83.919 Y84.46 E.03438
G1 X84.822 Y84.923 E.03437
G1 X85.635 Y85.533 E.03437
G1 X86.333 Y86.27 E.03437
G1 X86.904 Y87.128 E.03489
G1 X87.308 Y88.037 E.03368
G3 X87.639 Y90.046 I-6.374 J2.082 E.06917
G1 X87.545 Y91.05 E.03415
G1 X87.283 Y92.032 E.03441
G1 X86.858 Y92.955 E.03437
G1 X86.284 Y93.793 E.03437
G1 X85.577 Y94.521 E.03438
G1 X84.757 Y95.12 E.03437
G1 X83.847 Y95.571 E.03437
G1 X82.874 Y95.862 E.03437
G1 X81.926 Y95.978 E.03234
M204 S10000
G1 X81.847 Y96.391 F42000
G1 F2210.87
M204 S6000
G1 X80.797 Y96.34 E.03557
G1 X79.738 Y96.105 E.03672
G1 X78.734 Y95.694 E.03672
G1 X77.814 Y95.119 E.03672
G1 X77.005 Y94.397 E.03672
G1 X76.328 Y93.548 E.03675
G1 X75.804 Y92.597 E.03674
G1 X75.451 Y91.579 E.0365
G1 X75.273 Y90.498 E.03709
G1 X75.28 Y89.419 E.0365
G1 X75.471 Y88.351 E.03674
G1 X75.839 Y87.33 E.03674
G1 X76.375 Y86.386 E.03672
G1 X77.062 Y85.546 E.03672
G1 X77.88 Y84.835 E.03672
G1 X78.808 Y84.272 E.03672
G1 X79.817 Y83.874 E.03672
G1 X80.879 Y83.652 E.03672
G1 X81.963 Y83.613 E.03672
G1 X83.025 Y83.756 E.03626
G1 X84.073 Y84.082 E.03717
G1 X85.039 Y84.577 E.03672
G1 X85.907 Y85.228 E.03672
G1 X86.652 Y86.016 E.03672
G1 X87.26 Y86.927 E.03709
G3 X87.694 Y87.904 I-194.127 J86.85 E.03619
G3 X87.963 Y88.961 I-8.547 J2.734 E.03692
G3 X88.047 Y90.059 I-19.785 J2.072 E.03729
G1 X87.947 Y91.122 E.03614
G1 X87.667 Y92.171 E.03674
G1 X87.214 Y93.157 E.03672
G1 X86.601 Y94.051 E.03672
G1 X85.845 Y94.83 E.03672
G1 X84.969 Y95.469 E.03672
G1 X83.997 Y95.951 E.03672
G1 X82.958 Y96.262 E.03672
G1 X81.907 Y96.39 E.03583
M204 S250
G1 X81.828 Y96.783 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G1 X80.745 Y96.73 E.034
G1 X79.621 Y96.48 E.03611
G1 X78.555 Y96.044 E.0361
G1 X77.578 Y95.434 E.03611
G1 X76.719 Y94.668 E.03611
G1 X76.001 Y93.767 E.03611
G1 X75.471 Y92.808 E.03434
G1 X75.059 Y91.621 E.03941
G1 X74.881 Y90.517 E.03506
G1 X74.888 Y89.393 E.03525
G1 X75.091 Y88.249 E.03643
G1 X75.482 Y87.165 E.03611
G1 X76.05 Y86.164 E.0361
G1 X76.779 Y85.272 E.0361
G1 X77.649 Y84.517 E.03611
G1 X78.633 Y83.92 E.03611
G1 X79.704 Y83.497 E.0361
G1 X80.831 Y83.262 E.03611
G1 X81.982 Y83.22 E.03611
G1 X83.077 Y83.368 E.03464
G1 X84.222 Y83.718 E.03755
G1 X85.247 Y84.243 E.0361
G1 X86.169 Y84.934 E.03611
G1 X86.96 Y85.77 E.03611
G1 X87.601 Y86.732 E.03623
G3 X88.067 Y87.783 I-72.281 J32.718 E.03606
G3 X88.35 Y88.897 I-9.009 J2.876 E.03606
G3 X88.438 Y90.085 I-16.966 J1.863 E.03736
G1 X88.335 Y91.192 E.03485
G1 X88.037 Y92.304 E.03611
G1 X87.556 Y93.351 E.03611
G1 X86.905 Y94.3 E.0361
G1 X86.103 Y95.127 E.03611
G1 X85.173 Y95.805 E.03611
G1 X84.141 Y96.317 E.0361
G1 X83.038 Y96.647 E.03611
G1 X81.895 Y96.786 E.03611
G1 X81.888 Y96.786 E.00023
; WIPE_START
M204 S6000
G1 X80.745 Y96.73 E-.21742
G1 X79.909 Y96.544 E-.16258
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.8
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.8 F4000
            G39.3 S1
            G0 Z1.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.447 Y90.062 F42000
G1 Z1.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G3 X84.302 Y90.932 I-3.714 J-.171 E.02772
G1 X84.02 Y91.512 E.0202
G1 X83.58 Y92.044 E.02165
G1 X83.026 Y92.451 E.02155
G1 X82.384 Y92.714 E.02176
G1 X81.7 Y92.811 E.02166
G1 X81.013 Y92.738 E.02165
G1 X80.365 Y92.5 E.02166
G3 X79.319 Y91.573 I1.885 J-3.178 E.04408
G1 X79.069 Y91.084 E.0172
G3 X78.853 Y90.264 I4.067 J-1.512 E.02665
G1 X78.867 Y89.619 E.02021
G1 X79.044 Y88.952 E.02165
G1 X79.378 Y88.348 E.02165
G1 X79.851 Y87.844 E.02166
G1 X80.431 Y87.47 E.02165
G1 X81.086 Y87.249 E.02166
G1 X81.774 Y87.194 E.02165
G1 X82.167 Y87.24 E.01241
G1 X82.784 Y87.43 E.02026
G1 X83.373 Y87.781 E.0215
G1 X83.863 Y88.269 E.02166
G3 X84.42 Y89.525 I-3.033 J2.098 E.04334
G1 X84.444 Y90.002 E.01498
M204 S10000
G1 X84.823 Y90.047 F42000
G1 F2386.825
M204 S6000
G1 X84.818 Y90.334 E.00901
G1 X84.686 Y90.966 E.02022
G1 X84.39 Y91.614 E.02235
G3 X83.769 Y92.38 I-3.988 J-2.597 E.03096
G1 X83.244 Y92.759 E.0203
G1 X82.523 Y93.064 E.02454
G1 X81.75 Y93.185 E.02454
G3 X80.835 Y93.08 I.225 J-6.021 E.02889
G1 X80.232 Y92.853 E.02022
G3 X79.476 Y92.328 I2.797 J-4.838 E.02889
G3 X79.002 Y91.777 I3.556 J-3.532 E.02279
G3 X78.49 Y90.394 I3.138 J-1.949 E.04656
G1 X78.489 Y89.649 E.02335
G1 X78.68 Y88.852 E.02571
G1 X79.05 Y88.162 E.02454
G3 X79.733 Y87.465 I3.85 J3.087 E.03064
G1 X80.238 Y87.146 E.01876
G3 X81.104 Y86.864 I2.321 J5.66 E.02858
G1 X81.747 Y86.818 E.02021
G1 X82.275 Y86.878 E.01665
G1 X82.893 Y87.069 E.0203
G3 X84.131 Y88.004 I-1.694 J3.529 E.04896
G3 X84.599 Y88.796 I-4.64 J3.272 E.02889
G1 X84.781 Y89.415 E.02021
G1 X84.819 Y89.987 E.01798
M204 S10000
G1 X85.2 Y90.032 F42000
G1 F2386.825
M204 S6000
G1 X85.187 Y90.412 E.01191
G1 X85.055 Y91.043 E.02022
G1 X84.729 Y91.779 E.02524
G1 X84.572 Y92.036 E.00944
G1 X84.157 Y92.529 E.02021
G1 X83.468 Y93.063 E.02733
G3 X82.439 Y93.473 I-2.476 J-4.71 E.0348
G1 X81.789 Y93.56 E.02056
G3 X80.702 Y93.433 I.078 J-5.384 E.03435
G1 X80.099 Y93.206 E.02022
G1 X79.509 Y92.831 E.02191
G1 X79.192 Y92.576 E.01277
G3 X78.685 Y91.981 I3.839 J-3.779 E.02451
G3 X78.122 Y90.478 I3.486 J-2.163 E.05066
G1 X78.112 Y89.641 E.02624
G3 X78.402 Y88.544 I4.932 J.716 E.03567
G1 X78.723 Y87.976 E.02046
G3 X79.483 Y87.177 I4.244 J3.28 E.03465
G1 X80.028 Y86.832 E.02021
G3 X81.078 Y86.488 I2.131 J4.716 E.0347
G1 X81.72 Y86.442 E.02021
G1 X82.234 Y86.485 E.01616
G1 X83.002 Y86.708 E.02506
G3 X83.946 Y87.28 I-2.271 J4.811 E.03469
G1 X84.399 Y87.739 E.02022
G3 X84.96 Y88.69 I-4.046 J3.028 E.03469
G1 X85.143 Y89.308 E.02021
G1 X85.195 Y89.972 E.02088
M204 S10000
G1 X85.636 Y90.164 F42000
; LINE_WIDTH: 0.535426
G1 F1827.391
M204 S6000
G2 X85.613 Y89.493 I-14.576 J.161 E.02747
G1 X85.424 Y88.706 E.03314
G1 X85.152 Y88.092 E.02751
G1 X84.868 Y87.642 E.0218
G1 X84.306 Y87.023 E.03423
G1 X83.762 Y86.62 E.0277
G1 X83.163 Y86.305 E.02772
G1 X82.517 Y86.104 E.02774
G1 X81.943 Y86.02 E.02373
G1 X81.169 Y86.042 E.0317
G1 X80.507 Y86.182 E.02771
G1 X80.03 Y86.356 E.02082
G1 X79.298 Y86.778 E.03459
G1 X78.79 Y87.225 E.0277
G1 X78.356 Y87.744 E.02772
G1 X78.027 Y88.325 E.02734
G1 X77.798 Y88.976 E.02825
G1 X77.679 Y89.594 E.02579
G1 X77.667 Y90.238 E.0264
G1 X77.783 Y90.975 E.03053
G1 X77.961 Y91.52 E.02349
G1 X78.255 Y92.094 E.02639
G1 X78.754 Y92.742 E.03349
G1 X79.12 Y93.083 E.02048
G1 X79.65 Y93.45 E.0264
G2 X81.119 Y93.952 I2.142 J-3.863 E.0639
G1 X81.794 Y93.994 E.02772
G1 X82.466 Y93.909 E.02774
G1 X83.113 Y93.71 E.0277
G1 X83.719 Y93.416 E.02757
G1 X84.241 Y93.038 E.0264
G1 X84.736 Y92.526 E.02918
G1 X85.086 Y92.03 E.02484
G1 X85.367 Y91.45 E.02639
G1 X85.577 Y90.697 E.03202
G1 X85.629 Y90.223 E.01953
M204 S10000
G1 X86.082 Y90.021 F42000
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X86.047 Y89.466 E.01744
G1 X85.849 Y88.591 E.02813
G2 X85.114 Y87.242 I-4.813 J1.749 E.04837
G1 X84.597 Y86.696 E.02355
G1 X83.996 Y86.246 E.02355
G1 X83.328 Y85.903 E.02355
G1 X82.611 Y85.679 E.02355
G1 X81.867 Y85.578 E.02355
G1 X81.116 Y85.605 E.02355
G1 X80.381 Y85.759 E.02356
G1 X79.682 Y86.035 E.02355
G1 X79.04 Y86.424 E.02355
G1 X78.473 Y86.917 E.02355
G1 X77.997 Y87.498 E.02355
G1 X77.627 Y88.151 E.02354
G1 X77.371 Y88.861 E.02365
G1 X77.239 Y89.591 E.02327
G1 X77.234 Y90.355 E.02395
G1 X77.354 Y91.084 E.02315
G1 X77.604 Y91.805 E.02395
G1 X77.964 Y92.455 E.02328
G1 X78.434 Y93.045 E.02364
G1 X78.994 Y93.545 E.02355
G1 X79.631 Y93.943 E.02355
G1 X80.326 Y94.227 E.02355
G1 X81.06 Y94.39 E.02355
G1 X81.81 Y94.427 E.02355
G1 X82.556 Y94.336 E.02355
G1 X83.275 Y94.121 E.02355
G1 X83.948 Y93.787 E.02355
G1 X84.555 Y93.344 E.02355
G1 X85.078 Y92.805 E.02355
G1 X85.502 Y92.186 E.02354
G1 X85.816 Y91.504 E.02355
G1 X86.011 Y90.775 E.02364
G1 X86.076 Y90.081 E.02186
M204 S10000
G1 X86.46 Y90.027 F42000
G1 F2386.825
M204 S6000
G2 X86.197 Y88.432 I-5.672 J.116 E.05087
G1 X85.87 Y87.697 E.02521
G1 X85.41 Y87.006 E.02604
G1 X84.849 Y86.414 E.02556
G1 X84.197 Y85.925 E.02556
G1 X83.471 Y85.553 E.02556
G1 X82.693 Y85.309 E.02557
G1 X81.885 Y85.2 E.02556
G1 X81.071 Y85.23 E.02556
G1 X80.272 Y85.396 E.02557
G1 X79.514 Y85.696 E.02556
G1 X78.817 Y86.119 E.02556
G1 X78.202 Y86.653 E.02556
G1 X77.685 Y87.284 E.02556
G1 X77.283 Y87.993 E.02556
G1 X77.006 Y88.763 E.02565
G1 X76.863 Y89.556 E.02528
G1 X76.857 Y90.385 E.02598
G1 X76.987 Y91.177 E.02516
G1 X77.259 Y91.96 E.02597
G1 X77.649 Y92.665 E.02529
G1 X78.159 Y93.305 E.02564
G1 X78.767 Y93.848 E.02556
G1 X79.459 Y94.28 E.02556
G1 X80.213 Y94.588 E.02556
G1 X81.009 Y94.765 E.02556
G1 X81.824 Y94.805 E.02556
G1 X82.633 Y94.707 E.02556
G1 X83.414 Y94.473 E.02556
G1 X84.144 Y94.111 E.02556
G1 X84.803 Y93.63 E.02556
G1 X85.371 Y93.045 E.02557
G1 X85.832 Y92.373 E.02556
G1 X86.172 Y91.632 E.02557
G1 X86.383 Y90.842 E.02564
G1 X86.454 Y90.087 E.02378
M204 S10000
G1 X86.838 Y90.033 F42000
G1 F2386.825
M204 S6000
G2 X86.553 Y88.305 I-6.198 J.135 E.05509
G1 X86.202 Y87.514 E.02713
G1 X85.706 Y86.77 E.02805
G1 X85.101 Y86.131 E.02757
G1 X84.397 Y85.604 E.02757
G1 X83.615 Y85.203 E.02757
G1 X82.775 Y84.94 E.02758
G1 X81.904 Y84.822 E.02757
G1 X81.025 Y84.854 E.02757
G1 X80.164 Y85.034 E.02758
G1 X79.346 Y85.357 E.02757
G1 X78.594 Y85.813 E.02758
G1 X77.93 Y86.39 E.02757
G1 X77.373 Y87.07 E.02758
G1 X76.939 Y87.835 E.02757
G1 X76.64 Y88.665 E.02765
G1 X76.486 Y89.521 E.02729
G1 X76.48 Y90.415 E.028
G1 X76.621 Y91.27 E.02718
G1 X76.913 Y92.114 E.028
G1 X77.334 Y92.876 E.0273
G1 X77.884 Y93.565 E.02764
G1 X78.54 Y94.15 E.02757
G1 X79.286 Y94.616 E.02757
G1 X80.1 Y94.949 E.02758
G1 X80.959 Y95.14 E.02757
G1 X81.837 Y95.183 E.02758
G1 X82.71 Y95.077 E.02758
M73 P57 R7
G1 X83.553 Y94.825 E.02757
G1 X84.341 Y94.434 E.02757
G1 X85.051 Y93.916 E.02757
G1 X85.664 Y93.285 E.02758
G1 X86.161 Y92.559 E.02757
G1 X86.528 Y91.76 E.02758
G1 X86.756 Y90.909 E.02764
G1 X86.832 Y90.093 E.02569
; WIPE_START
G1 X86.756 Y90.909 E-.15569
G1 X86.528 Y91.76 E-.16751
G1 X86.403 Y92.032 E-.0568
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X93.851 Y90.365 Z1.8 F42000
G1 X105.506 Y87.756 Z1.8
G1 Z1.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G3 X104.397 Y87.487 I-.184 J-1.662 E.03942
G1 X104.09 Y87.222 E.01372
G3 X103.796 Y85.429 I1.303 J-1.135 E.06476
G1 X104 Y85.082 E.01365
G3 X105.735 Y84.473 I1.354 J1.083 E.06558
G3 X105.565 Y87.748 I-.413 J1.621 E.15546
M204 S10000
G1 X105.55 Y88.17 F42000
G1 F2210.87
M204 S6000
G1 X105.066 Y88.165 E.01638
G1 X104.596 Y88.048 E.01638
G1 X104.167 Y87.827 E.01633
G1 X103.789 Y87.5 E.01694
G1 X103.514 Y87.122 E.01581
G1 X103.326 Y86.674 E.01643
G1 X103.247 Y86.195 E.01642
G1 X103.281 Y85.711 E.01642
G1 X103.421 Y85.263 E.0159
G1 X103.674 Y84.834 E.01686
G1 X104.009 Y84.486 E.01633
G1 X104.416 Y84.225 E.01638
G1 X104.873 Y84.065 E.01638
G1 X105.354 Y84.014 E.01638
G1 X105.834 Y84.075 E.01638
G1 X106.287 Y84.246 E.01638
G1 X106.688 Y84.516 E.01638
G1 X107.016 Y84.872 E.01638
G1 X107.253 Y85.294 E.01638
G1 X107.387 Y85.759 E.01638
G1 X107.41 Y86.242 E.01638
G1 X107.32 Y86.718 E.01638
G1 X107.124 Y87.16 E.01638
G1 X106.831 Y87.545 E.01638
G1 X106.457 Y87.852 E.01638
G1 X106.022 Y88.064 E.01638
G1 X105.608 Y88.157 E.01434
M204 S10000
G1 X105.561 Y88.577 F42000
G1 F2210.87
M204 S6000
G1 X105.014 Y88.571 E.01852
G1 X104.452 Y88.432 E.0196
G1 X103.938 Y88.166 E.01957
G1 X103.487 Y87.777 E.02016
G1 X103.157 Y87.323 E.01901
G1 X102.932 Y86.787 E.01965
G1 X102.838 Y86.215 E.01965
G1 X102.878 Y85.635 E.01965
G1 X103.047 Y85.097 E.0191
G1 X103.348 Y84.586 E.02008
G1 X103.749 Y84.17 E.01957
G1 X104.237 Y83.857 E.0196
G1 X104.783 Y83.665 E.0196
G1 X105.359 Y83.604 E.0196
G1 X105.933 Y83.678 E.0196
G1 X106.475 Y83.882 E.0196
G1 X106.955 Y84.205 E.0196
G1 X107.348 Y84.631 E.0196
G1 X107.632 Y85.136 E.0196
G1 X107.791 Y85.692 E.0196
G1 X107.819 Y86.27 E.0196
G1 X107.712 Y86.84 E.0196
G1 X107.476 Y87.369 E.0196
G1 X107.126 Y87.829 E.0196
G1 X106.678 Y88.196 E.0196
G1 X106.158 Y88.451 E.0196
G1 X105.62 Y88.572 E.01865
M204 S250
G1 X105.556 Y88.969 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G1 X104.963 Y88.963 E.01859
G1 X104.313 Y88.801 E.02103
G1 X103.717 Y88.493 E.02102
G1 X103.197 Y88.045 E.02151
G3 X102.81 Y87.51 I44.628 J-32.714 E.02073
G1 X102.552 Y86.889 E.02109
G1 X102.445 Y86.241 E.02058
G1 X102.49 Y85.57 E.02109
G1 X102.686 Y84.937 E.02077
G1 X103.033 Y84.347 E.02147
G1 X103.499 Y83.864 E.02102
G1 X104.063 Y83.502 E.02103
G1 X104.696 Y83.28 E.02103
G1 X105.363 Y83.209 E.02103
G1 X106.01 Y83.292 E.02044
G1 X106.656 Y83.531 E.0216
G1 X107.212 Y83.906 E.02103
G1 X107.667 Y84.399 E.02103
G1 X107.996 Y84.983 E.02103
G1 X108.181 Y85.628 E.02103
G1 X108.212 Y86.298 E.02103
G1 X108.089 Y86.957 E.02103
G1 X107.816 Y87.57 E.02103
G1 X107.41 Y88.103 E.02103
G1 X106.891 Y88.529 E.02103
G1 X106.288 Y88.823 E.02103
G1 X105.634 Y88.97 E.02103
G1 X105.616 Y88.97 E.00056
; WIPE_START
M204 S6000
G1 X104.963 Y88.963 E-.12404
G1 X104.313 Y88.801 E-.12742
G1 X103.717 Y88.493 E-.12738
G1 X103.712 Y88.489 E-.00115
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.495 Y86.09 Z1.8 F42000
G1 Z1.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.37045
G1 F2747.84
M204 S6000
G1 X105.422 Y85.961 E.00402
G1 X105.276 Y85.943 E.00403
G1 X105.171 Y86.054 E.00416
G1 X105.2 Y86.201 E.00408
G1 X105.329 Y86.262 E.0039
G1 X105.462 Y86.197 E.00401
G1 X105.477 Y86.147 E.00143
M204 S10000
G1 X104.82 Y86.184 F42000
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X104.908 Y86.398 E.00726
G1 X105.096 Y86.558 E.00772
G1 X105.326 Y86.614 E.00742
G1 X105.558 Y86.562 E.00746
G1 X105.742 Y86.411 E.00747
G1 X105.839 Y86.193 E.00747
G1 X105.847 Y86.073 E.00376
G1 X105.781 Y85.844 E.00747
G1 X105.619 Y85.669 E.00747
G1 X105.396 Y85.585 E.00747
G1 X105.159 Y85.611 E.00748
G1 X104.96 Y85.738 E.00739
G1 X104.834 Y85.949 E.00771
G1 X104.823 Y86.124 E.00551
M204 S10000
G1 X104.464 Y86.347 F42000
G1 F2386.825
M204 S6000
G1 X104.66 Y86.698 E.0126
G1 X104.923 Y86.893 E.01026
G1 X105.216 Y86.99 E.0097
G1 X105.629 Y86.947 E.01301
G1 X105.978 Y86.722 E.01301
G1 X106.19 Y86.365 E.01301
G1 X106.224 Y86.056 E.00977
G1 X106.161 Y85.751 E.00976
G1 X105.917 Y85.415 E.01301
G1 X105.548 Y85.225 E.01301
G1 X105.133 Y85.22 E.01302
G1 X104.76 Y85.402 E.01301
G1 X104.553 Y85.659 E.01035
G1 X104.445 Y85.931 E.00917
G1 X104.462 Y86.287 E.01117
M204 S10000
G1 X104.16 Y86.597 F42000
G1 F2386.825
M204 S6000
G1 X104.381 Y86.955 E.01319
G1 X104.75 Y87.228 E.01439
G1 X105.168 Y87.367 E.01383
G1 X105.61 Y87.337 E.01389
G1 X106.022 Y87.174 E.01388
G1 X106.342 Y86.868 E.01389
G1 X106.552 Y86.478 E.01388
G1 X106.6 Y86.038 E.01389
G1 X106.511 Y85.604 E.01388
G1 X106.265 Y85.236 E.01389
G1 X105.918 Y84.961 E.01388
G1 X105.492 Y84.837 E.01389
G1 X105.05 Y84.85 E.01388
G1 X104.643 Y85.03 E.01395
G1 X104.315 Y85.321 E.01374
G1 X104.115 Y85.724 E.01411
G1 X104.051 Y86.158 E.01375
G1 X104.146 Y86.538 E.0123
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2386.825
G1 X104.051 Y86.158 E-.07455
G1 X104.115 Y85.724 E-.08333
G1 X104.315 Y85.321 E-.08553
G1 X104.643 Y85.03 E-.08328
G1 X104.899 Y84.916 E-.0533
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 8/65
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z1.8 I-.375 J-1.158 P1  F42000
G1 X81.741 Y92.415 Z1.8
G1 Z1.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G1 X81.673 Y92.417 E.00231
G3 X81.479 Y87.589 I-.026 J-2.417 E.25224
G1 X81.77 Y87.586 E.00985
G3 X81.97 Y92.396 I-.123 J2.414 E.24194
G1 X81.801 Y92.41 E.00572
M204 S10000
G1 X81.712 Y92.009 F42000
G1 F2210.87
M204 S6000
G1 X81.669 Y92.01 E.00146
G3 X81.508 Y87.995 I-.022 J-2.01 E.20971
G1 X81.749 Y87.993 E.00818
G3 X81.916 Y91.992 I-.102 J2.007 E.20114
G1 X81.772 Y92.004 E.00488
M204 S10000
G1 X81.684 Y91.603 F42000
G1 F2210.87
M204 S6000
G1 X81.665 Y91.603 E.00061
G3 X81.537 Y88.402 I-.018 J-1.602 E.1672
G1 X81.729 Y88.4 E.0065
G3 X81.862 Y91.588 I-.081 J1.6 E.16036
G1 X81.743 Y91.598 E.00403
M204 S250
G1 X81.662 Y91.203 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G3 X81.565 Y88.794 I-.014 J-1.206 E.11657
G1 X81.709 Y88.793 E.00454
G3 X81.722 Y91.2 I-.061 J1.204 E.11455
; WIPE_START
M204 S6000
G1 X81.513 Y91.204 E-.03965
G1 X81.224 Y91.134 E-.05644
G1 X80.96 Y90.996 E-.05661
G1 X80.739 Y90.798 E-.05648
G1 X80.572 Y90.551 E-.05656
G1 X80.513 Y90.414 E-.02833
G1 X80.471 Y90.271 E-.0283
G1 X80.44 Y89.976 E-.05652
G1 X80.441 Y89.97 E-.00111
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X81.838 Y95.379 Z2 F42000
G1 Z1.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G1 X80.934 Y95.335 E.03065
G3 X80.011 Y95.127 I4.941 J-24.089 E.03203
G3 X79.203 Y94.793 I4.634 J-12.374 E.02959
G1 X78.434 Y94.315 E.03064
G3 X77.13 Y92.913 I3.503 J-4.565 E.06512
G1 X76.716 Y92.146 E.02951
G3 X76.433 Y91.32 I8.659 J-3.42 E.02955
G1 X76.286 Y90.427 E.03065
G3 X76.294 Y89.481 I24.641 J-.257 E.03202
G3 X76.452 Y88.611 I14.603 J2.195 E.02993
G3 X76.786 Y87.704 I23.149 J8.002 E.03273
G3 X77.22 Y86.947 I6.535 J3.247 E.02954
G3 X77.849 Y86.198 I5.678 J4.129 E.03314
G1 X78.512 Y85.631 E.02954
G3 X79.26 Y85.181 I5.58 J8.424 E.02956
G1 X80.102 Y84.848 E.03065
G3 X81.028 Y84.656 I5.459 J24.051 E.03199
G3 X81.914 Y84.627 I.995 J16.506 E.03003
G1 X82.006 Y84.637 E.00313
G1 X82.869 Y84.761 E.02951
G3 X83.699 Y85.026 I-1.926 J7.483 E.02951
G1 X84.504 Y85.44 E.03065
G3 X85.26 Y86.011 I-14.442 J19.9 E.03205
G3 X85.858 Y86.647 I-7.628 J7.767 E.02956
G1 X86.361 Y87.4 E.03066
G3 X86.741 Y88.258 I-23.411 J10.891 E.03176
G3 X86.967 Y89.173 I-41.128 J10.638 E.03192
G3 X87.03 Y90.086 I-44.624 J3.53 E.03096
G3 X86.947 Y90.953 I-8.183 J-.348 E.02951
G1 X86.712 Y91.828 E.03065
G3 X86.314 Y92.686 I-22.596 J-9.958 E.03204
G3 X85.817 Y93.406 I-10.057 J-6.408 E.02959
G1 X85.188 Y94.057 E.03065
G3 X84.424 Y94.613 I-14.963 J-19.742 E.03197
G3 X83.625 Y95.007 I-10.292 J-19.846 E.03018
G3 X82.704 Y95.278 I-7.24 J-22.943 E.0325
G3 X81.898 Y95.375 I-1.443 J-8.567 E.02749
M204 S10000
G1 X81.842 Y95.787 F42000
G1 F2210.87
M204 S6000
G1 X80.888 Y95.74 E.03234
G3 X79.873 Y95.51 I3.96 J-19.86 E.03521
G3 X79.011 Y95.153 I4.958 J-13.2 E.0316
G1 X78.199 Y94.649 E.03234
G3 X76.776 Y93.115 I3.722 J-4.88 E.07119
G1 X76.336 Y92.294 E.03152
M73 P57 R6
G3 X76.036 Y91.411 I9.285 J-3.65 E.03157
G1 X75.88 Y90.468 E.03235
G3 X75.89 Y89.428 I20.285 J-.326 E.03521
G3 X76.059 Y88.503 I15.496 J2.342 E.03184
G3 X76.425 Y87.514 I19.189 J6.552 E.03571
G3 X76.891 Y86.707 I6.953 J3.469 E.03156
G3 X77.577 Y85.895 I5.954 J4.339 E.036
G1 X78.287 Y85.291 E.03155
G3 X79.086 Y84.811 I5.951 J9.013 E.03157
G1 X79.975 Y84.46 E.03235
G3 X80.993 Y84.25 I4.607 J19.763 E.03519
G3 X81.935 Y84.22 I1.046 J17.59 E.03191
G1 X82.056 Y84.233 E.00412
G1 X82.978 Y84.369 E.03153
G3 X83.865 Y84.653 I-2.071 J7.989 E.03154
G1 X84.714 Y85.09 E.03235
G3 X85.544 Y85.719 I-11.809 J16.448 E.03523
G3 X86.182 Y86.399 I-8.163 J8.291 E.03158
G1 X86.713 Y87.194 E.03236
G3 X87.131 Y88.14 I-18.711 J8.847 E.03502
G3 X87.373 Y89.135 I-23.769 J6.287 E.03468
G3 X87.437 Y90.109 I-25.768 J2.183 E.03302
G3 X87.346 Y91.036 I-8.746 J-.387 E.03154
G1 X87.098 Y91.959 E.03235
G3 X86.659 Y92.902 I-18.65 J-8.102 E.03522
G3 X86.129 Y93.67 I-10.755 J-6.871 E.03159
G1 X85.464 Y94.356 E.03235
G3 X84.624 Y94.968 I-12.362 J-16.098 E.03518
G3 X83.776 Y95.386 I-10.913 J-21.068 E.03201
G3 X82.768 Y95.68 I-6.131 J-19.148 E.03555
G3 X81.902 Y95.783 I-1.529 J-9.166 E.02952
M204 S10000
G1 X81.847 Y96.195 F42000
G1 F2210.87
M204 S6000
G1 X80.842 Y96.145 E.03404
G3 X79.736 Y95.894 I3.491 J-17.936 E.0384
G3 X78.819 Y95.514 I5.269 J-13.993 E.0336
G1 X77.965 Y94.983 E.03405
G3 X77.119 Y94.228 I11.769 J-14.039 E.03837
G3 X76.498 Y93.444 I23.205 J-19.035 E.03388
G3 X75.956 Y92.442 I15.799 J-9.181 E.03856
G3 X75.638 Y91.502 I9.897 J-3.875 E.03359
G1 X75.475 Y90.51 E.03405
G3 X75.486 Y89.376 I18.288 J-.381 E.03839
G3 X75.665 Y88.395 I16.435 J2.496 E.03375
G3 X76.065 Y87.324 I17.345 J5.863 E.03869
G3 X76.562 Y86.466 I7.383 J3.699 E.03358
G3 X77.305 Y85.592 I6.295 J4.601 E.03887
G1 X78.062 Y84.952 E.03357
G3 X78.913 Y84.442 I6.312 J9.583 E.03358
G1 X79.848 Y84.073 E.03405
G3 X80.959 Y83.844 I4.237 J17.778 E.03839
G3 X81.957 Y83.812 I1.099 J18.705 E.03379
G1 X82.106 Y83.829 E.00509
G1 X82.948 Y83.943 E.02875
G1 X83.087 Y83.976 E.00483
G3 X84.03 Y84.28 I-2.214 J8.487 E.03357
G1 X84.924 Y84.74 E.03404
G3 X85.828 Y85.426 I-10.603 J14.901 E.03841
G3 X86.506 Y86.151 I-8.697 J8.813 E.03359
G1 X87.064 Y86.987 E.03405
G3 X87.522 Y88.022 I-16.632 J7.969 E.03829
G3 X87.778 Y89.098 I-19.019 J5.104 E.03744
G3 X87.843 Y90.132 I-20.261 J1.797 E.03508
G3 X87.745 Y91.118 I-9.298 J-.425 E.03357
G1 X87.485 Y92.09 E.03405
G3 X87.005 Y93.118 I-16.823 J-7.22 E.0384
G3 X86.44 Y93.933 I-11.435 J-7.322 E.0336
G1 X85.74 Y94.656 E.03405
G3 X84.824 Y95.323 I-11.223 J-14.459 E.03838
G3 X83.927 Y95.765 I-11.501 J-22.226 E.03385
G3 X82.832 Y96.082 I-5.619 J-17.337 E.0386
G3 X81.907 Y96.191 I-1.615 J-9.771 E.03154
M204 S250
G1 X81.847 Y96.587 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G1 X80.798 Y96.535 E.03294
G3 X79.604 Y96.263 I3.242 J-16.992 E.03841
G3 X78.635 Y95.86 I5.575 J-14.773 E.03291
G1 X77.739 Y95.304 E.03306
G3 X76.826 Y94.489 I11.061 J-13.313 E.0384
G3 X76.172 Y93.664 I24.337 J-19.952 E.033
G3 X75.591 Y92.584 I14.937 J-8.741 E.03846
G3 X75.255 Y91.59 I10.479 J-4.089 E.03291
G1 X75.084 Y90.55 E.03306
G3 X75.097 Y89.325 I17.293 J-.427 E.03841
G3 X75.287 Y88.291 I17.337 J2.644 E.03296
G3 X75.718 Y87.142 I16.409 J5.5 E.0385
G3 X76.244 Y86.235 I7.808 J3.926 E.03291
G3 X77.043 Y85.301 I6.653 J4.879 E.03856
G1 X77.702 Y84.728 E.02739
G1 X77.845 Y84.624 E.00553
G3 X78.746 Y84.087 I6.661 J10.134 E.0329
G1 X79.726 Y83.699 E.03305
G3 X80.926 Y83.453 I4.077 J16.816 E.03841
G3 X81.977 Y83.42 I1.146 J19.679 E.03297
G1 X82.155 Y83.44 E.0056
G1 X83.02 Y83.557 E.02739
G1 X83.191 Y83.598 E.00552
G3 X84.189 Y83.921 I-2.354 J8.975 E.03291
G1 X85.127 Y84.404 E.03305
G3 X86.101 Y85.145 I-9.982 J14.131 E.03841
G3 X86.818 Y85.912 I-9.217 J9.322 E.03291
G1 X87.403 Y86.789 E.03306
G3 X87.898 Y87.908 I-15.612 J7.562 E.03837
G3 X88.169 Y89.061 I-17.062 J4.622 E.03714
G3 X88.235 Y90.154 I-17.88 J1.634 E.03433
G3 X88.13 Y91.198 I-9.828 J-.462 E.03291
G1 X87.857 Y92.216 E.03306
G3 X87.338 Y93.325 I-15.935 J-6.771 E.03841
G3 X86.74 Y94.187 I-12.084 J-7.752 E.03291
G1 X86.007 Y94.945 E.03306
G3 X85.016 Y95.666 I-10.66 J-13.613 E.03841
G3 X84.072 Y96.13 I-12.089 J-23.384 E.03299
G3 X82.893 Y96.47 I-5.373 J-16.42 E.03847
G3 X81.907 Y96.584 I-1.699 J-10.364 E.03114
; WIPE_START
M204 S6000
G1 X80.798 Y96.535 E-.21091
G1 X79.928 Y96.349 E-.16909
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2 F4000
            G39.3 S1
            G0 Z2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.446 Y90.055 F42000
G1 Z1.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G3 X84.315 Y90.897 I-3.416 J-.103 E.02679
G1 X84.04 Y91.471 E.01994
G1 X83.585 Y92.039 E.02283
G1 X83.023 Y92.453 E.02187
G1 X82.384 Y92.714 E.02166
G1 X81.7 Y92.811 E.02166
G1 X81.02 Y92.739 E.02144
G1 X80.365 Y92.5 E.02186
G1 X79.901 Y92.185 E.01759
G3 X79.314 Y91.564 I2.446 J-2.9 E.02684
G3 X78.854 Y90.271 I3.285 J-1.898 E.04329
G1 X78.868 Y89.613 E.02062
G1 X79.044 Y88.952 E.02146
G1 X79.375 Y88.354 E.02143
G1 X79.85 Y87.844 E.02185
G1 X80.431 Y87.47 E.02168
G1 X81.085 Y87.249 E.02164
G1 X81.767 Y87.194 E.02143
G1 X82.167 Y87.24 E.01265
G1 X82.78 Y87.428 E.02008
G1 X83.367 Y87.777 E.02143
G1 X83.862 Y88.269 E.02186
G1 X84.219 Y88.861 E.02167
G1 X84.419 Y89.522 E.02167
G1 X84.443 Y89.995 E.01486
M204 S10000
G1 X84.823 Y90.04 F42000
G1 F2386.825
M204 S6000
G1 X84.818 Y90.334 E.00923
G1 X84.686 Y90.966 E.02022
G1 X84.379 Y91.636 E.02311
G1 X83.874 Y92.282 E.02572
G1 X83.245 Y92.758 E.02474
G1 X82.523 Y93.064 E.02457
G1 X81.75 Y93.185 E.02454
G3 X80.843 Y93.082 I.219 J-5.968 E.02864
G1 X80.233 Y92.853 E.02042
M73 P58 R6
G3 X79.476 Y92.328 I2.526 J-4.451 E.02894
G1 X79.052 Y91.843 E.02021
G3 X78.634 Y91.023 I4.383 J-2.751 E.0289
G1 X78.491 Y90.401 E.01999
G1 X78.49 Y89.636 E.024
G1 X78.68 Y88.852 E.0253
G1 X79.046 Y88.168 E.0243
G1 X79.576 Y87.585 E.02472
G1 X80.23 Y87.151 E.02459
G3 X81.104 Y86.864 I2.287 J5.488 E.02887
G1 X81.74 Y86.818 E.01999
G1 X82.271 Y86.878 E.01678
G1 X82.89 Y87.068 E.0203
G3 X84.138 Y88.011 I-1.696 J3.54 E.04937
G3 X84.599 Y88.797 I-5.014 J3.468 E.02858
G1 X84.781 Y89.415 E.02022
G1 X84.819 Y89.98 E.01775
M204 S10000
G1 X85.276 Y90.022 F42000
; LINE_WIDTH: 0.566291
G1 F1719.624
M204 S6000
G3 X85.112 Y91.104 I-4.018 J-.056 E.04777
G1 X84.785 Y91.833 E.03478
G3 X83.509 Y93.123 I-3.385 J-2.072 E.07966
G3 X82.449 Y93.545 I-2.303 J-4.242 E.04979
G1 X81.809 Y93.63 E.02806
G3 X80.076 Y93.273 I-.058 J-4.113 E.07763
G1 X79.428 Y92.866 E.03329
G3 X78.685 Y92.102 I2.631 J-3.301 E.04651
G1 X78.338 Y91.477 E.03113
G1 X78.198 Y91.123 E.01657
G1 X78.055 Y90.501 E.02775
G1 X78.028 Y90.253 E.01087
G1 X78.039 Y89.626 E.02728
G3 X78.654 Y87.947 I3.958 J.498 E.07848
G3 X79.445 Y87.116 I3.885 J2.901 E.05003
G1 X79.99 Y86.772 E.02807
G1 X80.612 Y86.53 E.02903
G1 X81.072 Y86.417 E.0206
G1 X81.708 Y86.371 E.02775
G1 X82.216 Y86.414 E.02221
G1 X83 Y86.63 E.03537
G1 X83.582 Y86.937 E.02865
G1 X84.031 Y87.262 E.02411
G1 X84.449 Y87.687 E.02595
G1 X84.825 Y88.254 E.02963
G1 X85.028 Y88.67 E.02014
G1 X85.21 Y89.289 E.02807
G1 X85.27 Y89.962 E.02941
M204 S10000
G1 X85.795 Y90.19 F42000
; LINE_WIDTH: 0.566234
G1 F1719.809
M204 S6000
G2 X85.762 Y89.389 I-9.247 J-.02 E.0349
G1 X85.586 Y88.677 E.03188
G1 X85.388 Y88.206 E.02227
G1 X85.039 Y87.611 E.02998
G2 X83.878 Y86.498 I-3.721 J2.717 E.07038
G2 X82.542 Y85.941 I-2.439 J3.975 E.0632
G1 X81.95 Y85.865 E.02597
G1 X81.197 Y85.873 E.03279
G1 X80.695 Y85.967 E.02221
G1 X80.04 Y86.18 E.02997
G2 X79.204 Y86.645 I1.486 J3.66 E.04172
G1 X78.633 Y87.155 E.03331
G1 X78.241 Y87.625 E.02663
G1 X77.906 Y88.202 E.02905
G1 X77.644 Y88.912 E.03291
G1 X77.522 Y89.543 E.02799
G1 X77.506 Y90.245 E.03055
G1 X77.619 Y90.995 E.03298
G1 X77.806 Y91.559 E.02588
G2 X78.639 Y92.861 I4.32 J-1.848 E.06753
G1 X79.101 Y93.279 E.02714
G2 X81.599 Y94.15 I2.593 J-3.418 E.11704
G1 X82.493 Y94.069 E.03906
G1 X83.224 Y93.841 E.03332
G1 X83.773 Y93.574 E.02655
G1 X84.317 Y93.186 E.02906
G1 X84.855 Y92.64 E.03337
G1 X85.213 Y92.136 E.02691
G1 X85.514 Y91.516 E.02996
G1 X85.743 Y90.696 E.03708
G1 X85.789 Y90.249 E.01952
M204 S10000
G1 X86.26 Y90.015 F42000
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X86.21 Y89.355 E.02076
G1 X86.026 Y88.569 E.0253
G2 X85.255 Y87.129 I-5.067 J1.787 E.05139
G1 X84.693 Y86.539 E.02555
G1 X84.098 Y86.097 E.02325
G1 X83.343 Y85.716 E.02651
G1 X82.636 Y85.499 E.0232
G1 X81.8 Y85.398 E.02639
G1 X81.12 Y85.423 E.02135
G1 X80.323 Y85.588 E.02552
G1 X79.604 Y85.872 E.02423
G1 X78.913 Y86.294 E.02541
G1 X78.289 Y86.855 E.02628
G1 X77.855 Y87.385 E.02149
G1 X77.485 Y88.03 E.02332
G1 X77.197 Y88.814 E.02618
G1 X77.063 Y89.553 E.02357
G1 X77.056 Y90.367 E.02552
G1 X77.182 Y91.13 E.02423
G1 X77.448 Y91.895 E.0254
G1 X77.864 Y92.622 E.02628
G1 X78.291 Y93.158 E.02147
G1 X78.844 Y93.656 E.02332
G1 X79.558 Y94.108 E.02649
G1 X80.244 Y94.391 E.02327
G1 X81.038 Y94.57 E.02553
G1 X81.81 Y94.608 E.02422
G1 X82.614 Y94.509 E.0254
G1 X83.414 Y94.256 E.0263
G1 X84.026 Y93.952 E.02143
G1 X84.629 Y93.517 E.02332
G1 X85.222 Y92.914 E.02651
G1 X85.643 Y92.304 E.02325
G1 X85.985 Y91.567 E.02544
G1 X86.196 Y90.751 E.02644
G1 X86.255 Y90.075 E.02128
M204 S10000
G1 X86.638 Y90.017 F42000
G1 F2386.825
M204 S6000
G1 X86.586 Y89.326 E.02172
G1 X86.392 Y88.479 E.02726
G2 X85.964 Y87.511 I-7.963 J2.946 E.03319
G1 X85.551 Y86.893 E.02332
G1 X84.944 Y86.256 E.02757
G1 X84.297 Y85.775 E.02528
G1 X83.485 Y85.365 E.02853
G1 X82.715 Y85.129 E.02526
G1 X81.816 Y85.02 E.02837
G1 X81.075 Y85.047 E.02327
G1 X80.215 Y85.225 E.02754
G1 X79.435 Y85.533 E.02627
G1 X78.686 Y85.99 E.02752
G1 X78.016 Y86.593 E.02827
G1 X77.544 Y87.17 E.02337
G1 X77.142 Y87.87 E.02529
G1 X76.832 Y88.714 E.0282
G1 X76.686 Y89.518 E.02561
G1 X76.679 Y90.397 E.02755
G1 X76.815 Y91.223 E.02627
G1 X77.104 Y92.052 E.02751
G1 X77.551 Y92.835 E.02827
G1 X78.016 Y93.417 E.02335
G1 X78.615 Y93.957 E.02529
G1 X79.384 Y94.444 E.02852
G1 X80.129 Y94.751 E.0253
G1 X80.987 Y94.945 E.02756
G1 X81.824 Y94.986 E.02626
G1 X82.694 Y94.879 E.02751
G1 X83.555 Y94.606 E.0283
G1 X84.221 Y94.276 E.02331
G1 X84.876 Y93.804 E.0253
G1 X85.514 Y93.155 E.02854
G1 X85.972 Y92.491 E.02528
G1 X86.341 Y91.695 E.02752
G1 X86.569 Y90.815 E.02851
G1 X86.633 Y90.077 E.02323
; WIPE_START
G1 X86.569 Y90.815 E-.1408
G1 X86.341 Y91.695 E-.17276
G1 X86.194 Y92.012 E-.06644
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X93.631 Y90.297 Z2 F42000
G1 X105.478 Y87.563 Z2
G1 Z1.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G3 X105.346 Y84.62 I-.149 J-1.468 E.16249
G1 X105.686 Y84.664 E.0116
G3 X105.537 Y87.556 I-.356 J1.432 E.13766
M204 S10000
G1 X105.521 Y87.975 F42000
G1 F2210.87
M204 S6000
G1 X105.09 Y87.97 E.01457
G1 X104.665 Y87.865 E.01482
G1 X104.276 Y87.664 E.01483
G1 X103.944 Y87.379 E.01482
G1 X103.689 Y87.028 E.01469
G1 X103.517 Y86.62 E.01496
G1 X103.446 Y86.185 E.01492
G1 X103.477 Y85.744 E.01496
G1 X103.606 Y85.33 E.01469
G1 X103.829 Y84.953 E.01482
G1 X104.133 Y84.638 E.01482
G1 X104.502 Y84.401 E.01483
G1 X104.915 Y84.256 E.01482
G1 X105.35 Y84.21 E.01482
G1 X105.785 Y84.266 E.01482
G1 X106.198 Y84.422 E.01494
G1 X106.564 Y84.669 E.01496
G1 X106.858 Y84.988 E.01469
G1 X107.073 Y85.37 E.01482
G1 X107.194 Y85.791 E.01482
G1 X107.214 Y86.228 E.01482
G1 X107.135 Y86.651 E.01457
G1 X106.955 Y87.059 E.01509
G1 X106.69 Y87.407 E.01479
G1 X106.349 Y87.687 E.01494
G1 X105.952 Y87.879 E.01493
G1 X105.579 Y87.962 E.01294
M204 S10000
G1 X105.558 Y88.383 F42000
G1 F2210.87
M204 S6000
G1 X105.023 Y88.373 E.01812
G3 X104.521 Y88.247 I.894 J-4.622 E.01751
G3 X104.028 Y87.987 I6.026 J-12.036 E.01887
G1 X103.646 Y87.659 E.01706
G3 X103.332 Y87.229 I7.666 J-5.925 E.01803
G1 X103.124 Y86.734 E.01818
G1 X103.036 Y86.204 E.01817
G1 X103.074 Y85.668 E.01818
G3 X103.234 Y85.16 I9.365 J2.656 E.01804
G3 X103.514 Y84.693 I2.71 J1.312 E.01846
G3 X103.874 Y84.322 I3.575 J3.104 E.01751
G3 X104.346 Y84.025 I7.418 J11.25 E.01887
G1 X104.821 Y83.858 E.01706
G3 X105.388 Y83.805 I1.159 J9.337 E.01928
G1 X105.883 Y83.868 E.0169
G1 X106.386 Y84.058 E.01818
G1 X106.831 Y84.358 E.01818
G3 X107.192 Y84.751 I-6.914 J6.719 E.01804
G3 X107.455 Y85.227 I-2.492 J1.691 E.01845
G3 X107.597 Y85.724 I-4.393 J1.52 E.01752
G3 X107.619 Y86.281 I-13.549 J.804 E.01886
G1 X107.526 Y86.772 E.01693
G1 X107.309 Y87.266 E.01825
G3 X106.985 Y87.691 I-15.981 J-11.818 E.0181
G1 X106.57 Y88.032 E.01817
G1 X106.087 Y88.266 E.01817
G1 X105.617 Y88.371 E.01631
M204 S250
G1 X105.555 Y88.771 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G1 X104.995 Y88.756 E.01755
G3 X104.332 Y88.592 I.387 J-2.99 E.02146
G3 X103.823 Y88.325 I1.696 J-3.852 E.01803
G3 X103.311 Y87.868 I5.289 J-6.432 E.02154
G3 X102.98 Y87.403 I2.245 J-1.955 E.01791
G1 X102.74 Y86.82 E.01978
G1 X102.646 Y86.245 E.01825
G1 X102.685 Y85.616 E.01978
G3 X104.155 Y83.679 I2.731 J.546 E.07891
G3 X104.808 Y83.464 I2.929 J7.804 E.02154
G3 X105.377 Y83.409 I.572 J2.934 E.01796
G1 X105.436 Y83.416 E.00185
G1 X106.001 Y83.493 E.01789
G1 X106.545 Y83.699 E.01825
G1 X107.071 Y84.047 E.01978
G3 X108.014 Y86.289 I-1.838 J2.092 E.07891
G3 X107.896 Y86.906 I-15.15 J-2.571 E.01967
G1 X107.661 Y87.438 E.01824
G3 X107.251 Y87.98 I-7.688 J-5.39 E.02132
G1 X106.801 Y88.349 E.01825
G1 X106.236 Y88.63 E.01978
G1 X105.621 Y88.771 E.01979
G1 X105.615 Y88.771 E.0002
; WIPE_START
M204 S6000
G1 X104.995 Y88.756 E-.11773
G1 X104.332 Y88.592 E-.12977
G1 X103.823 Y88.325 E-.10919
G1 X103.73 Y88.246 E-.02331
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X104.342 Y86.519 Z2 F42000
G1 Z1.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X104.535 Y86.833 E.01158
G1 X104.838 Y87.054 E.01176
G1 X105.193 Y87.172 E.01171
G1 X105.564 Y87.147 E.01168
G1 X105.915 Y87.009 E.01182
G1 X106.186 Y86.75 E.01176
G1 X106.366 Y86.413 E.01198
G1 X106.406 Y86.046 E.01157
G1 X106.331 Y85.68 E.01171
G1 X106.123 Y85.37 E.0117
G1 X105.828 Y85.136 E.0118
G1 X105.466 Y85.031 E.01183
G1 X105.092 Y85.041 E.01173
G1 X104.749 Y85.192 E.01174
G1 X104.469 Y85.441 E.01173
G1 X104.304 Y85.776 E.0117
G1 X104.25 Y86.148 E.0118
G1 X104.327 Y86.46 E.01009
M204 S10000
G1 X104.629 Y86.13 F42000
G1 F2386.825
M204 S6000
G1 X104.72 Y86.446 E.0103
G1 X104.938 Y86.682 E.01006
G1 X105.241 Y86.796 E.01015
G1 X105.563 Y86.761 E.01015
G1 X105.838 Y86.584 E.01026
G1 X106.004 Y86.301 E.0103
G2 X105.98 Y85.827 I-.755 J-.2 E.01512
G1 X105.792 Y85.567 E.01006
G1 X105.499 Y85.415 E.01035
G1 X105.175 Y85.412 E.01014
G1 X104.884 Y85.554 E.01015
G1 X104.688 Y85.811 E.01015
G1 X104.64 Y86.071 E.0083
M204 S10000
G1 X105.098 Y86.201 F42000
; LINE_WIDTH: 0.55224
G1 F1767.062
M204 S6000
G1 X105.214 Y86.326 E.00723
G1 X105.387 Y86.346 E.00735
G1 X105.534 Y86.253 E.00737
G1 X105.586 Y86.085 E.00746
G1 X105.52 Y85.926 E.00727
G1 X105.361 Y85.844 E.00757
G1 X105.192 Y85.883 E.00735
G1 X105.087 Y86.02 E.0073
G1 X105.094 Y86.141 E.00515
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F1767.062
G1 X105.087 Y86.02 E-.03056
G1 X105.192 Y85.883 E-.0433
G1 X105.361 Y85.844 E-.04359
G1 X105.52 Y85.926 E-.04489
G1 X105.586 Y86.085 E-.04316
G1 X105.534 Y86.253 E-.04425
G1 X105.387 Y86.346 E-.04375
G1 X105.214 Y86.326 E-.04359
G1 X105.098 Y86.201 E-.0429
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 9/65
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z2 I-.313 J-1.176 P1  F42000
G1 X81.743 Y92.415 Z2
G1 Z1.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G1 X81.673 Y92.417 E.00237
G3 X81.479 Y87.589 I-.028 J-2.417 E.25239
G1 X81.765 Y87.586 E.00969
G3 X81.97 Y92.396 I-.12 J2.414 E.24195
G1 X81.803 Y92.41 E.00567
M204 S10000
G1 X81.714 Y92.009 F42000
G1 F2210.87
M204 S6000
G1 X81.669 Y92.01 E.00152
G3 X81.508 Y87.995 I-.024 J-2.01 E.20985
G1 X81.745 Y87.993 E.00804
G3 X81.916 Y91.992 I-.1 J2.007 E.20115
G1 X81.774 Y92.004 E.00482
M204 S10000
G1 X81.685 Y91.603 F42000
G1 F2210.87
M204 S6000
G1 X81.665 Y91.602 E.00067
G3 X81.537 Y88.402 I-.019 J-1.602 E.1673
G1 X81.725 Y88.401 E.00639
G3 X81.862 Y91.588 I-.079 J1.6 E.16034
G1 X81.745 Y91.598 E.00398
M204 S250
G1 X81.662 Y91.203 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G3 X81.565 Y88.794 I-.015 J-1.206 E.11665
G1 X81.706 Y88.793 E.00444
G3 X81.722 Y91.2 I-.06 J1.204 E.11455
; WIPE_START
M204 S6000
G1 X81.513 Y91.204 E-.03964
G1 X81.224 Y91.134 E-.05639
G1 X81.088 Y91.073 E-.02841
G1 X80.843 Y90.904 E-.05655
G1 X80.648 Y90.68 E-.05639
G1 X80.572 Y90.551 E-.02846
G1 X80.513 Y90.414 E-.02831
G1 X80.446 Y90.124 E-.05652
G1 X80.44 Y89.975 E-.02844
G1 X80.441 Y89.97 E-.00088
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X81.781 Y95.181 Z2.2 F42000
G1 Z1.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G1 X80.999 Y95.141 E.02652
G3 X76.617 Y91.228 I.683 J-5.175 E.21119
G1 X76.49 Y90.455 E.02652
G3 X79.383 Y85.343 I5.202 J-.43 E.21119
G1 X80.112 Y85.054 E.02652
G3 X82.234 Y84.864 I1.523 J5.046 E.07262
G3 X84.375 Y85.595 I-.596 J5.245 E.07719
G3 X86.579 Y88.407 I-2.794 J4.459 E.12338
G1 X86.762 Y89.159 E.02619
G1 X86.83 Y89.929 E.02619
G3 X86.739 Y90.973 I-7.384 J-.117 E.03548
G1 X86.535 Y91.729 E.02652
G3 X81.841 Y95.178 I-4.902 J-1.752 E.20924
M204 S10000
G1 X81.785 Y95.588 F42000
G1 F2210.87
M204 S6000
G1 X80.953 Y95.546 E.02822
G3 X76.219 Y91.319 I.732 J-5.583 E.22819
G1 X76.084 Y90.497 E.02822
G3 X79.21 Y84.974 I5.612 J-.47 E.22819
G1 X79.985 Y84.667 E.02822
G3 X82.284 Y84.46 I1.649 J5.446 E.07868
G3 X83.845 Y84.862 I-.683 J5.882 E.05475
G1 X84.586 Y85.246 E.02823
G3 X86.969 Y88.289 I-3.012 J4.814 E.13352
G1 X87.165 Y89.092 E.02798
G1 X87.237 Y89.916 E.02798
G3 X87.139 Y91.055 I-7.879 J-.11 E.03875
G1 X86.921 Y91.86 E.02822
G3 X81.845 Y95.586 I-5.292 J-1.889 E.22623
M204 S10000
G1 X81.828 Y95.992 F42000
G1 F2210.87
M204 S6000
G1 X81.79 Y95.996 E.00129
G1 X80.907 Y95.952 E.02992
G3 X75.822 Y91.41 I.781 J-5.992 E.24518
G1 X75.678 Y90.538 E.02992
G3 X79.036 Y84.605 I6.021 J-.509 E.24518
G1 X79.858 Y84.279 E.02992
G3 X82.334 Y84.056 I1.776 J5.845 E.08474
G3 X84.011 Y84.49 I-.742 J6.325 E.05883
G1 X84.796 Y84.896 E.02993
G3 X85.781 Y85.658 I-4.624 J6.997 E.04219
G3 X87.36 Y88.171 I-4.285 J4.443 E.10144
G3 X87.567 Y89.026 I-30.048 J7.758 E.02978
G3 X87.645 Y89.902 I-30.436 J3.136 E.02978
G3 X87.538 Y91.138 I-8.378 J-.103 E.04203
G1 X87.307 Y91.992 E.02992
G3 X86.269 Y93.827 I-5.963 J-2.163 E.0717
G1 X85.655 Y94.464 E.02993
G3 X82.654 Y95.906 I-4.069 J-4.623 E.11414
G1 X81.887 Y95.986 E.02609
M204 S250
G1 X81.866 Y96.382 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G1 X81.794 Y96.389 E.00229
M73 P59 R6
G1 X80.862 Y96.342 E.02923
G3 X75.439 Y91.498 I.828 J-6.385 E.24228
G1 X75.287 Y90.578 E.02924
G3 X78.869 Y84.249 I6.415 J-.547 E.24228
G1 X79.736 Y83.906 E.02923
G3 X82.382 Y83.667 I1.883 J6.066 E.08394
G3 X84.171 Y84.131 I-.798 J6.753 E.05812
G1 X84.999 Y84.56 E.02923
G3 X86.055 Y85.377 I-4.879 J7.397 E.0419
G3 X87.735 Y88.058 I-4.573 J4.733 E.10018
G3 X87.955 Y88.962 I-32.174 J8.288 E.02919
G3 X88.037 Y89.889 I-33.007 J3.401 E.02919
G3 X87.922 Y91.218 I-8.858 J-.097 E.04185
G1 X87.679 Y92.118 E.02923
G3 X87.105 Y93.323 I-8.27 J-3.196 E.0419
G3 X85.922 Y94.752 I-5.978 J-3.747 E.05834
G3 X82.715 Y96.294 I-4.339 J-4.921 E.11296
G1 X81.926 Y96.375 E.02488
; WIPE_START
M204 S6000
G1 X81.794 Y96.389 E-.0253
G1 X80.862 Y96.342 E-.17715
G1 X79.953 Y96.158 E-.17622
G1 X79.947 Y96.156 E-.00133
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.2
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.2 F4000
            G39.3 S1
            G0 Z2.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X84.453 Y90.211 F42000
G1 Z1.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X84.317 Y90.889 E.02166
G1 X84.02 Y91.512 E.02165
G1 X83.58 Y92.044 E.02165
G3 X82.384 Y92.714 I-2.319 J-2.739 E.04324
G1 X81.7 Y92.811 E.02166
G1 X81.025 Y92.74 E.02128
G1 X80.366 Y92.5 E.02199
G1 X79.794 Y92.111 E.02168
G1 X79.338 Y91.599 E.02149
G1 X79.017 Y90.982 E.02182
G3 X78.855 Y90.299 I8.705 J-2.423 E.02202
G1 X78.869 Y89.608 E.02167
G1 X79.044 Y88.952 E.02128
G1 X79.372 Y88.358 E.02128
G1 X79.85 Y87.844 E.022
G1 X80.431 Y87.47 E.02168
G1 X81.085 Y87.249 E.02164
G1 X81.762 Y87.194 E.02127
G1 X82.159 Y87.237 E.01252
G1 X82.78 Y87.428 E.02037
G1 X83.373 Y87.782 E.02165
G1 X83.863 Y88.269 E.02165
G1 X84.221 Y88.865 E.02181
G1 X84.419 Y89.522 E.02151
G1 X84.45 Y90.151 E.01976
M204 S10000
G1 X84.82 Y89.975 F42000
G1 F2386.825
M204 S6000
G1 X84.815 Y90.349 E.01173
G1 X84.686 Y90.966 E.01975
G3 X84.283 Y91.794 I-5.453 J-2.14 E.02889
G1 X83.868 Y92.287 E.02021
G3 X83.122 Y92.826 I-3.622 J-4.23 E.02888
G1 X82.523 Y93.064 E.02022
G1 X81.75 Y93.185 E.02455
G3 X80.848 Y93.083 I.224 J-6.02 E.02847
G1 X80.225 Y92.85 E.02085
G3 X79.476 Y92.329 I3.23 J-5.437 E.02864
G1 X79.055 Y91.848 E.02005
G3 X78.634 Y91.022 I5.11 J-3.128 E.02908
G3 X78.483 Y90.36 I10.716 J-2.782 E.0213
G3 X78.512 Y89.462 I6.823 J-.23 E.02819
G1 X78.68 Y88.852 E.01985
G1 X79.043 Y88.173 E.02414
G1 X79.576 Y87.585 E.02487
G1 X80.23 Y87.151 E.02461
G3 X81.103 Y86.864 I2.344 J5.658 E.02886
G1 X81.744 Y86.818 E.02014
G1 X82.246 Y86.87 E.01583
G3 X83.569 Y87.459 I-.806 J3.59 E.04569
G1 X84.131 Y88.004 E.02454
G3 X84.601 Y88.802 I-5.029 J3.501 E.02907
G1 X84.784 Y89.425 E.02036
G1 X84.816 Y89.915 E.01542
M204 S10000
G1 X85.224 Y89.959 F42000
; LINE_WIDTH: 0.464371
G1 F2135.481
M204 S6000
G1 X85.206 Y90.431 E.01656
G1 X85.073 Y91.047 E.02208
G1 X84.814 Y91.662 E.0234
G1 X84.586 Y92.048 E.01571
G1 X84.173 Y92.543 E.02259
G1 X83.621 Y92.983 E.02473
G3 X82.671 Y93.434 I-2.112 J-3.226 E.03699
G1 X81.802 Y93.579 E.03085
G3 X80.095 Y93.226 I-.089 J-3.873 E.06163
G3 X78.755 Y92.11 I1.885 J-3.626 E.06158
G1 X78.426 Y91.541 E.02305
G1 X78.248 Y91.111 E.01631
G3 X78.091 Y90.425 I7.645 J-2.114 E.02467
G3 X78.296 Y88.746 I4.172 J-.341 E.05968
G1 X78.697 Y87.977 E.03036
G3 X80.017 Y86.815 I3.188 J2.29 E.06219
G3 X81.075 Y86.465 I1.931 J4.07 E.03912
G1 X81.706 Y86.422 E.02217
G1 X82.207 Y86.46 E.0176
G1 X82.847 Y86.634 E.02326
G1 X83.222 Y86.788 E.0142
G1 X83.775 Y87.119 E.02259
G1 X84.414 Y87.724 E.03084
G3 X84.984 Y88.689 I-3.553 J2.752 E.03939
G1 X85.162 Y89.304 E.02243
G1 X85.218 Y89.899 E.02095
M204 S10000
G1 X85.653 Y89.964 F42000
; LINE_WIDTH: 0.465477
G1 F2129.892
M204 S6000
G1 X85.616 Y89.454 E.01798
G1 X85.39 Y88.574 E.03191
G2 X84.819 Y87.548 I-3.901 J1.499 E.04139
G1 X84.263 Y86.97 E.02818
G1 X83.786 Y86.617 E.02085
G2 X82.483 Y86.083 I-2.552 J4.375 E.04965
G1 X81.928 Y86.006 E.01969
G1 X81.048 Y86.044 E.03094
G2 X79.925 Y86.385 I.642 J4.136 E.04135
G1 X79.248 Y86.801 E.02794
G2 X78.401 Y87.656 I2.474 J3.296 E.04243
G1 X78.02 Y88.322 E.02696
G1 X77.795 Y88.925 E.02262
G1 X77.684 Y89.551 E.02231
G1 X77.655 Y90.242 E.0243
G1 X77.755 Y90.918 E.02402
G1 X77.948 Y91.497 E.02145
G1 X78.251 Y92.113 E.02411
G1 X78.672 Y92.675 E.02466
G2 X80.558 Y93.853 I3.182 J-2.997 E.079
G2 X81.72 Y94.008 I1.13 J-4.027 E.04134
G1 X82.496 Y93.912 E.02747
G1 X83.117 Y93.727 E.02275
G1 X83.574 Y93.505 E.01787
G1 X84.252 Y93.044 E.0288
G1 X84.716 Y92.574 E.02319
G1 X85.074 Y92.056 E.02215
G1 X85.382 Y91.449 E.02391
G1 X85.618 Y90.523 E.03359
G1 X85.65 Y90.024 E.01756
M204 S10000
G1 X86.056 Y89.99 F42000
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G2 X85.756 Y88.401 I-5.565 J.227 E.05088
G1 X85.487 Y87.828 E.01983
G1 X85.12 Y87.281 E.02068
G1 X84.485 Y86.625 E.0286
G1 X83.977 Y86.257 E.01966
G1 X83.129 Y85.851 E.0295
G1 X82.523 Y85.679 E.01974
G1 X81.881 Y85.598 E.02028
G1 X80.958 Y85.649 E.02899
G1 X80.341 Y85.791 E.01985
G1 X79.728 Y86.034 E.02068
G1 X78.954 Y86.514 E.02857
G1 X78.474 Y86.943 E.02017
G1 X78.06 Y87.443 E.02037
G1 X77.61 Y88.236 E.02858
G1 X77.396 Y88.844 E.02019
G1 X77.25 Y89.753 E.02889
G1 X77.258 Y90.387 E.01988
G1 X77.365 Y91.038 E.02068
G1 X77.67 Y91.896 E.02854
G1 X77.988 Y92.458 E.02024
G1 X78.388 Y92.967 E.02029
G1 X79.068 Y93.575 E.0286
G1 X79.617 Y93.914 E.02026
G1 X80.473 Y94.249 E.02882
G1 X81.095 Y94.376 E.0199
G1 X81.754 Y94.409 E.02068
G1 X82.657 Y94.294 E.02853
G1 X83.278 Y94.1 E.0204
G2 X84.586 Y93.292 I-2.388 J-5.325 E.04835
G1 X85.045 Y92.814 E.02077
G1 X85.551 Y92.054 E.02863
G1 X85.804 Y91.481 E.01963
G1 X86.019 Y90.564 E.02952
G1 X86.052 Y90.05 E.01618
M204 S10000
G1 X86.432 Y90.014 F42000
G1 F2386.825
M204 S6000
G2 X86.111 Y88.269 I-6.042 J.21 E.05581
G1 X85.816 Y87.642 E.02174
G1 X85.414 Y87.043 E.02263
G1 X84.733 Y86.339 E.03069
G1 X84.171 Y85.931 E.02177
G1 X83.262 Y85.497 E.03158
G1 X82.599 Y85.309 E.02163
G1 X81.895 Y85.22 E.02224
G1 X80.905 Y85.274 E.03108
G1 X80.229 Y85.43 E.02176
G1 X79.558 Y85.696 E.02263
G1 X78.727 Y86.211 E.03066
G1 X78.201 Y86.68 E.02209
G1 X77.748 Y87.228 E.0223
G1 X77.266 Y88.08 E.03067
G1 X77.029 Y88.75 E.0223
G1 X76.872 Y89.726 E.03097
G1 X76.881 Y90.421 E.02179
G1 X76.999 Y91.133 E.02263
G1 X77.325 Y92.053 E.03063
G1 X77.674 Y92.668 E.02216
G1 X78.112 Y93.226 E.02222
G1 X78.841 Y93.878 E.03068
G1 X79.448 Y94.253 E.02237
G1 X80.366 Y94.612 E.03091
G1 X81.048 Y94.751 E.02181
G1 X81.769 Y94.787 E.02262
G1 X82.737 Y94.664 E.03062
G1 X83.415 Y94.452 E.02226
G2 X84.838 Y93.574 I-2.632 J-5.853 E.05258
G1 X85.341 Y93.051 E.02273
G1 X85.883 Y92.236 E.03072
G1 X86.163 Y91.601 E.02174
G1 X86.394 Y90.62 E.0316
G1 X86.429 Y90.074 E.01717
; WIPE_START
G1 X86.394 Y90.62 E-.10404
G1 X86.163 Y91.601 E-.1915
G1 X85.984 Y92.008 E-.08446
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X93.408 Y90.24 Z2.2 F42000
G1 X105.462 Y87.37 Z2.2
G1 Z1.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G3 X104.492 Y85.132 I-.136 J-1.271 E.10969
G3 X105.407 Y84.824 I.855 J1.027 E.03344
G3 X105.522 Y87.362 I-.08 J1.275 E.12652
M204 S10000
G1 X105.457 Y87.773 F42000
G1 F2210.87
M204 S6000
G3 X103.942 Y85.144 I-.13 J-1.676 E.12808
G3 X105.456 Y84.42 I1.385 J.95 E.05949
G3 X105.517 Y87.767 I-.128 J1.677 E.16803
M204 S10000
G1 X105.525 Y88.18 F42000
G1 F2210.87
M204 S6000
G1 X105.47 Y88.188 E.00188
G3 X103.369 Y85.375 I-.139 J-2.087 E.14101
G3 X105.504 Y84.016 I1.964 J.729 E.09197
G3 X105.687 Y88.162 I-.173 J2.085 E.20448
G1 X105.585 Y88.173 E.00347
M204 S250
G1 X105.578 Y88.567 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G1 X105.482 Y88.584 E.00306
G3 X102.843 Y86.138 I-.153 J-2.481 E.12613
G3 X105.552 Y83.627 I2.492 J-.029 E.13045
G3 X105.768 Y88.549 I-.223 J2.476 E.22401
G1 X105.638 Y88.561 E.0041
; WIPE_START
M204 S6000
G1 X105.482 Y88.584 E-.0299
G1 X105.029 Y88.569 E-.08605
G1 X104.453 Y88.428 E-.11269
G1 X104.049 Y88.228 E-.08572
G1 X103.813 Y88.064 E-.05456
G1 X103.77 Y88.025 E-.01108
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.368 Y86.033 Z2.2 F42000
G1 Z1.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.63722
G1 F1514.387
M204 S6000
G2 X105.375 Y86.15 I-.034 J.06 E.01465
M204 S10000
G1 X104.831 Y86.159 F42000
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X104.926 Y86.398 E.00805
G1 X105.109 Y86.55 E.00745
G1 X105.313 Y86.596 E.00658
G1 X105.625 Y86.507 E.01017
G1 X105.789 Y86.307 E.00812
G1 X105.833 Y86.051 E.00812
G1 X105.729 Y85.797 E.00859
G1 X105.45 Y85.605 E.01063
G1 X105.208 Y85.606 E.00758
G1 X105.018 Y85.7 E.00665
G1 X104.866 Y85.949 E.00913
G1 X104.841 Y86.1 E.0048
M204 S10000
G1 X104.48 Y86.344 F42000
G1 F2386.825
M204 S6000
G1 X104.68 Y86.7 E.01281
G1 X105.018 Y86.927 E.01277
G1 X105.321 Y86.973 E.0096
G2 X105.815 Y86.839 I-.181 J-1.641 E.01612
G1 X106.097 Y86.545 E.01275
G1 X106.215 Y86.158 E.01268
G2 X106.021 Y85.55 I-1.005 J-.015 E.02038
G1 X105.73 Y85.308 E.01186
G1 X105.338 Y85.211 E.01268
G1 X104.942 Y85.301 E.01273
G1 X104.703 Y85.486 E.00946
G2 X104.461 Y85.935 I1.303 J.994 E.01608
G1 X104.477 Y86.284 E.01095
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2386.825
G1 X104.461 Y85.935 E-.06638
G1 X104.552 Y85.723 E-.04387
G1 X104.703 Y85.486 E-.05346
M73 P60 R6
G1 X104.942 Y85.301 E-.05731
G1 X105.338 Y85.211 E-.07712
G1 X105.73 Y85.308 E-.07682
G1 X105.751 Y85.325 E-.00504
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 10/65
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z2.2 I-.289 J-1.182 P1  F42000
G1 X81.663 Y91.21 Z2.2
G1 Z2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G3 X81.564 Y88.794 I-.017 J-1.209 E.11713
G1 X81.703 Y88.793 E.00436
G3 X81.722 Y91.208 I-.058 J1.208 E.11488
; WIPE_START
M204 S6000
G1 X81.513 Y91.204 E-.0398
G1 X81.224 Y91.134 E-.05652
G1 X80.96 Y90.996 E-.05654
G1 X80.843 Y90.904 E-.02831
G1 X80.647 Y90.679 E-.05669
G1 X80.568 Y90.542 E-.03007
G1 X80.471 Y90.272 E-.05459
G1 X80.446 Y90.124 E-.02832
G1 X80.44 Y89.975 E-.02849
G1 X80.441 Y89.971 E-.00067
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X81.878 Y96.179 Z2.4 F42000
G1 Z2
G1 E.4 F1800
G1 F2386.764
M204 S5000
G1 X81.736 Y96.19 E.00448
G1 X80.927 Y96.148 E.02542
G3 X78.992 Y84.412 I.732 J-6.148 E.50047
G1 X79.745 Y84.113 E.02541
G3 X82.61 Y83.893 I1.9 J5.999 E.09089
G1 X82.773 Y83.915 E.00515
G3 X82.539 Y96.126 I-1.126 J6.086 E.54612
G1 X81.938 Y96.174 E.01889
; WIPE_START
M204 S6000
G1 X81.736 Y96.19 E-.03853
G1 X80.927 Y96.148 E-.15402
G1 X80.134 Y96.001 E-.15312
G1 X79.962 Y95.948 E-.03433
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.4
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.4 F4000
            G39.3 S1
            G0 Z2.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X86.924 Y92.809 F42000
G1 Z2
G1 E.4 F1800
; FEATURE: Top surface
G1 F2386.764
M204 S2000
G1 X84.453 Y95.28 E.10956
G1 X83.532 Y95.668
G1 X87.327 Y91.873 E.16826
G1 X87.518 Y91.148
G1 X82.805 Y95.861 E.20898
G1 X82.183 Y95.95
G1 X87.606 Y90.527 E.24047
G1 X87.625 Y89.975
G1 X81.623 Y95.977 E.26611
G1 X81.116 Y95.951
G1 X87.598 Y89.469 E.28739
G1 X87.544 Y88.99
G1 X80.646 Y95.888 E.30588
G1 X80.198 Y95.802
G1 X87.444 Y88.556 E.32132
G1 X87.328 Y88.139
G1 X79.789 Y95.678 E.33427
G1 X79.398 Y95.536
G1 X87.186 Y87.748 E.34532
G1 X87.018 Y87.382
G1 X79.03 Y95.37 E.35421
G1 X78.684 Y95.183
G1 X86.838 Y87.029 E.36158
G1 X86.627 Y86.707
G1 X83.037 Y90.297 E.1592
G1 X83.046 Y89.755
G1 X86.413 Y86.388 E.14929
G1 X86.169 Y86.098
G1 X82.911 Y89.357 E.1445
G1 X82.692 Y89.042
G1 X85.919 Y85.815 E.14309
G1 X85.642 Y85.559
G1 X82.401 Y88.8 E.1437
G1 X82.031 Y88.637
G1 X85.357 Y85.31 E.14752
G1 X85.045 Y85.089
G1 X81.547 Y88.587 E.15511
; WIPE_START
M204 S6000
G1 X82.961 Y87.173 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X81.949 Y91.385 Z2.4 F42000
G1 Z2
G1 E.4 F1800
G1 F2386.764
M204 S2000
G1 X78.353 Y94.981 E.15945
G1 X78.04 Y94.76
G1 X81.405 Y91.396 E.1492
G1 X81.005 Y91.262
G1 X77.742 Y94.525 E.14468
G1 X77.468 Y94.266
G1 X80.69 Y91.044 E.14288
G1 X80.45 Y90.751
G1 X77.203 Y93.998 E.14395
G1 X76.965 Y93.702
G1 X80.287 Y90.381 E.14727
G1 X80.239 Y89.895
G1 X76.733 Y93.401 E.15546
G1 X76.529 Y93.072
G1 X84.727 Y84.874 E.36349
G1 X84.376 Y84.692
G1 X76.333 Y92.735 E.35665
G1 X76.167 Y92.368
G1 X84.022 Y84.513 E.3483
G1 X83.634 Y84.367
G1 X76.012 Y91.989 E.33798
G1 X75.89 Y91.579
G1 X83.229 Y84.239 E.32546
G1 X82.8 Y84.135
G1 X75.79 Y91.145 E.31084
G1 X75.714 Y90.687
G1 X82.331 Y84.07 E.29342
G1 X81.84 Y84.029
G1 X75.681 Y90.187 E.27307
G1 X75.687 Y89.648
G1 X81.301 Y84.035 E.24893
G1 X80.699 Y84.103
G1 X75.749 Y89.053 E.21947
G1 X75.9 Y88.369
G1 X80.011 Y84.258 E.18231
G1 X79.171 Y84.564
G1 X76.217 Y87.518 E.13101
; WIPE_START
M204 S6000
G1 X77.631 Y86.104 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X81.478 Y88.518 Z2.4 F42000
G1 Z2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.151913
G1 F8257.452
M204 S6000
G1 X81.243 Y88.643 E.00241
; WIPE_START
G1 X81.478 Y88.518 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X83.014 Y89.52 Z2.4 F42000
G1 Z2
G1 E.4 F1800
; LINE_WIDTH: 0.0895383
G1 F15000
M204 S6000
G1 X82.939 Y89.412 E.00051
M204 S10000
G1 X83.114 Y90.373 F42000
; LINE_WIDTH: 0.0988327
G1 F15000
M204 S6000
G3 X82.895 Y90.678 I-4.856 J-3.258 E.00174
M204 S10000
G1 X83.104 Y90.364 F42000
; LINE_WIDTH: 0.171175
G1 F7017.279
M204 S6000
G1 X82.904 Y90.685 E.00404
; WIPE_START
G1 X83.104 Y90.364 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X82.165 Y91.435 Z2.4 F42000
G1 Z2
G1 E.4 F1800
; LINE_WIDTH: 0.123912
G1 F11112.271
M204 S6000
G1 X81.936 Y91.373 E.0016
M204 S10000
G1 X82.326 Y91.248 F42000
; LINE_WIDTH: 0.100709
G1 F15000
M204 S6000
G1 X82.257 Y91.296 E.00041
; LINE_WIDTH: 0.135486
G1 F9722.78
G3 X82.019 Y91.456 I-2.661 J-3.71 E.00221
M204 S10000
M73 P61 R6
G1 X81.59 Y91.477 F42000
; LINE_WIDTH: 0.108733
G1 F13675.264
M204 S6000
G1 X81.429 Y91.397 E.00099
; WIPE_START
G1 X81.59 Y91.477 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X76.279 Y87.58 Z2.4 F42000
G1 Z2
G1 E.4 F1800
; LINE_WIDTH: 0.205244
G1 F5544.495
M204 S6000
G1 X76.038 Y87.917 E.00559
; WIPE_START
G1 X76.279 Y87.58 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X82.815 Y91.521 Z2.4 F42000
G1 X86.367 Y93.663 Z2.4
G1 Z2
G1 E.4 F1800
; LINE_WIDTH: 0.117715
G1 F12032.901
M204 S6000
G3 X85.31 Y94.72 I-9.921 J-8.857 E.0093
; WIPE_START
G1 X85.678 Y94.387 E-.12606
G1 X86.367 Y93.663 E-.25394
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.145 Y92.353 Z2.4 F42000
G1 Z2
G1 E.4 F1800
; LINE_WIDTH: 0.17028
G1 F7066.59
M204 S6000
G1 X87.045 Y92.496 E.00185
; LINE_WIDTH: 0.205341
G1 F5541.176
G3 X86.863 Y92.748 I-3.12 J-2.066 E.0042
; WIPE_START
G1 X87.045 Y92.496 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X84.44 Y85.322 Z2.4 F42000
G1 X84.184 Y84.617 Z2.4
G1 Z2
G1 E.4 F1800
; LINE_WIDTH: 0.101602
G1 F15000
M204 S6000
G1 X84.065 Y84.529 E.00072
; WIPE_START
G1 X84.184 Y84.617 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X78.547 Y84.893 Z2.4 F42000
G1 Z2
G1 E.4 F1800
; LINE_WIDTH: 0.1055
G1 F14381.729
M204 S6000
G1 X78.415 Y84.997 E.00087
; LINE_WIDTH: 0.147678
G1 F8591.256
G1 X78.179 Y85.198 E.00271
; LINE_WIDTH: 0.197359
G1 F5827.558
G1 X77.942 Y85.4 E.00399
; LINE_WIDTH: 0.240749
G1 F4549.387
G2 X77.388 Y85.93 I15.739 J16.988 E.01262
; LINE_WIDTH: 0.24183
G1 F4524.66
G1 X77.176 Y86.161 E.00518
; LINE_WIDTH: 0.208086
G1 F5449.063
G2 X76.865 Y86.502 I25.347 J23.46 E.00633
; LINE_WIDTH: 0.161938
G1 F7561.911
G1 X76.71 Y86.693 E.00244
; LINE_WIDTH: 0.112746
G1 F12889.212
G1 X76.555 Y86.885 E.00143
; WIPE_START
G1 X76.71 Y86.693 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X84.342 Y86.819 Z2.4 F42000
G1 X105.455 Y87.167 Z2.4
G1 Z2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2210.87
M204 S6000
G3 X105.369 Y85.018 I-.132 J-1.071 E.12079
G1 X105.522 Y85.035 E.00521
G3 X105.514 Y87.158 I-.199 J1.061 E.10149
M204 S10000
G1 X105.511 Y87.571 F42000
G1 F2210.87
M204 S6000
G3 X105.259 Y84.611 I-.188 J-1.474 E.16227
G3 X105.571 Y84.631 I.077 J1.269 E.01061
G3 X105.57 Y87.562 I-.248 J1.466 E.14122
M204 S10000
G1 X105.523 Y87.983 F42000
G1 F2210.87
M204 S6000
G1 X105.38 Y87.989 E.00485
G3 X104.769 Y84.287 I-.055 J-1.892 E.1841
G3 X105.62 Y84.227 I.55 J1.735 E.02913
G3 X105.582 Y87.973 I-.295 J1.87 E.18258
M204 S250
G1 X105.55 Y88.372 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2386.764
M204 S5000
G1 X105.298 Y88.382 E.00791
G3 X104.654 Y83.912 I.026 J-2.285 E.203
G3 X105.667 Y83.838 I.661 J2.077 E.03213
G3 X105.619 Y88.363 I-.343 J2.259 E.20501
G1 X105.61 Y88.364 E.00031
; WIPE_START
M204 S6000
G1 X105.298 Y88.382 E-.05929
G1 X105.065 Y88.372 E-.04442
G1 X104.837 Y88.331 E-.04389
G1 X104.524 Y88.24 E-.06199
G1 X104.228 Y88.102 E-.062
G1 X104.031 Y87.982 E-.04388
G1 X103.776 Y87.776 E-.06224
G1 X103.767 Y87.768 E-.0023
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X104.715 Y86.335 Z2.4 F42000
G1 Z2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41999
G1 F2386.825
M204 S6000
G1 X104.766 Y86.482 E.00486
G1 X104.945 Y86.662 E.00797
G1 X105.18 Y86.766 E.00805
G1 X105.485 Y86.761 E.00957
G1 X105.814 Y86.583 E.01175
G1 X105.953 Y86.36 E.00824
G2 X105.963 Y85.832 I-.75 J-.277 E.01688
G1 X105.721 Y85.54 E.01186
G1 X105.522 Y85.44 E.007
G1 X105.185 Y85.43 E.01059
G1 X104.96 Y85.522 E.00762
G1 X104.735 Y85.767 E.01043
G1 X104.652 Y86.045 E.00911
G1 X104.702 Y86.277 E.00742
M204 S10000
G1 X105.102 Y86.151 F42000
; LINE_WIDTH: 0.51902
G1 F1890.359
M204 S6000
G1 X105.191 Y86.305 E.00705
G1 X105.385 Y86.346 E.00784
G1 X105.543 Y86.235 E.00768
G1 X105.578 Y86.043 E.00771
G1 X105.446 Y85.871 E.00856
G1 X105.226 Y85.874 E.00874
G1 X105.095 Y85.997 E.00711
G1 X105.099 Y86.091 E.0037
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F1890.359
G1 X105.095 Y85.997 E-.02406
G1 X105.226 Y85.874 E-.04629
G1 X105.446 Y85.871 E-.05689
G1 X105.578 Y86.043 E-.05571
G1 X105.543 Y86.235 E-.0502
G1 X105.385 Y86.346 E-.04998
G1 X105.191 Y86.305 E-.051
G1 X105.102 Y86.151 E-.04586
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 11/65
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z2.4 I-.257 J-1.19 P1  F42000
G1 X81.667 Y91.211 Z2.4
G1 Z2.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.662 Y91.21 E.00016
G3 X81.565 Y88.794 I-.018 J-1.209 E.11719
G1 X81.701 Y88.793 E.00427
G3 X81.956 Y91.169 I-.057 J1.208 E.10747
G1 X81.726 Y91.203 E.00728
M204 S250
G1 X81.712 Y91.938 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.939 E.00136
G3 X81.755 Y88.065 I-.016 J-1.938 E.19466
G1 X81.989 Y88.092 E.00739
G3 X81.907 Y91.922 I-.337 J1.909 E.17233
G1 X81.772 Y91.933 E.00424
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.939 E-.01963
G1 X81.43 Y91.928 E-.04532
G1 X81.192 Y91.886 E-.04599
G1 X80.967 Y91.817 E-.04479
G1 X80.749 Y91.719 E-.04535
G1 X80.545 Y91.595 E-.04538
G1 X80.36 Y91.449 E-.04473
G1 X80.187 Y91.275 E-.04664
G1 X80.052 Y91.099 E-.04217
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.6
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.6 F4000
            G39.3 S1
            G0 Z2.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.34 Y90.875 F42000
G1 Z2.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378703
G1 F600
M204 S6000
G1 X80.17 Y90.539 E.01052
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.279 Y89.227 E.00511
G1 X80.387 Y89.062 E.0055
G1 X80.644 Y88.791 E.01044
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.528 Y88.432 E.01052
G1 X81.735 Y88.43 E.00578
G1 X82.104 Y88.494 E.01043
G1 X82.304 Y88.569 E.00599
G1 X82.626 Y88.765 E.01052
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.205 Y89.756 E.0057
G1 X83.22 Y90.132 E.0105
G1 X83.188 Y90.338 E.00582
G1 X83.067 Y90.69 E.01041
G1 X82.862 Y91.007 E.01052
G1 X82.72 Y91.157 E.00578
G1 X82.417 Y91.376 E.01044
G1 X82.233 Y91.465 E.0057
G1 X81.869 Y91.561 E.01052
G1 X81.655 Y91.576 E.00599
G1 X81.278 Y91.531 E.0106
G1 X80.928 Y91.4 E.01044
G1 X80.744 Y91.289 E.00599
G1 X80.471 Y91.045 E.01023
G1 X80.377 Y90.922 E.00431
; WIPE_START
G1 F2680.307
G1 X80.17 Y90.539 E-.08279
G1 X80.085 Y90.172 E-.0716
G1 X80.076 Y89.968 E-.0388
G1 X80.129 Y89.595 E-.07157
G1 X80.199 Y89.392 E-.04075
G1 X80.279 Y89.227 E-.0348
G1 X80.387 Y89.062 E-.03744
G1 X80.395 Y89.054 E-.00225
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.995 Y88.352 Z2.6 F42000
G1 X105.413 Y86.744 Z2.6
G1 Z2.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.369 Y85.443 I-.08 J-.648 E.07343
G1 X105.445 Y85.452 E.0026
G3 X105.472 Y86.734 I-.112 J.644 E.0609
M204 S10000
G1 X105.466 Y87.145 F42000
G1 F600
M204 S6000
G3 X105.391 Y85.036 I-.133 J-1.051 E.11914
G1 X105.516 Y85.05 E.00428
G3 X105.525 Y87.136 I-.183 J1.044 E.09992
M204 S10000
G1 X105.52 Y87.556 F42000
G1 F600
M204 S6000
G3 X105.413 Y84.629 I-.187 J-1.459 E.16543
G1 X105.588 Y84.649 E.00596
G3 X105.58 Y87.547 I-.254 J1.449 E.13937
M204 S250
G1 X105.517 Y87.95 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.348 Y87.96 E.0053
G3 X105.434 Y84.236 I-.015 J-1.863 E.18715
G1 X105.656 Y84.262 E.00702
G3 X105.577 Y87.945 I-.323 J1.835 E.16575
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.348 Y87.96 E-.04353
G1 X105.119 Y87.95 E-.04352
G1 X104.888 Y87.909 E-.04476
G1 X104.674 Y87.843 E-.04254
G1 X104.464 Y87.749 E-.04361
G1 X104.268 Y87.63 E-.04362
G1 X104.088 Y87.487 E-.04362
G1 X103.926 Y87.324 E-.04364
G1 X103.826 Y87.194 E-.03116
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.106 Y86.118 Z2.6 F42000
G1 Z2.2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47151
G1 F600
M204 S6000
G1 X105.213 Y86.294 E.00735
G1 X105.358 Y86.322 E.00526
G1 X105.538 Y86.199 E.00777
G1 X105.556 Y86.07 E.00462
G1 X105.49 Y85.936 E.00534
G1 X105.314 Y85.873 E.00666
G1 X105.138 Y85.974 E.00724
G1 X105.119 Y86.06 E.00312
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2099.909
G1 X105.138 Y85.974 E-.02506
G1 X105.314 Y85.873 E-.0581
G1 X105.49 Y85.936 E-.05344
G1 X105.556 Y86.07 E-.04284
G1 X105.538 Y86.199 E-.03708
G1 X105.358 Y86.322 E-.06233
G1 X105.213 Y86.294 E-.04219
G1 X105.106 Y86.118 E-.05895
; WIPE_END
M73 P62 R6
G1 E-.02 F1800
; layer num/total_layer_count: 12/65
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z2.6 I-.258 J-1.189 P1  F42000
G1 X81.666 Y91.211 Z2.6
G1 Z2.4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.662 Y91.211 E.00015
G3 X81.565 Y88.794 I-.019 J-1.21 E.11732
G1 X81.698 Y88.793 E.00417
G3 X81.956 Y91.17 I-.055 J1.208 E.10748
G1 X81.726 Y91.203 E.00729
M204 S250
G1 X81.714 Y91.938 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.939 E.00143
G3 X81.761 Y88.066 I-.013 J-1.938 E.19465
G1 X81.989 Y88.092 E.00719
G3 X81.897 Y91.924 I-.334 J1.909 E.1728
G1 X81.774 Y91.933 E.00388
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.939 E-.02005
G1 X81.431 Y91.929 E-.04525
G1 X81.186 Y91.884 E-.04726
G1 X80.967 Y91.817 E-.04356
G1 X80.749 Y91.719 E-.04537
G1 X80.545 Y91.595 E-.04539
G1 X80.358 Y91.447 E-.04527
G1 X80.184 Y91.27 E-.04726
G1 X80.053 Y91.1 E-.04059
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.8
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.8 F4000
            G39.3 S1
            G0 Z2.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.355 Y90.896 F42000
G1 Z2.4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378716
G1 F600
M204 S6000
G1 X80.247 Y90.717 E.00583
G1 X80.167 Y90.529 E.0057
G1 X80.085 Y90.172 E.01023
G1 X80.076 Y89.968 E.0057
G3 X80.39 Y90.944 I1.574 J.033 E.24706
; WIPE_START
G1 F2680.201
G1 X80.247 Y90.717 E-.05104
G1 X80.167 Y90.529 E-.03878
G1 X80.085 Y90.172 E-.06964
G1 X80.076 Y89.968 E-.03881
G1 X80.094 Y89.764 E-.0388
G1 X80.194 Y89.401 E-.07155
G1 X80.285 Y89.218 E-.03879
G1 X80.387 Y89.08 E-.0326
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.986 Y88.369 Z2.8 F42000
G1 X105.418 Y86.737 Z2.8
G1 Z2.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G1 X105.257 Y86.745 E.00547
G3 X105.377 Y85.444 I.08 J-.649 E.06813
G1 X105.445 Y85.452 E.00233
G3 X105.502 Y86.729 I-.108 J.644 E.06017
G1 X105.478 Y86.731 E.00081
M204 S10000
G1 X105.458 Y87.155 F42000
G1 F600
M204 S6000
G3 X105.4 Y85.037 I-.12 J-1.056 E.11927
G1 X105.517 Y85.05 E.00397
G3 X105.517 Y87.146 I-.179 J1.048 E.10087
M204 S10000
G1 X105.51 Y87.558 F42000
G1 F600
M204 S6000
G3 X105.423 Y84.63 I-.171 J-1.46 E.16502
G1 X105.588 Y84.649 E.00562
G3 X105.569 Y87.549 I-.249 J1.449 E.14002
M204 S250
G1 X105.513 Y87.951 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.348 Y87.96 E.00519
G3 X105.445 Y84.238 I-.009 J-1.863 E.18709
G1 X105.656 Y84.262 E.00667
G3 X105.573 Y87.946 I-.317 J1.836 E.16616
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.348 Y87.96 E-.04283
G1 X105.119 Y87.95 E-.04358
G1 X104.893 Y87.91 E-.04363
G1 X104.674 Y87.843 E-.0436
G1 X104.465 Y87.749 E-.04348
G1 X104.254 Y87.619 E-.04697
G1 X104.088 Y87.487 E-.04039
G1 X103.926 Y87.324 E-.04363
G1 X103.824 Y87.191 E-.03189
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.14 Y86.228 Z2.8 F42000
G1 Z2.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.472037
G1 F600
M204 S6000
G1 X105.28 Y86.323 E.00602
G1 X105.441 Y86.299 E.0058
G1 X105.551 Y86.157 E.00639
G2 X105.372 Y85.87 I-.328 J.005 E.01268
G1 X105.22 Y85.898 E.00551
G1 X105.122 Y86.012 E.00536
G1 X105.135 Y86.168 E.00561
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2097.333
G1 X105.122 Y86.012 E-.04484
G1 X105.22 Y85.898 E-.04284
G1 X105.372 Y85.87 E-.0441
G1 X105.49 Y85.955 E-.04137
G1 X105.544 Y86.079 E-.0387
G1 X105.551 Y86.157 E-.02244
G1 X105.441 Y86.299 E-.05112
G1 X105.28 Y86.323 E-.04641
G1 X105.14 Y86.228 E-.04818
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 13/65
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z2.8 I-.253 J-1.19 P1  F42000
G1 X81.666 Y91.211 Z2.8
G1 Z2.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.662 Y91.211 E.00014
G3 X81.565 Y88.794 I-.021 J-1.209 E.11739
G1 X81.695 Y88.793 E.00408
G3 X81.956 Y91.169 I-.054 J1.208 E.10748
G1 X81.725 Y91.203 E.0073
M204 S250
G1 X81.716 Y91.938 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.939 E.0015
M73 P63 R6
G3 X81.767 Y88.066 I-.01 J-1.938 E.19462
G1 X81.989 Y88.092 E.00699
G3 X81.891 Y91.925 I-.33 J1.91 E.17317
G1 X81.776 Y91.933 E.00361
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.939 E-.0205
G1 X81.431 Y91.929 E-.04519
G1 X81.18 Y91.882 E-.0485
G1 X80.967 Y91.817 E-.04239
G1 X80.749 Y91.719 E-.04535
G1 X80.545 Y91.595 E-.04538
G1 X80.358 Y91.447 E-.04524
G1 X80.18 Y91.265 E-.04848
G1 X80.055 Y91.102 E-.03897
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3 F4000
            G39.3 S1
            G0 Z3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.355 Y90.896 F42000
G1 Z2.6
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378656
G1 F600
M204 S6000
G1 X80.243 Y90.707 E.00614
G1 X80.118 Y90.363 E.01023
G1 X80.084 Y90.161 E.0057
G1 X80.078 Y89.952 E.00585
G3 X80.39 Y90.945 I1.573 J.051 E.24648
; WIPE_START
G1 F2680.682
G1 X80.243 Y90.707 E-.05314
G1 X80.118 Y90.363 E-.06961
G1 X80.084 Y90.161 E-.0388
G1 X80.078 Y89.952 E-.03985
G1 X80.129 Y89.595 E-.06854
G1 X80.191 Y89.411 E-.03683
G1 X80.285 Y89.218 E-.04078
G1 X80.387 Y89.081 E-.03246
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.986 Y88.37 Z3 F42000
G1 X105.424 Y86.738 Z3
G1 Z2.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G1 X105.257 Y86.745 E.00566
G3 X105.365 Y85.443 I.074 J-.649 E.06813
G1 X105.445 Y85.452 E.00273
G3 X105.496 Y86.728 I-.114 J.644 E.06
G1 X105.483 Y86.73 E.00042
M204 S10000
G1 X105.47 Y87.145 F42000
G1 F600
M204 S6000
G3 X105.386 Y85.035 I-.139 J-1.051 E.1193
G1 X105.517 Y85.05 E.00443
G3 X105.53 Y87.135 I-.185 J1.044 E.09966
M204 S10000
G1 X105.524 Y87.546 F42000
G1 F600
M204 S6000
G3 X105.408 Y84.628 I-.192 J-1.454 E.16503
G1 X105.588 Y84.649 E.00613
G3 X105.583 Y87.537 I-.256 J1.444 E.13864
M204 S250
G1 X105.51 Y87.951 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.348 Y87.963 E.00509
G3 X105.199 Y84.238 I-.025 J-1.864 E.18051
G3 X105.445 Y84.238 I.124 J.992 E.00774
G3 X105.577 Y87.945 I-.121 J1.861 E.17189
G1 X105.57 Y87.946 E.00023
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.348 Y87.963 E-.04225
G1 X105.119 Y87.95 E-.0436
G1 X104.893 Y87.91 E-.04363
G1 X104.674 Y87.843 E-.04362
G1 X104.464 Y87.749 E-.04361
G1 X104.268 Y87.63 E-.04362
G1 X104.088 Y87.487 E-.04362
G1 X103.926 Y87.324 E-.04364
G1 X103.822 Y87.189 E-.03241
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.14 Y86.227 Z3 F42000
G1 Z2.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47396
G1 F600
M204 S6000
G1 X105.277 Y86.321 E.00595
G1 X105.429 Y86.303 E.00549
G1 X105.533 Y86.196 E.00535
G2 X105.369 Y85.879 I-.229 J-.082 E.01432
G1 X105.177 Y85.93 E.00715
G1 X105.103 Y86.065 E.00549
G1 X105.127 Y86.168 E.0038
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2087.973
M73 P63 R5
G1 X105.103 Y86.065 E-.03037
G1 X105.177 Y85.93 E-.04385
G1 X105.369 Y85.879 E-.05707
G1 X105.512 Y85.974 E-.04891
G1 X105.549 Y86.077 E-.03131
G1 X105.533 Y86.196 E-.03444
G1 X105.429 Y86.303 E-.04272
G1 X105.277 Y86.321 E-.04382
G1 X105.14 Y86.227 E-.04752
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 14/65
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z3 I-.253 J-1.19 P1  F42000
G1 X81.666 Y91.211 Z3
G1 Z2.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.662 Y91.21 E.00014
G3 X81.565 Y88.794 I-.011 J-1.209 E.11674
G3 X81.86 Y88.809 I.077 J1.393 E.00929
G3 X81.956 Y91.17 I-.209 J1.191 E.10286
G1 X81.725 Y91.203 E.00731
M204 S250
G1 X81.719 Y91.937 F42000
G1 F600
M204 S5000
G1 X81.668 Y91.937 E.00159
G3 X81.513 Y88.067 I-.023 J-1.937 E.18739
G3 X81.762 Y88.066 I.129 J1 E.00783
G3 X81.906 Y91.92 I-.116 J1.934 E.17901
G1 X81.779 Y91.932 E.00401
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.668 Y91.937 E-.021
G1 X81.43 Y91.929 E-.04531
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04539
G1 X80.749 Y91.719 E-.04536
G1 X80.545 Y91.595 E-.04538
G1 X80.357 Y91.447 E-.04538
G1 X80.189 Y91.277 E-.04537
G1 X80.056 Y91.104 E-.04144
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.2
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.2 F4000
            G39.3 S1
            G0 Z3.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.367 Y90.894 F42000
G1 Z2.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.37883
G1 F600
M204 S6000
M73 P64 R5
G1 X80.252 Y90.726 E.00569
G1 X80.17 Y90.539 E.00571
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.00571
G3 X80.455 Y91.024 I1.573 J.033 E.24402
G1 X80.4 Y90.944 E.00271
; WIPE_START
G1 F2679.292
G1 X80.252 Y90.726 E-.05008
G1 X80.17 Y90.539 E-.03881
G1 X80.085 Y90.172 E-.07159
G1 X80.076 Y89.968 E-.03881
G1 X80.094 Y89.764 E-.0388
G1 X80.194 Y89.401 E-.07154
G1 X80.285 Y89.218 E-.03881
G1 X80.383 Y89.084 E-.03156
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.983 Y88.372 Z3.2 F42000
G1 X105.42 Y86.738 Z3.2
G1 Z2.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G1 X105.257 Y86.745 E.00552
G3 X105.365 Y85.443 I.074 J-.649 E.06815
G1 X105.445 Y85.452 E.00273
G3 X105.496 Y86.728 I-.114 J.644 E.05999
G1 X105.479 Y86.73 E.00055
M204 S10000
G1 X105.381 Y87.156 F42000
G1 F600
M204 S6000
G1 X105.341 Y87.154 E.00138
G3 X105.386 Y85.035 I-.009 J-1.06 E.1149
G1 X105.517 Y85.05 E.00443
G3 X105.598 Y87.12 I-.185 J1.044 E.09728
G1 X105.44 Y87.146 E.00541
M204 S10000
G1 X105.521 Y87.557 F42000
G1 F600
M204 S6000
G1 X105.165 Y87.549 E.01206
G3 X105.408 Y84.628 I.166 J-1.457 E.15285
G1 X105.588 Y84.649 E.00613
G3 X105.572 Y87.539 I-.256 J1.444 E.13901
M204 S250
G1 X105.506 Y87.951 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.348 Y87.961 E.00496
G3 X105.457 Y84.239 I-.017 J-1.863 E.18801
G3 X105.566 Y87.946 I-.126 J1.859 E.17218
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.348 Y87.961 E-.04143
G1 X105.119 Y87.95 E-.04358
G1 X104.893 Y87.91 E-.04363
G1 X104.674 Y87.843 E-.04361
G1 X104.464 Y87.749 E-.04361
G1 X104.268 Y87.63 E-.04363
G1 X104.088 Y87.487 E-.04361
G1 X103.926 Y87.324 E-.04363
G1 X103.819 Y87.185 E-.03327
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.112 Y86.148 Z3.2 F42000
G1 Z2.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47173
G1 F600
M204 S6000
G1 X105.18 Y86.266 E.00487
G1 X105.389 Y86.321 E.0077
G1 X105.544 Y86.171 E.0077
G2 X105.334 Y85.871 I-.236 J-.058 E.0148
G1 X105.22 Y85.898 E.00417
G1 X105.122 Y86.012 E.00535
G1 X105.116 Y86.088 E.00272
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2098.832
G1 X105.122 Y86.012 E-.02185
G1 X105.22 Y85.898 E-.04293
G1 X105.334 Y85.871 E-.03348
G1 X105.491 Y85.936 E-.04876
G1 X105.546 Y86.062 E-.03917
G1 X105.544 Y86.171 E-.03119
G1 X105.389 Y86.321 E-.06178
G1 X105.18 Y86.266 E-.06179
G1 X105.112 Y86.148 E-.03904
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 15/65
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z3.2 I-.257 J-1.19 P1  F42000
G1 X81.665 Y91.211 Z3.2
G1 Z3
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.662 Y91.21 E.00013
G3 X81.565 Y88.794 I-.011 J-1.209 E.11674
G3 X81.86 Y88.809 I.076 J1.416 E.00928
G3 X81.956 Y91.17 I-.209 J1.191 E.10287
G1 X81.725 Y91.203 E.00732
M204 S250
G1 X81.722 Y91.937 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.94 E.00168
G3 X81.768 Y88.066 I-.018 J-1.939 E.19523
G3 X81.89 Y91.925 I-.121 J1.935 E.17957
G1 X81.782 Y91.933 E.0034
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.94 E-.02157
G1 X81.43 Y91.929 E-.04535
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04538
G1 X80.749 Y91.719 E-.04536
G1 X80.545 Y91.595 E-.04538
G1 X80.357 Y91.447 E-.04537
G1 X80.179 Y91.264 E-.04856
G1 X80.058 Y91.107 E-.03767
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.4
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.4 F4000
            G39.3 S1
            G0 Z3.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.353 Y90.891 F42000
G1 Z3
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378813
G1 F600
M204 S6000
G3 X80.076 Y89.985 I1.296 J-.891 E.02688
G1 X80.076 Y89.968 E.00049
G1 X80.091 Y89.785 E.00513
G3 X80.388 Y90.94 I1.558 J.215 E.24189
; WIPE_START
G1 F2679.431
G1 X80.243 Y90.707 E-.05211
G1 X80.115 Y90.353 E-.07156
G1 X80.076 Y89.985 E-.07024
G1 X80.076 Y89.968 E-.00332
G1 X80.091 Y89.785 E-.03487
G1 X80.135 Y89.575 E-.04076
G1 X80.279 Y89.227 E-.07162
G1 X80.39 Y89.076 E-.03551
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.99 Y88.366 Z3.4 F42000
G1 X105.417 Y86.738 Z3.4
G1 Z3
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G1 X105.257 Y86.745 E.00541
G3 X105.365 Y85.443 I.074 J-.649 E.06813
G1 X105.445 Y85.452 E.00273
G3 X105.496 Y86.728 I-.114 J.644 E.06
G1 X105.476 Y86.73 E.00067
M204 S10000
G1 X105.379 Y87.156 F42000
G1 F600
M204 S6000
G1 X105.341 Y87.154 E.00132
G3 X105.386 Y85.035 I-.009 J-1.06 E.11489
G1 X105.516 Y85.05 E.00443
G3 X105.598 Y87.12 I-.185 J1.044 E.09729
G1 X105.439 Y87.147 E.00547
M204 S10000
G1 X105.433 Y87.558 F42000
G1 F600
M204 S6000
G1 X105.345 Y87.568 E.00301
M73 P65 R5
G3 X105.226 Y84.63 I-.02 J-1.471 E.15378
G3 X105.424 Y84.63 I.098 J.795 E.0067
G3 X105.702 Y87.518 I-.1 J1.467 E.14007
G1 X105.492 Y87.549 E.00718
M204 S250
G1 X105.503 Y87.951 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.348 Y87.96 E.00486
G3 X105.468 Y84.24 I-.017 J-1.862 E.18833
G3 X106.568 Y87.49 I-.14 J1.858 E.13663
G3 X105.577 Y87.944 I-1.238 J-1.392 E.0347
G1 X105.563 Y87.945 E.00045
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.348 Y87.96 E-.04083
G1 X105.119 Y87.95 E-.04358
G1 X104.893 Y87.91 E-.04362
G1 X104.674 Y87.843 E-.04361
G1 X104.464 Y87.749 E-.04363
G1 X104.268 Y87.63 E-.04363
G1 X104.088 Y87.487 E-.04361
G1 X103.926 Y87.324 E-.04363
G1 X103.817 Y87.183 E-.03387
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.105 Y86.136 Z3.4 F42000
G1 Z3
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47175
G1 F600
M204 S6000
G1 X105.18 Y86.266 E.00534
G1 X105.389 Y86.321 E.0077
G1 X105.524 Y86.224 E.00595
G1 X105.557 Y86.114 E.00407
G1 X105.491 Y85.939 E.00667
G1 X105.299 Y85.871 E.00726
G1 X105.167 Y85.942 E.00534
G1 X105.124 Y86.079 E.00512
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2098.734
G1 X105.167 Y85.942 E-.04102
G1 X105.299 Y85.871 E-.04278
G1 X105.491 Y85.939 E-.05813
G1 X105.557 Y86.114 E-.0534
G1 X105.524 Y86.224 E-.03262
G1 X105.389 Y86.321 E-.04763
G1 X105.18 Y86.266 E-.06165
G1 X105.105 Y86.136 E-.04278
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 16/65
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z3.4 I-.258 J-1.189 P1  F42000
G1 X81.665 Y91.211 Z3.4
G1 Z3.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.662 Y91.211 E.0001
G3 X81.675 Y88.793 I-.005 J-1.209 E.11986
G3 X82.006 Y88.845 I-.042 J1.355 E.01053
G3 X81.957 Y91.174 I-.35 J1.158 E.09847
G1 X81.724 Y91.204 E.00736
M204 S250
G1 X81.725 Y91.937 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.939 E.00177
G3 X81.775 Y88.067 I-.016 J-1.938 E.19524
G3 X81.883 Y91.926 I-.125 J1.934 E.1797
G1 X81.785 Y91.933 E.0031
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.939 E-.02214
G1 X81.43 Y91.929 E-.04534
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04538
G1 X80.749 Y91.719 E-.04536
G1 X80.545 Y91.595 E-.04538
G1 X80.357 Y91.447 E-.04538
G1 X80.189 Y91.277 E-.04537
G1 X80.06 Y91.109 E-.04029
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.6
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.6 F4000
            G39.3 S1
            G0 Z3.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.351 Y90.888 F42000
G1 Z3.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378669
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00046
G1 X80.174 Y90.548 E.01023
G1 X80.118 Y90.363 E.00541
G1 X80.084 Y90.162 E.0057
G1 X80.076 Y89.968 E.00542
G3 X82.714 Y91.162 I1.573 J.035 E.17341
G1 X82.564 Y91.284 E.00541
G1 X82.242 Y91.46 E.01023
G1 X82.049 Y91.525 E.0057
G1 X81.859 Y91.562 E.00542
G1 X81.665 Y91.576 E.00541
G1 X81.461 Y91.564 E.0057
G1 X81.271 Y91.529 E.00541
G1 X80.928 Y91.4 E.01023
G1 X80.753 Y91.295 E.0057
G1 X80.6 Y91.175 E.00541
G1 X80.464 Y91.037 E.00541
G1 X80.387 Y90.936 E.00356
; WIPE_START
G1 F2680.574
G1 X80.34 Y90.875 E-.01455
G1 X80.174 Y90.548 E-.06961
G1 X80.118 Y90.363 E-.03684
G1 X80.084 Y90.162 E-.03878
G1 X80.076 Y89.968 E-.03688
G1 X80.132 Y89.585 E-.07353
G1 X80.279 Y89.227 E-.07354
G1 X80.393 Y89.073 E-.03627
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.992 Y88.364 Z3.6 F42000
G1 X105.412 Y86.739 Z3.6
G1 Z3.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G1 X105.257 Y86.745 E.00525
G3 X105.365 Y85.443 I.074 J-.649 E.06814
G1 X105.445 Y85.452 E.00273
G3 X105.496 Y86.728 I-.114 J.644 E.06
G1 X105.471 Y86.731 E.00083
M204 S10000
G1 X105.47 Y87.145 F42000
G1 F600
M204 S6000
G3 X105.386 Y85.035 I-.139 J-1.051 E.11929
G1 X105.516 Y85.05 E.00443
G3 X105.53 Y87.135 I-.185 J1.044 E.09967
M204 S10000
G1 X105.51 Y87.557 F42000
G1 F600
M204 S6000
G1 X105.165 Y87.552 E.0117
G3 X105.436 Y84.631 I.172 J-1.457 E.15353
G3 X106.474 Y87.022 I-.107 J1.468 E.1084
G3 X105.568 Y87.544 I-1.137 J-.927 E.03619
M204 S250
G1 X105.498 Y87.952 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.348 Y87.96 E.00471
G3 X105.48 Y84.242 I-.017 J-1.862 E.18866
G3 X105.558 Y87.946 I-.149 J1.856 E.1716
; WIPE_START
M73 P66 R5
G1 F2386.764
M204 S6000
G1 X105.348 Y87.96 E-.03991
G1 X105.119 Y87.95 E-.04357
G1 X104.893 Y87.91 E-.04363
G1 X104.674 Y87.843 E-.04362
G1 X104.464 Y87.749 E-.04361
G1 X104.268 Y87.63 E-.04363
G1 X104.088 Y87.487 E-.04362
G1 X103.926 Y87.324 E-.04362
G1 X103.815 Y87.179 E-.03479
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.13 Y86.2 Z3.6 F42000
G1 Z3.2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.472083
G1 F600
M204 S6000
G1 X105.305 Y86.327 E.0077
G1 X105.454 Y86.291 E.0055
G1 X105.544 Y86.171 E.00534
G2 X105.371 Y85.871 I-.248 J-.057 E.01361
G1 X105.208 Y85.903 E.00594
G1 X105.108 Y86.053 E.00644
G1 X105.121 Y86.141 E.00318
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2097.106
G1 X105.108 Y86.053 E-.0253
G1 X105.208 Y85.903 E-.05124
G1 X105.371 Y85.871 E-.04726
G1 X105.491 Y85.937 E-.03877
G1 X105.545 Y86.062 E-.03881
G1 X105.544 Y86.171 E-.03099
G1 X105.454 Y86.291 E-.04253
G1 X105.305 Y86.327 E-.04379
G1 X105.13 Y86.2 E-.0613
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 17/65
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z3.6 I-.254 J-1.19 P1  F42000
G1 X81.664 Y91.211 Z3.6
G1 Z3.4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.662 Y91.212 E.00008
G3 X81.673 Y88.793 I-.005 J-1.209 E.11979
G3 X82.006 Y88.845 I-.037 J1.346 E.01061
G3 X81.957 Y91.174 I-.35 J1.158 E.09849
G1 X81.724 Y91.204 E.00737
M204 S250
G1 X81.728 Y91.937 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.939 E.00188
G3 X81.782 Y88.068 I-.016 J-1.938 E.19544
G3 X81.877 Y91.926 I-.131 J1.934 E.17967
G1 X81.788 Y91.932 E.00279
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.939 E-.02276
G1 X81.43 Y91.929 E-.04533
G1 X81.195 Y91.887 E-.04538
G1 X80.967 Y91.817 E-.04536
G1 X80.749 Y91.719 E-.04537
G1 X80.545 Y91.595 E-.04538
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.0454
G1 X80.062 Y91.112 E-.03964
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.8
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.8 F4000
            G39.3 S1
            G0 Z3.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.352 Y90.892 F42000
G1 Z3.4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378588
G1 F600
M204 S6000
G1 X80.247 Y90.717 E.0057
G1 X80.167 Y90.529 E.0057
G1 X80.085 Y90.172 E.01023
G1 X80.076 Y89.968 E.0057
G3 X81.271 Y91.529 I1.574 J.033 E.21683
G1 X80.928 Y91.4 E.01022
G1 X80.753 Y91.295 E.0057
G1 X80.593 Y91.168 E.0057
G1 X80.392 Y90.937 E.00855
; WIPE_START
G1 F2681.223
G1 X80.247 Y90.717 E-.05008
G1 X80.167 Y90.529 E-.03878
G1 X80.085 Y90.172 E-.06964
G1 X80.076 Y89.968 E-.03879
G1 X80.094 Y89.764 E-.03879
G1 X80.189 Y89.417 E-.06831
G1 X80.279 Y89.227 E-.04011
G1 X80.382 Y89.071 E-.0355
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.982 Y88.364 Z3.8 F42000
G1 X105.417 Y86.743 Z3.8
G1 Z3.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.365 Y85.443 I-.086 J-.648 E.07356
G1 X105.445 Y85.452 E.00273
G3 X105.476 Y86.733 I-.114 J.644 E.06069
M204 S10000
G1 X105.374 Y87.157 F42000
G1 F600
M204 S6000
G1 X105.341 Y87.16 E.00114
G3 X105.255 Y85.036 I-.016 J-1.063 E.11121
G3 X105.401 Y85.037 I.071 J.588 E.00495
G3 X105.599 Y87.124 I-.076 J1.06 E.10106
G1 X105.433 Y87.148 E.00567
M204 S10000
G1 X105.428 Y87.558 F42000
G1 F600
M204 S6000
G1 X105.344 Y87.566 E.00282
G3 X105.047 Y84.654 I-.021 J-1.469 E.14751
G3 X105.447 Y84.633 I.288 J1.652 E.01362
G3 X105.702 Y87.516 I-.124 J1.464 E.1391
G1 X105.487 Y87.549 E.00736
M204 S250
G1 X105.511 Y87.951 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.119 Y87.947 E.01228
G3 X105.492 Y84.243 I.212 J-1.85 E.18176
G3 X105.57 Y87.944 I-.162 J1.855 E.17075
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.119 Y87.947 E-.08571
G1 X104.893 Y87.91 E-.04359
G1 X104.674 Y87.843 E-.04361
G1 X104.464 Y87.749 E-.04363
G1 X104.268 Y87.63 E-.04363
G1 X104.088 Y87.487 E-.04361
G1 X103.926 Y87.324 E-.04362
G1 X103.822 Y87.188 E-.03261
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.106 Y86.149 Z3.8 F42000
G1 Z3.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.471555
G1 F600
M204 S6000
G1 X105.214 Y86.294 E.00644
G1 X105.361 Y86.321 E.00533
G1 X105.539 Y86.199 E.00769
G2 X105.491 Y85.936 I-.219 J-.096 E.01009
G1 X105.315 Y85.873 E.00667
G1 X105.13 Y85.984 E.0077
G1 X105.114 Y86.09 E.00381
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2099.688
G1 X105.13 Y85.984 E-.03043
G1 X105.315 Y85.873 E-.0615
G1 X105.491 Y85.936 E-.05326
G1 X105.556 Y86.07 E-.04241
G1 X105.539 Y86.199 E-.03699
G1 X105.361 Y86.321 E-.06142
G1 X105.214 Y86.294 E-.04254
G1 X105.106 Y86.149 E-.05145
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 18/65
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z3.8 I-.257 J-1.19 P1  F42000
G1 X81.664 Y91.211 Z3.8
G1 Z3.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
M73 P67 R5
G1 X81.662 Y91.212 E.00008
G3 X81.67 Y88.793 I-.005 J-1.209 E.11969
G3 X82.006 Y88.845 I-.033 J1.337 E.0107
G3 X81.957 Y91.174 I-.349 J1.158 E.0985
G1 X81.724 Y91.204 E.00738
M204 S250
G1 X81.732 Y91.936 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.941 E.00198
G3 X81.16 Y91.876 I-.027 J-1.81 E.01613
G3 X81.788 Y88.069 I.491 J-1.875 E.17964
G3 X81.87 Y91.927 I-.138 J1.933 E.17964
G1 X81.791 Y91.932 E.00248
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.941 E-.02342
G1 X81.43 Y91.929 E-.04535
G1 X81.16 Y91.876 E-.0523
G1 X81.16 Y91.876 E0
G1 X80.967 Y91.817 E-.0384
G1 X80.749 Y91.719 E-.04537
G1 X80.545 Y91.595 E-.04538
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.04537
G1 X80.064 Y91.114 E-.03903
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4 F4000
            G39.3 S1
            G0 Z4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.354 Y90.893 F42000
G1 Z3.6
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378695
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00065
G1 X80.17 Y90.539 E.01052
G1 X80.113 Y90.343 E.0057
G1 X80.076 Y89.968 E.01052
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.357 Y88.455 E.0057
G1 X81.733 Y88.429 E.01052
G1 X82.104 Y88.494 E.01051
G1 X82.305 Y88.569 E.00599
G1 X82.626 Y88.765 E.01052
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.206 Y89.759 E.00581
G1 X83.22 Y90.132 E.01041
G1 X83.143 Y90.501 E.01052
G1 X83.067 Y90.69 E.0057
G1 X82.862 Y91.007 E.01052
G1 X82.714 Y91.162 E.00599
G1 X82.408 Y91.382 E.01052
G1 X82.059 Y91.522 E.01052
G1 X81.848 Y91.563 E.00599
G1 X81.482 Y91.567 E.01023
G1 X81.271 Y91.529 E.00599
G1 X80.918 Y91.396 E.01051
G1 X80.744 Y91.289 E.0057
G1 X80.464 Y91.037 E.01052
G1 X80.391 Y90.941 E.00338
; WIPE_START
G1 F2680.367
G1 X80.34 Y90.875 E-.01579
G1 X80.17 Y90.539 E-.07158
G1 X80.113 Y90.343 E-.03881
G1 X80.076 Y89.968 E-.07159
G1 X80.129 Y89.595 E-.07158
G1 X80.199 Y89.392 E-.04075
G1 X80.38 Y89.072 E-.06991
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.98 Y88.363 Z4 F42000
G1 X105.404 Y86.739 Z4
G1 Z3.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G1 X105.257 Y86.745 E.00498
G3 X105.365 Y85.443 I.074 J-.649 E.06814
G1 X105.445 Y85.452 E.00273
G3 X105.496 Y86.728 I-.114 J.644 E.05999
G1 X105.464 Y86.732 E.00109
M204 S10000
G1 X105.371 Y87.158 F42000
G1 F600
M204 S6000
G1 X105.341 Y87.159 E.00104
G3 X105.255 Y85.036 I-.019 J-1.062 E.11135
G3 X105.413 Y85.038 I.072 J.636 E.00535
G3 X105.599 Y87.123 I-.091 J1.059 E.10042
G1 X105.431 Y87.148 E.00576
M204 S10000
G1 X105.425 Y87.559 F42000
G1 F600
M204 S6000
G1 X105.345 Y87.568 E.00274
G3 X105.047 Y84.654 I-.022 J-1.47 E.14769
G3 X105.459 Y84.634 I.284 J1.606 E.01402
G3 X105.702 Y87.518 I-.137 J1.464 E.13872
G1 X105.484 Y87.55 E.00746
M204 S250
G1 X105.501 Y87.951 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G3 X105.504 Y84.244 I-.163 J-1.854 E.1936
G3 X105.561 Y87.945 I-.173 J1.853 E.17067
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.501 Y87.951 E-.01139
G1 X105.119 Y87.95 E-.07263
G1 X104.893 Y87.91 E-.04362
G1 X104.674 Y87.843 E-.04362
G1 X104.464 Y87.749 E-.04361
G1 X104.268 Y87.63 E-.04363
G1 X104.088 Y87.487 E-.04362
G1 X103.926 Y87.324 E-.04361
G1 X103.816 Y87.181 E-.03427
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.119 Y86.175 Z4 F42000
G1 Z3.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.472135
G1 F600
M204 S6000
G1 X105.277 Y86.322 E.00771
G1 X105.43 Y86.304 E.00549
G1 X105.534 Y86.196 E.00535
G2 X105.371 Y85.871 I-.234 J-.087 E.01457
G1 X105.208 Y85.903 E.00593
G1 X105.114 Y86.025 E.00549
G1 X105.117 Y86.115 E.00321
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2096.854
G1 X105.114 Y86.025 E-.02552
G1 X105.208 Y85.903 E-.04363
G1 X105.371 Y85.871 E-.04715
G1 X105.509 Y85.957 E-.0464
G1 X105.548 Y86.088 E-.03872
G1 X105.534 Y86.196 E-.03101
G1 X105.43 Y86.304 E-.04256
G1 X105.277 Y86.322 E-.04369
G1 X105.119 Y86.175 E-.06133
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 19/65
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z4 I-.256 J-1.19 P1  F42000
G1 X81.664 Y91.212 Z4
G1 Z3.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.662 Y91.211 E.00007
G3 X81.668 Y88.793 I-.004 J-1.209 E.11953
G3 X82.006 Y88.845 I-.029 J1.331 E.01078
G3 X81.957 Y91.173 I-.349 J1.157 E.09848
G1 X81.723 Y91.204 E.00739
M204 S250
G1 X81.736 Y91.936 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.939 E.0021
G3 X81.795 Y88.069 I-.017 J-1.937 E.19584
G3 X81.864 Y91.927 I-.146 J1.932 E.17953
G1 X81.795 Y91.932 E.00214
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.939 E-.02415
G1 X81.43 Y91.929 E-.04533
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04539
G1 X80.749 Y91.719 E-.04536
G1 X80.545 Y91.595 E-.04538
G1 X80.357 Y91.447 E-.04538
M73 P68 R5
G1 X80.189 Y91.277 E-.04535
G1 X80.066 Y91.118 E-.03829
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.2
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.2 F4000
            G39.3 S1
            G0 Z4.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.356 Y90.895 F42000
G1 Z3.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378696
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.0007
G1 X80.17 Y90.539 E.01052
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.528 Y88.432 E.01052
G1 X81.733 Y88.429 E.0057
G1 X82.104 Y88.494 E.01051
G1 X82.304 Y88.569 E.00599
G1 X82.626 Y88.765 E.01052
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.205 Y89.756 E.0057
G1 X83.22 Y90.132 E.01052
G1 X83.189 Y90.334 E.0057
G1 X83.067 Y90.69 E.01052
G1 X82.862 Y91.007 E.01052
G1 X82.722 Y91.155 E.0057
G1 X82.417 Y91.376 E.01052
G1 X82.233 Y91.465 E.0057
G1 X81.869 Y91.561 E.01052
G1 X81.655 Y91.576 E.00599
G1 X81.281 Y91.532 E.01052
G1 X80.928 Y91.4 E.01051
G1 X80.744 Y91.289 E.00599
G1 X80.471 Y91.045 E.01023
G1 X80.392 Y90.942 E.0036
; WIPE_START
G1 F2680.361
G1 X80.34 Y90.875 E-.01619
G1 X80.17 Y90.539 E-.07156
G1 X80.085 Y90.172 E-.07161
G1 X80.076 Y89.968 E-.0388
G1 X80.129 Y89.595 E-.07157
G1 X80.199 Y89.392 E-.04075
G1 X80.379 Y89.074 E-.06952
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.979 Y88.366 Z4.2 F42000
G1 X105.337 Y86.749 Z4.2
G1 Z3.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.284 Y85.443 I-.011 J-.654 E.06846
G3 X105.378 Y85.444 I.044 J.38 E.0032
G3 X105.397 Y86.746 I-.052 J.652 E.06534
M204 S10000
G1 X105.369 Y87.158 F42000
G1 F600
M204 S6000
G1 X105.341 Y87.16 E.00095
G3 X105.255 Y85.036 I-.02 J-1.063 E.11153
G3 X105.425 Y85.04 I.072 J.685 E.00575
G3 X105.599 Y87.123 I-.104 J1.058 E.09996
G1 X105.428 Y87.149 E.00585
M204 S10000
G1 X105.422 Y87.559 F42000
G1 F600
M204 S6000
G1 X105.345 Y87.567 E.00264
G3 X105.047 Y84.654 I-.023 J-1.47 E.1477
G3 X105.471 Y84.635 I.281 J1.576 E.01442
G3 X105.702 Y87.518 I-.149 J1.462 E.13825
G1 X105.481 Y87.55 E.00755
M204 S250
G1 X105.489 Y87.952 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G3 X105.516 Y84.246 I-.158 J-1.854 E.19411
G3 X105.549 Y87.946 I-.184 J1.852 E.17069
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.489 Y87.952 E-.01139
G1 X105.119 Y87.95 E-.07038
G1 X104.893 Y87.91 E-.04362
G1 X104.674 Y87.843 E-.04361
G1 X104.464 Y87.749 E-.04363
G1 X104.268 Y87.63 E-.04363
G1 X104.088 Y87.487 E-.04362
G1 X103.926 Y87.324 E-.0436
G1 X103.809 Y87.172 E-.03652
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.106 Y86.121 Z4.2 F42000
G1 Z3.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.471469
G1 F600
M204 S6000
G1 X105.213 Y86.294 E.00726
G1 X105.361 Y86.321 E.00535
G1 X105.539 Y86.199 E.0077
G1 X105.556 Y86.071 E.0046
G1 X105.489 Y85.935 E.00542
G1 X105.319 Y85.871 E.00645
G1 X105.138 Y85.974 E.00742
G1 X105.119 Y86.062 E.0032
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2100.11
G1 X105.138 Y85.974 E-.02569
G1 X105.319 Y85.871 E-.05949
G1 X105.489 Y85.935 E-.05172
G1 X105.556 Y86.071 E-.04346
G1 X105.539 Y86.199 E-.03685
G1 X105.361 Y86.321 E-.06173
G1 X105.213 Y86.294 E-.04286
G1 X105.106 Y86.121 E-.0582
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 20/65
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z4.2 I-.258 J-1.189 P1  F42000
G1 X81.663 Y91.212 Z4.2
G1 Z4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.662 Y91.21 E.00007
G3 X81.665 Y88.793 I-.004 J-1.208 E.11939
G3 X82.006 Y88.845 I-.025 J1.324 E.01086
G3 X81.957 Y91.172 I-.349 J1.157 E.09845
G1 X81.723 Y91.204 E.00739
M204 S250
G1 X81.74 Y91.936 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.938 E.00223
G3 X81.801 Y88.07 I-.017 J-1.937 E.19604
G3 X83.344 Y89.06 I-.151 J1.931 E.05986
G3 X81.857 Y91.928 I-1.696 J.94 E.11968
G1 X81.8 Y91.932 E.00181
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.938 E-.02492
G1 X81.43 Y91.929 E-.04533
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04538
G1 X80.545 Y91.595 E-.04537
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.04539
G1 X80.069 Y91.121 E-.0375
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.4
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.4 F4000
            G39.3 S1
            G0 Z4.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




M73 P69 R5
G1 X80.358 Y90.898 F42000
G1 Z4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378694
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00082
G1 X80.17 Y90.539 E.01052
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.528 Y88.432 E.01052
G1 X81.733 Y88.429 E.0057
G1 X81.935 Y88.453 E.0057
G1 X82.295 Y88.565 E.01052
G1 X82.618 Y88.759 E.01052
G1 X82.778 Y88.902 E.00599
G1 X83.007 Y89.201 E.01052
G1 X83.158 Y89.547 E.01052
G1 X83.205 Y89.756 E.00599
G1 X83.22 Y90.132 E.01052
G1 X83.189 Y90.334 E.0057
G1 X83.067 Y90.69 E.01052
G1 X82.862 Y91.007 E.01052
G1 X82.722 Y91.155 E.0057
G1 X82.564 Y91.284 E.0057
G1 X82.233 Y91.465 E.01052
G1 X81.869 Y91.561 E.01052
G1 X81.655 Y91.576 E.00599
G1 X81.281 Y91.532 E.01052
G1 X80.928 Y91.4 E.01052
G1 X80.744 Y91.289 E.00598
G1 X80.471 Y91.045 E.01024
G1 X80.395 Y90.945 E.00349
; WIPE_START
G1 F2680.375
G1 X80.34 Y90.875 E-.01696
G1 X80.17 Y90.539 E-.07157
G1 X80.085 Y90.172 E-.0716
G1 X80.076 Y89.968 E-.03881
G1 X80.129 Y89.595 E-.07157
G1 X80.199 Y89.392 E-.04075
G1 X80.377 Y89.077 E-.06876
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.977 Y88.368 Z4.4 F42000
G1 X105.337 Y86.75 Z4.4
G1 Z4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.284 Y85.443 I-.012 J-.654 E.06859
G3 X105.39 Y85.445 I.045 J.428 E.0036
G3 X105.397 Y86.746 I-.066 J.65 E.06484
M204 S10000
G1 X105.366 Y87.158 F42000
G1 F600
M204 S6000
G1 X105.341 Y87.16 E.00085
G3 X105.125 Y85.054 I-.016 J-1.063 E.10679
G3 X105.437 Y85.041 I.202 J1.132 E.01057
G3 X105.599 Y87.124 I-.112 J1.057 E.09978
G1 X105.425 Y87.15 E.00595
M204 S10000
G1 X105.419 Y87.56 F42000
G1 F600
M204 S6000
G1 X105.345 Y87.567 E.00255
G3 X105.047 Y84.654 I-.023 J-1.47 E.14773
G3 X105.483 Y84.637 I.279 J1.559 E.01482
G3 X105.702 Y87.518 I-.161 J1.461 E.13783
G1 X105.479 Y87.551 E.00764
M204 S250
G1 X105.478 Y87.953 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G3 X105.527 Y84.247 I-.15 J-1.855 E.19434
G3 X105.537 Y87.947 I-.204 J1.851 E.17025
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.478 Y87.953 E-.01139
G1 X105.119 Y87.95 E-.06813
G1 X104.893 Y87.91 E-.04362
G1 X104.674 Y87.843 E-.04362
G1 X104.464 Y87.749 E-.04361
G1 X104.268 Y87.63 E-.04363
G1 X104.088 Y87.487 E-.04363
G1 X103.926 Y87.324 E-.0436
G1 X103.802 Y87.162 E-.03878
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.105 Y86.136 Z4.4 F42000
G1 Z4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47163
G1 F600
M204 S6000
G1 X105.18 Y86.266 E.00535
G1 X105.389 Y86.321 E.0077
G1 X105.544 Y86.171 E.0077
G2 X105.318 Y85.872 I-.234 J-.058 E.01529
G1 X105.13 Y85.984 E.00783
G1 X105.115 Y86.077 E.00335
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2099.321
G1 X105.13 Y85.984 E-.02693
G1 X105.318 Y85.872 E-.06299
G1 X105.488 Y85.934 E-.05185
G1 X105.546 Y86.062 E-.04019
G1 X105.544 Y86.171 E-.0312
G1 X105.389 Y86.321 E-.06195
G1 X105.18 Y86.266 E-.06189
G1 X105.105 Y86.136 E-.04301
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 21/65
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z4.4 I-.258 J-1.189 P1  F42000
G1 X81.663 Y91.212 Z4.4
G1 Z4.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.662 Y91.212 E.00004
G3 X81.662 Y88.793 I-.004 J-1.209 E.1194
G3 X82.006 Y88.845 I-.021 J1.318 E.01094
G3 X81.957 Y91.174 I-.349 J1.158 E.09853
G1 X81.723 Y91.204 E.00741
M204 S250
G1 X81.744 Y91.936 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.939 E.00237
G3 X81.808 Y88.071 I-.021 J-1.937 E.19648
G3 X81.85 Y91.928 I-.157 J1.931 E.17957
G1 X81.804 Y91.931 E.00146
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.939 E-.02575
G1 X81.43 Y91.929 E-.04533
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04538
G1 X80.545 Y91.595 E-.04537
G1 X80.357 Y91.447 E-.04538
G1 X80.189 Y91.277 E-.04535
G1 X80.072 Y91.124 E-.03669
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.6
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.6 F4000
            G39.3 S1
            G0 Z4.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




M73 P69 R4
G1 X80.362 Y90.903 F42000
G1 Z4.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378693
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00099
G1 X80.17 Y90.539 E.01052
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00598
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.357 Y88.455 E.0057
G1 X81.733 Y88.429 E.01052
G1 X81.935 Y88.453 E.0057
G1 X82.295 Y88.565 E.01052
G1 X82.618 Y88.759 E.01052
G1 X82.778 Y88.902 E.00599
G1 X83.007 Y89.201 E.01052
G1 X83.158 Y89.547 E.01052
G1 X83.205 Y89.756 E.00599
G1 X83.22 Y90.132 E.01052
G1 X83.189 Y90.334 E.0057
G1 X83.067 Y90.69 E.01051
G1 X82.862 Y91.007 E.01052
G1 X82.714 Y91.162 E.00599
G1 X82.408 Y91.382 E.01052
G1 X82.059 Y91.522 E.01052
G1 X81.848 Y91.563 E.00599
G1 X81.482 Y91.567 E.01023
G1 X81.271 Y91.529 E.00599
G1 X80.918 Y91.396 E.01052
G1 X80.608 Y91.182 E.01052
G1 X80.464 Y91.037 E.0057
G1 X80.398 Y90.951 E.00303
; WIPE_START
G1 F2680.383
G1 X80.34 Y90.875 E-.01816
G1 X80.17 Y90.539 E-.07156
G1 X80.085 Y90.172 E-.07161
G1 X80.076 Y89.968 E-.03881
G1 X80.129 Y89.595 E-.07158
G1 X80.199 Y89.392 E-.04072
G1 X80.374 Y89.083 E-.06757
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.974 Y88.373 Z4.6 F42000
G1 X105.337 Y86.752 Z4.6
G1 Z4.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P70 R4
G1 F600
M204 S6000
G3 X105.284 Y85.443 I-.013 J-.655 E.06875
G3 X105.402 Y85.447 I.045 J.476 E.004
G3 X105.397 Y86.748 I-.078 J.65 E.06455
M204 S10000
G1 X105.423 Y87.156 F42000
G1 F600
M204 S6000
G1 X105.341 Y87.156 E.00277
G3 X105.125 Y85.054 I-.016 J-1.06 E.10656
G3 X105.448 Y85.042 I.202 J1.122 E.01098
G3 X105.481 Y87.144 I-.124 J1.053 E.10321
M204 S10000
G1 X105.451 Y87.562 F42000
G1 F600
M204 S6000
G1 X105.344 Y87.568 E.00363
G3 X105.047 Y84.654 I-.023 J-1.47 E.14777
G3 X105.495 Y84.638 I.279 J1.551 E.01522
G3 X105.525 Y87.554 I-.173 J1.46 E.14358
G1 X105.511 Y87.556 E.00048
M204 S250
G1 X105.479 Y87.953 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.348 Y87.961 E.00412
G3 X104.749 Y84.326 I-.026 J-1.863 E.16602
G3 X105.539 Y84.248 I.569 J1.72 E.0251
G3 X105.577 Y87.944 I-.217 J1.85 E.16868
G1 X105.539 Y87.947 E.0012
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.348 Y87.961 E-.03634
G1 X105.119 Y87.95 E-.04358
G1 X104.893 Y87.91 E-.04364
G1 X104.674 Y87.843 E-.0436
G1 X104.464 Y87.749 E-.04364
G1 X104.268 Y87.63 E-.04361
G1 X104.088 Y87.487 E-.04363
G1 X103.926 Y87.324 E-.04359
G1 X103.803 Y87.164 E-.03837
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.106 Y86.149 Z4.6 F42000
G1 Z4.2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47166
G1 F600
M204 S6000
G1 X105.251 Y86.309 E.00771
G1 X105.454 Y86.291 E.00726
G1 X105.544 Y86.171 E.00534
G2 X105.488 Y85.934 I-.281 J-.059 E.00894
G1 X105.318 Y85.872 E.00648
G1 X105.13 Y85.984 E.00781
G1 X105.114 Y86.09 E.00381
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2099.174
G1 X105.13 Y85.984 E-.03063
G1 X105.318 Y85.872 E-.06277
G1 X105.488 Y85.934 E-.05206
G1 X105.546 Y86.062 E-.04011
G1 X105.544 Y86.171 E-.03119
G1 X105.454 Y86.291 E-.04296
G1 X105.251 Y86.309 E-.05833
G1 X105.106 Y86.149 E-.06195
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 22/65
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z4.6 I-.257 J-1.19 P1  F42000
G1 X81.663 Y91.212 Z4.6
G1 Z4.4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.662 Y91.212 E.00003
G3 X81.66 Y88.793 I-.004 J-1.209 E.1193
G3 X82.006 Y88.845 I-.017 J1.313 E.01103
G3 X81.957 Y91.174 I-.349 J1.158 E.09853
G1 X81.722 Y91.204 E.00742
M204 S250
G1 X81.749 Y91.935 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.938 E.00251
G3 X81.814 Y88.072 I-.017 J-1.937 E.19643
G3 X81.844 Y91.929 I-.165 J1.93 E.1795
G1 X81.808 Y91.931 E.00111
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.938 E-.02663
G1 X81.43 Y91.929 E-.04533
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04538
G1 X80.545 Y91.595 E-.04537
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.04538
G1 X80.074 Y91.128 E-.0358
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.8
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.8 F4000
            G39.3 S1
            G0 Z4.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.364 Y90.905 F42000
G1 Z4.4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378695
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00107
G1 X80.17 Y90.539 E.01052
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.528 Y88.432 E.01052
G1 X81.733 Y88.429 E.0057
G1 X82.104 Y88.494 E.01052
G1 X82.305 Y88.569 E.00599
G1 X82.626 Y88.765 E.01052
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.205 Y89.756 E.0057
G1 X83.22 Y90.132 E.01052
G1 X83.143 Y90.501 E.01052
G1 X83.067 Y90.69 E.0057
G1 X82.862 Y91.007 E.01052
G1 X82.722 Y91.155 E.0057
G1 X82.417 Y91.376 E.01052
G1 X82.233 Y91.465 E.0057
G1 X81.869 Y91.561 E.01052
G1 X81.655 Y91.576 E.00599
G1 X81.281 Y91.532 E.01052
G1 X80.928 Y91.4 E.01051
G1 X80.744 Y91.289 E.00599
G1 X80.471 Y91.045 E.01023
G1 X80.4 Y90.953 E.00324
; WIPE_START
G1 F2680.367
G1 X80.34 Y90.875 E-.01866
G1 X80.17 Y90.539 E-.07158
G1 X80.085 Y90.172 E-.07159
G1 X80.076 Y89.968 E-.03881
G1 X80.129 Y89.595 E-.07157
G1 X80.199 Y89.392 E-.04075
G1 X80.373 Y89.085 E-.06705
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.972 Y88.374 Z4.8 F42000
G1 X105.337 Y86.751 Z4.8
G1 Z4.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.284 Y85.443 I-.012 J-.654 E.0686
G3 X105.414 Y85.448 I.045 J.526 E.00441
G3 X105.397 Y86.747 I-.089 J.648 E.06413
M204 S10000
G1 X105.416 Y87.156 F42000
G1 F600
M204 S6000
G1 X105.341 Y87.16 E.00255
G3 X105.255 Y85.036 I-.02 J-1.063 E.11151
G3 X105.46 Y85.044 I.073 J.83 E.00696
G3 X105.476 Y87.149 I-.14 J1.054 E.10304
M204 S10000
G1 X105.414 Y87.56 F42000
G1 F600
M204 S6000
G1 X105.345 Y87.568 E.00235
G3 X105.047 Y84.654 I-.023 J-1.47 E.14773
G3 X105.507 Y84.639 I.279 J1.55 E.01563
G3 X105.702 Y87.518 I-.185 J1.459 E.13705
G1 X105.473 Y87.552 E.00784
M204 S250
G1 X105.464 Y87.953 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
M73 P71 R4
G1 X105.454 Y87.955 E.00032
G3 X105.551 Y84.25 I-.118 J-1.857 E.19372
G3 X105.802 Y87.899 I-.216 J1.848 E.16168
G1 X105.523 Y87.944 E.00885
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.454 Y87.955 E-.01335
G1 X105.454 Y87.955 E0
G1 X105.119 Y87.95 E-.06363
G1 X104.893 Y87.91 E-.04362
G1 X104.674 Y87.843 E-.04362
G1 X104.464 Y87.749 E-.04361
G1 X104.268 Y87.63 E-.04363
G1 X104.088 Y87.487 E-.04362
G1 X103.926 Y87.324 E-.0436
G1 X103.794 Y87.152 E-.04132
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.105 Y86.142 Z4.8 F42000
G1 Z4.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47158
G1 F600
M204 S6000
G1 X105.177 Y86.264 E.00506
G1 X105.382 Y86.322 E.00757
G1 X105.502 Y86.245 E.00509
G1 X105.555 Y86.063 E.00676
G1 X105.489 Y85.935 E.00514
G1 X105.317 Y85.872 E.00653
G1 X105.13 Y85.984 E.00779
G1 X105.114 Y86.083 E.00355
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2099.566
G1 X105.13 Y85.984 E-.02842
G1 X105.317 Y85.872 E-.06231
G1 X105.489 Y85.935 E-.05227
G1 X105.555 Y86.063 E-.04112
G1 X105.502 Y86.245 E-.0541
G1 X105.382 Y86.322 E-.04074
G1 X105.177 Y86.264 E-.06053
G1 X105.105 Y86.142 E-.0405
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 23/65
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z4.8 I-.257 J-1.189 P1  F42000
G1 X81.662 Y91.212 Z4.8
G1 Z4.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G3 X81.657 Y88.793 I-.004 J-1.209 E.11922
G3 X82.006 Y88.845 I-.014 J1.309 E.01111
G3 X81.722 Y91.21 I-.349 J1.158 E.10602
M204 S250
G1 X81.754 Y91.935 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.938 E.00267
G3 X81.821 Y88.072 I-.014 J-1.936 E.19637
G3 X81.837 Y91.929 I-.171 J1.929 E.1795
G1 X81.813 Y91.931 E.00075
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.938 E-.02757
G1 X81.43 Y91.929 E-.04532
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04539
G1 X80.545 Y91.595 E-.04537
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.04537
G1 X80.077 Y91.132 E-.03487
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5 F4000
            G39.3 S1
            G0 Z5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.368 Y90.911 F42000
G1 Z4.6
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378695
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00126
G1 X80.17 Y90.539 E.01052
G1 X80.113 Y90.343 E.0057
G1 X80.076 Y89.968 E.01052
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.528 Y88.432 E.01052
G1 X81.733 Y88.429 E.0057
G1 X82.104 Y88.494 E.01051
G1 X82.305 Y88.569 E.00599
G1 X82.626 Y88.765 E.01052
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.205 Y89.756 E.0057
G1 X83.22 Y90.132 E.01052
G1 X83.143 Y90.501 E.01052
G1 X83.067 Y90.69 E.0057
G1 X82.862 Y91.007 E.01052
G1 X82.714 Y91.162 E.00599
G1 X82.408 Y91.382 E.01052
G1 X82.059 Y91.522 E.01052
G1 X81.848 Y91.563 E.00599
G1 X81.482 Y91.567 E.01023
G1 X81.271 Y91.529 E.00599
G1 X80.918 Y91.396 E.01052
G1 X80.608 Y91.182 E.01052
G1 X80.464 Y91.037 E.0057
G1 X80.404 Y90.958 E.00277
; WIPE_START
G1 F2680.373
G1 X80.34 Y90.875 E-.01998
G1 X80.17 Y90.539 E-.07156
G1 X80.113 Y90.343 E-.03881
G1 X80.076 Y89.968 E-.0716
G1 X80.129 Y89.595 E-.07156
G1 X80.199 Y89.392 E-.04075
G1 X80.37 Y89.091 E-.06574
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.969 Y88.377 Z5 F42000
G1 X105.382 Y86.741 Z5
G1 Z4.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G1 X105.256 Y86.749 E.00426
G3 X105.365 Y85.443 I.065 J-.652 E.06902
G1 X105.426 Y85.449 E.00206
G3 X105.496 Y86.728 I-.105 J.647 E.06017
G1 X105.442 Y86.734 E.00184
M204 S10000
G1 X105.357 Y87.159 F42000
G1 F600
M204 S6000
G1 X105.341 Y87.157 E.00057
G3 X105.255 Y85.036 I-.019 J-1.061 E.11122
G3 X105.472 Y85.045 I.074 J.878 E.00736
G3 X105.598 Y87.12 I-.15 J1.051 E.09831
G1 X105.417 Y87.15 E.00623
M204 S10000
G1 X105.441 Y87.563 F42000
G1 F600
M204 S6000
G1 X105.345 Y87.568 E.00325
G3 X105.047 Y84.654 I-.022 J-1.47 E.1477
G3 X105.518 Y84.641 I.279 J1.553 E.01603
G3 X105.525 Y87.554 I-.196 J1.457 E.14283
G1 X105.5 Y87.557 E.00084
M204 S250
G1 X105.462 Y87.953 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.442 Y87.956 E.00062
G3 X105.563 Y84.251 I-.106 J-1.858 E.19377
G3 X105.801 Y87.897 I-.238 J1.846 E.1608
G1 X105.521 Y87.943 E.00891
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.442 Y87.956 E-.01518
G1 X105.442 Y87.956 E0
G1 X105.119 Y87.95 E-.06137
G1 X104.893 Y87.91 E-.04363
G1 X104.674 Y87.843 E-.0436
G1 X104.464 Y87.749 E-.04364
G1 X104.268 Y87.63 E-.0436
G1 X104.088 Y87.487 E-.04362
G1 X103.926 Y87.324 E-.04363
G1 X103.792 Y87.15 E-.04172
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.13 Y86.2 Z5 F42000
G1 Z4.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47172
G1 F600
M204 S6000
G1 X105.305 Y86.327 E.0077
G1 X105.503 Y86.243 E.0077
G1 X105.555 Y86.063 E.00667
G1 X105.489 Y85.935 E.00514
G1 X105.317 Y85.872 E.00655
G1 X105.13 Y85.984 E.00777
G1 X105.13 Y86.14 E.00556
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2098.881
G1 X105.13 Y85.984 E-.04488
G1 X105.317 Y85.872 E-.06269
G1 X105.489 Y85.935 E-.05288
G1 X105.555 Y86.063 E-.04147
G1 X105.503 Y86.243 E-.05382
M73 P72 R4
G1 X105.305 Y86.327 E-.0621
G1 X105.13 Y86.2 E-.06216
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 24/65
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z5 I-.254 J-1.19 P1  F42000
G1 X81.662 Y91.212 Z5
G1 Z4.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G3 X81.654 Y88.793 I-.004 J-1.209 E.11913
G3 X82.006 Y88.845 I-.011 J1.305 E.01119
G3 X81.722 Y91.21 I-.349 J1.158 E.10602
M204 S250
G1 X81.664 Y91.929 F42000
G1 F600
M204 S5000
G1 X81.431 Y91.925 E.00732
G3 X81.828 Y88.073 I.22 J-1.924 E.18936
G3 X81.831 Y91.929 I-.178 J1.928 E.17949
G1 X81.724 Y91.929 E.00335
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.431 Y91.925 E-.05575
G1 X81.195 Y91.887 E-.04534
G1 X80.967 Y91.817 E-.04538
G1 X80.749 Y91.719 E-.04536
G1 X80.545 Y91.595 E-.04538
G1 X80.357 Y91.447 E-.04537
G1 X80.143 Y91.217 E-.05981
G1 X80.034 Y91.051 E-.03761
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.2
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.2 F4000
            G39.3 S1
            G0 Z5.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.335 Y90.847 F42000
G1 Z4.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378694
G1 F600
M204 S6000
G1 X80.252 Y90.726 E.0041
G1 X80.17 Y90.539 E.0057
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.528 Y88.432 E.01052
G1 X81.733 Y88.429 E.00571
G1 X81.935 Y88.453 E.0057
G1 X82.295 Y88.565 E.01052
G1 X82.618 Y88.759 E.01052
G1 X82.778 Y88.902 E.00599
G1 X83.007 Y89.201 E.01052
G1 X83.158 Y89.547 E.01052
G1 X83.205 Y89.756 E.00598
G1 X83.22 Y90.132 E.01052
G1 X83.143 Y90.501 E.01052
G1 X83.067 Y90.69 E.0057
G1 X82.862 Y91.007 E.01052
G1 X82.714 Y91.162 E.00599
G1 X82.408 Y91.382 E.01052
G1 X82.059 Y91.522 E.01052
G1 X81.848 Y91.563 E.00599
G1 X81.482 Y91.567 E.01023
G1 X81.271 Y91.529 E.00599
G1 X80.919 Y91.396 E.01051
G1 X80.608 Y91.182 E.01052
G1 X80.464 Y91.037 E.0057
G1 X80.369 Y90.897 E.00475
; WIPE_START
G1 F2680.38
G1 X80.252 Y90.726 E-.03927
G1 X80.17 Y90.539 E-.03878
G1 X80.085 Y90.172 E-.07159
G1 X80.076 Y89.968 E-.03881
G1 X80.129 Y89.595 E-.07157
G1 X80.199 Y89.392 E-.04074
G1 X80.385 Y89.064 E-.07159
G1 X80.413 Y89.035 E-.00765
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X88.013 Y88.337 Z5.2 F42000
G1 X105.377 Y86.741 Z5.2
G1 Z4.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G1 X105.257 Y86.745 E.00406
G3 X105.365 Y85.443 I.074 J-.649 E.06815
G1 X105.445 Y85.452 E.00272
G3 X105.496 Y86.728 I-.114 J.644 E.05999
G1 X105.436 Y86.734 E.00202
M204 S10000
G1 X105.406 Y87.157 F42000
G1 F600
M204 S6000
G1 X105.341 Y87.16 E.00222
G3 X105.255 Y85.036 I-.017 J-1.063 E.11129
G3 X105.484 Y85.046 I.074 J.927 E.00776
G3 X105.471 Y87.15 I-.16 J1.051 E.10261
G1 X105.466 Y87.151 E.00018
M204 S10000
G1 X105.435 Y87.563 F42000
G1 F600
M204 S6000
G1 X105.345 Y87.568 E.00307
G3 X105.047 Y84.654 I-.021 J-1.47 E.14763
G3 X105.53 Y84.642 I.279 J1.56 E.01643
G3 X105.525 Y87.554 I-.207 J1.456 E.14247
G1 X105.495 Y87.557 E.00103
M204 S250
G1 X105.463 Y87.954 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.348 Y87.961 E.0036
G3 X104.749 Y84.326 I-.025 J-1.863 E.16597
G3 X105.575 Y84.252 I.571 J1.729 E.02623
G3 X105.577 Y87.944 I-.251 J1.846 E.16764
G1 X105.523 Y87.949 E.00171
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.348 Y87.961 E-.03324
G1 X105.119 Y87.95 E-.04359
G1 X104.893 Y87.91 E-.04362
G1 X104.674 Y87.843 E-.04362
G1 X104.464 Y87.749 E-.0436
G1 X104.268 Y87.63 E-.04364
G1 X104.088 Y87.487 E-.04362
G1 X103.926 Y87.324 E-.0436
G1 X103.793 Y87.151 E-.04146
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.106 Y86.121 Z5.2 F42000
G1 Z4.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47173
G1 F600
M204 S6000
G1 X105.224 Y86.302 E.0077
G1 X105.376 Y86.322 E.00549
G1 X105.503 Y86.243 E.00534
G1 X105.555 Y86.063 E.00667
G1 X105.491 Y85.936 E.00508
G1 X105.315 Y85.873 E.00667
G1 X105.138 Y85.974 E.00726
G1 X105.119 Y86.062 E.00321
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2098.832
G1 X105.138 Y85.974 E-.02569
G1 X105.315 Y85.873 E-.05818
G1 X105.491 Y85.936 E-.05345
G1 X105.555 Y86.063 E-.04069
G1 X105.503 Y86.243 E-.05347
G1 X105.376 Y86.322 E-.04279
G1 X105.224 Y86.302 E-.044
G1 X105.106 Y86.121 E-.06172
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 25/65
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z5.2 I-.258 J-1.189 P1  F42000
G1 X81.662 Y91.212 Z5.2
G1 Z5
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G3 X81.652 Y88.793 I-.004 J-1.209 E.11904
G3 X82.006 Y88.845 I-.007 J1.303 E.01128
G3 X81.722 Y91.21 I-.349 J1.158 E.10603
M204 S250
G1 X81.764 Y91.934 F42000
G1 F600
M204 S5000
G1 X81.668 Y91.938 E.00299
G3 X81.045 Y88.159 I-.026 J-1.937 E.17258
G3 X81.834 Y88.074 I.591 J1.79 E.02507
G3 X81.906 Y91.92 I-.192 J1.927 E.17644
G1 X81.824 Y91.928 E.00261
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.668 Y91.938 E-.02952
G1 X81.43 Y91.929 E-.04532
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04538
G1 X80.749 Y91.719 E-.04536
G1 X80.545 Y91.595 E-.04538
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.04538
G1 X80.084 Y91.14 E-.03291
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.4
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.4 F4000
            G39.3 S1
            G0 Z5.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.373 Y90.917 F42000
G1 Z5
M73 P73 R4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378694
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00149
G1 X80.17 Y90.539 E.01052
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.528 Y88.432 E.01051
G1 X81.733 Y88.429 E.00571
G1 X82.104 Y88.494 E.01051
G1 X82.305 Y88.569 E.006
G1 X82.626 Y88.765 E.01052
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.205 Y89.756 E.0057
G1 X83.22 Y90.132 E.01052
G1 X83.189 Y90.334 E.0057
G1 X83.067 Y90.69 E.01052
G1 X82.862 Y91.007 E.01052
G1 X82.722 Y91.155 E.0057
G1 X82.564 Y91.284 E.0057
G1 X82.233 Y91.465 E.01052
G1 X81.869 Y91.561 E.01052
G1 X81.655 Y91.576 E.00599
G1 X81.281 Y91.532 E.01052
G1 X80.928 Y91.4 E.01052
G1 X80.744 Y91.289 E.00599
G1 X80.471 Y91.045 E.01023
G1 X80.41 Y90.965 E.00282
; WIPE_START
G1 F2680.375
G1 X80.34 Y90.875 E-.02155
G1 X80.17 Y90.539 E-.07157
G1 X80.085 Y90.172 E-.07159
G1 X80.076 Y89.968 E-.0388
G1 X80.129 Y89.595 E-.07157
G1 X80.199 Y89.392 E-.04075
G1 X80.366 Y89.098 E-.06416
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.964 Y88.382 Z5.4 F42000
G1 X105.372 Y86.741 Z5.4
G1 Z5
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G1 X105.257 Y86.745 E.00391
G3 X105.365 Y85.443 I.074 J-.649 E.06815
G1 X105.445 Y85.452 E.00272
G3 X105.496 Y86.728 I-.114 J.644 E.05999
G1 X105.432 Y86.735 E.00217
M204 S10000
G1 X105.351 Y87.16 F42000
G1 F600
M204 S6000
G1 X105.341 Y87.159 E.00035
G3 X105.386 Y85.035 I-.02 J-1.063 E.11596
G1 X105.496 Y85.048 E.00372
G3 X105.599 Y87.122 I-.175 J1.049 E.09756
G1 X105.41 Y87.151 E.00645
M204 S10000
G1 X105.431 Y87.563 F42000
G1 F600
M204 S6000
G1 X105.344 Y87.567 E.00293
G3 X105.226 Y84.63 I-.023 J-1.47 E.15395
G3 X105.542 Y84.643 I.103 J1.28 E.01072
G3 X105.525 Y87.553 I-.221 J1.454 E.14193
G1 X105.491 Y87.557 E.00117
M204 S250
G1 X105.459 Y87.954 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.348 Y87.96 E.00347
G3 X104.971 Y84.268 I-.026 J-1.862 E.17324
G3 X105.586 Y84.254 I.354 J1.978 E.01938
G3 X105.577 Y87.942 I-.265 J1.844 E.16711
G1 X105.518 Y87.948 E.00184
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.348 Y87.96 E-.03242
G1 X105.119 Y87.95 E-.04357
G1 X104.893 Y87.91 E-.04362
G1 X104.674 Y87.843 E-.0436
G1 X104.464 Y87.749 E-.04364
G1 X104.268 Y87.63 E-.04361
G1 X104.088 Y87.487 E-.04363
G1 X103.926 Y87.324 E-.0436
G1 X103.79 Y87.148 E-.0423
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.105 Y86.136 Z5.4 F42000
G1 Z5
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47174
G1 F600
M204 S6000
G1 X105.18 Y86.266 E.00535
G1 X105.389 Y86.321 E.0077
G1 X105.544 Y86.171 E.0077
G2 X105.491 Y85.936 I-.284 J-.059 E.00884
G1 X105.315 Y85.873 E.00667
G1 X105.13 Y85.984 E.0077
G1 X105.115 Y86.077 E.00335
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2098.783
G1 X105.13 Y85.984 E-.02696
G1 X105.315 Y85.873 E-.06193
G1 X105.491 Y85.936 E-.05364
G1 X105.546 Y86.062 E-.03928
G1 X105.544 Y86.171 E-.03128
G1 X105.389 Y86.321 E-.06194
G1 X105.18 Y86.266 E-.06197
G1 X105.105 Y86.136 E-.043
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 26/65
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z5.4 I-.258 J-1.189 P1  F42000
G1 X81.662 Y91.212 Z5.4
G1 Z5.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G3 X81.649 Y88.793 I-.004 J-1.209 E.11896
G3 X82.006 Y88.845 I-.004 J1.3 E.01136
G3 X81.722 Y91.21 I-.349 J1.158 E.10603
M204 S250
G1 X81.776 Y91.93 F42000
G1 F600
M204 S5000
G1 X81.43 Y91.926 E.01082
G3 X81.841 Y88.075 I.217 J-1.924 E.19001
G3 X81.835 Y91.929 I-.199 J1.927 E.17846
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.43 Y91.926 E-.07695
G1 X81.195 Y91.887 E-.04534
G1 X80.967 Y91.817 E-.04538
G1 X80.749 Y91.719 E-.04536
G1 X80.545 Y91.595 E-.04538
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.04537
G1 X80.09 Y91.149 E-.03084
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.6
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.6 F4000
            G39.3 S1
            G0 Z5.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.381 Y90.928 F42000
G1 Z5.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378694
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00185
G1 X80.17 Y90.539 E.01052
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01051
G1 X81.357 Y88.455 E.0057
G1 X81.733 Y88.429 E.01052
G1 X82.104 Y88.494 E.01051
M73 P74 R4
G1 X82.304 Y88.569 E.00599
G1 X82.626 Y88.765 E.01052
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.205 Y89.756 E.0057
G1 X83.22 Y90.132 E.01052
G1 X83.143 Y90.501 E.01052
G1 X83.067 Y90.69 E.0057
G1 X82.862 Y91.007 E.01052
G1 X82.714 Y91.162 E.00599
G1 X82.408 Y91.382 E.01052
G1 X82.059 Y91.522 E.01052
G1 X81.848 Y91.563 E.00599
G1 X81.482 Y91.567 E.01023
G1 X81.271 Y91.529 E.00599
G1 X80.918 Y91.396 E.01051
G1 X80.608 Y91.182 E.01052
G1 X80.464 Y91.037 E.0057
G1 X80.417 Y90.975 E.00217
; WIPE_START
G1 F2680.38
G1 X80.34 Y90.875 E-.02397
G1 X80.17 Y90.539 E-.07158
G1 X80.085 Y90.172 E-.07161
G1 X80.076 Y89.968 E-.03881
G1 X80.129 Y89.595 E-.07157
G1 X80.199 Y89.392 E-.04075
G1 X80.359 Y89.109 E-.06172
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.958 Y88.39 Z5.6 F42000
G1 X105.369 Y86.742 Z5.6
G1 Z5.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G1 X105.257 Y86.745 E.00382
G3 X105.365 Y85.443 I.074 J-.649 E.06814
G1 X105.445 Y85.452 E.00273
G3 X105.496 Y86.728 I-.114 J.644 E.05999
G1 X105.429 Y86.735 E.00226
M204 S10000
G1 X105.349 Y87.161 F42000
G1 F600
M204 S6000
G1 X105.341 Y87.153 E.00038
G3 X105.386 Y85.035 I-.014 J-1.06 E.11521
G1 X105.507 Y85.049 E.00412
G3 X105.598 Y87.118 I-.181 J1.044 E.09728
G1 X105.408 Y87.15 E.0065
M204 S10000
G1 X105.403 Y87.562 F42000
G1 F600
M204 S6000
G1 X105.345 Y87.566 E.00198
G3 X105.226 Y84.63 I-.021 J-1.47 E.15375
G3 X105.554 Y84.645 I.103 J1.329 E.01112
G3 X105.702 Y87.517 I-.231 J1.452 E.13552
G1 X105.462 Y87.553 E.0082
M204 S250
G1 X105.456 Y87.955 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.407 Y87.958 E.00154
G3 X103.588 Y85.442 I-.076 J-1.86 E.11508
G3 X105.598 Y84.255 I1.745 J.659 E.07909
G3 X105.577 Y87.943 I-.267 J1.843 E.16725
G1 X105.515 Y87.949 E.00194
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.407 Y87.958 E-.02075
G1 X105.407 Y87.958 E0
G1 X105.119 Y87.95 E-.05464
G1 X104.893 Y87.91 E-.04362
G1 X104.674 Y87.843 E-.04362
G1 X104.464 Y87.749 E-.04361
G1 X104.268 Y87.63 E-.04363
G1 X104.088 Y87.487 E-.04363
G1 X103.926 Y87.324 E-.04361
G1 X103.789 Y87.145 E-.04289
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.106 Y86.149 Z5.6 F42000
G1 Z5.2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47174
G1 F600
M204 S6000
G1 X105.199 Y86.287 E.00595
G1 X105.414 Y86.307 E.0077
G1 X105.519 Y86.22 E.00486
G2 X105.451 Y85.9 I-.304 J-.102 E.01224
G1 X105.299 Y85.871 E.00549
G1 X105.167 Y85.942 E.00535
G1 X105.123 Y86.092 E.00556
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2098.783
G1 X105.167 Y85.942 E-.04467
G1 X105.299 Y85.871 E-.04297
G1 X105.451 Y85.9 E-.04415
G1 X105.532 Y86.023 E-.0422
G1 X105.537 Y86.156 E-.03806
G1 X105.519 Y86.22 E-.01915
G1 X105.414 Y86.307 E-.03905
G1 X105.199 Y86.287 E-.06192
G1 X105.106 Y86.149 E-.04783
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 27/65
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z5.6 I-.257 J-1.19 P1  F42000
G1 X81.662 Y91.212 Z5.6
G1 Z5.4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G3 X81.646 Y88.793 I-.004 J-1.209 E.11888
G3 X82.006 Y88.845 I-.001 J1.298 E.01144
G3 X81.722 Y91.21 I-.349 J1.158 E.10603
M204 S250
G1 X81.783 Y91.931 F42000
G1 F600
M204 S5000
G1 X81.431 Y91.925 E.01104
G3 X81.847 Y88.075 I.22 J-1.924 E.18997
G3 X81.843 Y91.928 I-.193 J1.926 E.1787
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.431 Y91.925 E-.07828
G1 X81.195 Y91.887 E-.04534
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04537
G1 X80.545 Y91.595 E-.04538
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.04539
G1 X80.095 Y91.154 E-.02951
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.8
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.8 F4000
            G39.3 S1
            G0 Z5.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.384 Y90.931 F42000
G1 Z5.4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378697
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00199
G1 X80.17 Y90.539 E.01052
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.528 Y88.432 E.01052
G1 X81.733 Y88.429 E.0057
G1 X82.104 Y88.494 E.01051
G1 X82.304 Y88.569 E.00599
G1 X82.626 Y88.765 E.01052
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.212 Y89.819 E.00746
G1 X83.22 Y90.132 E.00875
G1 X83.143 Y90.501 E.01052
G1 X83.067 Y90.69 E.0057
G1 X82.862 Y91.007 E.01052
G1 X82.722 Y91.155 E.0057
G1 X82.564 Y91.284 E.0057
G1 X82.233 Y91.465 E.01052
G1 X81.869 Y91.561 E.01052
G1 X81.655 Y91.576 E.00599
G1 X81.281 Y91.532 E.01052
G1 X80.928 Y91.4 E.01051
G1 X80.744 Y91.289 E.00599
G1 X80.471 Y91.045 E.01023
G1 X80.421 Y90.979 E.00232
; WIPE_START
G1 F2680.357
G1 X80.34 Y90.875 E-.02493
G1 X80.17 Y90.539 E-.07158
G1 X80.085 Y90.172 E-.0716
G1 X80.076 Y89.968 E-.03881
G1 X80.129 Y89.595 E-.07157
G1 X80.199 Y89.392 E-.04075
G1 X80.357 Y89.114 E-.06077
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.955 Y88.393 Z5.8 F42000
G1 X105.364 Y86.742 Z5.8
G1 Z5.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G1 X105.257 Y86.745 E.00364
G3 X105.365 Y85.443 I.074 J-.649 E.06814
G1 X105.445 Y85.452 E.00273
G3 X105.496 Y86.728 I-.114 J.644 E.05999
G1 X105.424 Y86.736 E.00244
M204 S10000
G1 X105.346 Y87.161 F42000
G1 F600
M204 S6000
G1 X105.341 Y87.154 E.0003
G3 X105.386 Y85.035 I-.01 J-1.06 E.11491
M73 P75 R4
G1 X105.517 Y85.05 E.00443
G3 X105.598 Y87.12 I-.185 J1.044 E.09728
G1 X105.405 Y87.151 E.00662
M204 S10000
G1 X105.399 Y87.562 F42000
G1 F600
M204 S6000
G1 X105.345 Y87.567 E.00186
G3 X105.226 Y84.63 I-.019 J-1.47 E.15364
G3 X105.566 Y84.646 I.104 J1.376 E.01152
G3 X105.702 Y87.518 I-.24 J1.451 E.13531
G1 X105.459 Y87.554 E.00833
M204 S250
G1 X105.45 Y87.955 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.348 Y87.959 E.0032
G3 X104.971 Y84.268 I-.024 J-1.862 E.17308
G3 X105.61 Y84.256 I.356 J2.001 E.02012
G3 X105.577 Y87.942 I-.286 J1.84 E.16652
G1 X105.51 Y87.949 E.00211
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.348 Y87.959 E-.0308
G1 X105.119 Y87.95 E-.04357
G1 X104.893 Y87.91 E-.04362
G1 X104.674 Y87.843 E-.04362
G1 X104.464 Y87.749 E-.04364
G1 X104.268 Y87.63 E-.0436
G1 X104.088 Y87.487 E-.04362
G1 X103.926 Y87.324 E-.04362
G1 X103.786 Y87.142 E-.04363
G1 X103.785 Y87.141 E-.00028
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.139 Y86.227 Z5.8 F42000
G1 Z5.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47172
G1 F600
M204 S6000
G1 X105.333 Y86.323 E.0077
G1 X105.515 Y86.233 E.00726
G2 X105.451 Y85.9 I-.275 J-.119 E.01285
G1 X105.286 Y85.871 E.00595
G1 X105.122 Y86.012 E.00771
G1 X105.135 Y86.167 E.00556
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2098.881
G1 X105.122 Y86.012 E-.04493
G1 X105.286 Y85.871 E-.06229
G1 X105.451 Y85.9 E-.04807
G1 X105.524 Y86.002 E-.03612
G1 X105.537 Y86.156 E-.04453
G1 X105.515 Y86.233 E-.02311
G1 X105.333 Y86.323 E-.0587
G1 X105.139 Y86.227 E-.06225
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 28/65
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z5.8 I-.253 J-1.19 P1  F42000
G1 X81.661 Y91.212 Z5.8
G1 Z5.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.513 Y91.203 E.00463
G3 X81.644 Y88.793 I.145 J-1.201 E.11412
G3 X82.006 Y88.845 I.002 J1.296 E.01153
G3 X81.72 Y91.21 I-.349 J1.158 E.10607
M204 S250
G1 X81.79 Y91.931 F42000
G1 F600
M204 S5000
G1 X81.43 Y91.926 E.01128
G3 X81.854 Y88.076 I.217 J-1.924 E.19042
G3 X81.85 Y91.927 I-.199 J1.925 E.17826
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.43 Y91.926 E-.07968
G1 X81.195 Y91.887 E-.04534
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04538
G1 X80.545 Y91.595 E-.04536
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.04537
G1 X80.099 Y91.16 E-.02811
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6 F4000
            G39.3 S1
            G0 Z6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.389 Y90.939 F42000
G1 Z5.6
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378694
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00225
G1 X80.17 Y90.539 E.01052
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01051
G1 X81.357 Y88.455 E.0057
G1 X81.733 Y88.429 E.01052
G1 X82.104 Y88.494 E.01051
G1 X82.305 Y88.569 E.006
G1 X82.626 Y88.765 E.01051
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.205 Y89.756 E.0057
G1 X83.22 Y90.132 E.01052
G1 X83.189 Y90.334 E.0057
G1 X83.067 Y90.69 E.01052
G1 X82.862 Y91.007 E.01052
G1 X82.714 Y91.162 E.00599
G1 X82.408 Y91.382 E.01052
G1 X82.059 Y91.522 E.01051
G1 X81.848 Y91.563 E.00599
G1 X81.482 Y91.567 E.01023
G1 X81.271 Y91.529 E.00599
G1 X80.918 Y91.396 E.01052
G1 X80.608 Y91.182 E.01052
G1 X80.464 Y91.037 E.0057
G1 X80.426 Y90.987 E.00177
; WIPE_START
G1 F2680.38
G1 X80.34 Y90.875 E-.02672
G1 X80.17 Y90.539 E-.07158
G1 X80.085 Y90.172 E-.0716
G1 X80.076 Y89.968 E-.03881
G1 X80.129 Y89.595 E-.07156
G1 X80.199 Y89.392 E-.04076
G1 X80.352 Y89.122 E-.05897
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.95 Y88.401 Z6 F42000
G1 X105.417 Y86.743 Z6
G1 Z5.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.365 Y85.443 I-.086 J-.648 E.07358
G1 X105.445 Y85.452 E.00273
G3 X105.476 Y86.733 I-.114 J.644 E.06067
M204 S10000
G1 X105.436 Y87.153 F42000
G1 F600
M204 S6000
G1 X105.211 Y87.147 E.0076
G3 X105.386 Y85.035 I.12 J-1.053 E.1105
G1 X105.517 Y85.05 E.00443
G3 X105.494 Y87.141 I-.185 J1.044 E.10086
M204 S10000
M73 P75 R3
G1 X105.439 Y87.557 F42000
G1 F600
M204 S6000
G1 X105.164 Y87.558 E.00933
G3 X105.408 Y84.628 I.162 J-1.462 E.15369
G1 X105.577 Y84.647 E.00578
G3 X105.525 Y87.554 I-.252 J1.449 E.14107
G1 X105.499 Y87.555 E.00087
M204 S250
G1 X105.446 Y87.955 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.348 Y87.96 E.00307
G3 X105.198 Y84.238 I-.025 J-1.863 E.18043
G3 X105.622 Y84.258 I.131 J1.719 E.01332
G3 X105.577 Y87.943 I-.299 J1.839 E.16614
G1 X105.506 Y87.95 E.00224
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.348 Y87.96 E-.03001
G1 X105.119 Y87.95 E-.04358
G1 X104.893 Y87.91 E-.04364
G1 X104.674 Y87.843 E-.04362
G1 X104.464 Y87.749 E-.04361
M73 P76 R3
G1 X104.268 Y87.63 E-.04363
G1 X104.088 Y87.487 E-.04361
G1 X103.926 Y87.324 E-.04363
G1 X103.786 Y87.142 E-.04361
G1 X103.783 Y87.137 E-.00107
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.14 Y86.227 Z6 F42000
G1 Z5.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.471908
G1 F600
M204 S6000
G1 X105.277 Y86.322 E.00594
G1 X105.429 Y86.304 E.00549
G1 X105.534 Y86.196 E.00535
G2 X105.383 Y85.876 I-.231 J-.087 E.0141
G1 X105.234 Y85.894 E.00533
G1 X105.102 Y86.065 E.00769
G1 X105.126 Y86.169 E.00381
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2097.963
G1 X105.102 Y86.065 E-.03031
G1 X105.234 Y85.894 E-.06119
G1 X105.383 Y85.876 E-.0424
G1 X105.509 Y85.957 E-.04283
G1 X105.549 Y86.088 E-.03877
G1 X105.534 Y86.196 E-.03099
G1 X105.429 Y86.304 E-.04255
G1 X105.277 Y86.322 E-.0437
G1 X105.14 Y86.227 E-.04726
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 29/65
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z6 I-.253 J-1.19 P1  F42000
G1 X81.66 Y91.212 Z6
G1 Z5.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.513 Y91.203 E.00462
G3 X81.641 Y88.793 I.145 J-1.201 E.11404
G3 X82.006 Y88.845 I.005 J1.295 E.01161
G3 X81.72 Y91.21 I-.349 J1.158 E.10607
M204 S250
G1 X81.795 Y91.932 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.94 E.00396
G3 X81.045 Y88.159 I-.027 J-1.938 E.17269
G3 X81.86 Y88.077 I.591 J1.789 E.0259
G3 X81.907 Y91.922 I-.219 J1.925 E.17568
G1 X81.854 Y91.927 E.00165
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.94 E-.03539
G1 X81.43 Y91.929 E-.04534
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04536
G1 X80.749 Y91.719 E-.0454
G1 X80.545 Y91.595 E-.04536
G1 X80.357 Y91.447 E-.04538
G1 X80.189 Y91.277 E-.04536
G1 X80.103 Y91.164 E-.02704
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.2
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.2 F4000
            G39.3 S1
            G0 Z6.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.393 Y90.943 F42000
G1 Z5.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378693
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00241
G1 X80.17 Y90.539 E.01052
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01051
G1 X81.357 Y88.455 E.0057
G1 X81.733 Y88.429 E.01052
G1 X82.104 Y88.494 E.01051
G1 X82.304 Y88.569 E.00599
G1 X82.626 Y88.765 E.01052
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.205 Y89.756 E.0057
G1 X83.22 Y90.132 E.01052
G1 X83.143 Y90.501 E.01052
G1 X83.067 Y90.69 E.0057
G1 X82.862 Y91.007 E.01052
G1 X82.714 Y91.162 E.00599
G1 X82.417 Y91.376 E.01023
G1 X82.223 Y91.468 E.00599
G1 X81.859 Y91.562 E.01052
G1 X81.482 Y91.567 E.01052
G1 X81.271 Y91.529 E.00599
G1 X80.918 Y91.396 E.01052
G1 X80.608 Y91.182 E.01052
G1 X80.464 Y91.037 E.0057
G1 X80.429 Y90.991 E.00162
; WIPE_START
G1 F2680.389
G1 X80.34 Y90.875 E-.0278
G1 X80.17 Y90.539 E-.07158
G1 X80.085 Y90.172 E-.07159
G1 X80.076 Y89.968 E-.03881
G1 X80.129 Y89.595 E-.07156
G1 X80.199 Y89.392 E-.04074
G1 X80.349 Y89.127 E-.05792
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.947 Y88.402 Z6.2 F42000
G1 X105.356 Y86.743 Z6.2
G1 Z5.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G1 X105.257 Y86.745 E.00335
G3 X105.365 Y85.443 I.074 J-.649 E.06815
G1 X105.445 Y85.452 E.00273
G3 X105.496 Y86.728 I-.114 J.644 E.05999
G1 X105.415 Y86.736 E.00273
M204 S10000
G1 X105.341 Y87.154 F42000
G1 F600
M204 S6000
G3 X105.386 Y85.035 I-.01 J-1.06 E.1149
G1 X105.516 Y85.05 E.00443
G3 X105.401 Y87.151 I-.185 J1.044 E.10405
M204 S10000
G1 X105.394 Y87.563 F42000
G1 F600
M204 S6000
G1 X105.345 Y87.558 E.00168
G3 X105.408 Y84.628 I-.013 J-1.466 E.15895
G1 X105.588 Y84.649 E.00613
G3 X105.7 Y87.511 I-.256 J1.444 E.13457
G1 X105.453 Y87.553 E.00849
M204 S250
G1 X105.442 Y87.956 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.348 Y87.959 E.00294
G3 X105.199 Y84.238 I-.023 J-1.863 E.18022
G3 X105.634 Y84.259 I.131 J1.767 E.0137
G3 X105.577 Y87.942 I-.308 J1.837 E.16588
G1 X105.502 Y87.95 E.00237
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.348 Y87.959 E-.0292
G1 X105.119 Y87.95 E-.04357
G1 X104.893 Y87.91 E-.04362
G1 X104.674 Y87.843 E-.04362
G1 X104.464 Y87.749 E-.04362
G1 X104.268 Y87.63 E-.04362
G1 X104.088 Y87.487 E-.04362
G1 X103.912 Y87.306 E-.04791
G1 X103.786 Y87.142 E-.03929
G1 X103.781 Y87.133 E-.00194
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.106 Y86.149 Z6.2 F42000
G1 Z5.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47175
G1 F600
M204 S6000
G1 X105.199 Y86.287 E.00595
G1 X105.414 Y86.307 E.0077
G1 X105.552 Y86.157 E.00726
G2 X105.371 Y85.87 I-.324 J.004 E.01272
G1 X105.167 Y85.942 E.0077
G1 X105.123 Y86.092 E.00556
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2098.734
G1 X105.167 Y85.942 E-.04493
G1 X105.371 Y85.87 E-.06223
G1 X105.491 Y85.956 E-.04247
G1 X105.544 Y86.077 E-.03827
G1 X105.552 Y86.157 E-.02309
G1 X105.414 Y86.307 E-.05868
G1 X105.199 Y86.287 E-.06225
G1 X105.106 Y86.149 E-.04809
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 30/65
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z6.2 I-.257 J-1.19 P1  F42000
M73 P77 R3
G1 X81.66 Y91.212 Z6.2
G1 Z6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.513 Y91.203 E.0046
G3 X81.638 Y88.793 I.145 J-1.201 E.11396
G3 X82.006 Y88.845 I.008 J1.294 E.01169
G3 X81.719 Y91.21 I-.349 J1.158 E.10609
M204 S250
G1 X81.802 Y91.931 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.94 E.00419
G3 X81.045 Y88.159 I-.027 J-1.938 E.17269
G3 X81.867 Y88.078 I.591 J1.79 E.02611
G3 X81.907 Y91.922 I-.225 J1.925 E.17547
G1 X81.862 Y91.926 E.00141
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.94 E-.03681
G1 X81.43 Y91.929 E-.04535
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04539
G1 X80.545 Y91.595 E-.04537
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.04537
G1 X80.107 Y91.17 E-.02561
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.4
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.4 F4000
            G39.3 S1
            G0 Z6.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.396 Y90.948 F42000
G1 Z6
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378694
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00256
G1 X80.17 Y90.539 E.01052
G1 X80.113 Y90.343 E.0057
G1 X80.076 Y89.968 E.01052
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01051
G1 X81.528 Y88.432 E.01052
G1 X81.733 Y88.429 E.00571
G1 X82.104 Y88.494 E.01051
G1 X82.304 Y88.569 E.00599
G1 X82.626 Y88.765 E.01052
G1 X82.891 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.214 Y89.838 E.00801
G1 X83.22 Y90.132 E.0082
G1 X83.143 Y90.501 E.01052
G1 X83.067 Y90.69 E.0057
G1 X82.862 Y91.007 E.01052
G1 X82.722 Y91.155 E.0057
G1 X82.564 Y91.284 E.0057
G1 X82.233 Y91.465 E.01052
G1 X81.869 Y91.561 E.01052
G1 X81.655 Y91.576 E.00599
G1 X81.281 Y91.532 E.01052
G1 X80.928 Y91.4 E.01051
G1 X80.744 Y91.289 E.00599
G1 X80.471 Y91.045 E.01024
G1 X80.433 Y90.995 E.00174
; WIPE_START
G1 F2680.375
G1 X80.34 Y90.875 E-.02884
G1 X80.17 Y90.539 E-.07158
G1 X80.113 Y90.343 E-.03881
G1 X80.076 Y89.968 E-.0716
G1 X80.129 Y89.595 E-.07157
G1 X80.199 Y89.392 E-.04075
G1 X80.347 Y89.132 E-.05685
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.944 Y88.406 Z6.4 F42000
G1 X105.351 Y86.743 Z6.4
G1 Z6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G1 X105.257 Y86.745 E.0032
G3 X105.365 Y85.443 I.074 J-.649 E.06815
G1 X105.445 Y85.452 E.00273
G3 X105.496 Y86.728 I-.114 J.644 E.05999
G1 X105.411 Y86.737 E.00287
M204 S10000
G1 X105.341 Y87.154 F42000
G1 F600
M204 S6000
G3 X105.386 Y85.035 I-.009 J-1.06 E.1149
G1 X105.516 Y85.05 E.00443
G3 X105.401 Y87.151 I-.185 J1.044 E.10406
M204 S10000
G1 X105.428 Y87.558 F42000
G1 F600
M204 S6000
G1 X105.165 Y87.549 E.0089
G3 X105.408 Y84.628 I.166 J-1.457 E.15286
G1 X105.588 Y84.649 E.00613
G3 X105.524 Y87.546 I-.256 J1.444 E.14066
G1 X105.487 Y87.55 E.00125
M204 S250
G1 X105.438 Y87.956 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.348 Y87.958 E.0028
G3 X105.428 Y84.236 I-.023 J-1.862 E.18739
G1 X105.646 Y84.261 E.00686
G3 X105.577 Y87.941 I-.32 J1.835 E.16549
G1 X105.497 Y87.949 E.0025
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.348 Y87.958 E-.02837
G1 X105.119 Y87.95 E-.04356
G1 X104.893 Y87.91 E-.04364
G1 X104.674 Y87.843 E-.04361
G1 X104.455 Y87.743 E-.04567
G1 X104.268 Y87.63 E-.04157
G1 X104.088 Y87.487 E-.04361
G1 X103.926 Y87.324 E-.04362
G1 X103.786 Y87.142 E-.04362
G1 X103.779 Y87.13 E-.00273
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.134 Y86.215 Z6.4 F42000
G1 Z6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47174
G1 F600
M204 S6000
G1 X105.251 Y86.309 E.00535
G1 X105.454 Y86.29 E.00726
G1 X105.544 Y86.171 E.00534
G2 X105.333 Y85.871 I-.236 J-.058 E.0148
G1 X105.22 Y85.898 E.00418
G1 X105.122 Y86.012 E.00534
G1 X105.131 Y86.155 E.00512
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2098.783
G1 X105.122 Y86.012 E-.04102
G1 X105.22 Y85.898 E-.04281
G1 X105.333 Y85.871 E-.03345
G1 X105.491 Y85.936 E-.0487
G1 X105.546 Y86.062 E-.03905
G1 X105.544 Y86.171 E-.03116
G1 X105.454 Y86.29 E-.04279
G1 X105.251 Y86.309 E-.05817
G1 X105.134 Y86.215 E-.04284
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 31/65
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z6.4 I-.253 J-1.19 P1  F42000
G1 X81.659 Y91.212 Z6.4
G1 Z6.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.513 Y91.203 E.0046
G3 X81.636 Y88.793 I.145 J-1.201 E.11389
G3 X82.006 Y88.845 I.01 J1.294 E.01178
G3 X81.719 Y91.21 I-.349 J1.158 E.10609
M204 S250
G1 X81.81 Y91.931 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.94 E.00444
G3 X81.045 Y88.159 I-.027 J-1.938 E.17269
G3 X81.874 Y88.078 I.592 J1.791 E.02632
G3 X81.907 Y91.922 I-.232 J1.924 E.17527
G1 X81.87 Y91.925 E.00117
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.94 E-.03831
G1 X81.43 Y91.929 E-.04534
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04539
G1 X80.545 Y91.595 E-.04537
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.04537
G1 X80.112 Y91.177 E-.02411
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.6
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.6 F4000
            G39.3 S1
            G0 Z6.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.402 Y90.956 F42000
G1 Z6.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378696
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00284
G1 X80.17 Y90.539 E.01052
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
M73 P78 R3
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.528 Y88.432 E.01052
G1 X81.733 Y88.429 E.0057
G1 X82.104 Y88.494 E.01052
G1 X82.305 Y88.569 E.00599
G1 X82.626 Y88.765 E.01051
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.205 Y89.756 E.0057
G1 X83.22 Y90.132 E.01052
G1 X83.143 Y90.501 E.01052
G1 X83.067 Y90.69 E.0057
G1 X82.862 Y91.007 E.01052
G1 X82.714 Y91.162 E.00599
G1 X82.408 Y91.382 E.01052
G1 X82.059 Y91.522 E.01052
G1 X81.848 Y91.563 E.00599
G1 X81.482 Y91.567 E.01023
G1 X81.271 Y91.529 E.00599
G1 X80.918 Y91.396 E.01052
G1 X80.608 Y91.182 E.01052
G1 X80.464 Y91.037 E.0057
G1 X80.438 Y91.003 E.00118
; WIPE_START
G1 F2680.365
G1 X80.34 Y90.875 E-.03073
G1 X80.17 Y90.539 E-.07157
G1 X80.085 Y90.172 E-.0716
G1 X80.076 Y89.968 E-.03881
G1 X80.129 Y89.595 E-.07157
G1 X80.199 Y89.392 E-.04075
G1 X80.342 Y89.14 E-.05497
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.939 Y88.412 Z6.6 F42000
G1 X105.347 Y86.743 Z6.6
G1 Z6.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G1 X105.257 Y86.745 E.00305
G3 X105.365 Y85.443 I.07 J-.65 E.06841
G1 X105.437 Y85.451 E.00246
G3 X105.495 Y86.726 I-.11 J.644 E.05999
G1 X105.407 Y86.736 E.00302
M204 S10000
G1 X105.341 Y87.153 F42000
G1 F600
M204 S6000
G3 X105.386 Y85.035 I-.014 J-1.06 E.11519
G1 X105.507 Y85.049 E.00412
G3 X105.4 Y87.151 I-.181 J1.044 E.10405
M204 S10000
G1 X105.422 Y87.558 F42000
G1 F600
M204 S6000
G1 X105.164 Y87.558 E.00873
G3 X105.408 Y84.628 I.162 J-1.462 E.15368
G1 X105.577 Y84.647 E.00579
G3 X105.525 Y87.554 I-.252 J1.449 E.14106
G1 X105.482 Y87.555 E.00146
M204 S250
G1 X105.433 Y87.956 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.348 Y87.959 E.00268
G3 X105.428 Y84.236 I-.023 J-1.863 E.18749
G1 X105.645 Y84.26 E.00684
G3 X105.577 Y87.942 I-.32 J1.836 E.16556
G1 X105.493 Y87.95 E.00264
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.348 Y87.959 E-.0276
G1 X105.119 Y87.95 E-.04356
G1 X104.893 Y87.91 E-.04364
G1 X104.684 Y87.846 E-.04147
G1 X104.464 Y87.748 E-.04585
G1 X104.268 Y87.63 E-.04352
G1 X104.088 Y87.487 E-.04363
G1 X103.926 Y87.324 E-.04361
G1 X103.786 Y87.142 E-.04364
G1 X103.777 Y87.126 E-.00349
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.107 Y86.121 Z6.6 F42000
G1 Z6.2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47144
G1 F600
M204 S6000
G1 X105.221 Y86.301 E.0076
G1 X105.376 Y86.322 E.00558
G1 X105.503 Y86.243 E.00533
G1 X105.556 Y86.063 E.00668
G1 X105.491 Y85.936 E.00507
G1 X105.315 Y85.873 E.00668
G1 X105.139 Y85.972 E.00718
G1 X105.119 Y86.062 E.0033
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2100.252
G1 X105.139 Y85.972 E-.02645
G1 X105.315 Y85.873 E-.05756
G1 X105.491 Y85.936 E-.0535
G1 X105.556 Y86.063 E-.0406
G1 X105.503 Y86.243 E-.05353
G1 X105.376 Y86.322 E-.04274
G1 X105.221 Y86.301 E-.04469
G1 X105.107 Y86.121 E-.06093
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 32/65
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z6.6 I-.258 J-1.189 P1  F42000
G1 X81.659 Y91.212 Z6.6
G1 Z6.4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.513 Y91.203 E.00459
G3 X81.633 Y88.793 I.145 J-1.2 E.11379
G3 X82.007 Y88.845 I.013 J1.294 E.01186
G3 X81.719 Y91.21 I-.349 J1.158 E.10608
M204 S250
G1 X81.818 Y91.93 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.94 E.0047
G3 X81.045 Y88.159 I-.027 J-1.938 E.17269
G3 X81.88 Y88.079 I.592 J1.792 E.02652
G3 X81.907 Y91.922 I-.238 J1.923 E.17507
G1 X81.878 Y91.925 E.0009
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.94 E-.03988
G1 X81.43 Y91.929 E-.04535
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04539
G1 X80.545 Y91.595 E-.04537
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.04539
G1 X80.117 Y91.183 E-.02253
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.8
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.8 F4000
            G39.3 S1
            G0 Z6.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.407 Y90.962 F42000
G1 Z6.4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378694
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00307
G1 X80.17 Y90.539 E.01052
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.528 Y88.432 E.01052
G1 X81.733 Y88.429 E.0057
G1 X82.104 Y88.494 E.01052
G1 X82.295 Y88.565 E.0057
G1 X82.618 Y88.759 E.01052
G1 X82.778 Y88.902 E.00599
G1 X83.007 Y89.201 E.01052
M73 P79 R3
G1 X83.158 Y89.547 E.01052
G1 X83.205 Y89.756 E.00599
G1 X83.22 Y90.132 E.01052
G1 X83.164 Y90.427 E.00838
G1 X83.067 Y90.69 E.00783
G1 X82.862 Y91.007 E.01052
G1 X82.714 Y91.162 E.00599
G1 X82.408 Y91.382 E.01052
G1 X82.059 Y91.522 E.01052
G1 X81.848 Y91.563 E.00599
G1 X81.482 Y91.567 E.01023
G1 X81.271 Y91.529 E.00599
G1 X80.918 Y91.396 E.01052
G1 X80.608 Y91.182 E.01052
G1 X80.464 Y91.037 E.00571
G1 X80.443 Y91.01 E.00095
; WIPE_START
G1 F2680.375
G1 X80.34 Y90.875 E-.0323
G1 X80.17 Y90.539 E-.07158
G1 X80.085 Y90.172 E-.0716
G1 X80.076 Y89.968 E-.03881
G1 X80.129 Y89.595 E-.07156
G1 X80.199 Y89.392 E-.04074
G1 X80.338 Y89.147 E-.05342
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.935 Y88.417 Z6.8 F42000
G1 X105.343 Y86.743 Z6.8
G1 Z6.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G1 X105.257 Y86.745 E.00293
G3 X105.365 Y85.443 I.074 J-.649 E.06813
G1 X105.445 Y85.452 E.00273
G3 X105.496 Y86.728 I-.114 J.644 E.05999
G1 X105.403 Y86.737 E.00315
M204 S10000
G1 X105.341 Y87.154 F42000
G1 F600
M204 S6000
G3 X105.386 Y85.035 I-.009 J-1.06 E.11489
G1 X105.517 Y85.05 E.00443
G3 X105.401 Y87.151 I-.185 J1.044 E.10407
M204 S10000
G1 X105.416 Y87.558 F42000
G1 F600
M204 S6000
G1 X105.165 Y87.549 E.00851
G3 X105.408 Y84.628 I.167 J-1.457 E.15283
G1 X105.588 Y84.649 E.00613
G3 X105.524 Y87.546 I-.256 J1.444 E.14068
G1 X105.476 Y87.551 E.00164
M204 S250
G1 X105.429 Y87.957 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.348 Y87.96 E.00255
G3 X105.428 Y84.236 I-.017 J-1.864 E.18716
G1 X105.656 Y84.262 E.0072
G3 X105.577 Y87.944 I-.325 J1.835 E.16559
G1 X105.489 Y87.952 E.00277
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.348 Y87.96 E-.02683
G1 X105.119 Y87.95 E-.04358
G1 X104.893 Y87.91 E-.04361
G1 X104.674 Y87.843 E-.04362
G1 X104.464 Y87.749 E-.04364
G1 X104.268 Y87.63 E-.0436
G1 X104.088 Y87.487 E-.04363
G1 X103.926 Y87.324 E-.04364
G1 X103.786 Y87.142 E-.04359
G1 X103.775 Y87.123 E-.00427
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.14 Y86.227 Z6.8 F42000
G1 Z6.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47177
G1 F600
M204 S6000
G1 X105.277 Y86.322 E.00595
G1 X105.484 Y86.263 E.0077
G1 X105.558 Y86.091 E.00667
G1 X105.504 Y85.951 E.00537
G1 X105.371 Y85.87 E.00554
G1 X105.22 Y85.898 E.00547
G1 X105.122 Y86.012 E.00534
G1 X105.135 Y86.167 E.00557
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2098.636
G1 X105.122 Y86.012 E-.04442
G1 X105.22 Y85.898 E-.04266
G1 X105.371 Y85.87 E-.04369
G1 X105.504 Y85.951 E-.0442
G1 X105.558 Y86.091 E-.04283
G1 X105.484 Y86.263 E-.05326
G1 X105.277 Y86.322 E-.06146
G1 X105.14 Y86.227 E-.04748
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 33/65
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z6.8 I-.253 J-1.19 P1  F42000
G1 X81.659 Y91.212 Z6.8
G1 Z6.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.513 Y91.203 E.00459
G3 X81.63 Y88.793 I.144 J-1.201 E.11373
G3 X82.006 Y88.845 I.015 J1.294 E.01194
G3 X81.719 Y91.21 I-.349 J1.158 E.10609
M204 S250
G1 X81.827 Y91.93 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.94 E.00497
G3 X81.045 Y88.159 I-.026 J-1.938 E.17268
G3 X81.887 Y88.08 I.592 J1.793 E.02673
G3 X81.907 Y91.922 I-.245 J1.922 E.17488
G1 X81.887 Y91.924 E.00063
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.94 E-.04154
G1 X81.43 Y91.929 E-.04535
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04538
G1 X80.545 Y91.595 E-.04538
G1 X80.357 Y91.447 E-.04536
G1 X80.189 Y91.277 E-.04537
G1 X80.122 Y91.19 E-.02088
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7 F4000
            G39.3 S1
            G0 Z7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.412 Y90.967 F42000
G1 Z6.6
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378697
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00326
G1 X80.17 Y90.539 E.01052
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.357 Y88.455 E.0057
G1 X81.733 Y88.429 E.01052
G1 X82.104 Y88.494 E.01051
G1 X82.304 Y88.569 E.00599
G1 X82.626 Y88.765 E.01052
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.205 Y89.756 E.0057
G1 X83.22 Y90.132 E.01052
G1 X83.143 Y90.501 E.01052
G1 X83.067 Y90.69 E.0057
G1 X82.862 Y91.007 E.01052
G1 X82.722 Y91.155 E.0057
G1 X82.483 Y91.335 E.00834
G1 X82.233 Y91.465 E.00787
G1 X81.869 Y91.561 E.01052
G1 X81.655 Y91.576 E.00599
G1 X81.281 Y91.532 E.01052
G1 X80.928 Y91.4 E.01051
G1 X80.744 Y91.289 E.00599
G1 X80.471 Y91.045 E.01023
G1 X80.448 Y91.015 E.00105
; WIPE_START
G1 F2680.352
G1 X80.34 Y90.875 E-.03358
G1 X80.17 Y90.539 E-.07157
G1 X80.085 Y90.172 E-.07161
G1 X80.076 Y89.968 E-.03881
G1 X80.129 Y89.595 E-.07157
G1 X80.199 Y89.392 E-.04075
G1 X80.334 Y89.153 E-.05212
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.935 Y88.454 Z7 F42000
G1 X105.359 Y86.85 Z7
G1 Z6.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.298 Y85.346 I-.035 J-.752 E.08037
G3 X105.374 Y85.347 I.031 J.433 E.0026
G3 X105.419 Y86.845 I-.05 J.751 E.07516
M204 S10000
G1 X105.443 Y87.251 F42000
G1 F600
M204 S6000
G1 X105.079 Y87.23 E.01235
G3 X105.072 Y84.967 I.249 J-1.133 E.10611
G3 X105.414 Y84.942 I.255 J1.122 E.01163
G3 X105.503 Y87.244 I-.086 J1.156 E.11444
M204 S10000
G1 X105.396 Y87.661 F42000
G1 F600
M204 S6000
G1 X105.363 Y87.665 E.0011
G3 X104.991 Y84.567 I-.038 J-1.567 E.15653
G3 X105.453 Y84.536 I.335 J1.54 E.01571
G3 X105.743 Y87.609 I-.127 J1.562 E.14806
G1 X105.455 Y87.652 E.00985
M204 S250
G1 X105.432 Y88.054 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P80 R3
G1 F600
M204 S5000
G1 X105.365 Y88.059 E.00211
G1 X105.071 Y88.041 E.00925
G1 X104.888 Y88.009 E.00582
G1 X104.606 Y87.92 E.00925
G3 X104.04 Y87.574 I.961 J-2.214 E.02088
G1 X103.833 Y87.363 E.00926
G1 X103.72 Y87.216 E.00582
G1 X103.57 Y86.961 E.00926
G1 X103.496 Y86.791 E.00581
G1 X103.413 Y86.508 E.00926
G3 X103.386 Y85.845 I2.387 J-.429 E.02087
G1 X103.446 Y85.556 E.00926
G1 X103.506 Y85.38 E.00582
G1 X103.634 Y85.114 E.00926
G3 X104.06 Y84.605 I2.048 J1.28 E.02087
G1 X104.298 Y84.43 E.00926
G1 X104.461 Y84.341 E.00582
G1 X104.734 Y84.229 E.00926
G1 X104.913 Y84.182 E.00582
G1 X105.206 Y84.14 E.00926
G1 X105.394 Y84.138 E.0059
G1 X105.49 Y84.146 E.00304
G3 X105.868 Y84.213 I-.08 J1.557 E.01206
G1 X105.96 Y84.243 E.00303
G3 X106.31 Y84.4 I-.458 J1.492 E.01207
G1 X106.392 Y84.452 E.00304
G3 X106.693 Y84.689 I-.809 J1.336 E.01206
G1 X106.761 Y84.759 E.00304
G3 X106.995 Y85.063 I-1.111 J1.098 E.01206
G1 X107.044 Y85.147 E.00304
G3 X107.196 Y85.498 I-1.342 J.793 E.01206
G1 X107.224 Y85.591 E.00304
G3 X107.286 Y85.97 I-1.497 J.441 E.01206
G1 X107.29 Y86.067 E.00303
G3 X107.258 Y86.449 I-1.56 J.062 E.01206
G1 X107.239 Y86.544 E.00304
G3 X107.115 Y86.907 I-1.528 J-.32 E.01206
G1 X107.073 Y86.994 E.00304
G3 X106.864 Y87.316 I-1.403 J-.683 E.01206
G1 X106.803 Y87.391 E.00304
G3 X106.522 Y87.652 I-1.193 J-1.004 E.01205
G1 X106.445 Y87.711 E.00305
G3 X106.109 Y87.895 I-.913 J-1.267 E.01205
G1 X106.019 Y87.933 E.00305
G1 X105.841 Y87.992 E.0059
G1 X105.55 Y88.046 E.00925
G1 X105.492 Y88.05 E.00183
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.365 Y88.059 E-.02418
G1 X105.071 Y88.041 E-.05608
G1 X104.888 Y88.009 E-.03527
G1 X104.606 Y87.92 E-.05607
G1 X104.269 Y87.742 E-.07255
G1 X104.04 Y87.574 E-.05389
G1 X103.833 Y87.363 E-.05611
G1 X103.75 Y87.255 E-.02584
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.07 Y86.197 Z7 F42000
G1 Z6.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.56764
G1 F600
M204 S6000
G1 X105.216 Y86.341 E.00896
G1 X105.402 Y86.364 E.00817
G1 X105.574 Y86.229 E.00952
G1 X105.599 Y86.121 E.00487
G1 X105.55 Y85.927 E.0087
G1 X105.369 Y85.822 E.00917
G1 X105.182 Y85.865 E.00834
G1 X105.069 Y86.033 E.00881
G1 X105.07 Y86.137 E.00456
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F1715.201
G1 X105.069 Y86.033 E-.02436
G1 X105.182 Y85.865 E-.04709
G1 X105.369 Y85.822 E-.04457
G1 X105.55 Y85.927 E-.04903
G1 X105.599 Y86.121 E-.0465
G1 X105.574 Y86.229 E-.02603
G1 X105.402 Y86.364 E-.05088
G1 X105.216 Y86.341 E-.04366
G1 X105.07 Y86.197 E-.04787
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 34/65
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z7 I-.255 J-1.19 P1  F42000
G1 X81.659 Y91.212 Z7
G1 Z6.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.513 Y91.203 E.00459
G3 X81.628 Y88.794 I.144 J-1.201 E.11366
G3 X82.006 Y88.845 I.018 J1.295 E.01202
G3 X81.719 Y91.21 I-.349 J1.158 E.10609
M204 S250
G1 X81.837 Y91.929 F42000
G1 F600
M204 S5000
G1 X81.668 Y91.937 E.00528
G3 X81.893 Y88.081 I-.018 J-1.936 E.1989
G3 X82.497 Y91.743 I-.238 J1.92 E.15579
G3 X81.906 Y91.92 I-.846 J-1.741 E.01942
G1 X81.896 Y91.922 E.00032
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.668 Y91.937 E-.04337
G1 X81.43 Y91.929 E-.04532
G1 X81.195 Y91.887 E-.04538
G1 X80.967 Y91.817 E-.04536
G1 X80.749 Y91.719 E-.04539
G1 X80.545 Y91.595 E-.04537
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.04538
G1 X80.128 Y91.198 E-.01906
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.2
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.2 F4000
            G39.3 S1
            G0 Z7.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.418 Y90.977 F42000
G1 Z6.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378695
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00358
G1 X80.17 Y90.539 E.01052
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.528 Y88.432 E.01052
G1 X81.733 Y88.429 E.0057
G1 X82.104 Y88.494 E.01051
G1 X82.305 Y88.569 E.006
G1 X82.626 Y88.765 E.01052
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.205 Y89.756 E.0057
G1 X83.22 Y90.132 E.01052
G1 X83.189 Y90.334 E.0057
G1 X83.067 Y90.69 E.01052
G1 X82.862 Y91.007 E.01052
G1 X82.714 Y91.162 E.00599
G1 X82.417 Y91.377 E.01024
G1 X82.223 Y91.468 E.00598
G1 X81.859 Y91.562 E.01052
G1 X81.482 Y91.567 E.01052
G1 X81.271 Y91.529 E.00599
G1 X80.918 Y91.396 E.01052
G1 X80.609 Y91.182 E.01051
G1 X80.464 Y91.037 E.00571
G1 X80.454 Y91.025 E.00044
; WIPE_START
G1 F2680.366
G1 X80.34 Y90.875 E-.03575
G1 X80.17 Y90.539 E-.0716
G1 X80.085 Y90.172 E-.07158
G1 X80.076 Y89.968 E-.03881
G1 X80.129 Y89.595 E-.07157
G1 X80.199 Y89.392 E-.04075
G1 X80.329 Y89.163 E-.04994
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.927 Y88.444 Z7.2 F42000
G1 X105.372 Y86.791 Z7.2
G1 Z6.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.269 Y85.403 I-.04 J-.695 E.07327
G3 X105.438 Y85.408 I.073 J.399 E.00579
G3 X105.432 Y86.785 I-.106 J.688 E.06705
M204 S10000
G1 X105.379 Y87.199 F42000
G1 F600
M204 S6000
G3 X105.208 Y85 I-.047 J-1.103 E.11475
G3 X105.477 Y85.003 I.127 J.777 E.00916
G3 X105.439 Y87.195 I-.145 J1.094 E.10881
M204 S10000
G1 X105.387 Y87.612 F42000
G1 F600
M204 S6000
G1 X105.38 Y87.61 E.00026
G3 X104.62 Y84.76 I-.054 J-1.512 E.13781
G3 X105.516 Y84.597 I.725 J1.44 E.03128
G3 X105.639 Y87.578 I-.191 J1.5 E.14368
G1 X105.447 Y87.604 E.00657
M204 S250
G1 X105.438 Y87.998 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.38 Y88.001 E.00181
G3 X104.449 Y84.406 I-.056 J-1.903 E.16078
G3 X105.554 Y84.207 I.897 J1.81 E.03566
G3 X105.709 Y87.962 I-.229 J1.89 E.16823
G1 X105.498 Y87.99 E.00667
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.38 Y88.001 E-.02237
G1 X105.039 Y87.982 E-.06497
M73 P81 R3
G1 X104.918 Y87.961 E-.0234
G1 X104.478 Y87.805 E-.08855
G1 X104.092 Y87.549 E-.08817
G1 X103.852 Y87.304 E-.06509
G1 X103.777 Y87.206 E-.02337
G1 X103.767 Y87.187 E-.00408
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.103 Y86.196 Z7.2 F42000
G1 Z6.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.52086
G1 F600
M204 S6000
G1 X105.252 Y86.326 E.00787
G1 X105.377 Y86.341 E.00502
G1 X105.538 Y86.223 E.00793
G2 X105.382 Y85.862 I-.214 J-.122 E.01816
G1 X105.208 Y85.882 E.00693
G1 X105.102 Y86.022 E.007
G1 X105.103 Y86.136 E.0045
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F1883.081
G1 X105.102 Y86.022 E-.02976
G1 X105.208 Y85.882 E-.04634
G1 X105.382 Y85.862 E-.04588
G1 X105.532 Y85.949 E-.04558
G1 X105.571 Y86.095 E-.03994
G1 X105.538 Y86.223 E-.03469
G1 X105.377 Y86.341 E-.05249
G1 X105.252 Y86.326 E-.03321
G1 X105.103 Y86.196 E-.05211
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 35/65
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z7.2 I-.255 J-1.19 P1  F42000
G1 X81.659 Y91.212 Z7.2
G1 Z7
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.513 Y91.202 E.00459
G3 X81.625 Y88.794 I.144 J-1.2 E.11354
G3 X82.007 Y88.845 I.02 J1.296 E.01211
G3 X81.719 Y91.209 I-.349 J1.157 E.10604
M204 S250
G1 X81.845 Y91.928 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.94 E.00556
G3 X81.045 Y88.159 I-.026 J-1.938 E.17265
G3 X81.9 Y88.081 I.593 J1.797 E.02715
G3 X81.907 Y91.922 I-.257 J1.921 E.1745
G1 X81.905 Y91.922 E.00005
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.94 E-.04508
G1 X81.43 Y91.929 E-.04534
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04539
G1 X80.545 Y91.595 E-.04536
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.04539
G1 X80.134 Y91.205 E-.01732
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.4
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.4 F4000
            G39.3 S1
            G0 Z7.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.438 Y90.998 F42000
G1 Z7
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378695
G1 F600
M204 S6000
G1 X80.252 Y90.726 E.00921
G1 X80.17 Y90.539 E.0057
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.357 Y88.455 E.0057
G1 X81.733 Y88.429 E.01052
G1 X82.104 Y88.494 E.01052
G1 X82.304 Y88.569 E.00599
G1 X82.626 Y88.765 E.01052
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.217 Y89.871 E.00893
G1 X83.22 Y90.132 E.00728
G1 X83.189 Y90.334 E.0057
G1 X83.067 Y90.69 E.01052
G1 X82.862 Y91.007 E.01052
G1 X82.714 Y91.162 E.00599
G1 X82.417 Y91.376 E.01023
G1 X82.223 Y91.468 E.00599
G1 X81.859 Y91.562 E.01052
G1 X81.482 Y91.567 E.01052
G1 X81.271 Y91.529 E.00599
G1 X80.918 Y91.396 E.01052
G1 X80.608 Y91.182 E.01052
G1 X80.473 Y91.046 E.00534
; WIPE_START
G1 F2680.369
G1 X80.252 Y90.726 E-.07401
G1 X80.17 Y90.539 E-.03877
G1 X80.085 Y90.172 E-.07161
G1 X80.076 Y89.968 E-.03881
G1 X80.129 Y89.595 E-.07157
G1 X80.199 Y89.392 E-.04073
G1 X80.314 Y89.188 E-.0445
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.911 Y88.445 Z7.4 F42000
G1 X105.362 Y86.736 Z7.4
G1 Z7
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.311 Y85.454 I-.026 J-.641 E.0683
G1 X105.459 Y85.466 E.00501
G3 X105.421 Y86.731 I-.124 J.63 E.06108
M204 S10000
G1 X105.381 Y87.143 F42000
G1 F600
M204 S6000
G3 X105.295 Y85.045 I-.046 J-1.049 E.11182
G1 X105.54 Y85.064 E.00831
G3 X105.441 Y87.139 I-.204 J1.03 E.10114
M204 S10000
G1 X105.401 Y87.553 F42000
G1 F600
M204 S6000
G3 X104.602 Y84.828 I-.075 J-1.457 E.13209
G3 X105.58 Y84.659 I.758 J1.464 E.03412
G3 X105.461 Y87.548 I-.254 J1.437 E.14193
M204 S250
G1 X105.434 Y87.946 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.396 Y87.949 E.00122
G3 X104.073 Y84.735 I-.068 J-1.851 E.14142
G3 X105.618 Y84.268 I1.25 J1.348 E.05238
G3 X105.839 Y87.878 I-.29 J1.83 E.15707
G1 X105.493 Y87.936 E.011
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.396 Y87.949 E-.01875
G1 X105.007 Y87.924 E-.07399
G1 X104.52 Y87.767 E-.09715
G1 X104.143 Y87.524 E-.08525
G1 X103.835 Y87.196 E-.0855
G1 X103.784 Y87.108 E-.01937
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.112 Y86.081 Z7.4 F42000
M73 P81 R2
G1 Z7
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.46839
G1 F600
M204 S6000
G1 X105.163 Y86.228 E.00552
G1 X105.287 Y86.313 E.00533
G1 X105.484 Y86.257 E.00723
G1 X105.545 Y86.114 E.00548
G1 X105.507 Y85.965 E.00545
G1 X105.327 Y85.878 E.00707
G1 X105.184 Y85.943 E.00558
G1 X105.14 Y86.028 E.00337
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2115.308
G1 X105.184 Y85.943 E-.0284
G1 X105.327 Y85.878 E-.04712
G1 X105.507 Y85.965 E-.05965
G1 X105.545 Y86.114 E-.04597
G1 X105.484 Y86.257 E-.04628
G1 X105.287 Y86.313 E-.06104
G1 X105.163 Y86.228 E-.04496
G1 X105.112 Y86.081 E-.04657
; WIPE_END
M73 P82 R2
G1 E-.02 F1800
; layer num/total_layer_count: 36/65
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z7.4 I-.26 J-1.189 P1  F42000
G1 X81.66 Y91.212 Z7.4
G1 Z7.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.514 Y91.196 E.0046
G3 X81.623 Y88.794 I.144 J-1.197 E.11318
G3 X82.006 Y88.845 I.023 J1.296 E.01219
G3 X81.715 Y91.204 I-.349 J1.154 E.1059
M204 S250
G1 X81.855 Y91.928 F42000
G1 F600
M204 S5000
G1 X81.668 Y91.939 E.00587
G3 X81.045 Y88.159 I-.026 J-1.937 E.17258
G3 X81.906 Y88.082 I.594 J1.799 E.02735
G3 X81.915 Y91.92 I-.264 J1.919 E.17399
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.668 Y91.939 E-.04693
G1 X81.43 Y91.929 E-.04533
G1 X81.195 Y91.887 E-.04538
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04536
G1 X80.545 Y91.595 E-.04538
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.04539
G1 X80.14 Y91.213 E-.01549
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.6
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.6 F4000
            G39.3 S1
            G0 Z7.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.429 Y90.99 F42000
G1 Z7.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378696
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00405
G1 X80.17 Y90.539 E.01052
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.528 Y88.432 E.01052
G1 X81.733 Y88.429 E.0057
G1 X82.104 Y88.494 E.01052
G1 X82.304 Y88.569 E.00599
G1 X82.626 Y88.765 E.01052
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.223 Y89.928 E.01052
G1 X83.22 Y90.132 E.0057
G1 X83.189 Y90.334 E.0057
G1 X83.067 Y90.69 E.01052
G1 X82.862 Y91.007 E.01052
G1 X82.722 Y91.155 E.0057
G1 X82.417 Y91.377 E.01052
G1 X82.233 Y91.465 E.0057
G1 X81.869 Y91.561 E.01052
G1 X81.655 Y91.576 E.00599
G1 X81.281 Y91.532 E.01052
G1 X80.928 Y91.4 E.01051
G1 X80.744 Y91.289 E.00599
G1 X80.471 Y91.045 E.01023
G1 X80.466 Y91.037 E.00026
; WIPE_START
G1 F2680.364
G1 X80.34 Y90.875 E-.03895
G1 X80.17 Y90.539 E-.07158
G1 X80.085 Y90.172 E-.0716
G1 X80.076 Y89.968 E-.03881
G1 X80.129 Y89.595 E-.07156
G1 X80.199 Y89.392 E-.04076
G1 X80.32 Y89.178 E-.04674
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.915 Y88.42 Z7.6 F42000
G1 X105.355 Y86.68 Z7.6
G1 Z7.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.306 Y85.511 I-.02 J-.585 E.0619
G1 X105.45 Y85.522 E.00489
G3 X105.415 Y86.675 I-.115 J.574 E.05559
M204 S10000
G1 X105.371 Y87.087 F42000
G1 F600
M204 S6000
G3 X105.287 Y85.102 I-.035 J-.993 E.10519
G1 X105.53 Y85.12 E.00826
G3 X105.43 Y87.083 I-.194 J.974 E.09582
M204 S10000
G1 X105.386 Y87.495 F42000
G1 F600
M204 S6000
G3 X104.932 Y84.748 I-.053 J-1.402 E.1372
G3 X105.61 Y84.717 I.402 J1.369 E.0232
G3 X105.446 Y87.491 I-.277 J1.375 E.13592
M204 S250
G1 X105.427 Y87.894 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.401 Y87.886 E.00084
G3 X104.199 Y87.501 I-.065 J-1.863 E.04039
G3 X103.674 Y86.809 I1.482 J-1.671 E.02742
G1 X103.552 Y86.391 E.01364
G3 X103.617 Y85.54 I1.823 J-.287 E.02701
G3 X103.809 Y85.132 I2.679 J1.009 E.01414
G3 X104.42 Y84.543 I1.537 J.983 E.02687
G1 X104.82 Y84.37 E.01367
G1 X105.25 Y84.298 E.01365
G1 X105.675 Y84.329 E.01338
G1 X105.696 Y84.333 E.00066
G3 X106.108 Y84.472 I-.476 J2.094 E.01365
G1 X106.465 Y84.698 E.01326
G1 X106.768 Y85.011 E.01366
G1 X106.987 Y85.387 E.01366
G1 X107.107 Y85.794 E.01331
G3 X107.127 Y86.249 I-10.048 J.653 E.01428
G1 X107.041 Y86.666 E.01333
G1 X106.855 Y87.059 E.01366
G1 X106.579 Y87.397 E.01366
G1 X106.243 Y87.652 E.01324
G3 X105.842 Y87.818 I-.907 J-1.629 E.01363
G1 X105.486 Y87.883 E.01135
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.401 Y87.886 E-.01611
G1 X104.968 Y87.863 E-.08248
G1 X104.555 Y87.724 E-.08277
G1 X104.199 Y87.501 E-.07982
G1 X103.887 Y87.176 E-.08558
G1 X103.799 Y87.025 E-.03323
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.154 Y86.173 Z7.6 F42000
G1 Z7.2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.413349
G1 F600
M204 S6000
G1 X105.291 Y86.285 E.00546
G1 X105.461 Y86.238 E.00541
G2 X105.483 Y85.982 I-.15 J-.142 E.00855
G1 X105.324 Y85.907 E.00542
G1 X105.17 Y85.993 E.00544
G1 X105.159 Y86.113 E.00373
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2429.619
G1 X105.17 Y85.993 E-.04182
G1 X105.324 Y85.907 E-.06108
G1 X105.483 Y85.982 E-.06085
G1 X105.517 Y86.113 E-.04656
G1 X105.461 Y86.238 E-.04764
G1 X105.291 Y86.285 E-.06078
G1 X105.154 Y86.173 E-.06126
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 37/65
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z7.6 I-.255 J-1.19 P1  F42000
G1 X81.66 Y91.212 Z7.6
G1 Z7.4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.513 Y91.202 E.00462
G3 X81.62 Y88.794 I.148 J-1.2 E.11318
G3 X81.862 Y88.81 I.056 J.983 E.00762
G3 X81.72 Y91.21 I-.201 J1.193 E.11094
M204 S250
G1 X81.865 Y91.927 F42000
G1 F600
M204 S5000
G1 X81.669 Y91.939 E.00619
G3 X81.276 Y88.098 I-.028 J-1.938 E.18026
G3 X81.913 Y88.083 I.368 J2.055 E.02005
G3 X81.925 Y91.918 I-.272 J1.919 E.17337
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.939 E-.04887
G1 X81.43 Y91.929 E-.04534
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04539
G1 X80.545 Y91.595 E-.04536
G1 X80.357 Y91.447 E-.04538
G1 X80.189 Y91.277 E-.04536
G1 X80.146 Y91.221 E-.01356
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.8
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.8 F4000
            G39.3 S1
            G0 Z7.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.436 Y91 F42000
G1 Z7.4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378695
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00439
G1 X80.17 Y90.539 E.01052
G1 X80.085 Y90.172 E.01052
M73 P83 R2
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01051
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.528 Y88.432 E.01052
G1 X81.733 Y88.429 E.0057
G1 X82.104 Y88.494 E.01051
G1 X82.304 Y88.569 E.00599
G1 X82.626 Y88.765 E.01051
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.205 Y89.756 E.0057
G1 X83.22 Y90.132 E.01052
G1 X83.143 Y90.501 E.01052
G1 X83.067 Y90.69 E.0057
G1 X82.862 Y91.007 E.01052
G1 X82.714 Y91.162 E.00599
G1 X82.408 Y91.382 E.01052
G1 X82.059 Y91.522 E.01052
G1 X81.848 Y91.563 E.00599
G1 X81.482 Y91.567 E.01023
G1 X81.271 Y91.529 E.00599
G1 X80.918 Y91.396 E.01052
G1 X80.608 Y91.182 E.01052
G1 X80.473 Y91.046 E.00534
; WIPE_START
G1 F2680.371
G1 X80.34 Y90.875 E-.04126
G1 X80.17 Y90.539 E-.07158
G1 X80.085 Y90.172 E-.07159
G1 X80.076 Y89.968 E-.03881
G1 X80.129 Y89.595 E-.07155
G1 X80.199 Y89.392 E-.04076
G1 X80.314 Y89.188 E-.04445
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.907 Y88.412 Z7.8 F42000
G1 X105.353 Y86.627 Z7.8
G1 Z7.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.308 Y85.564 I-.022 J-.532 E.05658
G1 X105.436 Y85.574 E.00436
G3 X105.413 Y86.622 I-.106 J.522 E.0502
M204 S10000
G1 X105.371 Y87.034 F42000
G1 F600
M204 S6000
G3 X105.291 Y85.154 I-.04 J-.94 E.10001
G1 X105.518 Y85.172 E.0077
G3 X105.43 Y87.03 I-.187 J.922 E.09031
M204 S10000
G1 X105.388 Y87.441 F42000
G1 F600
M204 S6000
G3 X105.273 Y84.745 I-.057 J-1.348 E.14344
G1 X105.599 Y84.77 E.01105
G3 X105.448 Y87.437 I-.267 J1.323 E.13042
M204 S250
G1 X105.377 Y87.843 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X104.985 Y87.812 E.01234
G1 X104.585 Y87.68 E.01322
G1 X104.228 Y87.455 E.01322
G1 X103.935 Y87.152 E.01322
G1 X103.723 Y86.787 E.01322
G1 X103.605 Y86.382 E.01322
G1 X103.587 Y85.961 E.01322
G1 X103.685 Y85.516 E.0143
G1 X103.85 Y85.166 E.01212
G1 X104.116 Y84.839 E.01322
G1 X104.453 Y84.585 E.01322
G1 X104.84 Y84.419 E.01322
G1 X105.256 Y84.35 E.01322
G1 X105.642 Y84.38 E.01212
G1 X106.077 Y84.516 E.0143
G1 X106.434 Y84.74 E.01322
G1 X106.727 Y85.044 E.01322
G1 X106.938 Y85.408 E.01322
G1 X107.057 Y85.813 E.01322
G1 X107.075 Y86.235 E.01322
G1 X106.991 Y86.648 E.01322
G1 X106.811 Y87.029 E.01322
G1 X106.517 Y87.378 E.01429
G1 X106.209 Y87.611 E.01212
G1 X105.821 Y87.777 E.01322
G1 X105.437 Y87.84 E.01222
; WIPE_START
G1 F2386.764
M204 S6000
G1 X104.985 Y87.812 E-.08603
G1 X104.585 Y87.68 E-.08012
G1 X104.228 Y87.455 E-.08012
G1 X103.935 Y87.152 E-.08011
G1 X103.793 Y86.908 E-.05361
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.49 Y86.11 Z7.8 F42000
G1 Z7.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.36242
G1 F600
M204 S6000
G1 X105.462 Y85.999 E.00306
G1 X105.324 Y85.933 E.00406
G1 X105.192 Y86.01 E.00406
G1 X105.18 Y86.163 E.00406
G1 X105.298 Y86.259 E.00407
G1 X105.445 Y86.216 E.00406
G1 X105.467 Y86.165 E.00146
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2816.901
G1 X105.445 Y86.216 E-.02235
G1 X105.298 Y86.259 E-.06218
G1 X105.18 Y86.163 E-.0622
G1 X105.192 Y86.01 E-.06215
G1 X105.324 Y85.933 E-.06218
G1 X105.462 Y85.999 E-.06216
G1 X105.49 Y86.11 E-.04678
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 38/65
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z7.8 I-.255 J-1.19 P1  F42000
G1 X81.661 Y91.212 Z7.8
G1 Z7.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.513 Y91.202 E.00465
G3 X81.617 Y88.794 I.148 J-1.2 E.11312
G3 X81.862 Y88.81 I.058 J.994 E.0077
G3 X81.721 Y91.21 I-.201 J1.192 E.1109
M204 S250
G1 X81.876 Y91.926 F42000
G1 F600
M204 S5000
G1 X81.668 Y91.939 E.00652
G3 X81.276 Y88.098 I-.027 J-1.937 E.1802
G3 X81.92 Y88.084 I.369 J2.06 E.02026
G3 X81.935 Y91.916 I-.278 J1.918 E.17285
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.668 Y91.939 E-.05085
G1 X81.43 Y91.929 E-.04533
G1 X81.195 Y91.887 E-.04538
G1 X80.967 Y91.817 E-.04536
G1 X80.749 Y91.719 E-.04539
G1 X80.545 Y91.595 E-.04536
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.04537
G1 X80.152 Y91.229 E-.01159
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8 F4000
            G39.3 S1
            G0 Z8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.442 Y91.008 F42000
G1 Z7.6
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378693
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00468
G1 X80.17 Y90.539 E.01052
G1 X80.113 Y90.343 E.0057
G1 X80.076 Y89.968 E.01052
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.528 Y88.432 E.01052
G1 X81.733 Y88.429 E.0057
G1 X81.935 Y88.453 E.0057
G1 X82.295 Y88.565 E.01052
G1 X82.618 Y88.759 E.01052
G1 X82.778 Y88.902 E.00599
G1 X83.007 Y89.201 E.01052
G1 X83.158 Y89.547 E.01052
G1 X83.205 Y89.756 E.00599
G1 X83.22 Y90.132 E.01052
G1 X83.189 Y90.334 E.0057
M73 P84 R2
G1 X83.067 Y90.69 E.01052
G1 X82.862 Y91.007 E.01052
G1 X82.714 Y91.162 E.00599
G1 X82.408 Y91.382 E.01052
G1 X82.188 Y91.479 E.00673
G1 X81.859 Y91.562 E.00949
G1 X81.482 Y91.567 E.01052
G1 X81.271 Y91.529 E.00599
G1 X80.918 Y91.396 E.01052
G1 X80.608 Y91.182 E.01052
G1 X80.481 Y91.054 E.00504
; WIPE_START
G1 F2680.387
G1 X80.34 Y90.875 E-.0432
G1 X80.17 Y90.539 E-.07157
G1 X80.113 Y90.343 E-.03882
G1 X80.076 Y89.968 E-.07159
G1 X80.129 Y89.595 E-.07158
G1 X80.199 Y89.392 E-.04074
G1 X80.309 Y89.197 E-.0425
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.9 Y88.402 Z8 F42000
G1 X105.351 Y86.575 Z8
G1 Z7.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.31 Y85.617 I-.02 J-.479 E.05098
G1 X105.426 Y85.626 E.00393
G3 X105.411 Y86.569 I-.095 J.47 E.04503
M204 S10000
G1 X105.369 Y86.984 F42000
G1 F600
M204 S6000
G3 X105.081 Y85.242 I-.046 J-.887 E.08774
G3 X105.472 Y85.221 I.238 J.782 E.01338
G3 X105.428 Y86.979 I-.149 J.876 E.08582
M204 S10000
G1 X105.386 Y87.398 F42000
G1 F600
M204 S6000
G3 X105.275 Y84.798 I-.055 J-1.3 E.13838
G1 X105.504 Y84.815 E.00775
G1 X105.588 Y84.822 E.00287
G3 X105.446 Y87.394 I-.257 J1.276 E.1257
M204 S250
G1 X105.374 Y87.79 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X104.995 Y87.761 E.01191
G1 X104.607 Y87.632 E.01282
G1 X104.261 Y87.414 E.01282
G1 X103.977 Y87.12 E.01282
G1 X103.772 Y86.766 E.01282
G1 X103.657 Y86.374 E.01282
G1 X103.64 Y85.965 E.01282
G1 X103.721 Y85.564 E.01282
G1 X103.777 Y85.445 E.00415
G1 X103.895 Y85.194 E.00867
G1 X104.153 Y84.877 E.01282
G1 X104.479 Y84.631 E.01282
G1 X104.855 Y84.469 E.01282
G1 X105.259 Y84.403 E.01282
G1 X105.534 Y84.425 E.00867
G1 X105.666 Y84.435 E.00415
G1 X106.055 Y84.564 E.01282
G1 X106.401 Y84.781 E.01282
G1 X106.685 Y85.076 E.01282
G1 X106.89 Y85.429 E.01282
G1 X107.005 Y85.822 E.01282
G1 X107.022 Y86.23 E.01282
G1 X106.941 Y86.631 E.01282
G1 X106.767 Y87.001 E.01282
G1 X106.509 Y87.318 E.01282
G1 X106.182 Y87.565 E.01282
G1 X105.806 Y87.726 E.01282
G1 X105.433 Y87.788 E.01186
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2386.764
M204 S6000
G1 X104.995 Y87.761 E-.08339
G1 X104.607 Y87.632 E-.0777
G1 X104.261 Y87.414 E-.07769
G1 X103.977 Y87.12 E-.07769
G1 X103.809 Y86.831 E-.06353
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 39/65
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z8 I-.236 J-1.194 P1  F42000
G1 X81.662 Y91.212 Z8
G1 Z7.8
G1 E.4 F1800
G1 F600
M204 S5000
G1 X81.662 Y91.212 E.00002
G3 X81.615 Y88.794 I-.001 J-1.21 E.11776
G3 X81.862 Y88.81 I.059 J1.005 E.00778
G3 X81.957 Y91.175 I-.201 J1.193 E.1034
G1 X81.722 Y91.204 E.00744
M204 S250
G1 X81.887 Y91.925 F42000
G1 F600
M204 S5000
G1 X81.668 Y91.938 E.00685
G3 X81.276 Y88.098 I-.027 J-1.937 E.18012
G3 X81.926 Y88.084 I.369 J2.066 E.02047
G3 X81.946 Y91.914 I-.284 J1.916 E.17232
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.668 Y91.938 E-.05283
G1 X81.43 Y91.929 E-.04532
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04539
G1 X80.545 Y91.595 E-.04536
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.04539
G1 X80.159 Y91.237 E-.00958
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.2
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.2 F4000
            G39.3 S1
            G0 Z8.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.461 Y91.032 F42000
G1 Z7.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378695
G1 F600
M204 S6000
G1 X80.252 Y90.726 E.01034
G1 X80.17 Y90.539 E.0057
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.528 Y88.432 E.01052
G1 X81.733 Y88.429 E.0057
G1 X82.104 Y88.494 E.01051
G1 X82.304 Y88.569 E.00599
G1 X82.626 Y88.765 E.01052
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.205 Y89.756 E.0057
G1 X83.22 Y90.132 E.01052
G1 X83.189 Y90.334 E.0057
G1 X83.067 Y90.69 E.01052
G1 X82.862 Y91.007 E.01052
G1 X82.714 Y91.162 E.00599
G1 X82.408 Y91.382 E.01052
G1 X82.059 Y91.522 E.01052
G1 X81.848 Y91.563 E.00599
G1 X81.482 Y91.567 E.01023
G1 X81.271 Y91.529 E.00599
G1 X80.918 Y91.396 E.01052
G1 X80.609 Y91.182 E.01051
G1 X80.502 Y91.075 E.00421
; WIPE_START
G1 F2680.372
G1 X80.252 Y90.726 E-.08162
G1 X80.17 Y90.539 E-.03879
G1 X80.085 Y90.172 E-.07159
G1 X80.076 Y89.968 E-.03881
G1 X80.129 Y89.595 E-.07157
G1 X80.199 Y89.392 E-.04075
G1 X80.295 Y89.223 E-.03688
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.883 Y88.405 Z8.2 F42000
G1 X105.349 Y86.521 Z8.2
G1 Z7.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.211 Y85.687 I-.025 J-.425 E.0422
G3 X105.333 Y85.671 I.092 J.241 E.00421
G3 X105.408 Y86.514 I-.009 J.425 E.04206
M204 S10000
G1 X105.366 Y86.932 F42000
G1 F600
M204 S6000
G3 X104.749 Y85.494 I-.043 J-.833 E.06868
G3 X105.365 Y85.265 I.567 J.584 E.0229
G3 X105.426 Y86.927 I-.041 J.833 E.08385
M204 S10000
G1 X105.384 Y87.344 F42000
G1 F600
M204 S6000
G3 X104.146 Y85.705 I-.059 J-1.242 E.08179
G3 X105.396 Y84.86 I1.172 J.387 E.05498
G3 X105.444 Y87.339 I-.072 J1.242 E.12579
M204 S250
G1 X105.374 Y87.738 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.006 Y87.709 E.01158
G3 X105.261 Y84.456 I.325 J-1.611 E.14943
G1 X105.427 Y84.469 E.00523
G1 X105.656 Y84.487 E.00719
G3 X106.156 Y87.519 I-.325 J1.611 E.12453
G1 X105.792 Y87.675 E.01242
G3 X105.434 Y87.738 I-.461 J-1.578 E.01142
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.006 Y87.709 E-.08148
G1 X104.63 Y87.584 E-.07528
G1 X104.294 Y87.373 E-.07527
G1 X104.019 Y87.088 E-.07528
G1 X103.827 Y86.757 E-.07269
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 40/65
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z8.2 I-.24 J-1.193 P1  F42000
G1 X81.662 Y91.211 Z8.2
G1 Z8
G1 E.4 F1800
G1 F600
M204 S5000
G3 X81.612 Y88.794 I-.002 J-1.209 E.11767
G3 X81.862 Y88.81 I.06 J1.015 E.00787
M73 P85 R2
G3 X81.722 Y91.21 I-.202 J1.192 E.11084
M204 S250
G1 X81.898 Y91.925 F42000
G1 F600
M204 S5000
G1 X81.668 Y91.937 E.0072
G3 X81.276 Y88.098 I-.026 J-1.937 E.18004
G3 X81.933 Y88.085 I.37 J2.073 E.02068
G3 X81.955 Y91.912 I-.29 J1.915 E.17179
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.668 Y91.937 E-.05474
G1 X81.43 Y91.929 E-.04531
G1 X81.195 Y91.887 E-.04538
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04538
G1 X80.545 Y91.595 E-.04537
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.04537
G1 X80.165 Y91.245 E-.00771
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.4
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.4 F4000
            G39.3 S1
            G0 Z8.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.454 Y91.024 F42000
G1 Z8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378695
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00525
G1 X80.17 Y90.539 E.01052
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.528 Y88.432 E.01052
G1 X81.733 Y88.429 E.0057
G1 X82.104 Y88.494 E.01052
G1 X82.305 Y88.569 E.00599
G1 X82.626 Y88.765 E.01051
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.205 Y89.756 E.0057
G1 X83.22 Y90.132 E.01052
G1 X83.143 Y90.501 E.01052
G1 X83.067 Y90.69 E.0057
G1 X82.862 Y91.007 E.01052
G1 X82.714 Y91.162 E.00599
G1 X82.417 Y91.376 E.01023
G1 X82.223 Y91.468 E.00598
G1 X81.859 Y91.562 E.01052
G1 X81.482 Y91.567 E.01052
G1 X81.271 Y91.529 E.00599
G1 X80.918 Y91.396 E.01051
G1 X80.608 Y91.182 E.01052
G1 X80.495 Y91.068 E.00448
; WIPE_START
G1 F2680.367
G1 X80.34 Y90.875 E-.04706
G1 X80.17 Y90.539 E-.07158
G1 X80.085 Y90.172 E-.0716
G1 X80.076 Y89.968 E-.03881
G1 X80.129 Y89.595 E-.07158
G1 X80.199 Y89.392 E-.04074
G1 X80.299 Y89.215 E-.03864
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.886 Y88.384 Z8.4 F42000
G1 X105.347 Y86.47 Z8.4
G1 Z8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.315 Y85.723 I-.016 J-.374 E.03978
G1 X105.405 Y85.73 E.00306
G3 X105.406 Y86.463 I-.074 J.367 E.03469
M204 S10000
G1 X105.364 Y86.877 F42000
G1 F600
M204 S6000
G3 X105.297 Y85.313 I-.033 J-.782 E.08321
G1 X105.486 Y85.328 E.00641
G3 X105.424 Y86.872 I-.155 J.767 E.0748
M204 S10000
G1 X105.381 Y87.284 F42000
G1 F600
M204 S6000
G3 X105.28 Y84.903 I-.05 J-1.19 E.12665
G1 X105.567 Y84.926 E.00976
G3 X105.441 Y87.28 I-.236 J1.168 E.11491
M204 S250
G1 X105.371 Y87.685 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.018 Y87.649 E.01112
G3 X105.263 Y84.509 I.313 J-1.555 E.14426
G1 X105.32 Y84.513 E.00178
G1 X105.645 Y84.539 E.01024
G3 X105.43 Y87.677 I-.314 J1.555 E.14325
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.018 Y87.649 E-.0785
G1 X104.652 Y87.536 E-.07269
G1 X104.328 Y87.332 E-.07285
G1 X104.061 Y87.056 E-.07285
G1 X103.869 Y86.724 E-.07287
G1 X103.854 Y86.673 E-.01024
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 41/65
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z8.4 I-.244 J-1.192 P1  F42000
G1 X81.663 Y91.212 Z8.4
G1 Z8.2
G1 E.4 F1800
G1 F600
M204 S5000
G1 X81.662 Y91.212 E.00005
G3 X81.609 Y88.794 I-.002 J-1.21 E.11764
G3 X81.862 Y88.81 I.062 J1.026 E.00795
G3 X81.957 Y91.175 I-.202 J1.193 E.10335
G1 X81.723 Y91.204 E.00741
M204 S250
G1 X81.906 Y91.921 F42000
G1 F600
M204 S5000
G3 X81.276 Y88.098 I-.263 J-1.92 E.1876
G3 X81.939 Y88.086 I.37 J2.08 E.02088
G3 X81.966 Y91.912 I-.296 J1.915 E.17143
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.669 Y91.941 E-.05674
G1 X81.43 Y91.928 E-.04537
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04539
G1 X80.749 Y91.719 E-.04536
G1 X80.545 Y91.595 E-.04538
G1 X80.357 Y91.447 E-.04537
G1 X80.189 Y91.277 E-.04539
G1 X80.171 Y91.254 E-.00564
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.6
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.6 F4000
            G39.3 S1
            G0 Z8.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.461 Y91.031 F42000
G1 Z8.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378697
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.00549
G1 X80.17 Y90.539 E.01052
M73 P86 R2
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.357 Y88.455 E.0057
G1 X81.733 Y88.429 E.01052
G1 X82.104 Y88.494 E.01052
G1 X82.304 Y88.569 E.00599
G1 X82.626 Y88.765 E.01052
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.223 Y89.928 E.01052
G1 X83.22 Y90.132 E.0057
G1 X83.189 Y90.334 E.0057
G1 X83.067 Y90.69 E.01052
G1 X82.862 Y91.007 E.01052
G1 X82.722 Y91.155 E.0057
G1 X82.564 Y91.284 E.0057
G1 X82.233 Y91.465 E.01052
G1 X81.869 Y91.561 E.01052
G1 X81.655 Y91.576 E.00599
G1 X81.281 Y91.532 E.01052
G1 X80.928 Y91.4 E.01051
G1 X80.744 Y91.289 E.00599
G1 X80.503 Y91.073 E.00905
; WIPE_START
G1 F2680.357
G1 X80.34 Y90.875 E-.04867
G1 X80.17 Y90.539 E-.07158
G1 X80.085 Y90.172 E-.0716
G1 X80.076 Y89.968 E-.0388
G1 X80.129 Y89.595 E-.07158
G1 X80.199 Y89.392 E-.04073
G1 X80.295 Y89.222 E-.03703
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.88 Y88.373 Z8.6 F42000
G1 X105.344 Y86.418 Z8.6
G1 Z8.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.317 Y85.775 I-.014 J-.321 E.03418
G1 X105.395 Y85.781 E.00263
G3 X105.404 Y86.41 I-.064 J.315 E.02952
M204 S10000
G1 X105.362 Y86.824 F42000
G1 F600
M204 S6000
G3 X105.3 Y85.366 I-.031 J-.729 E.07762
G1 X105.476 Y85.379 E.00598
G3 X105.422 Y86.819 I-.145 J.716 E.06963
M204 S10000
G1 X105.379 Y87.231 F42000
G1 F600
M204 S6000
G3 X105.282 Y84.956 I-.048 J-1.138 E.12105
G1 X105.557 Y84.978 E.00932
G3 X105.439 Y87.227 I-.226 J1.116 E.10974
M204 S250
G1 X105.368 Y87.632 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.029 Y87.594 E.01069
G3 X105.265 Y84.561 I.302 J-1.502 E.13931
G1 X105.635 Y84.59 E.01162
G3 X105.426 Y87.621 I-.304 J1.502 E.13835
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.029 Y87.594 E-.07568
G1 X104.675 Y87.489 E-.07021
G1 X104.361 Y87.291 E-.07043
G1 X104.104 Y87.024 E-.07044
G1 X103.917 Y86.704 E-.07044
G1 X103.884 Y86.589 E-.0228
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 42/65
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z8.6 I-.248 J-1.191 P1  F42000
G1 X81.664 Y91.212 Z8.6
G1 Z8.4
G1 E.4 F1800
G1 F600
M204 S5000
G1 X81.662 Y91.211 E.00007
G3 X81.607 Y88.794 I-.003 J-1.209 E.11753
G3 X81.862 Y88.81 I.063 J1.037 E.00803
G3 X81.957 Y91.173 I-.203 J1.192 E.10328
G1 X81.723 Y91.204 E.00739
M204 S250
G1 X81.918 Y91.922 F42000
G1 F600
M204 S5000
G1 X81.906 Y91.92 E.00036
G3 X81.513 Y88.067 I-.266 J-1.919 E.19522
G3 X81.946 Y88.087 I.136 J1.759 E.01363
G3 X82.14 Y91.873 I-.305 J1.914 E.16544
G1 X81.976 Y91.909 E.00526
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.906 Y91.92 E-.01343
G1 X81.669 Y91.941 E-.04535
G1 X81.43 Y91.929 E-.04536
G1 X81.195 Y91.887 E-.04538
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04536
G1 X80.545 Y91.595 E-.04539
G1 X80.357 Y91.447 E-.04536
G1 X80.189 Y91.277 E-.04538
G1 X80.178 Y91.262 E-.00362
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z8.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.8
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.8 F4000
            G39.3 S1
            G0 Z8.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.464 Y91.037 F42000
G1 Z8.4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378695
G1 F600
M204 S6000
G1 X80.34 Y90.875 E.0057
G1 X80.17 Y90.539 E.01052
G1 X80.113 Y90.343 E.0057
G1 X80.076 Y89.968 E.01052
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.528 Y88.432 E.01052
G1 X81.733 Y88.429 E.0057
G1 X82.104 Y88.494 E.01051
G1 X82.305 Y88.569 E.006
G1 X82.626 Y88.765 E.01051
G1 X82.892 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.222 Y89.917 E.01022
G1 X83.22 Y90.132 E.00599
G1 X83.143 Y90.501 E.01052
G1 X83.067 Y90.69 E.0057
G1 X82.862 Y91.007 E.01052
G1 X82.714 Y91.162 E.00599
G1 X82.408 Y91.382 E.01052
G1 X82.059 Y91.522 E.01052
G1 X81.848 Y91.563 E.00599
G1 X81.482 Y91.567 E.01023
G1 X81.271 Y91.529 E.00599
G1 X80.919 Y91.396 E.01051
G1 X80.608 Y91.182 E.01052
G1 X80.506 Y91.08 E.00403
; WIPE_START
G1 F2680.367
G1 X80.34 Y90.875 E-.05009
G1 X80.17 Y90.539 E-.07158
G1 X80.113 Y90.343 E-.03881
G1 X80.076 Y89.968 E-.0716
G1 X80.129 Y89.595 E-.07156
G1 X80.199 Y89.392 E-.04076
G1 X80.291 Y89.229 E-.0356
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.874 Y88.362 Z8.8 F42000
G1 X105.342 Y86.365 Z8.8
G1 Z8.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.319 Y85.828 I-.011 J-.269 E.02858
G1 X105.384 Y85.833 E.0022
G3 X105.402 Y86.356 I-.053 J.264 E.02434
M204 S10000
G1 X105.36 Y86.772 F42000
G1 F600
M204 S6000
G3 X105.302 Y85.418 I-.029 J-.677 E.07202
G1 X105.465 Y85.431 E.00555
G3 X105.419 Y86.767 I-.134 J.664 E.06446
M204 S10000
G1 X105.377 Y87.181 F42000
G1 F600
M204 S6000
G3 X104.784 Y85.155 I-.053 J-1.084 E.09812
G3 X105.317 Y85.011 I.606 J1.187 E.01882
G3 X105.437 Y87.177 I.007 J1.086 E.11184
M204 S250
G1 X105.365 Y87.579 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
M73 P87 R2
G1 X105.039 Y87.542 E.01027
G3 X105.268 Y84.614 I.292 J-1.45 E.13449
G1 X105.347 Y84.62 E.00251
G1 X105.625 Y84.642 E.00872
G3 X105.423 Y87.568 I-.293 J1.45 E.13355
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.039 Y87.542 E-.07313
G1 X104.697 Y87.441 E-.06778
G1 X104.394 Y87.25 E-.06802
G1 X104.146 Y86.992 E-.06801
G1 X103.966 Y86.683 E-.06802
G1 X103.914 Y86.506 E-.03504
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 43/65
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z8.8 I-.252 J-1.191 P1  F42000
G1 X81.664 Y91.211 Z8.8
G1 Z8.6
G1 E.4 F1800
G1 F600
M204 S5000
G1 X81.662 Y91.211 E.00009
G3 X81.604 Y88.794 I-.003 J-1.209 E.11748
G3 X81.862 Y88.81 I.065 J1.047 E.00811
G3 X81.957 Y91.173 I-.203 J1.192 E.10326
G1 X81.724 Y91.204 E.00737
M204 S250
G1 X81.931 Y91.919 F42000
G1 F600
M204 S5000
G1 X81.907 Y91.921 E.00076
G3 X81.952 Y88.087 I-.255 J-1.92 E.2083
G3 X82.814 Y91.551 I-.302 J1.914 E.14222
G3 X82.141 Y91.876 I-1.163 J-1.55 E.0236
G1 X81.989 Y91.907 E.00484
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.907 Y91.921 E-.01597
G1 X81.669 Y91.941 E-.04537
G1 X81.43 Y91.929 E-.04536
G1 X81.195 Y91.887 E-.04538
G1 X80.967 Y91.817 E-.04536
G1 X80.749 Y91.719 E-.04537
G1 X80.545 Y91.595 E-.04539
G1 X80.357 Y91.447 E-.04536
G1 X80.189 Y91.277 E-.04538
G1 X80.186 Y91.273 E-.00105
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9 F4000
            G39.3 S1
            G0 Z9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.464 Y91.037 F42000
G1 Z8.6
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378697
G1 F600
M204 S6000
G1 X80.252 Y90.726 E.01052
G1 X80.17 Y90.539 E.0057
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.129 Y89.595 E.01052
G1 X80.199 Y89.392 E.00599
G1 X80.385 Y89.064 E.01052
G1 X80.644 Y88.791 E.01052
G1 X80.818 Y88.665 E.00599
G1 X81.159 Y88.505 E.01052
G1 X81.528 Y88.432 E.01052
G1 X81.733 Y88.429 E.0057
G1 X82.104 Y88.494 E.01051
G1 X82.304 Y88.569 E.00599
G1 X82.626 Y88.765 E.01052
G1 X82.891 Y89.033 E.01052
G1 X83.012 Y89.21 E.00599
G1 X83.161 Y89.556 E.01052
G1 X83.205 Y89.756 E.0057
G1 X83.22 Y90.132 E.01052
G1 X83.143 Y90.501 E.01052
G1 X83.067 Y90.69 E.0057
G1 X82.862 Y91.007 E.01052
G1 X82.714 Y91.162 E.00599
G1 X82.408 Y91.382 E.01052
G1 X82.059 Y91.522 E.01052
G1 X81.848 Y91.563 E.00599
G1 X81.482 Y91.567 E.01023
G1 X81.271 Y91.529 E.00599
G1 X80.918 Y91.396 E.01051
G1 X80.608 Y91.182 E.01052
G1 X80.506 Y91.08 E.00403
; WIPE_START
G1 F2680.354
G1 X80.252 Y90.726 E-.08279
G1 X80.17 Y90.539 E-.03878
G1 X80.085 Y90.172 E-.0716
G1 X80.076 Y89.968 E-.03881
G1 X80.129 Y89.595 E-.07158
G1 X80.199 Y89.392 E-.04075
G1 X80.292 Y89.228 E-.03569
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.873 Y88.345 Z9 F42000
G1 X105.34 Y86.31 Z9
G1 Z8.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.27 Y85.889 I-.014 J-.214 E.02133
G3 X105.339 Y85.882 I.049 J.138 E.00238
G3 X105.399 Y86.298 I-.013 J.214 E.01986
M204 S10000
G1 X105.357 Y86.723 F42000
G1 F600
M204 S6000
G3 X105.016 Y85.555 I-.034 J-.624 E.05671
G3 X105.371 Y85.477 I.317 J.59 E.01247
G3 X105.417 Y86.717 I-.048 J.623 E.0616
M204 S10000
G1 X105.375 Y87.132 F42000
G1 F600
M204 S6000
G3 X104.453 Y85.545 I-.051 J-1.031 E.07645
G3 X105.403 Y85.071 I.882 J.577 E.03767
G3 X105.435 Y87.127 I-.079 J1.03 E.10337
M204 S250
G1 X105.362 Y87.526 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.05 Y87.491 E.00986
G3 X105.27 Y84.667 I.281 J-1.398 E.12971
G1 X105.434 Y84.68 E.00515
G1 X105.614 Y84.694 E.00567
G3 X105.421 Y87.516 I-.283 J1.398 E.12878
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.05 Y87.491 E-.07068
G1 X104.72 Y87.393 E-.06538
G1 X104.428 Y87.209 E-.06559
G1 X104.188 Y86.961 E-.06559
G1 X104.015 Y86.662 E-.0656
G1 X103.945 Y86.424 E-.04717
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 44/65
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z9 I-.256 J-1.19 P1  F42000
G1 X81.665 Y91.211 Z9
G1 Z8.8
G1 E.4 F1800
G1 F600
M204 S5000
G1 X81.662 Y91.21 E.00012
G3 X81.591 Y88.794 I-.005 J-1.209 E.11719
G3 X81.862 Y88.81 I.072 J1.101 E.00854
G3 X81.956 Y91.172 I-.205 J1.191 E.1031
G1 X81.725 Y91.203 E.00734
M204 S250
G1 X81.944 Y91.917 F42000
M73 P87 R1
G1 F600
M204 S5000
G1 X81.906 Y91.921 E.00118
G3 X81.513 Y88.067 I-.263 J-1.92 E.19508
G3 X81.959 Y88.088 I.136 J1.813 E.01404
M73 P88 R1
G3 X82.14 Y91.874 I-.316 J1.912 E.16522
G1 X82.003 Y91.904 E.00441
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.906 Y91.921 E-.01855
G1 X81.669 Y91.941 E-.04536
G1 X81.43 Y91.928 E-.04536
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04539
G1 X80.545 Y91.595 E-.04535
G1 X80.357 Y91.447 E-.04538
G1 X80.195 Y91.283 E-.04387
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.2
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.2 F4000
            G39.3 S1
            G0 Z9.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.458 Y91.029 F42000
G1 Z8.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378761
G1 F600
M204 S6000
G3 X80.253 Y90.726 I1.191 J-1.028 E.01025
G1 X80.17 Y90.539 E.0057
G1 X80.115 Y90.353 E.00541
G1 X80.076 Y89.968 E.01081
G3 X80.498 Y91.073 I1.573 J.033 E.24216
; WIPE_START
G1 F2679.843
G1 X80.253 Y90.726 E-.08089
G1 X80.17 Y90.539 E-.03881
G1 X80.115 Y90.353 E-.03684
G1 X80.076 Y89.968 E-.07356
G1 X80.094 Y89.764 E-.0388
G1 X80.194 Y89.401 E-.07155
G1 X80.285 Y89.218 E-.03881
G1 X80.287 Y89.215 E-.00074
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.867 Y88.321 Z9.2 F42000
G1 X105.338 Y86.26 Z9.2
G1 Z8.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.324 Y85.934 I-.007 J-.163 E.01739
G1 X105.363 Y85.937 E.00134
G3 X105.397 Y86.247 I-.032 J.16 E.01397
M204 S10000
G1 X105.355 Y86.667 F42000
G1 F600
M204 S6000
G3 X105.306 Y85.524 I-.024 J-.572 E.06083
G1 X105.444 Y85.535 E.00468
G3 X105.415 Y86.662 I-.113 J.561 E.05412
M204 S10000
G1 X105.372 Y87.077 F42000
G1 F600
M204 S6000
G3 X105.289 Y85.114 I-.041 J-.981 E.10443
G1 X105.489 Y85.13 E.0068
G1 X105.525 Y85.133 E.00123
G3 X105.432 Y87.073 I-.194 J.963 E.09438
M204 S250
G1 X105.36 Y87.473 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.06 Y87.441 E.00946
G3 X105.272 Y84.72 I.271 J-1.348 E.12502
G1 X105.52 Y84.739 E.0078
G1 X105.604 Y84.746 E.00263
G3 X105.419 Y87.466 I-.272 J1.348 E.12408
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.06 Y87.441 E-.06842
G1 X104.742 Y87.345 E-.063
G1 X104.461 Y87.168 E-.06316
G1 X104.23 Y86.929 E-.06318
G1 X104.063 Y86.641 E-.06317
G1 X103.976 Y86.343 E-.05907
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 45/65
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z9.2 I-.259 J-1.189 P1  F42000
G1 X81.666 Y91.211 Z9.2
G1 Z9
G1 E.4 F1800
G1 F600
M204 S5000
G1 X81.662 Y91.21 E.00014
G3 X81.588 Y88.794 I-.006 J-1.209 E.11713
G3 X81.862 Y88.81 I.074 J1.113 E.00863
G3 X81.956 Y91.172 I-.206 J1.191 E.10306
G1 X81.725 Y91.203 E.00731
M204 S250
G1 X81.958 Y91.914 F42000
G1 F600
M204 S5000
G1 X81.906 Y91.92 E.00162
G3 X81.513 Y88.067 I-.261 J-1.92 E.19495
G3 X81.966 Y88.089 I.137 J1.84 E.01425
G3 X82.14 Y91.873 I-.321 J1.911 E.16508
G1 X82.016 Y91.901 E.00398
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.906 Y91.92 E-.02117
G1 X81.669 Y91.941 E-.04535
G1 X81.43 Y91.929 E-.04536
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04537
G1 X80.545 Y91.595 E-.04538
G1 X80.357 Y91.447 E-.04538
G1 X80.205 Y91.293 E-.04125
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.4
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.4 F4000
            G39.3 S1
            G0 Z9.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.474 Y91.042 F42000
G1 Z9
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378798
G1 F600
M204 S6000
G3 X80.113 Y90.335 I1.175 J-1.046 E.02241
G1 X80.076 Y89.968 E.01032
G3 X80.515 Y91.086 I1.573 J.029 E.24162
; WIPE_START
G1 F2679.546
G1 X80.346 Y90.884 E-.0501
G1 X80.173 Y90.545 E-.07227
G1 X80.113 Y90.335 E-.04141
G1 X80.076 Y89.968 E-.07022
G1 X80.094 Y89.764 E-.03879
G1 X80.194 Y89.401 E-.07158
G1 X80.286 Y89.238 E-.03563
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.877 Y88.443 Z9.4 F42000
G1 X105.353 Y86.615 Z9.4
G1 Z9
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.309 Y85.577 I-.022 J-.519 E.05521
G1 X105.434 Y85.587 E.00425
G3 X105.413 Y86.609 I-.103 J.509 E.04896
M204 S10000
G1 X105.37 Y87.022 F42000
G1 F600
M204 S6000
G3 X105.291 Y85.167 I-.039 J-.927 E.09865
G1 X105.515 Y85.185 E.0076
G3 X105.43 Y87.017 I-.184 J.91 E.08906
M204 S250
G1 X105.357 Y87.421 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.07 Y87.388 E.00905
G3 X105.274 Y84.773 I.261 J-1.296 E.12016
G1 X105.593 Y84.798 E.01003
G3 X105.416 Y87.412 I-.262 J1.295 E.11923
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.07 Y87.388 E-.06587
G1 X104.765 Y87.297 E-.06058
G1 X104.494 Y87.127 E-.06074
G1 X104.272 Y86.897 E-.06075
G1 X104.112 Y86.62 E-.06077
G1 X104.022 Y86.313 E-.06074
G1 X104.02 Y86.258 E-.01056
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 46/65
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z9.4 I-.263 J-1.188 P1  F42000
G1 X81.667 Y91.211 Z9.4
G1 Z9.2
G1 E.4 F1800
G1 F600
M204 S5000
G1 X81.662 Y91.21 E.00016
G3 X81.585 Y88.794 I-.007 J-1.209 E.11709
G3 X81.862 Y88.81 I.075 J1.125 E.00872
G3 X81.956 Y91.172 I-.207 J1.191 E.10303
G1 X81.726 Y91.203 E.00729
M204 S250
G1 X81.971 Y91.911 F42000
M73 P89 R1
G1 F600
M204 S5000
G1 X81.907 Y91.922 E.00205
G3 X81.972 Y88.09 I-.254 J-1.921 E.20896
G3 X82.799 Y91.563 I-.326 J1.913 E.14216
G3 X82.141 Y91.876 I-1.147 J-1.562 E.02299
G1 X82.03 Y91.899 E.00354
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.907 Y91.922 E-.02385
G1 X81.669 Y91.941 E-.04538
G1 X81.43 Y91.928 E-.04536
G1 X81.195 Y91.887 E-.04537
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04538
G1 X80.545 Y91.595 E-.04538
G1 X80.357 Y91.447 E-.04537
G1 X80.215 Y91.303 E-.03855
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.6
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.6 F4000
            G39.3 S1
            G0 Z9.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.497 Y91.057 F42000
G1 Z9.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378821
G1 F600
M204 S6000
G1 X80.348 Y90.882 E.00642
G3 X80.113 Y90.339 I1.3 J-.885 E.01663
G1 X80.076 Y89.968 E.01042
G3 X80.595 Y91.165 I1.573 J.029 E.23843
G1 X80.537 Y91.102 E.0024
; WIPE_START
G1 F2679.364
G1 X80.348 Y90.882 E-.05508
G1 X80.173 Y90.545 E-.07212
G1 X80.113 Y90.339 E-.04085
G1 X80.076 Y89.968 E-.07086
G1 X80.094 Y89.764 E-.0388
G1 X80.194 Y89.401 E-.07155
G1 X80.266 Y89.256 E-.03074
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.855 Y88.442 Z9.6 F42000
G1 X105.353 Y86.564 Z9.6
G1 Z9.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.314 Y85.628 I-.021 J-.468 E.04985
G1 X105.424 Y85.637 E.00375
G3 X105.413 Y86.557 I-.092 J.459 E.04394
M204 S10000
G1 X105.371 Y86.971 F42000
G1 F600
M204 S6000
G3 X105.297 Y85.218 I-.038 J-.876 E.09331
G1 X105.505 Y85.235 E.00707
G3 X105.431 Y86.966 I-.172 J.86 E.08405
M204 S250
G1 X105.355 Y87.369 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.081 Y87.338 E.00867
G3 X104.981 Y84.872 I.246 J-1.245 E.10621
G3 X105.56 Y84.846 I.345 J1.193 E.01836
G3 X105.414 Y87.359 I-.233 J1.247 E.1149
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.081 Y87.338 E-.06349
G1 X104.787 Y87.25 E-.05829
G1 X104.537 Y87.094 E-.05602
G1 X104.312 Y86.864 E-.06097
G1 X104.158 Y86.598 E-.05851
G1 X104.073 Y86.302 E-.05851
G1 X104.068 Y86.174 E-.02421
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 47/65
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z9.6 I-.267 J-1.187 P1  F42000
G1 X81.667 Y91.211 Z9.6
G1 Z9.4
G1 E.4 F1800
G1 F600
M204 S5000
G1 X81.662 Y91.21 E.00018
G3 X81.582 Y88.794 I-.003 J-1.209 E.11676
G1 X81.714 Y88.793 E.00413
G3 X81.957 Y91.172 I-.054 J1.208 E.10797
G1 X81.727 Y91.203 E.00727
M204 S250
G1 X81.985 Y91.909 F42000
G1 F600
M204 S5000
G1 X81.906 Y91.92 E.0025
G3 X81.752 Y88.064 I-.261 J-1.921 E.20245
G1 X81.979 Y88.09 E.00717
G3 X82.14 Y91.874 I-.333 J1.909 E.16473
G1 X82.044 Y91.895 E.0031
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.906 Y91.92 E-.02651
G1 X81.669 Y91.941 E-.04536
G1 X81.43 Y91.929 E-.04536
G1 X81.195 Y91.887 E-.04538
G1 X80.977 Y91.82 E-.04341
G1 X80.749 Y91.719 E-.04733
G1 X80.545 Y91.595 E-.04537
G1 X80.357 Y91.447 E-.04536
G1 X80.224 Y91.313 E-.03592
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z9.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.8
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.8 F4000
            G39.3 S1
            G0 Z9.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.471 Y91.041 F42000
G1 Z9.4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378824
G1 F600
M204 S6000
G3 X80.114 Y90.342 I1.177 J-1.043 E.02215
G1 X80.076 Y89.968 E.01051
G3 X80.512 Y91.085 I1.573 J.03 E.24168
; WIPE_START
G1 F2679.336
G1 X80.347 Y90.883 E-.04953
G1 X80.247 Y90.717 E-.03684
G1 X80.173 Y90.546 E-.03542
G1 X80.114 Y90.342 E-.04027
G1 X80.076 Y89.968 E-.07152
G1 X80.094 Y89.764 E-.03879
G1 X80.194 Y89.401 E-.07156
G1 X80.287 Y89.236 E-.03606
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.875 Y88.412 Z9.8 F42000
G1 X105.351 Y86.513 Z9.8
G1 Z9.4
M73 P90 R1
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G3 X105.319 Y85.679 I-.017 J-.417 E.04445
G1 X105.414 Y85.687 E.00323
G3 X105.411 Y86.506 I-.08 J.41 E.03904
M204 S10000
G1 X105.371 Y86.922 F42000
G1 F600
M204 S6000
G3 X105.303 Y85.27 I-.046 J-.826 E.08878
G1 X105.476 Y85.283 E.00585
G3 X105.431 Y86.916 I-.151 J.813 E.07922
M204 S250
G1 X105.353 Y87.317 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.079 Y87.288 E.00863
G3 X105.021 Y84.917 I.247 J-1.192 E.1025
G3 X105.513 Y84.893 I.302 J1.122 E.01556
G3 X105.412 Y87.311 I-.187 J1.203 E.11135
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.079 Y87.288 E-.06344
G1 X104.837 Y87.214 E-.04808
G1 X104.549 Y87.036 E-.06444
G1 X104.346 Y86.82 E-.05632
G1 X104.218 Y86.6 E-.04822
G1 X104.122 Y86.275 E-.06442
G1 X104.115 Y86.091 E-.03509
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 48/65
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z9.8 I-.271 J-1.186 P1  F42000
G1 X81.668 Y91.211 Z9.8
G1 Z9.6
G1 E.4 F1800
G1 F600
M204 S5000
G1 X81.662 Y91.21 E.00021
G3 X81.579 Y88.794 I-.004 J-1.209 E.11678
G1 X81.714 Y88.793 E.00422
G3 X81.957 Y91.172 I-.056 J1.208 E.10789
G1 X81.728 Y91.203 E.00723
M204 S250
G1 X81.999 Y91.906 F42000
G1 F600
M204 S5000
G1 X81.906 Y91.92 E.00294
G3 X81.752 Y88.064 I-.264 J-1.92 E.20266
G1 X81.973 Y88.09 E.00699
G3 X82.14 Y91.873 I-.331 J1.91 E.16474
G1 X82.058 Y91.892 E.00265
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.906 Y91.92 E-.02922
G1 X81.669 Y91.941 E-.04536
G1 X81.43 Y91.929 E-.04536
G1 X81.195 Y91.887 E-.04538
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04538
G1 X80.545 Y91.595 E-.04536
G1 X80.357 Y91.447 E-.04538
G1 X80.234 Y91.323 E-.0332
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10 F4000
            G39.3 S1
            G0 Z10 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.495 Y91.067 F42000
G1 Z9.6
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378672
G1 F600
M204 S6000
G1 X80.458 Y91.029 E.00147
G3 X80.253 Y90.725 I1.191 J-1.028 E.01025
G1 X80.17 Y90.539 E.00569
G1 X80.115 Y90.353 E.00542
G1 X80.076 Y89.968 E.01081
G3 X80.601 Y91.174 I1.573 J.033 E.23806
G1 X80.537 Y91.109 E.00256
; WIPE_START
G1 F2680.549
G1 X80.458 Y91.029 E-.02139
G1 X80.253 Y90.725 E-.06962
G1 X80.17 Y90.539 E-.03875
G1 X80.115 Y90.353 E-.03685
G1 X80.076 Y89.968 E-.07355
G1 X80.094 Y89.764 E-.0388
G1 X80.194 Y89.401 E-.07156
G1 X80.263 Y89.262 E-.02947
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.848 Y88.412 Z10 F42000
G1 X105.283 Y86.457 Z10
G1 Z9.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F600
M204 S6000
G1 X105.261 Y86.462 E.00076
G3 X105.324 Y85.73 I.063 J-.363 E.03705
G1 X105.382 Y85.735 E.00197
G3 X105.439 Y86.449 I-.058 J.364 E.03331
G1 X105.343 Y86.454 E.00325
M204 S10000
G1 X105.36 Y86.87 F42000
G1 F600
M204 S6000
G3 X105.14 Y85.346 I-.033 J-.773 E.07706
G3 X105.422 Y85.329 I.183 J.693 E.00961
G3 X105.419 Y86.866 I-.095 J.768 E.07589
M204 S250
G1 X105.351 Y87.265 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X105.078 Y87.233 E.00862
G3 X104.167 Y86.135 I.253 J-1.136 E.04814
G3 X105.459 Y84.939 I1.167 J-.035 E.06252
G3 X105.41 Y87.258 I-.128 J1.157 E.10818
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.078 Y87.233 E-.06317
G1 X104.881 Y87.176 E-.03901
G1 X104.571 Y86.986 E-.0691
G1 X104.379 Y86.775 E-.05416
G1 X104.243 Y86.525 E-.05414
G1 X104.185 Y86.327 E-.03911
G1 X104.167 Y86.135 E-.03663
G1 X104.167 Y86.135 E0
G1 X104.17 Y86.005 E-.02468
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 49/65
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z10 I-.274 J-1.186 P1  F42000
G1 X81.669 Y91.211 Z10
G1 Z9.8
G1 E.4 F1800
G1 F600
M204 S5000
G1 X81.662 Y91.21 E.00023
G3 X81.576 Y88.794 I-.005 J-1.209 E.11679
G1 X81.714 Y88.793 E.00431
G3 X81.957 Y91.172 I-.057 J1.208 E.10783
G1 X81.728 Y91.203 E.00722
M204 S250
M73 P91 R1
G1 X82.013 Y91.903 F42000
G1 F600
M204 S5000
G1 X81.906 Y91.92 E.00339
G3 X81.752 Y88.064 I-.261 J-1.92 E.20241
G1 X81.98 Y88.091 E.00719
G3 X82.14 Y91.873 I-.334 J1.909 E.16471
G1 X82.072 Y91.889 E.0022
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.906 Y91.92 E-.03193
G1 X81.669 Y91.941 E-.04535
G1 X81.43 Y91.929 E-.04535
G1 X81.195 Y91.887 E-.04538
G1 X80.967 Y91.817 E-.04537
G1 X80.749 Y91.719 E-.04529
G1 X80.537 Y91.589 E-.04725
G1 X80.357 Y91.447 E-.04357
G1 X80.244 Y91.333 E-.0305
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.2
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.2 F4000
            G39.3 S1
            G0 Z10.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.524 Y91.089 F42000
G1 Z9.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378639
G1 F600
M204 S6000
G1 X80.352 Y90.892 E.00729
G1 X80.252 Y90.724 E.00546
G1 X80.167 Y90.529 E.00594
G1 X80.085 Y90.172 E.01023
G1 X80.076 Y89.968 E.0057
G3 X83.066 Y90.69 I1.574 J.036 E.15684
G1 X82.965 Y90.867 E.00569
G1 X82.729 Y91.148 E.01023
G1 X82.572 Y91.278 E.0057
G1 X82.399 Y91.386 E.0057
G1 X82.059 Y91.522 E.01022
G1 X81.859 Y91.562 E.0057
G1 X81.655 Y91.576 E.0057
G1 X81.281 Y91.532 E.01052
G1 X80.928 Y91.4 E.01051
G1 X80.746 Y91.29 E.00594
G1 X80.593 Y91.168 E.00546
G1 X80.563 Y91.134 E.00126
; WIPE_START
G1 F2680.817
G1 X80.352 Y90.892 E-.06104
G1 X80.252 Y90.724 E-.03715
G1 X80.167 Y90.529 E-.04045
G1 X80.085 Y90.172 E-.06961
G1 X80.076 Y89.968 E-.03881
G1 X80.092 Y89.776 E-.03661
G1 X80.134 Y89.577 E-.03868
G1 X80.25 Y89.296 E-.05764
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X87.856 Y88.664 Z10.2 F42000
G1 X105.348 Y87.211 Z10.2
G1 Z9.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G3 X105.257 Y84.984 I-.025 J-1.114 E.10854
G3 X105.405 Y84.985 I.067 J.844 E.00465
G3 X105.407 Y87.209 I-.083 J1.112 E.10454
; WIPE_START
G1 F2386.764
M204 S6000
G1 X105.076 Y87.184 E-.0632
G1 X104.925 Y87.137 E-.03003
G1 X104.71 Y87.023 E-.04618
G1 X104.593 Y86.935 E-.0278
G1 X104.412 Y86.73 E-.05198
G1 X104.332 Y86.594 E-.03002
G1 X104.241 Y86.336 E-.05195
G1 X104.221 Y86.192 E-.02767
G1 X104.225 Y85.948 E-.04633
G1 X104.232 Y85.924 E-.00483
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X106.227 Y86.229 Z10.2 F42000
G1 Z9.8
G1 E.4 F1800
; FEATURE: Top surface
G1 F600
M204 S2000
G1 X105.199 Y85.202 E.04556
G1 X104.816 Y85.352
G1 X106.077 Y86.613 E.05589
G1 X105.803 Y86.872
G1 X104.556 Y85.625 E.05528
G1 X104.427 Y86.029
G1 X105.399 Y87.002 E.04314
; WIPE_START
G1 F2386.764
M204 S6000
G1 X104.427 Y86.029 E-.26142
G1 X104.556 Y85.625 E-.08054
G1 X104.698 Y85.767 E-.03804
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X106.24 Y85.924 Z10.2 F42000
G1 Z9.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.194538
G1 F600
M204 S6000
G1 X106.066 Y85.685 E.00372
; LINE_WIDTH: 0.229018
G2 X105.754 Y85.37 I-1.596 J1.27 E.00689
; LINE_WIDTH: 0.199471
G1 X105.506 Y85.188 E.004
; WIPE_START
G1 F5748.924
G1 X105.754 Y85.37 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G1 X105.072 Y86.972 Z10.2 F42000
G1 Z9.8
G1 E.4 F1800
; LINE_WIDTH: 0.132371
G1 F600
M204 S6000
G1 X104.931 Y86.875 E.00127
; LINE_WIDTH: 0.174216
G1 X104.833 Y86.798 E.00136
G3 X104.545 Y86.486 I1.518 J-1.689 E.00465
; LINE_WIDTH: 0.127163
G1 X104.495 Y86.412 E.00063
; LINE_WIDTH: 0.0993434
G1 X104.46 Y86.354 E.00032
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X104.495 Y86.412 E-.38
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 50/65
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z10.2 I-.25 J-1.191 P1  F42000
G1 X81.67 Y91.211 Z10.2
G1 Z10
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.662 Y91.203 E.00037
G3 X81.573 Y88.794 I-.007 J-1.206 E.11642
G1 X81.714 Y88.793 E.0044
G3 X81.955 Y91.165 I-.059 J1.204 E.10742
G1 X81.729 Y91.201 E.00716
M204 S250
G1 X82.027 Y91.9 F42000
G1 F600
M204 S5000
G1 X81.907 Y91.921 E.00384
G3 X81.752 Y88.064 I-.258 J-1.921 E.20227
G1 X81.986 Y88.091 E.00739
G3 X82.14 Y91.875 I-.337 J1.909 E.16474
G1 X82.086 Y91.887 E.00175
; WIPE_START
M73 P92 R1
G1 F2386.764
M204 S6000
G1 X81.907 Y91.921 E-.03466
G1 X81.669 Y91.941 E-.04536
G1 X81.43 Y91.928 E-.04538
G1 X81.195 Y91.887 E-.04538
G1 X80.967 Y91.817 E-.04536
G1 X80.749 Y91.719 E-.04538
G1 X80.545 Y91.595 E-.04539
G1 X80.357 Y91.447 E-.04536
G1 X80.255 Y91.343 E-.02774
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.4
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.4 F4000
            G39.3 S1
            G0 Z10.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.499 Y91.069 F42000
G1 Z10
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.378712
G1 F600
M204 S6000
G1 X80.471 Y91.045 E.00103
G1 X80.34 Y90.875 E.00598
G1 X80.17 Y90.539 E.01052
G1 X80.085 Y90.172 E.01052
G1 X80.076 Y89.968 E.0057
G1 X80.094 Y89.764 E.0057
G1 X80.194 Y89.401 E.01052
G1 X80.379 Y89.073 E.01052
G1 X80.517 Y88.909 E.00599
G1 X80.8 Y88.676 E.01023
G1 X80.988 Y88.573 E.00599
G1 X81.347 Y88.456 E.01052
G1 X81.722 Y88.429 E.01052
G1 X81.935 Y88.453 E.00599
G1 X82.295 Y88.565 E.01051
G1 X82.475 Y88.661 E.0057
G1 X82.771 Y88.895 E.01052
G1 X82.904 Y89.049 E.0057
G1 X83.095 Y89.374 E.01052
G1 X83.164 Y89.566 E.0057
G1 X83.224 Y89.938 E.01052
G1 X83.194 Y90.314 E.01052
G1 X83.141 Y90.511 E.0057
G1 X82.976 Y90.851 E.01056
G1 X82.842 Y91.029 E.00621
G1 X82.572 Y91.278 E.01025
G1 X82.242 Y91.46 E.01052
G1 X82.039 Y91.527 E.00599
G1 X81.665 Y91.576 E.01052
G1 X81.291 Y91.534 E.01052
G1 X81.086 Y91.471 E.00599
G1 X80.753 Y91.295 E.01052
G1 X80.544 Y91.109 E.00782
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2680.231
G1 X80.471 Y91.045 E-.0184
G1 X80.34 Y90.875 E-.04071
G1 X80.17 Y90.539 E-.0716
G1 X80.085 Y90.172 E-.07157
G1 X80.076 Y89.968 E-.03882
G1 X80.094 Y89.764 E-.03879
G1 X80.194 Y89.401 E-.07156
G1 X80.268 Y89.27 E-.02854
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 51/65
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z10.4 I-.985 J.714 P1  F42000
G1 X81.674 Y91.211 Z10.4
G1 Z10.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.662 Y91.203 E.00047
G3 X81.57 Y88.794 I-.008 J-1.206 E.11642
G1 X81.714 Y88.793 E.00449
G3 X81.809 Y91.193 I-.06 J1.204 E.11198
G1 X81.734 Y91.203 E.00239
M204 S250
G1 X82.036 Y91.878 F42000
G1 F600
M204 S5000
G1 X81.881 Y91.906 E.00495
G3 X81.257 Y88.122 I-.235 J-1.905 E.18416
G3 X81.781 Y88.087 I.404 J2.1 E.0165
G3 X82.144 Y91.855 I-.134 J1.915 E.16906
G1 X82.095 Y91.866 E.00157
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.881 Y91.906 E-.0414
G1 X81.678 Y91.922 E-.0387
G1 X81.41 Y91.907 E-.05093
G1 X81.21 Y91.871 E-.0387
G1 X80.954 Y91.791 E-.05094
G1 X80.768 Y91.708 E-.03879
G1 X80.585 Y91.597 E-.04065
G1 X80.379 Y91.442 E-.04887
G1 X80.265 Y91.325 E-.03102
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.6
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.6 F4000
            G39.3 S1
            G0 Z10.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.504 Y91.06 F42000
G1 Z10.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.359877
G1 F600
M204 S6000
G1 X80.478 Y91.038 E.0009
G3 X80.086 Y89.958 I1.173 J-1.036 E.03101
G1 X80.099 Y89.793 E.00437
G3 X80.745 Y91.279 I1.551 J.209 E.21429
G1 X80.548 Y91.101 E.007
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F2839.501
G1 X80.478 Y91.038 E-.01791
G1 X80.349 Y90.87 E-.04027
G1 X80.184 Y90.55 E-.06833
G1 X80.121 Y90.335 E-.04265
G1 X80.086 Y89.958 E-.07184
G1 X80.099 Y89.793 E-.03147
G1 X80.145 Y89.574 E-.04262
G1 X80.277 Y89.259 E-.0649
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 52/65
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z10.6 I-.99 J.707 P1  F42000
G1 X81.672 Y91.21 Z10.6
G1 Z10.4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.662 Y91.203 E.0004
G3 X81.565 Y88.794 I-.011 J-1.206 E.11643
G1 X81.714 Y88.793 E.00467
G3 X81.954 Y91.164 I-.063 J1.204 E.10716
G1 X81.731 Y91.201 E.0071
M204 S250
G1 X82.05 Y91.836 F42000
G1 F600
M204 S5000
G1 X82.009 Y91.844 E.00132
G3 X80.787 Y88.328 I-.365 J-1.844 E.16874
G3 X81.857 Y88.133 I.878 J1.785 E.03453
G3 X82.277 Y91.77 I-.212 J1.867 E.15823
G1 X82.108 Y91.819 E.00552
; WIPE_START
G1 F2386.764
M204 S6000
G1 X82.009 Y91.844 E-.01939
G1 X81.696 Y91.885 E-.05995
G1 X81.37 Y91.863 E-.06211
G1 X81.239 Y91.84 E-.02531
G1 X80.805 Y91.685 E-.08751
G1 X80.423 Y91.431 E-.08712
G1 X80.282 Y91.286 E-.03861
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z10.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.8
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.8 F4000
            G39.3 S1
            G0 Z10.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.523 Y91.05 F42000
G1 Z10.4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.322155
G1 F600
M204 S6000
G1 X80.451 Y90.975 E.00242
G3 X80.114 Y90.167 I1.199 J-.974 E.02061
G1 X80.106 Y89.96 E.00481
G3 X80.651 Y91.179 I1.544 J.041 E.19329
G1 X80.565 Y91.093 E.00281
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F3223.099
G1 X80.451 Y90.975 E-.03117
G1 X80.27 Y90.695 E-.0633
G1 X80.195 Y90.52 E-.03615
G1 X80.114 Y90.167 E-.06891
G1 X80.106 Y89.96 E-.0394
G1 X80.158 Y89.601 E-.06893
G1 X80.219 Y89.42 E-.03615
G1 X80.308 Y89.253 E-.03598
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 53/65
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z10.8 I-.997 J.697 P1  F42000
G1 X81.677 Y91.211 Z10.8
G1 Z10.6
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.662 Y91.203 E.00054
G3 X81.565 Y88.794 I-.011 J-1.206 E.11643
G1 X81.714 Y88.793 E.00467
G3 X81.809 Y91.192 I-.063 J1.204 E.1118
G1 X81.736 Y91.202 E.00231
M204 S250
G1 X82.052 Y91.795 F42000
G1 F600
M204 S5000
G1 X81.714 Y91.845 E.01071
G3 X80.399 Y88.643 I-.067 J-1.843 E.14085
G3 X81.933 Y88.18 I1.243 J1.343 E.05201
G3 X82.156 Y91.775 I-.286 J1.822 E.1565
G1 X82.111 Y91.783 E.00144
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.714 Y91.845 E-.07632
G1 X81.33 Y91.82 E-.07322
G1 X80.843 Y91.663 E-.09723
G1 X80.468 Y91.421 E-.08486
G1 X80.293 Y91.235 E-.04838
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z11 F4000
            G39.3 S1
            G0 Z11 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.52 Y91.015 F42000
G1 Z10.6
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28297
G1 F600
M204 S6000
M73 P93 R1
G1 X80.442 Y90.933 E.00225
G3 X80.134 Y90.164 I1.208 J-.931 E.01676
G1 X80.125 Y89.961 E.00404
G3 X80.14 Y89.789 I1.19 J.015 E.00346
G3 X80.683 Y91.182 I1.51 J.213 E.16007
G1 X80.562 Y91.058 E.00346
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3749.231
G1 X80.442 Y90.933 E-.03286
G1 X80.288 Y90.688 E-.05509
G1 X80.214 Y90.515 E-.03566
G1 X80.134 Y90.164 E-.06849
G1 X80.125 Y89.961 E-.03846
G1 X80.14 Y89.789 E-.03292
G1 X80.205 Y89.506 E-.05513
G1 X80.344 Y89.214 E-.06139
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 54/65
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z11 I-1.016 J.671 P1  F42000
G1 X81.678 Y91.235 Z11
G1 Z10.8
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.674 Y91.234 E.00013
G3 X81.573 Y88.769 I-.024 J-1.233 E.11981
G3 X81.874 Y88.787 I.064 J1.47 E.00946
G3 X81.886 Y91.211 I-.223 J1.213 E.10705
G1 X81.738 Y91.228 E.00469
M204 S250
G1 X82.059 Y91.755 F42000
G1 F600
M204 S5000
G1 X81.723 Y91.8 E.01064
G3 X80.873 Y91.636 I-.076 J-1.892 E.02738
G1 X80.511 Y91.409 E.0134
G3 X79.984 Y90.708 I1.478 J-1.66 E.02768
G1 X79.866 Y90.305 E.01316
G1 X79.847 Y89.85 E.01425
G1 X79.93 Y89.439 E.01317
G3 X80.119 Y89.035 I2.692 J1.015 E.01401
G3 X80.396 Y88.696 I2.347 J1.633 E.01371
G1 X80.737 Y88.439 E.01342
G1 X81.139 Y88.265 E.01371
G1 X81.57 Y88.193 E.0137
G1 X82.003 Y88.226 E.01362
G1 X82.012 Y88.227 E.0003
G3 X82.427 Y88.366 I-.472 J2.104 E.01371
G1 X82.79 Y88.595 E.01349
G1 X83.094 Y88.91 E.01371
G1 X83.314 Y89.288 E.01371
G1 X83.436 Y89.702 E.01355
G1 X83.456 Y90.138 E.01368
G1 X83.368 Y90.572 E.01386
G1 X83.182 Y90.967 E.01371
G1 X82.905 Y91.306 E.01371
G1 X82.563 Y91.566 E.01348
G3 X82.16 Y91.731 I-.915 J-1.658 E.01368
G1 X82.118 Y91.741 E.00136
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.723 Y91.8 E-.07584
G1 X81.288 Y91.775 E-.08282
G1 X80.873 Y91.636 E-.08311
G1 X80.511 Y91.409 E-.08122
G1 X80.303 Y91.192 E-.057
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.2
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z11.2 F4000
            G39.3 S1
            G0 Z11.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.51 Y90.993 F42000
G1 Z10.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.219751
G1 F600
M204 S6000
G1 X80.438 Y90.91 E.00162
G3 X80.145 Y90.187 I1.212 J-.912 E.0116
G1 X80.134 Y89.939 E.00365
G3 X80.144 Y89.817 I.511 J-.023 E.00182
G3 X80.696 Y91.177 I1.506 J.181 E.1176
G1 X80.553 Y91.035 E.00296
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5089.628
G1 X80.438 Y90.91 E-.03236
G1 X80.288 Y90.669 E-.05394
G1 X80.23 Y90.537 E-.02747
G1 X80.145 Y90.187 E-.0683
G1 X80.134 Y89.939 E-.04714
G1 X80.144 Y89.817 E-.0234
G1 X80.205 Y89.529 E-.05582
G1 X80.364 Y89.191 E-.07101
G1 X80.365 Y89.189 E-.00055
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 55/65
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z11.2 I-1.025 J.656 P1  F42000
G1 X81.692 Y91.26 Z11.2
G1 Z11
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.395 Y91.225 E.00936
G3 X81.291 Y88.795 I.255 J-1.229 E.10411
G1 X81.59 Y88.743 E.00952
G3 X81.746 Y91.248 I.06 J1.253 E.1225
M204 S250
G1 X82.066 Y91.717 F42000
G1 F600
M204 S5000
G1 X81.726 Y91.773 E.01082
G1 X81.3 Y91.74 E.0134
G1 X80.894 Y91.605 E.0134
G1 X80.532 Y91.378 E.0134
G1 X80.235 Y91.07 E.01341
G1 X80.02 Y90.7 E.01341
G1 X79.901 Y90.29 E.0134
G1 X79.882 Y89.863 E.01341
G1 X79.967 Y89.444 E.01341
G1 X80.149 Y89.057 E.0134
G1 X80.419 Y88.725 E.0134
G1 X80.76 Y88.468 E.01341
G1 X81.153 Y88.299 E.0134
G1 X81.575 Y88.23 E.01341
G1 X81.64 Y88.235 E.00203
M73 P94 R0
G1 X82.001 Y88.263 E.01137
G1 X82.407 Y88.397 E.0134
G1 X82.769 Y88.625 E.01341
G1 X83.066 Y88.933 E.0134
G1 X83.28 Y89.303 E.01341
G1 X83.4 Y89.713 E.0134
G1 X83.418 Y90.14 E.01341
G1 X83.334 Y90.559 E.0134
G1 X83.151 Y90.946 E.01341
G1 X82.882 Y91.278 E.0134
G1 X82.541 Y91.535 E.01341
G1 X82.148 Y91.704 E.0134
G1 X82.125 Y91.707 E.00071
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.726 Y91.773 E-.07695
G1 X81.3 Y91.74 E-.08123
G1 X80.894 Y91.605 E-.08123
G1 X80.532 Y91.378 E-.08123
G1 X80.315 Y91.153 E-.05936
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.4
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z11.4 F4000
            G39.3 S1
            G0 Z11.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.5 Y90.975 F42000
G1 Z11
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.160826
G1 F600
M204 S6000
G1 X80.445 Y90.911 E.00083
G3 X80.152 Y90.211 I1.203 J-.915 E.00752
G1 X80.141 Y89.958 E.00248
G3 X80.143 Y89.86 I.405 J-.042 E.00097
G3 X80.695 Y91.169 I1.505 J.136 E.07861
G1 X80.543 Y91.018 E.0021
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7633.236
G1 X80.445 Y90.911 E-.02746
G1 X80.279 Y90.639 E-.06053
G1 X80.152 Y90.211 E-.08486
G1 X80.141 Y89.958 E-.04808
G1 X80.143 Y89.86 E-.01868
G1 X80.213 Y89.525 E-.06501
G1 X80.359 Y89.21 E-.06599
G1 X80.39 Y89.171 E-.0094
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 56/65
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z11.4 I-1.036 J.639 P1  F42000
G1 X81.693 Y91.283 Z11.4
G1 Z11.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.398 Y91.251 E.0093
G3 X81.291 Y88.769 I.251 J-1.254 E.10662
G1 X81.369 Y88.756 E.00249
G1 X81.596 Y88.719 E.00721
G3 X81.75 Y91.272 I.054 J1.278 E.1245
M204 S250
G1 X82.073 Y91.679 F42000
G1 F600
M204 S5000
G1 X81.724 Y91.737 E.01108
G1 X81.307 Y91.704 E.01313
G1 X80.909 Y91.572 E.01313
G1 X80.555 Y91.349 E.01313
G1 X80.264 Y91.048 E.01313
G1 X80.054 Y90.686 E.01313
G1 X79.937 Y90.284 E.01313
G1 X79.919 Y89.866 E.01313
G1 X80.002 Y89.455 E.01313
G1 X80.18 Y89.077 E.01313
G1 X80.444 Y88.752 E.01313
G1 X80.779 Y88.499 E.01313
G1 X81.163 Y88.334 E.01313
G1 X81.577 Y88.266 E.01313
G1 X81.761 Y88.281 E.00581
G1 X81.994 Y88.299 E.00731
G1 X82.391 Y88.431 E.01313
G1 X82.746 Y88.654 E.01313
G1 X83.036 Y88.955 E.01313
G1 X83.247 Y89.317 E.01313
G1 X83.312 Y89.541 E.00731
G1 X83.364 Y89.719 E.00581
G1 X83.382 Y90.137 E.01313
G1 X83.299 Y90.548 E.01313
G1 X83.12 Y90.926 E.01313
G1 X82.856 Y91.251 E.01313
G1 X82.522 Y91.504 E.01313
G1 X82.137 Y91.669 E.01313
G1 X82.132 Y91.669 E.00017
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.724 Y91.737 E-.07855
G1 X81.307 Y91.704 E-.07955
G1 X80.909 Y91.572 E-.07954
G1 X80.555 Y91.349 E-.07956
G1 X80.326 Y91.111 E-.0628
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.6
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z11.6 F4000
            G39.3 S1
            G0 Z11.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X80.487 Y90.955 F42000
G1 Z11.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.100806
G1 F600
M204 S6000
G1 X80.448 Y90.914 E.00028
G1 X80.261 Y90.593 E.00179
G1 X80.16 Y90.247 E.00174
G1 X80.145 Y89.883 E.00175
G1 X80.218 Y89.523 E.00177
G1 X80.372 Y89.197 E.00174
G1 X80.602 Y88.915 E.00175
G1 X80.892 Y88.695 E.00175
G1 X81.224 Y88.553 E.00173
G1 X81.59 Y88.493 E.00179
G1 X81.949 Y88.521 E.00174
G1 X82.295 Y88.636 E.00175
G1 X82.603 Y88.83 E.00175
G1 X82.853 Y89.089 E.00174
G1 X83.039 Y89.41 E.00178
G1 X83.14 Y89.756 E.00174
G1 X83.156 Y90.12 E.00175
G1 X83.082 Y90.48 E.00177
G1 X82.929 Y90.806 E.00174
G1 X82.699 Y91.088 E.00175
G1 X82.408 Y91.307 E.00175
G1 X82.077 Y91.45 E.00174
G1 X81.711 Y91.51 E.00178
G1 X81.352 Y91.482 E.00174
G1 X81.006 Y91.367 E.00175
G1 X80.698 Y91.173 E.00175
G1 X80.529 Y90.998 E.00117
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X80.448 Y90.914 E-.02228
G1 X80.261 Y90.593 E-.07047
G1 X80.16 Y90.247 E-.0685
G1 X80.145 Y89.883 E-.06916
G1 X80.218 Y89.523 E-.06982
G1 X80.372 Y89.197 E-.06851
G1 X80.41 Y89.151 E-.01126
; WIPE_END
G1 E-.02 F1800
; layer num/total_layer_count: 57/65
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; OBJECT_ID: 25
M204 S10000
G17
G3 Z11.6 I-1.046 J.623 P1  F42000
G1 X81.694 Y91.307 Z11.6
G1 Z11.4
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X81.392 Y91.281 E.00949
G3 X81.469 Y88.716 I.264 J-1.276 E.11409
G3 X82.941 Y89.789 I.178 J1.302 E.06309
G3 X81.754 Y91.304 I-1.285 J.216 E.0679
M204 S250
G1 X82.079 Y91.641 F42000
G1 F600
M204 S5000
G1 X81.723 Y91.7 E.01134
G1 X81.314 Y91.668 E.01285
G1 X80.925 Y91.539 E.01285
G1 X80.578 Y91.321 E.01285
G1 X80.294 Y91.026 E.01285
G1 X80.088 Y90.671 E.01285
G1 X79.973 Y90.278 E.01285
G1 X79.955 Y89.868 E.01285
G1 X80.037 Y89.467 E.01285
G1 X80.211 Y89.096 E.01285
G1 X80.47 Y88.778 E.01285
M73 P95 R0
G1 X80.797 Y88.531 E.01285
G1 X81.174 Y88.37 E.01285
G1 X81.578 Y88.303 E.01285
G1 X81.883 Y88.327 E.00959
G1 X81.987 Y88.335 E.00326
G1 X82.376 Y88.464 E.01285
G1 X82.723 Y88.682 E.01285
G1 X83.007 Y88.977 E.01285
G1 X83.213 Y89.332 E.01285
G1 X83.328 Y89.725 E.01285
G1 X83.345 Y90.134 E.01285
G1 X83.264 Y90.536 E.01285
G1 X83.089 Y90.907 E.01285
G1 X82.831 Y91.225 E.01285
G1 X82.504 Y91.472 E.01285
G1 X82.138 Y91.629 E.01248
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.723 Y91.7 E-.08003
G1 X81.314 Y91.668 E-.07787
G1 X80.925 Y91.539 E-.07788
G1 X80.578 Y91.321 E-.07786
G1 X80.336 Y91.069 E-.06636
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z11.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z11.8
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z11.8 F4000
            G39.3 S1
            G0 Z11.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; layer num/total_layer_count: 58/65
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; OBJECT_ID: 25
G1 X81.694 Y91.331 F42000
G1 Z11.6
G1 E.4 F1800
G1 F600
M204 S5000
G1 X81.389 Y91.297 E.00963
G3 X81.277 Y88.723 I.261 J-1.301 E.11061
G1 X81.594 Y88.671 E.01006
G3 X81.751 Y91.319 I.056 J1.326 E.12924
M204 S250
G1 X82.086 Y91.603 F42000
G1 F600
M204 S5000
G1 X81.721 Y91.663 E.01158
G1 X81.321 Y91.632 E.01257
G1 X80.941 Y91.506 E.01257
G1 X80.601 Y91.292 E.01257
G1 X80.323 Y91.004 E.01257
G1 X80.122 Y90.657 E.01258
G1 X80.009 Y90.272 E.01257
G1 X79.992 Y89.871 E.01258
G1 X80.071 Y89.478 E.01257
G1 X80.242 Y89.116 E.01258
G1 X80.495 Y88.804 E.01257
G1 X80.815 Y88.563 E.01258
G1 X81.184 Y88.405 E.01257
G1 X81.58 Y88.339 E.01257
G1 X81.979 Y88.371 E.01257
G1 X82.36 Y88.497 E.01257
G1 X82.7 Y88.711 E.01257
G1 X82.978 Y88.999 E.01257
G1 X83.179 Y89.346 E.01258
G1 X83.292 Y89.731 E.01257
G1 X83.309 Y90.132 E.01257
G1 X83.229 Y90.525 E.01257
G1 X83.058 Y90.887 E.01258
G1 X82.805 Y91.198 E.01257
G1 X82.485 Y91.44 E.01258
G1 X82.143 Y91.587 E.01169
; WIPE_START
G1 F2386.764
M204 S6000
G1 X81.721 Y91.663 E-.08142
G1 X81.321 Y91.632 E-.07619
G1 X80.941 Y91.506 E-.07619
G1 X80.601 Y91.292 E-.07619
G1 X80.345 Y91.027 E-.07
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z12 F4000
            G39.3 S1
            G0 Z12 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 59/65
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; OBJECT_ID: 25
G1 X81.696 Y91.334 F42000
G1 Z11.8
G1 E.4 F1800
; LINE_WIDTH: 0.378512
G1 F600
M204 S5000
G1 X81.388 Y91.3 E.00864
G3 X81.276 Y88.72 I.261 J-1.303 E.09864
G1 X81.459 Y88.69 E.00516
G1 X81.594 Y88.668 E.00382
G3 X81.752 Y91.321 I.056 J1.328 E.11522
M204 S250
G1 X82.097 Y91.586 F42000
G1 F600
M204 S5000
G1 X81.72 Y91.648 E.01064
G1 X81.325 Y91.617 E.01108
G1 X80.947 Y91.492 E.01108
G1 X80.611 Y91.28 E.01109
G1 X80.335 Y90.994 E.01108
G1 X80.136 Y90.651 E.01108
G1 X80.025 Y90.269 E.01108
G1 X80.008 Y89.873 E.01108
G1 X80.086 Y89.483 E.01109
G1 X80.218 Y89.204 E.00861
G1 X80.256 Y89.124 E.00248
G1 X80.506 Y88.816 E.01108
G1 X80.823 Y88.576 E.01108
G1 X81.188 Y88.42 E.01109
G1 X81.58 Y88.355 E.01108
G1 X81.669 Y88.362 E.00248
G1 X81.976 Y88.386 E.00861
G1 X82.353 Y88.511 E.01108
G1 X82.69 Y88.723 E.01109
G1 X82.965 Y89.009 E.01108
G1 X83.165 Y89.352 E.01108
G1 X83.276 Y89.733 E.01108
G1 X83.293 Y90.13 E.01108
G1 X83.214 Y90.52 E.01108
G1 X83.045 Y90.879 E.01108
G1 X82.795 Y91.187 E.01108
G1 X82.478 Y91.426 E.01108
G1 X82.153 Y91.566 E.00985
; WIPE_START
G1 F2681.829
M204 S6000
G1 X81.72 Y91.648 E-.08364
G1 X81.325 Y91.617 E-.07546
G1 X80.947 Y91.492 E-.07546
G1 X80.611 Y91.28 E-.07548
G1 X80.356 Y91.015 E-.06995
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.2
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z12.2 F4000
            G39.3 S1
            G0 Z12.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 60/65
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; OBJECT_ID: 25
G1 X81.697 Y91.358 F42000
G1 Z12
G1 E.4 F1800
G1 F600
M204 S5000
G1 X81.384 Y91.324 E.00879
G3 X81.269 Y88.697 I.266 J-1.327 E.10045
G1 X81.345 Y88.685 E.00215
G1 X81.593 Y88.644 E.00699
G3 X81.753 Y91.346 I.057 J1.352 E.11736
M204 S250
G1 X82.1 Y91.548 F42000
G1 F600
M204 S5000
G1 X81.718 Y91.599 E.01075
G3 X81.582 Y88.392 I-.068 J-1.604 E.14068
G1 X81.782 Y88.408 E.00559
G1 X81.969 Y88.422 E.00524
G3 X82.145 Y91.523 I-.318 J1.573 E.11775
; WIPE_START
G1 F2681.829
M204 S6000
G1 X81.718 Y91.599 E-.08243
G1 X81.332 Y91.581 E-.07355
G1 X80.963 Y91.459 E-.07379
G1 X80.634 Y91.252 E-.07379
G1 X80.365 Y90.972 E-.07379
G1 X80.358 Y90.96 E-.00265
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.4
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z12.4 F4000
            G39.3 S1
            G0 Z12.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 61/65
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; OBJECT_ID: 25
G1 X81.697 Y91.382 F42000
G1 Z12.2
G1 E.4 F1800
G1 F600
M204 S5000
G1 X81.378 Y91.353 E.00894
G3 X81.51 Y88.634 I.279 J-1.349 E.10885
G3 X82.921 Y89.457 I.152 J1.362 E.04884
G3 X81.757 Y91.378 I-1.265 J.547 E.07329
M204 S250
G1 X82.096 Y91.511 F42000
G1 F600
M204 S5000
G1 X82.09 Y91.507 E.0002
G3 X81.784 Y91.563 I-.439 J-1.508 E.0087
G1 X81.717 Y91.574 E.00188
G3 X81.895 Y88.453 I-.067 J-1.57 E.14645
G1 X81.962 Y88.458 E.00188
G3 X82.438 Y91.358 I-.31 J1.54 E.10602
G1 X82.151 Y91.486 E.00878
; WIPE_START
G1 F2681.829
M204 S6000
G1 X82.09 Y91.507 E-.0121
G1 X81.784 Y91.563 E-.05917
M73 P96 R0
G1 X81.717 Y91.574 E-.01281
G1 X81.339 Y91.545 E-.07212
G1 X80.979 Y91.425 E-.0721
G1 X80.657 Y91.223 E-.07211
G1 X80.394 Y90.95 E-.07211
G1 X80.374 Y90.916 E-.00747
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.6
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z12.6 F4000
            G39.3 S1
            G0 Z12.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 62/65
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; OBJECT_ID: 25
G1 X81.697 Y91.406 F42000
G1 Z12.4
G1 E.4 F1800
G1 F600
M204 S5000
G1 X81.374 Y91.37 E.00907
G3 X81.256 Y88.651 I.275 J-1.374 E.10399
G1 X81.391 Y88.629 E.00382
G1 X81.591 Y88.596 E.00565
G3 X81.754 Y91.394 I.059 J1.4 E.12158
M204 S250
G1 X82.094 Y91.473 F42000
G1 F600
M204 S5000
G1 X82.08 Y91.471 E.00038
G3 X81.216 Y88.526 I-.429 J-1.473 E.13432
G3 X81.953 Y88.493 I.436 J1.484 E.02078
G1 X81.956 Y88.494 E.00008
G3 X82.428 Y91.321 I-.304 J1.504 E.10325
G1 X82.148 Y91.448 E.00856
; WIPE_START
G1 F2681.829
M204 S6000
G1 X82.08 Y91.471 E-.01365
G1 X81.713 Y91.538 E-.07101
G1 X81.343 Y91.508 E-.07052
G1 X80.99 Y91.39 E-.07057
G1 X80.687 Y91.2 E-.06811
G1 X80.42 Y90.924 E-.07293
G1 X80.385 Y90.863 E-.01322
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z12.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z12.8
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z12.8 F4000
            G39.3 S1
            G0 Z12.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; layer num/total_layer_count: 63/65
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; OBJECT_ID: 25
G1 X81.697 Y91.43 F42000
G1 Z12.6
G1 E.4 F1800
G1 F600
M204 S5000
G1 X81.369 Y91.394 E.00921
G3 X81.249 Y88.628 I.28 J-1.398 E.10577
G1 X81.59 Y88.572 E.00962
G3 X81.754 Y91.418 I.06 J1.424 E.12371
M204 S250
G1 X82.104 Y91.428 F42000
G1 F600
M204 S5000
G3 X81.262 Y88.552 I-.459 J-1.427 E.1336
G3 X81.89 Y88.522 I.381 J1.389 E.01769
G3 X82.161 Y91.408 I-.244 J1.479 E.10987
; WIPE_START
G1 F2681.829
M204 S6000
G1 X81.705 Y91.502 E-.08848
G1 X81.342 Y91.471 E-.06917
G1 X81.037 Y91.371 E-.06108
G1 X80.691 Y91.157 E-.0772
G1 X80.442 Y90.892 E-.06915
G1 X80.402 Y90.825 E-.01492
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z13 F4000
            G39.3 S1
            G0 Z13 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 64/65
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; OBJECT_ID: 25
G1 X82.105 Y91.379 F42000
G1 Z12.8
G1 E.4 F1800
G1 F600
M204 S5000
G1 X81.961 Y91.414 E.00414
G3 X81.566 Y88.55 I-.31 J-1.416 E.13346
G3 X81.919 Y88.573 I.061 J1.826 E.00988
G3 X82.16 Y91.356 I-.268 J1.425 E.10509
M204 S250
G1 X81.714 Y91.462 F42000
G1 F600
M204 S5000
G1 X81.688 Y91.461 E.00073
G3 X80.974 Y88.703 I-.043 J-1.461 E.10983
G3 X81.82 Y88.55 I.689 J1.394 E.0243
G3 X82.04 Y91.408 I-.174 J1.451 E.11207
G1 X81.774 Y91.452 E.00754
; WIPE_START
G1 F2681.829
M204 S6000
G1 X81.688 Y91.461 E-.01628
G1 X81.427 Y91.448 E-.04975
G1 X81.333 Y91.432 E-.01809
G1 X80.996 Y91.312 E-.06802
G1 X80.699 Y91.115 E-.06764
G1 X80.516 Y90.927 E-.04986
G1 X80.288 Y90.538 E-.08572
G1 X80.255 Y90.413 E-.02463
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z13.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z13.2
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z13.2 F4000
            G39.3 S1
            G0 Z13.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




; close powerlost recovery
M1003 S0
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20260513 =====================
;turn off nozzle clog detect
G392 S0

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G90
G1 Z13.2 F900 ; lower z a little
G1 X0 Y89.9994 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos

M1002 judge_flag timelapse_record_flag
M622 J1
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M991 S0 P-1 ;end timelapse at safe pos
M623


M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

;G1 X27 F15000 ; wipe

; pull back filament to AMS
M620 S255
G1 X181 F12000
T255
G1 X0 F18000
G1 X-13.0 F3000
G1 X0 F18000 ; wipe
M621 S255

M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z112.8 F600
    G1 Z110.8

M400 P100
M17 R ; restore z current

G90
G1 X-13 Y180 F3600

G91
G1 Z-1 F600
G90
M83

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A0 B20 L100 C37 D20 M100 E42 F20 N100
M1006 A0 B10 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C46 D10 M100 E46 F10 N100
M1006 A44 B20 L100 C39 D20 M100 E48 F20 N100
M1006 A0 B10 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B10 L100 C39 D10 M100 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B10 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B10 L100 C39 D10 M100 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A44 B10 L100 C0 D10 M100 E48 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A44 B20 L100 C41 D20 M100 E49 F20 N100
M1006 A0 B20 L100 C0 D20 M100 E0 F20 N100
M1006 A0 B20 L100 C37 D20 M100 E37 F20 N100
M1006 W
;=====printer finish  sound=========
M400 S1
M18 X Y Z
M73 P100 R0
; EXECUTABLE_BLOCK_END

