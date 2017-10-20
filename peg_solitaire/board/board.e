note
	description: "A board for the peg solitaire game."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOARD

inherit
	ANY
		redefine
			out, is_equal
		end

create
	make_default,
	make_easy,
	make_cross,
	make_plus,
	make_pyramid,
	make_arrow,
	make_diamond,
	make_skull


feature -- Constructor
	make_default
			-- Initialize a default board with all slots unavailable.
		do
			create imp.make_filled (unavailable_slot, 7, 7)
		ensure
			board_set:
				-- Your task.
				current ~ bta.templates.default_board
		end

	make_easy
			-- Initialize an easy board.
		do
			make_default
			set_status (1, 4, unoccupied_slot)
			set_status (4, 4, unoccupied_slot)
			set_status (6, 4, unoccupied_slot)

			set_statuses (2, 3, 4, 4, occupied_slot)
			set_status (5, 4, occupied_slot)
		ensure
			board_set:
				Current ~ bta.templates.easy_board
		end

	make_cross
			-- Initialize a Cross board.
		do
			make_default
			-- Your task: the current implementation
			-- may not be correct.
			set_statuses (1, 1, 3, 5, unoccupied_slot)
			set_statuses (2, 5, 4, 4, occupied_slot)
			set_statuses (3, 3, 3, 5, occupied_slot)
			set_status (2, 3, unoccupied_slot)
            set_status (2, 5, unoccupied_slot)
            set_statuses (3, 5, 1, 2, unoccupied_slot)
            set_statuses (3, 5, 6, 7, unoccupied_slot)
            set_statuses (4, 7, 3, 3, unoccupied_slot)
            set_statuses (4, 7, 5, 5, unoccupied_slot)
            set_statuses (6, 7, 4, 4, unoccupied_slot)

		ensure
			board_set:
				-- Your task.
				current ~ bta.templates.cross_board
		end

	make_plus
			-- Initialize a Plus board.
		do
			make_cross
			-- Your task: the current implementation
			-- may not be correct.
			set_status(3, 3, unoccupied_slot)
			set_status(3, 5, unoccupied_slot)
			set_statuses(4, 4, 2, 6, occupied_slot)
			set_status(6, 4, occupied_slot)
		ensure
			board_set:
				-- Your task.
				Current ~ bta.templates.plus_board
		end

	make_pyramid
			-- Initialize a Pyramid board.
		do
			make_cross
			-- Your task: the current implementation
			-- may not be correct.
			set_statuses(4, 4, 2, 6, occupied_slot)
			set_statuses(5, 5, 1, 7, occupied_slot)
		ensure
			board_set:
				-- Your task.
				Current ~ bta.templates.pyramid_board
		end

	make_arrow
			-- Initialize a Arrow board.
		do
			make_default
			-- Your task: the current implementation
			-- may not be correct.
			set_statuses(1, 7, 1, 7, occupied_slot)
			set_statuses(1, 2, 1, 2, unavailable_slot)
			set_statuses(6, 7, 1, 2, unavailable_slot)
			set_statuses(1, 2, 6, 7, unavailable_slot)
			set_statuses(6, 7, 6, 7, unavailable_slot)
			set_status(1, 3, unoccupied_slot)
			set_status(1, 5, unoccupied_slot)
			set_statuses(3, 5, 1, 1, unoccupied_slot)
			set_statuses(3, 5, 7, 7, unoccupied_slot)
			set_statuses(4, 5, 2, 3, unoccupied_slot)
			set_statuses(4, 5, 5, 6, unoccupied_slot)
		ensure
			board_set:
				-- Your task.
				Current ~ bta.templates.arrow_board
		end

	make_diamond
			-- Initialize a Diamond board.
		do
			make_arrow
			-- Your task: the current implementation
			-- may not be correct.
			set_statuses(4, 4, 1, 3, occupied_slot)
			set_statuses(4, 4, 5, 7, occupied_slot)
			set_status (4, 4, unoccupied_slot)
			set_statuses(5, 5, 2, 6, occupied_slot)
			set_status (7, 3, unoccupied_slot)
			set_status (7, 5, unoccupied_slot)
		ensure
			board_set:
				-- Your task.
				Current ~ bta.templates.diamond_board
		end

	make_skull
			-- Initialize a Skull board.
		do
			make_arrow
			-- Your task: the current implementation
			-- may not be correct.
			set_status (1, 3, occupied_slot)
			set_status (1, 5, occupied_slot)
			set_status (4, 2, occupied_slot)
			set_status (4, 6, occupied_slot)
			set_statuses(5, 5, 2, 6, occupied_slot)


		ensure
			board_set:
				-- Your task.
				Current ~ bta.templates.skull_board
		end

feature -- Auxiliary Commands
	set_status (r, c: INTEGER; status: SLOT_STATUS)
			-- Set the status of slot at row 'r' and column 'c' to 'status'.
		require
			valid_row: is_valid_row(r)
				-- Your task.
			valid_column: is_valid_column(c)
				-- Your task.
		do
			-- Your task.
			imp.put (status, r, c)
		ensure
			slot_set:
				-- Your task.
				imp [r,c] ~ status
			slots_not_in_range_unchanged:
				-- Your task.
				-- Hint: Use query 'matches_slots_except'.
			Current.matches_slots_except ((old Current.deep_twin), r, r, c, c)



		end

	set_statuses (r1, r2, c1, c2: INTEGER; status: SLOT_STATUS)
			-- Set the range of slots to 'status':
			-- intersection of rows 'r1' to 'r2' and
			-- columns 'c1' to 'c2'.
		require
			valid_rows:
				-- Your task.
				across
				r1 |..| r2	 as a
				all
				is_valid_row(a.item)
				end
			valid_columns:
				-- Your task.
				across
				c1 |..| c2 as a
				all
				is_valid_column (a.item)

				end
			valid_row_range: r2 >= r1
				-- Your task.
			valid_column_range: c2 >= c1
				-- Your task.
		local
			i, j: INTEGER
		do
			-- Your task.
			from
				i := r1
			until
				i > r2
			loop
				from
				j := c1
				until
				j > c2
				loop
				imp.put (status, i, j)
				j := j + 1
				end
                i := i + 1

			end


		ensure
			slots_in_range_set:
				-- Your task.
				across
				r1 |..| r2 as a
				all
					across
					c1 |..| c2	 as b
					all
					imp[a.item, b.item] ~ status
					end

				end
			slots_not_in_range_unchanged:
				-- Your task.
				-- Hint: Use query 'matches_slots_except'.
				Current.matches_slots_except (old Current.deep_twin, r1, r2, c1, c2)
		end

feature -- Auxiliary Queries
	matches_slots_except (
		other: BOARD; r1, r2, c1, c2: INTEGER)
	: BOOLEAN
			-- Do slots outside the intersection of
			-- rows 'r1' to 'r2' and columns 'c1' and 'c2'
			-- match in Current and 'other'.
		require
			consistent_row_numbers:Current.number_of_rows = other.number_of_rows
				-- Your task.

			consistent_column_numbers: Current.number_of_columns = other.number_of_columns
				-- Your task.

			valid_rows:
				-- Your task.
				across
				r1 |..| r2	 as a
				all
				is_valid_row(a.item)
				end
			valid_columns:
				-- Your task.
				across
				c1 |..| c2 as a
				all
				is_valid_column (a.item)

				end
			valid_row_range: r2 >= r1
				-- Your task.
			valid_column_range: c2 >= c1
				-- Your task.
				local
					i, j : INTEGER
		do
			-- Your task.
			Result := True
			from
			i := 1
			until
			i > number_of_rows
			loop
				from
					j := 1
				until
					j > number_of_columns
				loop
				    if (j < c1 or j > c2) or (i < r1 or i > r2) then
				    if not (imp[i,j].is_equal (other.status_of(i,j))) then
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
				-- by its row and column numbers. If the slot location
				-- is not witin 'r1', 'r2', 'c1', and 'c2', then
				-- its value in 'Current' is equal to that in 'other'.
				across
				1 |..| number_of_rows as a
				all
					across
					1 |..| number_of_columns as b
					all
					((a.item < r1 or a.item > r2) or (b.item < c1 or b.item > c2))
					implies
					Current.status_of (a.item, b.item).is_equal (other.status_of (a.item, b.item))
					end

				end
		end

	unavailable_slot: UNAVAILABLE_SLOT
			-- A slot not available for movement.
		do
			Result := ssa.unavailable_slot
		ensure
			Result = ssa.unavailable_slot
		end

	occupied_slot: OCCUPIED_SLOT
			-- A slot available for moment but currently occupied.
		do
			Result := ssa.occupied_slot
		ensure
			Result = ssa.occupied_slot
		end

	unoccupied_slot: UNOCCUPIED_SLOT
			-- A slot available for moment and currently unoccupied.
		do
			Result := ssa.unoccupied_slot
		ensure
			Result = ssa.unoccupied_slot
		end

feature -- Queries
	number_of_rows: INTEGER
			-- Number of rows in the board of game.
		do
			-- Your task.
			Result := imp.height
		ensure
			correct_result:
				-- Your task.
				Result = (old imp.deep_twin).height

		end

	number_of_columns: INTEGER
			-- Number of columns in the board of game.
		do
			-- Your task.
			Result := imp.width
		ensure
			correct_result:
				-- Your task.
				Result = (old imp.deep_twin).width
		end

	is_valid_row (r: INTEGER): BOOLEAN
			-- Is 'r' a valid row number?
		do
			-- Your task.
			Result := r >= 1 and r <= imp.height
		ensure
			correct_result:
				-- Your task.
				Result = (r >=1 and r <= (old imp.deep_twin).height)
		end

	is_valid_column (c: INTEGER): BOOLEAN
			-- Is 'x' a valid column number?
		do
			-- Your task.
			Result := c >= 1 and c <= imp.width
		ensure
			correct_result:
				-- Your task.
				Result = (c>=1 and c <= (old imp.deep_twin).height)
		end

	status_of (r, c: INTEGER): SLOT_STATUS
			-- Is the slot at row 'r' and column 'c'
			-- unavailable, occupied, or unoccupied?
		require
			valid_row: is_valid_row(r)
				-- Your task.

			valid_column: is_valid_column(c)
				-- Your task.
		do

			-- Your task: the current implementation
			-- may not be correct.
			Result:= imp[r,c]
		ensure
			correct_result: Result ~ (old imp.deep_twin)[r,c]
				-- Your task.
		end

	number_of_occupied_slots: INTEGER
			-- Number of slots occupied by pegs on current board.

       local
       i, j, a: INTEGER
		do

			-- Your task.
			-- No postcondition is needed for this auxiliary query.
        a := 0
        from
        i := 1
        until
        i > number_of_rows
        loop
        	from
        		j :=1
        	until
        		j > number_of_columns
        	loop
        		if imp [i,j].is_equal (ssa.occupied_slot) then
        			a := a + 1
        		end
        		j := j + 1
        	end
        	i := i + 1
        end
        Result := a

		end

feature -- Equality
	is_equal (other: like Current): BOOLEAN
			-- Is current board equal to 'other'?
		do
			-- Your task.
			Result := Current.out ~ other.out
		ensure then
			correct_result: Result = (other.out ~ Current.out)
				-- Your task.
		end


feature -- Output
	out: STRING
			-- String representation of current board.
			local
			i, j: INTEGER

		do

		create Result.make_empty

			-- Your task: the current implementation
			-- may not be correct.
			-- No postcondition is needed for this query.
--			s := ""
--			across
--			1 |..| Current.number_of_rows as r
--			loop
--				across
--					1 |..| Current.number_of_columns as c
--				loop
--					s := s + imp.item (r.item, c.item).out
--				end
--				if(r.item /= Current.number_of_columns) then
--					s:= "%N"
--				end
--			end
--			Result := s

        from
        i := 1
        until
        i > number_of_rows
        loop
        	from
        		j :=1
        	until
        		j > number_of_columns
        	loop
                Result.append(imp[i,j].out)


        		j := j + 1
        	end
        	if i /= 7 then
        		Result.append ("%N")

        	end
        	i := i + 1

        end

		end

feature {NONE} -- Implementation

	ssa:SLOT_STATUS_ACCESS
	bta: BOARD_TEMPLATES_ACCESS

	-- Note: ARRAY2 takes row (y) and then column (x)
	imp: ARRAY2[SLOT_STATUS]
end
