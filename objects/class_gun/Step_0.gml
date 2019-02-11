/// @description Actions

switch (object_get_parent(owner.object_index)) {
	case class_player:
		x = owner.x;
		image_xscale = owner.image_xscale;
		if (is_selected) {
			y = owner.y-8;
			depth = owner.depth-1;
			if (owner.is_sprinting) {
				if (image_xscale == -1) {
					image_angle = 45;
				} else {
					image_angle = -45;
				}
			} else {
				image_angle = point_direction(x, y, mouse_x, mouse_y);
				if (image_xscale == 0) {
					image_angle += 180;
				}
			}
			if ((owner.is_meleeing || owner.is_throwing) && owner.current_animation == animation.melee) {
				if (owner.animation_index == 0) {
					image_angle = 0;
				} else if (owner.animation_index == 1) {
					image_angle = 25;
				} else if (owner.animation_index >= 2 && owner.animation_index < 5) {
					image_angle = 25;
				} else if (owner.animation_index >= 5) {
					image_angle = 160;
				}
				if (image_xscale == 0) {
					image_angle = -image_angle;
				}
			}
		} else {
			y = owner.y-35;
			depth = owner.depth+1;
			if (image_xscale == 1) {
				image_angle = 135;
			} else {
				image_angle = 225;
			}
		}
			/*if (owner.is_sprinting) {
				if (image_xscale == -1) {
					image_angle = 45;
				} else {
					image_angle = -45;
				}
			} else {
				image_angle = point_direction(x, y, mouse_x, mouse_y);
				if (image_xscale == -1) {
					image_angle += 180;
				}
			}
			if ((owner.is_meleeing || owner.is_throwing) && owner.current_animation == animation.melee) {
				var _direction = owner.image_xscale == 1? 1: 0;
				
				if (owner.animation_index == 0) {
					 x = owner.x-5*_direction;
					y = owner.y-15;
					image_angle = 0;
				} else if (owner.animation_index == 1) {
					x = owner.x-5*_direction;
					y = owner.y-15;
					image_angle = 25;
				} else if (owner.animation_index >= 2 && owner.animation_index < 5) {
					x = owner.x-10*_direction;
					y = owner.y-10;
					image_angle = 25;
				} else if (owner.animation_index >= 5) {
					x = owner.x+38*_direction;
					y = owner.y-7;
					image_angle = 160;
				}
				if (image_xscale == 0) {
					if (image_angle == 160) {
						x = x.owner-38;
					}
					image_angle = -image_angle;
				}
			}
		} else {
			image_xscale = owner.image_xscale;
			if (image_xscale == 1) {
				image_angle = 135;
			} else {
				image_angle = 225;
			}
		}*/
	break;
}
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