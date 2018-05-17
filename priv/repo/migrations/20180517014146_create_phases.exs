defmodule BoardApp.Repo.Migrations.CreatePhases do
  use Ecto.Migration

  def change do
    create table(:phases) do
      add :title, :string
      add :index, :integer
      add :cards_count, :integer
      add :is_done, :boolean, default: false, null: false
      add :board_id, references(:boards, on_delete: :nothing)

      timestamps()
    end

    create index(:phases, [:board_id])
  end
end
