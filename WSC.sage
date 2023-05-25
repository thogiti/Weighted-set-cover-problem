
# Weighted set cover using greedy algorithm in sagemath

def weighted_set_cover(U, S, w, B):
    C = []  # Selected subsets
    uncovered = set(U)  # Initially, all items are uncovered

    while uncovered:
        best_subset = None
        max_covered = 0

        for subset in S:
            covered = uncovered.intersection(subset)
            if len(covered) > max_covered:
                best_subset = subset
                max_covered = len(covered)

        C.append(best_subset)
        uncovered -= best_subset

    total_weight = sum(w[i] for subset in C for i in subset)
    return C, total_weight



U = {1, 2, 3, 4, 5}  # Set of items
S = [{1, 2}, {2, 3, 4}, {1, 3, 5}, {4, 5}]  # Collection of subsets
w = {1: 3, 2: 5, 3: 2, 4: 4, 5: 1}  # Weight associated with each item
B = 10  # Budget

selected_subsets, total_weight = weighted_set_cover(U, S, w, B)

print("Selected Subsets:")
for subset in selected_subsets:
    print(subset)

print("Total Weight:", total_weight)
