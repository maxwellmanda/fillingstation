defmodule Fillingstation.Accounts.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tbl_users" do
    field :auto_password, :string, default: "Y"
    field :email, :string
    field :first_name, :string
    field :last_login_dt, :naive_datetime
    field :last_name, :string
    field :login_attempt, :integer, default: 0
    field :password, :string
    field :remote_ip, :string
    field :status, :string, default: "D"

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:first_name, :email, :last_login_dt, :last_name, :login_attempt, :password, :remote_ip, :status])
    # |> validate_required([:first_name, :email, :last_login_dt, :last_name, :login_attempt, :password, :remote_ip, :status])
  end
end
