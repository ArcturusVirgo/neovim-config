return {
    "mfussenegger/nvim-lint",
    event = {"BufWritePost", "InsertLeave"},
    config = function()
        local lint = require "lint"

        local required_args = {"-fsyntax-only", "-fdiagnostics-plain-output"}
        local gfortran_diagnostic_args = {"-Wall", "-Wextra"}
        local args = vim.list_extend(required_args, gfortran_diagnostic_args)
        local parser_func_gfortran = function(output)
            local severity_map = {
                ["Error"] = vim.diagnostic.severity.ERROR,
                ["Warning"] = vim.diagnostic.severity.WARN
            }
            -- 判断操作系统类型
            local path_sep = package.config:sub(1, 1)
            local os_type
            if path_sep == "\\" then
                os_type = "Windows"
            elseif path_sep == "/" then
                os_type = "Unix-like (Linux/macOS/BSD)"
            else
                os_type = "Unknown"
            end

            local diagnostics = {}

            local lines = vim.split(output, "\n", {
                plain = true
            })
            for _, line in ipairs(lines) do
                if line == "" then
                    goto continue
                end
                local filepath, row_num, col_num, message, severity
                local parts = vim.split(line, ":", {
                    plain = true
                })
                for i, part in ipairs(parts) do
                    parts[i] = part:match("^%s*(.-)%s*$")
                end
                if os_type == "Windows" then
                    -- 将 parts[0] parts[1] 拼接为一个完整的文件路径
                    filepath = parts[1] .. ":" .. parts[2]
                    row_num = tonumber(parts[3])
                    col_num = tonumber(parts[4])
                    severity = parts[5]
                    message = parts[6]
                else
                    filepath = parts[1]
                    row_num = tonumber(parts[2])
                    col_num = tonumber(parts[3])
                    severity = parts[4]
                    message = parts[5]
                end

                local parts = {
                    source = "gfortran",
                    lnum = row_num - 1,
                    end_lnum = row_num - 1,
                    col = col_num,
                    end_col = col_num,
                    message = message,
                    severity = severity_map[severity]
                }
                table.insert(diagnostics, parts)
                ::continue::
            end

            return diagnostics
        end
        lint.linters.gfortran = {
            cmd = "gfortran",
            stdin = false,
            append_fname = true,
            stream = "stderr",
            env = nil,
            args = args,
            ignore_exitcode = true,
            parser = parser_func_gfortran
        }
        local args = {'-syntax-only', '-warn'}
        local parser_func_ifx = function(output)   
            local severity_map = {
                ["error"] = vim.diagnostic.severity.ERROR,
                ["remark"] = vim.diagnostic.severity.WARN
            }   
            local diagnostics = {}

            local lines = vim.split(output, "\n", {
                plain = true
            })
            usful_lines_num = {}
            -- 查找带有 # 的行
            for i, line in ipairs(lines) do
                if line:find("#") then
                    table.insert(usful_lines_num, i)
                end
            end
            
            -- 输出带有 # 的行
            for _, line_num in ipairs(usful_lines_num) do
                --  C:\Users\Virgo\Desktop\main.f90(5): remark #7712: This variable has not been used.   [NUPM2]
                local line = lines[line_num]
                -- 提取文件路径、行号、列号、消息和严重性
                local filepath, row_num, col_num, message, severity
                -- 查找 # 索引
                local index_1 = line:find("#")
                message = line:sub(index_1)  -- 提取 # 后的消息
                local other_parts = line:sub(1, index_1 - 1)
                -- 去除前后空格
                other_parts = other_parts:match("^%s*(.-)%s*$")
                -- 按照空格分割
                local parts = vim.split(other_parts, " ", {plain = true})
                -- 去除空格
                for i, part in ipairs(parts) do
                    parts[i] = part:match("^%s*(.-)%s*$")
                end
                severity = parts[2]
                other_parts = parts[1]
                other_parts = other_parts:match("^%s*(.-)%s*$")
                -- 按照 ( 分割
                local parts = vim.split(other_parts, "(", {plain = true})
                local temp = parts[2]
                -- 去除 temp 的 '):'
                temp = temp:match("^(.-)%):$")                
                row_num = tonumber(temp)
                filepath = parts[1]
                local line = lines[line_num + 2]
                -- 查找 ^
                local index_2 = line:find("^")
                col_num = index_2 and index_2 or 1  -- 如果没有找到 ^，则列号为 1
                local parts = {
                    source = "ifx",
                    lnum = row_num - 1,
                    end_lnum = row_num - 1,
                    col = col_num,
                    end_col = col_num,
                    message = message,
                    severity = severity_map[severity]
                }
                table.insert(diagnostics, parts)
            end

            return diagnostics
        end
        lint.linters.ifx = {
            cmd = "D:/Intel/oneAPI/compiler/latest/bin/ifx.exe",
            stdin = false,
            append_fname = true,
            stream = "stderr",
            env = nil,
            args = args,
            ignore_exitcode = true,
            parser = parser_func_ifx
        }

        lint.linters_by_ft = {
            fortran = {"ifx"}
        }

        vim.api.nvim_create_autocmd({"BufEnter", "InsertLeave", "BufWritePost", "LspAttach", "TextChanged",
                                     'InsertLeavePre'}, {
            callback = function()
                require("lint").try_lint()
            end
        })

    end
}
