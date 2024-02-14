defmodule Fillingstation.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Fillingstation.Accounts` context.
  """

  @doc """
  Generate a users.
  """
  def users_fixture(attrs \\ %{}) do
    {:ok, users} =
      attrs
      |> Enum.into(%{
        email: "some email",
        first_name: "some first_name",
        last_login_dt: "some last_login_dt",
        last_name: "some last_name",
        login_attempt: "some login_attempt",
        password: "some password",
        password_expiry_dt: "some password_expiry_dt",
        remote_ip: "some remote_ip",
        status: "some status"
      })
      |> Fillingstation.Accounts.create_users()

    users
  end

  @doc """
  Generate a activity.
  """
  def activity_fixture(attrs \\ %{}) do
    {:ok, activity} =
      attrs
      |> Enum.into(%{
        activity: "some activity"
      })
      |> Fillingstation.Accounts.create_activity()

    activity
  end

  @doc """
  Generate a user_role.
  """
  def user_role_fixture(attrs \\ %{}) do
    {:ok, user_role} =
      attrs
      |> Enum.into(%{
        role_desc: "some role_desc",
        role_str: %{},
        status: "some status"
      })
      |> Fillingstation.Accounts.create_user_role()

    user_role
  end
end
