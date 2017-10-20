note
	description: "Summary description for {SLOT_STATUS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	SLOT_STATUS

inherit
	ANY
		redefine
			is_equal
		end

feature -- Equality
	is_equal(other: like Current): BOOLEAN
			-- Is the current slot status equal to 'other'?
		do
			-- Your task.
		    Result := Current.out ~ other.out

		ensure then
			correct_result: Result = (other.out ~ Current.out)
				-- Your task
		end
end
