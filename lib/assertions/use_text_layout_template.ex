defmodule Bamboo.ESpec.Assertions.UseTextLayoutTemplate do
  use ESpec.Assertions.Interface

  defp match(%Bamboo.Email{} = email, value) do
    result = elem(email.private.text_layout, 1) == value
    {result, value}
  end

  defp success_message(email, value, _result, positive) do
    has = if positive, do: "has", else: "does not have"
    "`#{inspect(email)}` #{has} text layout template `#{inspect(value)}`."
  end

  defp error_message(email, value, _result, positive) do
    have = if positive, do: "have", else: "not to have"
    but = if positive, do: "it does not", else: "it does"
    "Expected `#{inspect(email)}` to #{have} text layout template `#{inspect(value)}`, but #{but}."
  end
end
