/// @description Actions

if (is_selected) {
	if (icon_scale > icon_scale_final) {
		icon_scale -= min(icon_scale_speed, icon_scale-icon_scale_final);
	}
} else {
	icon_scale = icon_scale_start;
}
if (execute_action && !is_clicked_play) {
	is_clicked_play = true;
	audio_play_sound(sfx_clicked, pr_hight, false);
} else {
	is_clicked_play = false;
}
if (is_selected && !is_selected_play) {
	is_selected_play = true;
	audio_play_sound(sfx_selected, pr_hight, false);
} else {
	is_selected_play = false;
}