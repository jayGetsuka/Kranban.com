import math
def float_dec(number):
    number = float("{:.3f}".format(number))
    if(str(number)[-1] in [5,6,7,8,9]):
        number += 0.01
        number = float("{:.2f}".format(number))
        return number
    number = float("{:.2f}".format(number))
    return number
def loop_num():
    print("( ",end="")
    for i in range(n):
        if(i == (n -1)):
            print(number_map[i], end=" / {} ) ".format(n))
        else:
            print(number_map[i], end=" + ")
       
print("example >> input numbers: 12,14,17,15,16")
numbers = list(input("input numbers: ").split(","))
number_map = list(map(int, numbers))
n = len(number_map)
avg = float_dec(float(sum(number_map) / n))
print("ค่าเฉลี่ย: ", end="")
loop_num()
print(" = {:.2f}".format(avg))
print("sum = ", sum(number_map))
for i in range(n):
   number_map[i] = number_map[i] ** 2

variance = (sum(number_map) / n) - (avg ** 2)
print("ค่าแปรปรวน ที่ยกกำลัง2แล้ว คือ ",end="")
loop_num()
print("- {:.2f} = ".format(avg ** 2),float_dec(variance))
print("sum = ", sum(number_map))
std_deviation = math.sqrt(variance)
print("ค่าเบี่ยงเบนมาตรฐาน: squeue root({}) = ".format(float_dec(variance)),float_dec(std_deviation))
cv = std_deviation / avg
print("C.V.: {} / {} = ".format(float_dec(std_deviation), avg), "{:.2f}".format(float_dec(cv)))