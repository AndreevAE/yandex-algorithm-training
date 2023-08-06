# C. Носки

l, n, m = map(int, input().split())
balance = [0] * (l + 1)
ans = [0] * (l + 1)
for i in range(n):
    left, right = map(int, input().split())
    balance[left - 1] += 1
    balance[right] -= 1

now = 0
for i in range(l):
    now = now + balance[i]
    ans[i] = now
for i in range(m):
    query = int(input()) - 1
    print(ans[query])