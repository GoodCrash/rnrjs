defmodule Rnrjs.TestHelpers do
  alias Rnrjs.Accounts

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "Some User",
        email: "user@mail.ru",
        password: attrs[:password] || "123456"
      })
      |> Accounts.register_user()
    
    user
  end
end
