defmodule BoardApp.Kanban.Card do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cards" do
    field :description, :string
    field :title, :string
    belongs_to :board, BoardApp.Kanban.Board
    belongs_to :phase, BoardApp.Kanban.Phase

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:title, :description, :board_id, :phase_id])
    |> validate_required([:title, :description, :board_id, :phase_id])
  end
end
