/// @description Actions

if (!global.pause) {
	switch (object_get_parent(owner.object_index)) {
		case class_player:
			#region Orientation.
			
				x = owner.x;
				image_xscale = owner.image_xscale;
				if (is_selected) {
					y = owner.y-8;
					depth = owner.depth-1;
					image_angle = point_direction(x, y, owner.crosshair_x, owner.crosshair_y);
					if (image_xscale == -1) {
						image_angle += 180;
					}
				} else {
					y = owner.y-16;
					depth = owner.depth+1;
					if (image_xscale == 1) {
						image_angle = 130;
						x -= 4;
					} else {
						image_angle = 230;
						x += 4;
					}
				}
			
			#endregion
			if (is_selected) {
				if (!owner.is_digging && owner.current_animation != animation.dig) {
					#region Shot.
	
						if (input_keyboard_shot() || input_gamepad_shot()) {
							if (current_ammo > 0) {
								var _projectile = instance_create_layer(x+sprite_width, y, "interactive", projectile);
								_projectile.image_xscale = image_xscale;
							}
						}
	
					#endregion
					#region Reload.
		
						if (input_keyboard_reload()) {
							is_reloading = true;
						}
						if (is_reloading) {
							current_reload_time += delta_time;
							if (current_reload_time >= reload_duration) {
								current_reload_time = 0;
								is_reloading = false;
								audio_play(owner.audio_emitter, false, pr_low, sfx_reload_end);
								if (audio_is_playing(sfx_reload_loop1)) {
									audio_stop_sound(sfx_reload_loop1);
								}
								if (audio_is_playing(sfx_reload_loop2)) {
									audio_stop_sound(sfx_reload_loop2);
								}
								if (audio_is_playing(sfx_reload_loop3)) {
									audio_stop_sound(sfx_reload_loop3);
								}
							}
						}
	
					#endregion
				}
			} else {
				#region Recoil.
	
					current_recoil += recoil_speed;
					if (current_recoil > 0) {
						recoil_speed -= recoil_return;
					} else {
						current_recoil = 0;
						recoil_speed = 0;
					}
					if (current_recoil > recoil_max) {
						current_recoil = recoil_max;
					}
	
				#endregion
			}
		break;
	}
}