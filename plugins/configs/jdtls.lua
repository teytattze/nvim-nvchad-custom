local M = {}

function M.start_or_attach()
  local jdtls = require "jdtls"
  local jdtls_setup = require "jdtls.setup"
  local on_attach = require("plugins.configs.lspconfig").on_attach
  local capabilities = require("plugins.configs.lspconfig").capabilities

  local home = os.getenv "HOME"
  local root_dir = jdtls_setup.find_root { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
  local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
  local workspace_dir = home .. "/.cache/jdtls/workspace" .. project_name

  local mason_packages_path = home .. "/.local/share/nvim/mason/packages"

  local jdtls_path = mason_packages_path .. "/jdtls"
  local jdtls_config_path = jdtls_path .. "/config_mac"
  local jdtls_lombok_path = jdtls_path .. "/lombok.jar"
  local jdtls_jar_path = jdtls_path .. "/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar"

  local config = {}

  config.cmd = {
    -- 💀
    "java", -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "-javaagent:" .. jdtls_lombok_path,
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    -- 💀
    "-jar",
    jdtls_jar_path,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version

    -- 💀
    "-configuration",
    jdtls_config_path,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.

    -- 💀
    -- See `data directory configuration` section in the README
    "-data",
    workspace_dir,
  }

  config.flags = {
    allow_incremental_sync = true,
  }

  config.settings = {
    java = {
      references = {
        includeDecompiledSources = true,
      },
      format = {
        enable = true,
        settings = {
          url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },
      eclipse = {
        downloadSources = true,
      },
      maven = {
        downloadSources = true,
      },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
        importOrder = {
          "#",
        },
      },
    },
  }

  config.on_attach = on_attach
  config.capabilities = capabilities
  config.capabilities.workspace.configuration = true

  config.on_init = function(client, _)
    client.notify("workspace/didChangeConfiguration", { settings = config.settings })
  end

  local extendedClientCapabilities = jdtls.extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
  config.init_options = {
    extendedClientCapabilities = extendedClientCapabilities,
  }

  config.rootdir = root_dir

  jdtls.start_or_attach(config)
end

return M
