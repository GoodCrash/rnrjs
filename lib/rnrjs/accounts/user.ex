defmodule Rnrjs.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
    |> validate_length(:name, min: 1, max: 20)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
end
