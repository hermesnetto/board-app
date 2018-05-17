defmodule BoardAppWeb.CardController do
  use BoardAppWeb, :controller

  alias BoardApp.Kanban
  alias BoardApp.Kanban.Card

  action_fallback BoardAppWeb.FallbackController

  def index(conn, _params) do
    cards = Kanban.list_cards()
    render(conn, "index.json", cards: cards)
  end

  def create(conn, params) do
    with {:ok, %Card{} = card} <- Kanban.create_card(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", card_path(conn, :show, card))
      |> render("show.json", card: card)
    end
  end

  def show(conn, %{"id" => id}) do
    card = Kanban.get_card!(id)
    render(conn, "show.json", card: card)
  end

  def update(conn, %{"id" => id, "card" => card_params}) do
    card = Kanban.get_card!(id)

    with {:ok, %Card{} = card} <- Kanban.update_card(card, card_params) do
      render(conn, "show.json", card: card)
    end
  end

  def delete(conn, %{"id" => id}) do
    card = Kanban.get_card!(id)
    with {:ok, %Card{}} <- Kanban.delete_card(card) do
      send_resp(conn, :no_content, "")
    end
  end
end
