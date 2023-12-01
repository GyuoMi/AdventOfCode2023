total_sum = 0

with open('input.txt', 'r') as file:
    for line in file:
        s_idx = next((i for i, c in enumerate(line) if c.isdigit()), None)
        e_idx = next((i for i, c in enumerate(line[::-1]) if c.isdigit()), None)

        s = int(line[s_idx])
        e = int(line[len(line) - e_idx - 1])

        c_v = int(str(s) + str(e))

        total_sum += c_v

print(total_sum)