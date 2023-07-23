def search(quary, ranking=lambda r: -r.rank):
    # string quary is the substring of r.name
    result = [r for r in Restaurant.all if quary in r.name]
    return sorted(result, key=ranking)


def reviewed_both(r, s):
    return len([x for x in r.reviewers if x in s.reviewers])


class Restaurant:
    all = []

    def __init__(self, name, stars) -> None:
        self.name, self.stars = name, stars
        Restaurant.all.append(self)

    def similar(self, k, similarity):
        "Return the K most similar restaurant to SELF"
        others = list(Restaurant.all)
        others.remove(self)
        return sorted(others, key=lambda r: -similarity(self, r))[:k]

    def __repr__(self) -> str:
        return '<' + self.name + '>'


results = search('Thai')
for r in results:
    print(r, 'is similar to', r.similar(3))
