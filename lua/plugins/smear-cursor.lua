return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  opts = {
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    scroll_buffer_space = true,
    legacy_computing_symbols_support = false,
    smear_insert_mode = true,
    -- Smooth, crisp cursor glide (no long blurry trail):
    -- damping is INVERTED here: higher = trail decays faster = less blur.
    stiffness = 0.6,
    trailing_stiffness = 0.45,
    stiffness_insert_mode = 0.6,
    trailing_stiffness_insert_mode = 0.45,
    damping = 0.9,                 -- high = short, crisp trail (not blurry)
    damping_insert_mode = 0.9,
    distance_stop_animating = 0.1, -- stop the instant it reaches the target
    time_interval = 12,            -- ~83 fps, smooth motion

  },
}
