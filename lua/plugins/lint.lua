return {
    "mfussenegger/nvim-lint",
    config = function()
        vim.notify("Loading fortran linting", 3, {
            title = "LazyVim"
        })
        local lint = require("lint")

        local pattern = [[^([^:]+):(%d+):(%d+):%s+([^:]+):%s+(.*)$]]
        local groups = { "file", "lnum", "col", "severity", "message" }
        local severity_map = {
            ["error"] = vim.diagnostic.severity.ERROR,
            ["warning"] = vim.diagnostic.severity.WARN,
            ["performance"] = vim.diagnostic.severity.WARN,
            ["style"] = vim.diagnostic.severity.INFO,
            ["information"] = vim.diagnostic.severity.INFO
        }
        local defaults = {
            ["source"] = "fortran"
        }
        lint.linters.gfortran = {
            name = "gfortran",
            cmd = "gfortran",
            args = {"-c", "-Wunused-variable", "-Wunused-dummy-argument", "-Wall" , "-fsyntax-only", "-cpp",  "-fdiagnostics-plain-output"
            --   "-I",
            --   os.getenv("HOME") .. "/.easifem/install/easifem/extpkgs/include/",
            --   os.getenv("HOME") .. "/.easifem/install/easifem/extpkgs/include/toml-f/modules/",
            --   os.getenv("HOME") .. "/.easifem/install/easifem/base/include/",
            --   os.getenv("HOME") .. "/.easifem/install/easifem/classes/include/",
            --   os.getenv("HOME") .. "/.easifem/ide/include/",
            --   "-J",
            --   os.getenv("HOME") .. "/.easifem/ide/include/",
            }, -- args to pass to the linter
            ignore_exitcode = true, -- set this to true if you don't want to show error messages
            stream = "both", -- set this to "stdout" if the output is not an error, for example with luac
            parser = require("lint.parser").from_pattern(pattern, groups, severity_map, defaults)
        }

        lint.linters_by_ft = {
            fortran = {"gfortran"}
        }
    end
}
