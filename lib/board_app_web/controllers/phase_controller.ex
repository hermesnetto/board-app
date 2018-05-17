defmodule BoardAppWeb.PhaseController do
  use BoardAppWeb, :controller

  alias BoardApp.Kanban
  alias BoardApp.Kanban.Phase

  action_fallback BoardAppWeb.FallbackController

  def index(conn, _params) do
    phases = Kanban.list_phases()
    render(conn, "index.json", phases: phases)
  end

  def create(conn, %{"phase" => phase_params}) do
    with {:ok, %Phase{} = phase} <- Kanban.create_phase(phase_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", phase_path(conn, :show, phase))
      |> render("show.json", phase: phase)
    end
  end

  def show(conn, %{"id" => id}) do
    phase = Kanban.get_phase!(id)
    render(conn, "show.json", phase: phase)
  end

  def update(conn, %{"id" => id, "phase" => phase_params}) do
    phase = Kanban.get_phase!(id)

    with {:ok, %Phase{} = phase} <- Kanban.update_phase(phase, phase_params) do
      render(conn, "show.json", phase: phase)
    end
  end

  def delete(conn, %{"id" => id}) do
    phase = Kanban.get_phase!(id)
    with {:ok, %Phase{}} <- Kanban.delete_phase(phase) do
      send_resp(conn, :no_content, "")
    end
  end
end
