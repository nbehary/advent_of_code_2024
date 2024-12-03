package main

import "core:fmt"


check_line :: proc(line:[dynamic]int, descending:bool, count:int) -> bool {
	if count > 1{
		return false
	}
	is_safe := true
	for i in 1..<len(line)-1{
		diff := abs(line[i] - line[i+1])
		if descending{
			if (line[i] > line[i+1]) && (diff <=3){
			} else {
				is_safe = false
			}
		} else {
			if (line[i] < line[i+1]) && (diff <=3){
			} else {
				is_safe = false
			}
		}
	}

	return is_safe 
}

remove_same :: proc(line:[dynamic]int) -> ([dynamic]int, bool) {
	the_map := make(map[int]int)
	the_array : [dynamic]int
	multiples := false
	defer delete(the_map)
	for val in line{
		not_ok := val in the_map
		the_map[val] += 1
		if  !not_ok{
			append(&the_array, val)
		} else if the_map[val] >1 {
			multiples = true
	}
	return (the_array, multiples

}

