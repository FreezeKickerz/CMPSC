nums = [2,7,11,15]
target = 9
def twoSum(nums: list[int], target: int) -> list[int]:
    for x in range(len(nums)):
        for y in range(x+1,len(nums)):
            if nums[x] + nums[y] == target:
                return [x, y]
print(twoSum(nums, target))