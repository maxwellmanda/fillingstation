defmodule Fillingstation.AccountsTest do
  use Fillingstation.DataCase

  alias Fillingstation.Accounts

  describe "tbl_users" do
    alias Fillingstation.Accounts.Users

    import Fillingstation.AccountsFixtures

    @invalid_attrs %{status: nil, password: nil, first_name: nil, email: nil, last_login_dt: nil, last_name: nil, login_attempt: nil, password_expiry_dt: nil, remote_ip: nil}

    test "list_tbl_users/0 returns all tbl_users" do
      users = users_fixture()
      assert Accounts.list_tbl_users() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Accounts.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      valid_attrs = %{status: "some status", password: "some password", first_name: "some first_name", email: "some email", last_login_dt: "some last_login_dt", last_name: "some last_name", login_attempt: "some login_attempt", password_expiry_dt: "some password_expiry_dt", remote_ip: "some remote_ip"}

      assert {:ok, %Users{} = users} = Accounts.create_users(valid_attrs)
      assert users.status == "some status"
      assert users.password == "some password"
      assert users.first_name == "some first_name"
      assert users.email == "some email"
      assert users.last_login_dt == "some last_login_dt"
      assert users.last_name == "some last_name"
      assert users.login_attempt == "some login_attempt"
      assert users.password_expiry_dt == "some password_expiry_dt"
      assert users.remote_ip == "some remote_ip"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      update_attrs = %{status: "some updated status", password: "some updated password", first_name: "some updated first_name", email: "some updated email", last_login_dt: "some updated last_login_dt", last_name: "some updated last_name", login_attempt: "some updated login_attempt", password_expiry_dt: "some updated password_expiry_dt", remote_ip: "some updated remote_ip"}

      assert {:ok, %Users{} = users} = Accounts.update_users(users, update_attrs)
      assert users.status == "some updated status"
      assert users.password == "some updated password"
      assert users.first_name == "some updated first_name"
      assert users.email == "some updated email"
      assert users.last_login_dt == "some updated last_login_dt"
      assert users.last_name == "some updated last_name"
      assert users.login_attempt == "some updated login_attempt"
      assert users.password_expiry_dt == "some updated password_expiry_dt"
      assert users.remote_ip == "some updated remote_ip"
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_users(users, @invalid_attrs)
      assert users == Accounts.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Accounts.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Accounts.change_users(users)
    end
  end
end
