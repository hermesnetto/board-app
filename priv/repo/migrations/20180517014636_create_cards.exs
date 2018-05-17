defmodule BoardApp.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :title, :string
      add :description, :text
      add :board_id, references(:boards, on_delete: :nothing)
      add :phase_id, references(:phases, on_delete: :nothing)

      timestamps()
    end

    create index(:cards, [:board_id])
    create index(:cards, [:phase_id])
  end
end
