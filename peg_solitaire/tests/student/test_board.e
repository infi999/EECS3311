note
	description: "Tests on bad players."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_BOARD

inherit
	ES_TEST

create
	make

feature -- Constructor
	make
		do
			add_boolean_case (agent test1_matchs_slots_except)
			add_boolean_case (agent test2_number_of_occupied_slots)
			add_violation_case_with_tag("valid_row", agent test3_illegal_valid_row)
			add_violation_case_with_tag("to_slot_valid_row", agent test4_illegal_to_slot_valid_row)
			add_violation_case_with_tag("valid_row_range", agent test5_illegal_valid_row_range)
			add_violation_case_with_tag("correct_result", agent test6_illegal_correct_result)
		end

feature -- Tests for success 
	test1_matchs_slots_except: BOOLEAN

    local
    	a : BOARD
    	b : BOARD
    do
    	comment("test feature matchs_slots_except")
    	create a.make_default
    	create b.make_easy

    	Result := a.matches_slots_except (b, 1, 6, 4, 4)
    end


    test2_number_of_occupied_slots: BOOLEAN

    local
    	a : BOARD
    do
    	comment("test feature number_of_occupied_slots")
    	create a.make_cross

    	Result := a.number_of_occupied_slots = 6
    end

feature -- test to fail
    test3_illegal_valid_row

    local
    	a : BOARD
    do
    	comment("test precondition valid_row")
    	create a.make_cross

        a.set_status (8, 4, a.occupied_slot)
    end

    test4_illegal_to_slot_valid_row

    local
    	a : game
    do
    	comment("test precondition slot_to_valid_row")
    	create a.make_diamond

        a.move_up (2, 4)
    end

    test5_illegal_valid_row_range

    local
    	a : BOARD
    	b : BOARD
    	c : BOOLEAN
    do
    	comment("test feature matches_slots_except precondition violation valid_row_range")
    	create a.make_default
    	create b.make_easy

        c := a.matches_slots_except (b, 5, 1, 1, 2)
    end

    test6_illegal_correct_result
    local
    	a : BOARD
    	b : BOARD
    	c : BOOLEAN
    do
    	comment("test feature matches_slots_except postcondition violation correct_result")
    	create a.make_default
    	create b.make_easy

        c := a.matches_slots_except (b, 2, 6, 4, 4)
end
end
