defmodule BoardApp.Repo.Migrations.AddDefaultPhaseIndex do
  use Ecto.Migration

  def change do
    alter table(:phases) do
      modify :index, :integer, default: 0
    end
  end
end
