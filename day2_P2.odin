package main

import "core:fmt"
import "core:strings"


day2_part_2 :: proc(){

	lines := read_input_lines("day2.txt")
	safe_cnt := 0
	for the_line in lines{
		line, is_safe := remove_same(the_line)
		descending := false
		if line[0] > line[1]{
			if (line[0]- line[1]) > 3{
				is_safe = false
			}
			descending = true
		} else if (line[1] - line[0]) > 3 {
			is_safe = false
		}
		
		if is_safe{
			is_safe = check_line(line, descending, 0)
		}
		
		if is_safe {
			fmt.printf("Safe: %v\n", line)
			safe_cnt +=1
		}
	}
	fmt.printf("%d\n", safe_cnt)

}
