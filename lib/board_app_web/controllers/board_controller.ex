defmodule BoardAppWeb.BoardController do
  use BoardAppWeb, :controller

  alias BoardApp.Kanban
  alias BoardApp.Kanban.Board

  action_fallback BoardAppWeb.FallbackController

  def index(conn, _params) do
    boards = Kanban.list_boards()
    render(conn, "index.json", boards: boards)
  end

  def create(conn, params) do
    with {:ok, %Board{} = board} <- Kanban.create_board(params) do
      Kanban.create_default_phases(board)
      
      conn
      |> put_status(:created)
      |> put_resp_header("location", board_path(conn, :show, board))
      |> render("show.json", board: board)
    end
  end

  def show(conn, %{"id" => id}) do
    board = Kanban.get_board!(id)
    render(conn, "show.json", board: board)
  end

  def update(conn, %{"id" => id, "board" => board_params}) do
    board = Kanban.get_board!(id)

    with {:ok, %Board{} = board} <- Kanban.update_board(board, board_params) do
      render(conn, "show.json", board: board)
    end
  end

  def delete(conn, %{"id" => id}) do
    board = Kanban.get_board!(id)
    with {:ok, %Board{}} <- Kanban.delete_board(board) do
      send_resp(conn, :no_content, "")
    end
  end
end
