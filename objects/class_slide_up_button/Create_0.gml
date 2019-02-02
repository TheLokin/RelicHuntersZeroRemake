/// @description Variables

event_inherited();

#region Desplazamiento.

	move_speed = 3;		// Velocidad a la que se desplaza el botón.
	final_y -= 8;		// Posición en el eje vertical final del botón.
	
#endregion
#region Icono.

	icon_x = sprite_get_width(sprite_index)/2;		// Posición en el eje horizontal del icono.	
	icon_y = 0;										// Posición en el eje vertical del icono.

#endregion
#region Texto.

	font_code = ft_medium;									// Código de la fuente.
	label_font = get_font(font_code);						// Fuente del texto.
	label_text_x = sprite_get_width(sprite_index)/2;		// Posición en el eje horizontal del texto.
	label_text_y = sprite_get_height(sprite_index)/2;		// Posición en el eje vertical del texto.
	
#endregion