from typing import Any

fastbinary = ...  # type: Any

class ResultCode:
    OK = ...  # type: Any
    TRY_LATER = ...  # type: Any

class LogEntry:
    thrift_spec = ...  # type: Any
    category = ...  # type: Any
    message = ...  # type: Any
    def __init__(self, category=..., message=...) -> None: ...
    def read(self, iprot): ...
    def write(self, oprot): ...
    def validate(self): ...
    def __eq__(self, other): ...
    def __ne__(self, other): ...
