const c = @cImport({
    @cInclude("notcurses/notcurses.h");
});

// Re-export the C symbols we need
pub const notcurses = c.notcurses;
pub const ncplane = c.ncplane;
pub const notcurses_options = c.notcurses_options;
pub const ncplane_options = c.ncplane_options;
pub const ncselector_options = c.ncselector_options;

// Re-export functions
pub const notcurses_core_init = c.notcurses_core_init;
pub const notcurses_stop = c.notcurses_stop;
pub const notcurses_stddim_yx = c.notcurses_stddim_yx;
pub const notcurses_render = c.notcurses_render;
pub const notcurses_get_nblock = c.notcurses_get_nblock;

pub const ncplane_create = c.ncplane_create;
pub const ncplane_set_base = c.ncplane_set_base;
pub const ncplane_erase = c.ncplane_erase;
pub const ncplane_move_yx = c.ncplane_move_yx;
pub const ncplane_resize_simple = c.ncplane_resize_simple;
pub const ncplane_gradient2x1 = c.ncplane_gradient2x1;
pub const ncplane_rounded_box = c.ncplane_rounded_box;
pub const ncplane_cursor_move_yx = c.ncplane_cursor_move_yx;
pub const ncplane_putstr_yx = c.ncplane_putstr_yx;
pub const ncplane_dim_y = c.ncplane_dim_y;
pub const ncplane_dim_x = c.ncplane_dim_x;
pub const ncplane_x = c.ncplane_x;
pub const ncplane_y = c.ncplane_y;

pub const ncchannels_set_bg_rgb = c.ncchannels_set_bg_rgb;
pub const ncchannels_set_bg_alpha = c.ncchannels_set_bg_alpha;
pub const ncchannels_set_fg_rgb = c.ncchannels_set_fg_rgb;
pub const ncchannels_set_bchannel = c.ncchannels_set_bchannel;
pub const ncchannels_set_fchannel = c.ncchannels_set_fchannel;

pub const ncchannel_r = c.ncchannel_r;
pub const ncchannel_g = c.ncchannel_g;
pub const ncchannel_b = c.ncchannel_b;
pub const ncchannel_set_rgb8_clipped = c.ncchannel_set_rgb8_clipped;

// Re-export constants
pub const NCLOGLEVEL_SILENT = c.NCLOGLEVEL_SILENT;
pub const NCALPHA_BLEND = c.NCALPHA_BLEND;
pub const NC_BGDEFAULT_MASK = c.NC_BGDEFAULT_MASK;
pub const default_notcurses_options = c.notcurses_options{
    .termtype = null,
    .loglevel = c.NCLOGLEVEL_SILENT,
    .margin_t = 0,
    .margin_r = 0,
    .margin_b = 0,
    .margin_l = 0,
    .flags = 0,
};
pub const default_ncplane_options = c.ncplane_options{
    .y = 0,
    .userptr = null,
    .name = null,
    .rows = 0,
    .cols = 0,
    .margin_r = 0,
    .margin_b = 0,
    .x = 0,
    .flags = 0,
    .resizecb = null,
};
const default_ncselector_options = c.ncselector_options{
    .footchannels = 0,
    .boxchannels = 0,
    .defidx = 0,
    .opchannels = 0,
    .secondary = null,
    .footer = null,
    .title = null,
    .items = null,
    .flags = 0,
    .titlechannels = 0,
    .maxdisplay = 0,
    .descchannels = 0,
};
pub const Error = error{
    NotcursesError,
};
pub fn err(code: c_int) !void {
    if (code < 0) return Error.NotcursesError;
}
