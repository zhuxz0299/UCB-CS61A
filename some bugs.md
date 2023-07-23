## A bug in project *Hog*
```python
def announce_highest(who, last_score=0, running_high=0):
    assert who == 0 or who == 1, 'The who argument should indicate a player.'
    # BEGIN PROBLEM 7
    "*** YOUR CODE HERE ***"
    def say(score0, score1):
        if who == 0:
            cur_score = score0
        else:
            cur_score = score1
        if cur_score-last_score > running_high:
            new_running_high = cur_score-last_score
            print("{} point(s)! That's the biggest gain yet for Player {}".format(
                new_running_high, who))
        else:
            new_running_high=running_high
        return announce_highest(who, cur_score, new_running_high)
    return say
    # END PROBLEM 7
```

If I use `running_high` instead of `new_running_high`,the interpreter will return:`UnboundLocalError: local variable 'running_high' referenced before assignment`