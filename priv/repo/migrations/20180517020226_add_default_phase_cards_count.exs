defmodule BoardApp.Repo.Migrations.AddDefaultPhaseCardsCount do
  use Ecto.Migration

  def change do
    alter table(:phases) do    
      modify :cards_count, :integer, default: 0
    end
  end
end
