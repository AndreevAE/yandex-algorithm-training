# D. Удали строку

s = input()
left = 0
right = len(s) - 1
while left < right and s[left] == s[right]:
    now_char = s[left]
    while left < right and s[left] == now_char:
        left += 1
    while right >= left and s[right] == now_char:
        right -= 1
print(right - left + 1)