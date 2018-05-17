defmodule BoardApp.Kanban.Phase do
  use Ecto.Schema
  import Ecto.Changeset

  schema "phases" do
    field :cards_count, :integer, default: 0
    field :index, :integer, default: 0
    field :is_done, :boolean, default: false
    field :title, :string
    belongs_to :board, BoardApp.Kanban.Board
    has_many :cards, BoardApp.Kanban.Card

    timestamps()
  end

  @doc false
  def changeset(phase, attrs) do
    phase
    |> cast(attrs, [:title, :index, :cards_count, :is_done, :board_id])
    |> validate_required([:title, :index, :cards_count, :is_done, :board_id])
  end
end
