# C. Гирлянды

def good(m):
    inGarland = 0
    for i in range(k):
        inGarland += cntLamp[i] // m
    return inGarland >= n

n, k = map(int, input().split())
cntLamp = [0] * k
for i in range(k):
    cntLamp[i] = int(input())
l = 0
r = 2 * 10**9
while l < r:
    m = (l + r + 1) // 2
    if good(m):
        l = m
    else:
        r = m - 1
print(l)
usedLamps = 0
for i in range(k):
    for j in range(min(cntLamp[i] // l, n - usedLamps)):
        print(i + 1)
        usedLamps += 1