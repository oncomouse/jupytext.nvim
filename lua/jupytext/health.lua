local M = {}

M.check = function()

  local cmd = ""
  if vim.g.python3_host_prog ~= nil and vim.fn.executable "jupytext" == 0 then
    cmd = vim.g.python3_host_prog .. " -m "
  end

  vim.fn.system(cmd .. "jupytext --version")

  if vim.v.shell_error == 0 then
    vim.health.ok("Jupytext is available")
  else
    vim.health.error("Jupytext is not available", "Install jupytext via `pip install jupytext`")
  end
end

return M
