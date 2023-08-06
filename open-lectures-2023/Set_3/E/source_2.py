# E. Варим зелья

INF = int(1e18)
MAX_ELEM = int(1e9)

def check(minUs):
    ans = 0
    cnt = 0
    for i in range(1, n + 1):
        if usefullness[i] < minUs:
            break
        cnt += 1
        ans += usefullness[i]
    j = 2
    while j <= n and usefullness[1] + usefullness[j] >= minUs:
        j += 1

    for i in range(1, n + 1):
        if i + 1 >= j:
            break
        while j - 1 > i and usefullness[i] + usefullness[j - 1] < minUs:
            j -= 1
        cnt += (j - i - 1) # cnt += j - i
        ans += prefSum[j - 1] - prefSum[i] + usefullness[i] * (j - i - 1) # ans += prefSum[j+1] - prefSum[i] + usefullness[i]*(j-i-1)
    if cnt >= k:
        return ans - (cnt - k) * minUs
    else:
        return INF

n, k = map(int, input().split())
usefullness = list(map(int, input().split()))
usefullness.sort()
usefullness.append(0)
usefullness.reverse()
prefSum = [0] * (n + 1)
for i in range(1, n + 1):
    prefSum[i] = prefSum[i - 1] + usefullness[i]
l = -MAX_ELEM
r = MAX_ELEM
while r > l:
    m = (l + r + 1) // 2
    if check(m) != INF:
        l = m
    else:
        r = m - 1

print(check(l))