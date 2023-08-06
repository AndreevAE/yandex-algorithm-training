# B. Наибольшая подстрока

n, k = map(int, input().split())
s = input()
total_unique = len(set(s))
ans = 0
for unique_lim in range(1, total_unique + 1):
    left = right = 0
    cnt = {s[left]: 1}
    k_cnt_chars = 0
    if k == 1:
        k_cnt_chars = 1
    now_unique = 1
    while right < n:
        if now_unique > unique_lim:
            if cnt.get(s[left], 0) == k:
                k_cnt_chars -= 1
            cnt[s[left]] -= 1
            if cnt[s[left]] == 0:
                now_unique -= 1
            left += 1
        else:
            if k_cnt_chars == unique_lim:
                ans = max(ans, right - left + 1)
            right += 1
            if right < n:
                cnt[s[right]] = cnt.get(s[right], 0) + 1
                if cnt[s[right]] == k:
                    k_cnt_chars += 1
                if cnt[s[right]] == 1:
                    now_unique += 1
print(ans)