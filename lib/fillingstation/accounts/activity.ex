defmodule Fillingstation.Accounts.Activity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tbl_user_activity" do
    field :activity, :string

    timestamps()
  end

  @doc false
  def changeset(activity, attrs) do
    activity
    |> cast(attrs, [:activity])
    |> validate_required([:activity])
  end
end
