# tests/bowling/test_score_calculator.py
from app.bowling.score_calculator import sum_num


def test_sum_num():
    assert sum_num([1, 2, 3]) == 6, "Should be 6"
