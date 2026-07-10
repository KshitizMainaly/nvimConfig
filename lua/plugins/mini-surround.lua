return {
  "echasnovski/mini.surround",
  version = "*",
  event = "VeryLazy",
  opts = {
    mappings = {
      add = "sa",
      delete = "sd",
      find = "sf",
      find_left = "sF",
      highlight = "sh",
      replace = "sr",
      update_n_lines = "sn",
    },
    n_lines = 20,
    search_method = "cover_or_next",
  },
}