local config = {}

config.options = {
  variant = "default",
}

function config.extend_options(options)
  config.optons = vim.tbl_deep_extend("force", config.options, {})
end

return config
