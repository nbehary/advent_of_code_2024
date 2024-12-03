package main

import "core:fmt"
import "core:strings"


day2 :: proc(){

	lines := read_input_lines("day2.txt")
	safe_cnt := 0
	for line in lines{
		is_safe := true
		descending := false
		if line[0] > line[1]{
			if (line[0]- line[1]) > 3{
				is_safe = false
			}
			descending = true
		} else if line[0] == line[1] {
			is_safe = false
		} else if (line[1] - line[0]) > 3 {
			is_safe = false
		}
		
		
		for i in 1..<len(line)-1{
			if descending{
				diff:= line[i] - line[i+1]
				if diff > 0{
					if (line[i] > line[i+1]) && (diff <=3){
					} else {
						is_safe = false
					}
				} else {
					is_safe = false
				}
			} else {
				diff:= line[i+1] - line[i]
				if diff > 0{
					if (line[i] < line[i+1]) && (diff <=3){
					} else {
						is_safe = false
					}

				} else {
					is_safe = false
				}
			}
		}
		if is_safe {
			fmt.printf("Safe: %v\n", line)
			safe_cnt +=1
		}
	}
	fmt.printf("%d\n", safe_cnt)

}
