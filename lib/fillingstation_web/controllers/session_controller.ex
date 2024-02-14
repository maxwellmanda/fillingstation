defmodule FillingstationWeb.SessionController do
  use FillingstationWeb, :controller
  alias Fillingstation.Accounts
  # alias ReconWeb.UserController
  alias Fillingstation.Auth
  # def home(conn, _params) do
  #   # The home page is often custom made,
  #   # so skip the default app layout.
  #   render(conn, :home, layout: false)
  # end


  def new(conn, _params) do
    put_layout(conn, false)
    |> render("index.html")
  end

  def create(conn, params) do
    with {:error, _reason} <- UserController.get_user_by_email(String.trim(params["email"])) do
      conn
      |> put_flash(:error, "Email/password not match")
      |> put_layout(false)
      |> render("index.html")
    else
      {:ok, user} ->
        with {:error, _reason} <- Auth.confirm_password(user, String.trim(params["password"])) do
          prepare_login_attempt(user)

          conn
          |> put_flash(:error, "Email/password not match")
          |> put_layout(false)
          |> render("index.html")
        else
          {:ok, _} ->
            cond do
              user.status == "A" ->
                {:ok, _} =
                Fillingstation.Activity.create_user_log(%{user_id: user.id, activity: "logged in"})

                logon_dt = Timex.format!(Timex.local(), "%Y-%m-%d %H:%M:%S", :strftime)
                remote_ip = conn.remote_ip |> :inet.ntoa() |> to_string()

                {:ok, user} =
                  Accounts.update_user(user, %{
                    remote_ip: remote_ip,
                    last_login_dt: logon_dt,
                    login_attempt: 0
                  })

                  "ADMIN" ->
                    conn
                    |> put_session(:current_user, user.id)
                    |> put_session(:session_timeout_at, session_timeout_at())
                    |> redirect(to: Routes.user_path(conn, :dashboard))
                end

              true ->
                conn
                |> put_status(405)
                |> put_layout(false)
                |> render("index.html")
            end
        end
  end

  defp session_timeout_at do
    DateTime.utc_now() |> DateTime.to_unix() |> (&(&1 + 10_000)).()
  end

  def signout(conn, _params) do
    {:ok, _} =
    Fillingstation.Activity.create_user_log(%{user_id: conn.assigns.user.id, activity: "logged out"})

    conn
    |> clear_session()
    |> redirect(to: Routes.session_path(conn, :new))
  rescue
    _ ->
      conn
      |> clear_session()
      |> redirect(to: Routes.session_path(conn, :new))
  end

  defp prepare_login_attempt(user) do
    max_attempts = 3
    status = if user.login_attempt < max_attempts, do: "A", else: "D"
    Accounts.update_user(user, %{login_attempt: user.login_attempt + 1, status: status})
  end

end
