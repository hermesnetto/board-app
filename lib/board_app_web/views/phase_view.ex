defmodule BoardAppWeb.PhaseView do
  use BoardAppWeb, :view
  alias BoardAppWeb.PhaseView

  def render("index.json", %{phases: phases}) do
    %{data: render_many(phases, PhaseView, "phase.json")}
  end

  def render("show.json", %{phase: phase}) do
    %{data: render_one(phase, PhaseView, "phase.json")}
  end

  def render("phase.json", %{phase: phase}) do
    %{id: phase.id,
      title: phase.title,
      index: phase.index,
      cards_count: phase.cards_count,
      is_done: phase.is_done}
  end
end
