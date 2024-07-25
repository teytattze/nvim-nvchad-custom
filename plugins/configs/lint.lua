local jdtls_setup = require "jdtls.setup"
local lint = require "lint"

local java_project_base_path = jdtls_setup.find_root { ".git", "mvnw", "gradlew" }
local buffering_and_dispatch_checkstyle_path = java_project_base_path .. "/_config/checkstyle/google_checks.xml"

lint.linters_by_ft = {
  java = { "checkstyle" },
  python = { "pylint" },
}

lint.linters.checkstyle.config_file = buffering_and_dispatch_checkstyle_path

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local lint_augroup = augroup("lint", { clear = true })

autocmd({ "BufWritePost" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})
