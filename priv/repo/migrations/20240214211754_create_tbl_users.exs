defmodule Fillingstation.Repo.Migrations.CreateTblUsers do
  use Ecto.Migration

  def change do
    create table(:tbl_users) do
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :password, :text
      add :auto_password, :string
      add :status, :string
      add :login_attempt, :integer
      add :remote_ip, :string
      add :last_login_dt, :naive_datetime
      add :password_expiry_dt, :date
      add :maker_id, references(:tbl_users, on_delete: :nothing)
      add :checker_id, references(:tbl_users, on_delete: :nothing)

      timestamps()
    end
  end
end
