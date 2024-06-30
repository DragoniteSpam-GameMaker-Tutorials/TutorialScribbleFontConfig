for (var i = 0; i < 3; i++) {
    draw_sprite_ext(spr_hearts, 0, 64 + 72 * i, 64, 4, 4, 0, c_white, 1);
}

//var text = "Oh, there once was a hero named [b]Ragnar the Red[/b], who came riding to [i]Whiterun[/i] from old [bi][rainbow]Rorikstead![/rainbow][/bi] And the braggart did swagger and brandish his blade, as he told of bold battles and the [c_yellow]gold[/c] he had made!~";

var text_markdown = @"# Oh,
There once was a hero named **Ragnar the Red**, who came riding to _Whiterun_ from old ***[rainbow]Rorikstead![/rainbow]***
And the braggart did swagger and brandish his blade, as he told of bold battles and the [c_yellow]gold[/c] he had made!~";

// use scribble_markdown_set_styles() to define style information
scribble_markdown_set_styles({
    quote: {
        color: c_gray,
        italic: true,
        bold: true
    }
});
var text = scribble_markdown_format(text_markdown);

draw_sprite_stretched(spr_nineslice, 0, 0, window_get_height() - 176, window_get_width(), 176);

var text_x = 32;
var text_y = window_get_height() - 144;

draw_circle(text_x, text_y, 8, false);
draw_circle_colour(text_x, text_y, 8, c_black, c_black, true);

var scribble_object = scribble(text)
    .wrap(960)
    /*.line_spacing(32)
    .align(fa_left, fa_top)
    .origin(100, 100)
    .bezier(
        0, 0,
        640, -160,
        720, 160,
        1000, -64,
    );*/

scribble_object.draw(text_x, text_y);

var bbox = scribble_object.get_bbox(text_x, text_y);

draw_set_colour(c_black);
draw_rectangle(bbox.left, bbox.top, bbox.right, bbox.bottom, true);