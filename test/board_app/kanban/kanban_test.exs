defmodule BoardApp.KanbanTest do
  use BoardApp.DataCase

  alias BoardApp.Kanban

  describe "boards" do
    alias BoardApp.Kanban.Board

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def board_fixture(attrs \\ %{}) do
      {:ok, board} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Kanban.create_board()

      board
    end

    test "list_boards/0 returns all boards" do
      board = board_fixture()
      assert Kanban.list_boards() == [board]
    end

    test "get_board!/1 returns the board with given id" do
      board = board_fixture()
      assert Kanban.get_board!(board.id) == board
    end

    test "create_board/1 with valid data creates a board" do
      assert {:ok, %Board{} = board} = Kanban.create_board(@valid_attrs)
      assert board.title == "some title"
    end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Kanban.create_board(@invalid_attrs)
    end

    test "update_board/2 with valid data updates the board" do
      board = board_fixture()
      assert {:ok, board} = Kanban.update_board(board, @update_attrs)
      assert %Board{} = board
      assert board.title == "some updated title"
    end

    test "update_board/2 with invalid data returns error changeset" do
      board = board_fixture()
      assert {:error, %Ecto.Changeset{}} = Kanban.update_board(board, @invalid_attrs)
      assert board == Kanban.get_board!(board.id)
    end

    test "delete_board/1 deletes the board" do
      board = board_fixture()
      assert {:ok, %Board{}} = Kanban.delete_board(board)
      assert_raise Ecto.NoResultsError, fn -> Kanban.get_board!(board.id) end
    end

    test "change_board/1 returns a board changeset" do
      board = board_fixture()
      assert %Ecto.Changeset{} = Kanban.change_board(board)
    end
  end

  describe "phases" do
    alias BoardApp.Kanban.Phase

    @valid_attrs %{cards_count: 42, index: 42, is_done: true, title: "some title"}
    @update_attrs %{cards_count: 43, index: 43, is_done: false, title: "some updated title"}
    @invalid_attrs %{cards_count: nil, index: nil, is_done: nil, title: nil}

    def phase_fixture(attrs \\ %{}) do
      {:ok, phase} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Kanban.create_phase()

      phase
    end

    test "list_phases/0 returns all phases" do
      phase = phase_fixture()
      assert Kanban.list_phases() == [phase]
    end

    test "get_phase!/1 returns the phase with given id" do
      phase = phase_fixture()
      assert Kanban.get_phase!(phase.id) == phase
    end

    test "create_phase/1 with valid data creates a phase" do
      assert {:ok, %Phase{} = phase} = Kanban.create_phase(@valid_attrs)
      assert phase.cards_count == 42
      assert phase.index == 42
      assert phase.is_done == true
      assert phase.title == "some title"
    end

    test "create_phase/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Kanban.create_phase(@invalid_attrs)
    end

    test "update_phase/2 with valid data updates the phase" do
      phase = phase_fixture()
      assert {:ok, phase} = Kanban.update_phase(phase, @update_attrs)
      assert %Phase{} = phase
      assert phase.cards_count == 43
      assert phase.index == 43
      assert phase.is_done == false
      assert phase.title == "some updated title"
    end

    test "update_phase/2 with invalid data returns error changeset" do
      phase = phase_fixture()
      assert {:error, %Ecto.Changeset{}} = Kanban.update_phase(phase, @invalid_attrs)
      assert phase == Kanban.get_phase!(phase.id)
    end

    test "delete_phase/1 deletes the phase" do
      phase = phase_fixture()
      assert {:ok, %Phase{}} = Kanban.delete_phase(phase)
      assert_raise Ecto.NoResultsError, fn -> Kanban.get_phase!(phase.id) end
    end

    test "change_phase/1 returns a phase changeset" do
      phase = phase_fixture()
      assert %Ecto.Changeset{} = Kanban.change_phase(phase)
    end
  end

  describe "cards" do
    alias BoardApp.Kanban.Card

    @valid_attrs %{description: "some description", title: "some title"}
    @update_attrs %{description: "some updated description", title: "some updated title"}
    @invalid_attrs %{description: nil, title: nil}

    def card_fixture(attrs \\ %{}) do
      {:ok, card} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Kanban.create_card()

      card
    end

    test "list_cards/0 returns all cards" do
      card = card_fixture()
      assert Kanban.list_cards() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert Kanban.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      assert {:ok, %Card{} = card} = Kanban.create_card(@valid_attrs)
      assert card.description == "some description"
      assert card.title == "some title"
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Kanban.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      assert {:ok, card} = Kanban.update_card(card, @update_attrs)
      assert %Card{} = card
      assert card.description == "some updated description"
      assert card.title == "some updated title"
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Kanban.update_card(card, @invalid_attrs)
      assert card == Kanban.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Kanban.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Kanban.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Kanban.change_card(card)
    end
  end
end
