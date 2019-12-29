defmodule RnrjsWeb.SessionController do
  use RnrjsWeb, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    case Rnrjs.Accounts.authenticate_by_username_and_pass(email, password) do
      {:ok, user} -> 
        conn
        |> RnrjsWeb.Auth.login(user)
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.page_path(conn, :index))
      
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid email/password")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> RnrjsWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
