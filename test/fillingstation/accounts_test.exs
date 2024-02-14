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

  describe "tbl_user_activity" do
    alias Fillingstation.Accounts.Activity

    import Fillingstation.AccountsFixtures

    @invalid_attrs %{activity: nil}

    test "list_tbl_user_activity/0 returns all tbl_user_activity" do
      activity = activity_fixture()
      assert Accounts.list_tbl_user_activity() == [activity]
    end

    test "get_activity!/1 returns the activity with given id" do
      activity = activity_fixture()
      assert Accounts.get_activity!(activity.id) == activity
    end

    test "create_activity/1 with valid data creates a activity" do
      valid_attrs = %{activity: "some activity"}

      assert {:ok, %Activity{} = activity} = Accounts.create_activity(valid_attrs)
      assert activity.activity == "some activity"
    end

    test "create_activity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_activity(@invalid_attrs)
    end

    test "update_activity/2 with valid data updates the activity" do
      activity = activity_fixture()
      update_attrs = %{activity: "some updated activity"}

      assert {:ok, %Activity{} = activity} = Accounts.update_activity(activity, update_attrs)
      assert activity.activity == "some updated activity"
    end

    test "update_activity/2 with invalid data returns error changeset" do
      activity = activity_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_activity(activity, @invalid_attrs)
      assert activity == Accounts.get_activity!(activity.id)
    end

    test "delete_activity/1 deletes the activity" do
      activity = activity_fixture()
      assert {:ok, %Activity{}} = Accounts.delete_activity(activity)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_activity!(activity.id) end
    end

    test "change_activity/1 returns a activity changeset" do
      activity = activity_fixture()
      assert %Ecto.Changeset{} = Accounts.change_activity(activity)
    end
  end

  describe "tbl_user_role" do
    alias Fillingstation.Accounts.UserRole

    import Fillingstation.AccountsFixtures

    @invalid_attrs %{status: nil, role_desc: nil, role_str: nil}

    test "list_tbl_user_role/0 returns all tbl_user_role" do
      user_role = user_role_fixture()
      assert Accounts.list_tbl_user_role() == [user_role]
    end

    test "get_user_role!/1 returns the user_role with given id" do
      user_role = user_role_fixture()
      assert Accounts.get_user_role!(user_role.id) == user_role
    end

    test "create_user_role/1 with valid data creates a user_role" do
      valid_attrs = %{status: "some status", role_desc: "some role_desc", role_str: %{}}

      assert {:ok, %UserRole{} = user_role} = Accounts.create_user_role(valid_attrs)
      assert user_role.status == "some status"
      assert user_role.role_desc == "some role_desc"
      assert user_role.role_str == %{}
    end

    test "create_user_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_role(@invalid_attrs)
    end

    test "update_user_role/2 with valid data updates the user_role" do
      user_role = user_role_fixture()
      update_attrs = %{status: "some updated status", role_desc: "some updated role_desc", role_str: %{}}

      assert {:ok, %UserRole{} = user_role} = Accounts.update_user_role(user_role, update_attrs)
      assert user_role.status == "some updated status"
      assert user_role.role_desc == "some updated role_desc"
      assert user_role.role_str == %{}
    end

    test "update_user_role/2 with invalid data returns error changeset" do
      user_role = user_role_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user_role(user_role, @invalid_attrs)
      assert user_role == Accounts.get_user_role!(user_role.id)
    end

    test "delete_user_role/1 deletes the user_role" do
      user_role = user_role_fixture()
      assert {:ok, %UserRole{}} = Accounts.delete_user_role(user_role)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user_role!(user_role.id) end
    end

    test "change_user_role/1 returns a user_role changeset" do
      user_role = user_role_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_role(user_role)
    end
  end
end
