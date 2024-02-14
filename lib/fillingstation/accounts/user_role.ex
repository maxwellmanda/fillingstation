defmodule Fillingstation.Accounts.UserRole do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tbl_user_role" do
    field :status, :string
    field :role_desc, :string
    field :role_str, :map

    timestamps()
  end

  @doc false
  def changeset(user_role, attrs) do
    user_role
    |> cast(attrs, [:role_desc, :role_str, :status])
    |> validate_required([:role_desc, :status])
  end
end
