defmodule Fillingstation.Repo.Migrations.CreateTblUserRole do
  use Ecto.Migration

  def change do
    create table(:tbl_user_role) do
      add :role_desc, :string
      add :role_str, :map
      add :status, :string

      timestamps()
    end
  end
end
