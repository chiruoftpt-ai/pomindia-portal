import pytest

from pomindia_portal import main


def test_main_prints_greeting(capsys: pytest.CaptureFixture[str]) -> None:
    main()
    assert "pomindia-portal" in capsys.readouterr().out
