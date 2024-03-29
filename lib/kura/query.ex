defmodule Kura.Query do
  defmacro case_when(condition, do: then_expr, else: else_expr) do
    quote do
      fragment(
        "CASE WHEN ? THEN ? ELSE ? END",
        unquote(condition),
        unquote(then_expr),
        unquote(else_expr)
      )
    end
  end

  defmacro round(number, places) do
    quote do
      fragment("round(?, ?)", unquote(number), unquote(places))
    end
  end
end
