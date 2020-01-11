defmodule Rnrjs.AccountsTest do
  use Rnrjs.DataCase, async: true

  alias Rnrjs.Accounts
  alias Rnrjs.Accounts.User

  describe "register_user/1" do
    @valid_attrs %{
      name: "User",
      email: "user@mail.ru",
      password: "123456"
    }

    @invalid_attrs %{}

    test "with valid data insert user" do
      assert {:ok, %User{id: id} = user} = Accounts.register_user(@valid_attrs)
      assert user.name == "User"
      assert user.email == "user@mail.ru"
      assert [%User{id: ^id}] = Accounts.list_users()
    end

    test "with invalid data does not insert user" do
      assert {:error, _changeset} = Accounts.register_user(@invalid_attrs)
      assert Accounts.list_users() == []
    end

    test "enforse unique email" do
      assert {:ok, %User{id: id} = user} = Accounts.register_user(@valid_attrs)
      assert {:error, changeset} = Accounts.register_user(@valid_attrs)
      assert %{email: ["has already been taken"]} = errors_on(changeset)
      assert [%User{id: ^id}] = Accounts.list_users()
    end

    test "does not accept long name" do
      attrs = Map.put(@valid_attrs, :name, String.duplicate("a", 30))
      {:error, changeset} = Accounts.register_user(attrs)

      assert %{name: ["should be at most 20 character(s)"]} = errors_on(changeset)
      assert Accounts.list_users() == []
    end

    test "requires password to be at least 6 chars long" do
      attrs = Map.put(@valid_attrs, :password, "12345")
      {:error, changeset} = Accounts.register_user(attrs)

      assert %{password: ["should be at least 6 character(s)"]} = errors_on(changeset)
      assert Accounts.list_users() == []
    end
  end

  describe "authenticate_by_email_and_password/2" do
    @password "123456"

    setup do
      {:ok, user: user_fixture(password: @password)}
    end

    test "returns user with correct password", %{user: user} do
      assert {:ok, auth_user} = Accounts.authenticate_by_email_and_pass(user.email, @password)
      assert auth_user.id == user.id
    end

    test "returns unauthorized error with invalid password", %{user: user} do
      assert {:error, :unauthorized} = Accounts.authenticate_by_email_and_pass(user.email, "badpass")
    end

    test "returns not found error with no matching user for email" do
      assert {:error, :not_found} = Accounts.authenticate_by_email_and_pass("unknowemail@mail.ru", @password)
    end
  end
end
