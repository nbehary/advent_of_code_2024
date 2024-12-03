package main

import "core:os"
import "core:strings"
import "core:fmt"
import "core:strconv"
import "core:slice"


main :: proc(){
	//read_input_lines("day1_test.txt")
	day2_part_2()


}

read_input_lines :: proc(filepath: string)-> [dynamic][dynamic]int{
	data, ok := os.read_entire_file(filepath, context.allocator)
	if !ok {
		return nil
	}
	defer delete(data, context.allocator)

	it := string(data)
	lines: [dynamic][dynamic]int

	for line in strings.split_lines_iterator(&it){
		split := strings.split(line, " ")
		ints: [dynamic]int
		for num_str in split{
			append(&ints, strconv.atoi(num_str) )
		}
		append(&lines, ints)
	}
	return lines
}


read_input :: proc(filepath:string) {

	data, ok := os.read_entire_file(filepath, context.allocator)
	if !ok {
		return
	}
	defer delete(data, context.allocator)

	it := string(data)
	left_side: [dynamic]int
	right_side: [dynamic]int
	for line in strings.split_lines_iterator(&it){
		split := strings.split(line, "   ")
		append(&left_side, strconv.atoi(split[0]))
		append(&right_side, strconv.atoi(split[1]))
	}
	slice.sort(left_side[:])
	slice.sort(right_side[:])
	total := 0
	similiar : map[int]int
	for idx in 0..<len(left_side){
		similiar[left_side[idx]] = 1
	}
	for idx in 0..<len(right_side){
		if similiar[right_side[idx]] >=1 {
			similiar[right_side[idx]] += 1
		}
	}
	for value in left_side{
		//fmt.printf("i:%d v:%d\n", idx,value)
		sim := similiar[value]-1
		if value > 1 {
			total += value * sim
		}
	}

	fmt.printf("total: %d\n",total)




}

scratch :: proc() {

		//dist := abs(left_side[idx] - right_side[idx])
		//total = total + dist
		//fmt.printf("%d, %d : %d. Total: %d\n", left_side[idx],right_side[idx],dist, total)
}
