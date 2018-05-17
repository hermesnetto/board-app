defmodule BoardApp.Kanban.Board do
  use Ecto.Schema
  import Ecto.Changeset

  schema "boards" do
    field :title, :string
    has_many :phases, BoardApp.Kanban.Phase
    has_many :cards, BoardApp.Kanban.Card

    timestamps()
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
