/// @description Opciones

option = global.volume_sound;
for (var _option = 0; _option <= 10; _option++) {
	label_option[_option] = string(_option);
}
max_option = array_length_1d(label_option)-1;
label_text = get_lang_value(label_code);
label_text_second = label_option[option];