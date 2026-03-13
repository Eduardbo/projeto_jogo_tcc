draw_sprite(spr_book, 0, 15, 17);

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_ui);
draw_text(30,17, string(global.book));

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);