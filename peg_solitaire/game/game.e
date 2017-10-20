note
	description: "A game of peg solitaire."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAME

inherit
	ANY
		redefine
			out
		end

create
	make_from_board,
	make_easy,
	make_cross,
	make_plus,
	make_pyramid,
	make_arrow,
	make_diamond,
	make_skull

feature -- Constructors
	make_from_board (new_board: BOARD)
			-- Initialize a game with 'new_board'.
		do
			board := new_board
		ensure
			board_set:
				-- Your task.
				board ~ bta.templates.default_board
		end

	make_easy
			-- Initialize a game with easy board.
		do
			create board.make_easy
		ensure
			board_set:
				board ~ bta.templates.easy_board
		end

	make_cross
			-- Initialize a game with Cross board.
		do
			create board.make_cross
			-- Your task: the current implementation
			-- may not be correct.
		ensure
			board_set:
				-- Your task.
				board ~ bta.templates.cross_board
		end

	make_plus
			-- Initialize a game with Plus board.
		do
			create board.make_plus
			-- Your task: the current implementation
			-- may not be correct.
		ensure
			board_set:
				-- Your task.
				board ~ bta.templates.plus_board
		end

	make_pyramid
			-- Initialize a game with Pyramid board.
		do
		    create board.make_pyramid
			-- Your task: the current implementation
			-- may not be correct.
		ensure
			board_set:
				-- Your task.
				board ~ bta.templates.pyramid_board
		end

	make_arrow
			-- Initialize a game with Arrow board.
		do
			create board.make_arrow
			-- Your task: the current implementation
			-- may not be correct.
		ensure
			board_set:
				-- Your task.
				board ~ bta.templates.arrow_board
		end

	make_diamond
			-- Initialize a game with Diamond board.
		do
			create board.make_diamond
			-- Your task: the current implementation
			-- may not be correct.
		ensure
			board_set:
				-- Your task.
				board ~ bta.templates.diamond_board
		end

	make_skull
			-- Initialize a game with Skull board.
		do
			create board.make_skull
			-- Your task: the current implementation
			-- may not be correct.
		ensure
			board_set:
				-- Your task.
				board ~ bta.templates.skull_board
		end

feature -- Commands
	move_left (r, c: INTEGER)
		require
			from_slot_valid_row: board.is_valid_row (r)
				-- Your task.
			from_slot_valid_column: board.is_valid_column (c)
				-- Your task.
			middle_slot_valid_column: board.is_valid_column (c-1)
				-- Your task.
			to_slot_valid_column: board.is_valid_column (c-2)
				-- Your task.
			from_slot_occupied: board.status_of (r, c).is_equal (board.occupied_slot)
				-- Your task.
			middle_slot_occupied: board.status_of (r, c - 1).is_equal (board.occupied_slot)
				-- Your task.
			to_slot_unoccupied: board.status_of (r, c - 2).is_equal (board.unoccupied_slot)
				-- Your task.
		do
			-- Your task.
			board.set_status (r, c - 2, board.occupied_slot)
		    board.set_status (r, c - 1, board.unoccupied_slot)
			board.set_status (r, c, board.unoccupied_slot)
		ensure
			slots_properly_set: board.status_of (r, c - 2).is_equal (board.occupied_slot)
				-- Your task.
			other_slots_unchanged:
				-- Your task.
				-- Hint: Use 'matches_slots_except' feature from BOARD.
				board.matches_slots_except (old board.deep_twin, r, r, c-2, c)
		end

	move_right (r, c: INTEGER)
		require
			from_slot_valid_row: board.is_valid_row (r)
				-- Your task.
			from_slot_valid_column: board.is_valid_column (c)
				-- Your task.
			middle_slot_valid_column: board.is_valid_column (c+1)
				-- Your task.
			to_slot_valid_column: board.is_valid_column (c+2)
				-- Your task.
			from_slot_occupied: board.status_of (r, c).is_equal (board.occupied_slot)
				-- Your task.
			middle_slot_occupied: board.status_of (r, c + 1).is_equal (board.occupied_slot)
				-- Your task.
			to_slot_unoccupied: board.status_of (r, c + 2).is_equal (board.unoccupied_slot)
				-- Your task.
		do
			-- Your task.
			board.set_status (r, c + 2, board.occupied_slot)
		    board.set_status (r, c + 1, board.unoccupied_slot)
		    board.set_status (r, c, board.unoccupied_slot)

		ensure
			slots_properly_set: board.status_of (r, c + 2).is_equal (board.occupied_slot)
				-- Your task.
			other_slots_unchanged:
				-- Your task.
				-- Hint: Use 'matches_slots_except' from BOARD.
				board.matches_slots_except (old board.deep_twin, r, r, c, c+2)
		end

	move_up (r, c: INTEGER)
		require
			from_slot_valid_column: board.is_valid_column (c)
				-- Your task.
			from_slot_valid_row: board.is_valid_row (r)
				-- Your task.
			middle_slot_valid_row: board.is_valid_row (r - 1)
				-- Your task.
			to_slot_valid_row: board.is_valid_row (r - 2)
				-- Your task.
			from_slot_occupied: board.status_of (r, c).is_equal (board.occupied_slot)
				-- Your task.
			middle_slot_occupied: board.status_of (r - 1, c).is_equal (board.occupied_slot)
				-- Your task.
			to_slot_unoccupied: board.status_of (r - 2, c).is_equal (board.unoccupied_slot)
				-- Your task.
		do
			-- Your task.
			board.set_status (r-2, c, board.occupied_slot)
		    board.set_status (r-1, c, board.unoccupied_slot)
			board.set_status (r, c, board.unoccupied_slot)

		ensure
			slots_properly_set: board.status_of (r - 2, c).is_equal (board.occupied_slot)
				-- Your task.
			other_slots_unchanged:
				-- Your task.
				-- Hint: Use 'matches_slots_except' from BOARD.
			board.matches_slots_except (old board.deep_twin, r-2, r, c, c)
		end

	move_down (r, c: INTEGER)
		require
			from_slot_valid_column: board.is_valid_column (c)
				-- Your task.
			from_slot_valid_row: board.is_valid_row (r)
				-- Your task.
			middle_slot_valid_row: board.is_valid_row (r + 1)
				-- Your task.
			to_slot_valid_row: board.is_valid_row (r + 2)
				-- Your task.
			from_slot_occupied: board.status_of (r, c).is_equal (board.occupied_slot)
				-- Your task.
			middle_slot_occupied: board.status_of (r + 1, c).is_equal (board.occupied_slot)
				-- Your task.
			to_slot_unoccupied: board.status_of (r + 2, c).is_equal (board.unoccupied_slot)
				-- Your task.
		do
			-- Your task.
		         	board.set_status (r+2, c, board.occupied_slot)
				    board.set_status (r+1, c, board.unoccupied_slot)
					board.set_status (r, c, board.unoccupied_slot)
		ensure
			slots_properly_set: board.status_of (r + 2, c).is_equal (board.occupied_slot)
				-- Your task.
			other_slots_unchanged:
				-- Your task.
				-- Hint: Use 'matches_slots_except' from BOARD.
				board.matches_slots_except (old board.deep_twin, r, r+2, c, c)
		end

feature -- Status Queries
	is_over: BOOLEAN
			-- Is the current game 'over'?
			-- i.e., no further movements are possible.
		local
			i, j: INTEGER
		do
			-- Your task.
	    Result := True
	    from
			i := 1
			until
			i > board.number_of_rows
			loop
				from
					j := 1
				until
					j > board.number_of_columns
				loop
				    if board.status_of (i, j).is_equal (board.occupied_slot) then
				        -- check move up
				    	if board.is_valid_row (i-1) and board.is_valid_row (i-2) and
				    	board.status_of (i-1,j).is_equal (board.occupied_slot) and
				    	board.status_of (i-2, j).is_equal (board.unoccupied_slot) then
				    	Result := False
				    	end
				    	-- check move down
				    	if board.is_valid_row (i+1) and board.is_valid_row (i+2) and
				    	board.status_of (i+1,j).is_equal (board.occupied_slot) and
				    	board.status_of (i+2, j).is_equal (board.unoccupied_slot) then
				        Result := False
				        end
                        -- check move left
                        if board.is_valid_column (j-1) and board.is_valid_column (j-2) and
                        board.status_of (i,j - 1).is_equal (board.occupied_slot) and
                        board.status_of (i, j-2).is_equal (board.unoccupied_slot) then
				        Result := False
				        end
				        -- check move right
				        if board.is_valid_column (j+1) and board.is_valid_column (j+2) and
				        board.status_of (i,j+1).is_equal (board.occupied_slot) and
				        board.status_of (i, j+2).is_equal (board.unoccupied_slot) then
				        Result := False
				        end
				        end
				    j := j + 1
				end
				i := i + 1
			end

		ensure
			correct_result:
				-- Your task.
				-- Hint: write two nested across expressions to
				-- iterate through all slots. Each slot is identified
				-- by its row and column numbers. If there is any
				-- slot that is movable, then the result should be true.
			across
			1 |..| board.number_of_rows as a
			all
				across
					1 |..| board.number_of_columns as b
				all
					 board.status_of (a.item, b.item).is_equal (board.occupied_slot) and
					((board.is_valid_row (a.item-1) and board.is_valid_row (a.item-2) and
					board.status_of (a.item-1,b.item).is_equal (board.occupied_slot) and
					board.status_of (a.item-2, b.item).is_equal (board.unoccupied_slot))
					or
					(board.is_valid_row (a.item+1) and board.is_valid_row (a.item+2) and
					board.status_of (a.item+1,b.item).is_equal (board.occupied_slot) and
					board.status_of (a.item+2, b.item).is_equal (board.unoccupied_slot))
				    or
				    (board.is_valid_column (b.item-1) and board.is_valid_column (b.item-2) and
				    board.status_of (a.item,b.item-1).is_equal (board.occupied_slot) and
				    board.status_of (a.item, b.item-2).is_equal (board.unoccupied_slot))
				    or
				    (board.is_valid_column (b.item+1) and board.is_valid_column (b.item+2) and
				     board.status_of (a.item,b.item+1).is_equal (board.occupied_slot) and
				     board.status_of (a.item, b.item+2).is_equal (board.unoccupied_slot)))
				    implies Result = False
				end

			end

		end

	is_won: BOOLEAN
			-- Has the current game been won?
			-- i.e., there's only one occupied slot on the board.
		do
			-- Your task.
			Result := board.number_of_occupied_slots = 1

		ensure
			game_won_iff_one_occupied_slot_left: Result = (board.number_of_occupied_slots = 1)
				-- Your task.
				-- Hint: Use 'number_of_occupied_slots' from BOARD.
			winning_a_game_means_game_over: (Result = True) implies is_over
				-- Your task.
		end

feature -- Output
	out: STRING
			-- String representation of current game.
			-- Do not modify this feature!
		do
			create Result.make_empty
			Result.append ("Game is over: " + boolean_to_yes_no (is_over) + "%N")
			Result.append ("Game is won : " + boolean_to_yes_no (is_won) + "%N")
			Result.append ("Board Status:%N")
			Result.append (board.out)
		end

feature -- Auxiliary Routines
	boolean_to_yes_no (b: BOOLEAN): STRING
			-- 'Yes' or 'No' corresponding to 'b'.
		do
			if b then
				Result := "Yes"
			else
				Result := "No"
			end
		end

feature -- Board
	bta: BOARD_TEMPLATES_ACCESS
	board: BOARD
end
