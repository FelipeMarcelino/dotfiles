__revision__ = ...  # type: str

class BaseRNG:
    closed = ...  # type: bool
    def __init__(self) -> None: ...
    def __del__(self): ...
    def __enter__(self): ...
    def __exit__(self): ...
    def close(self): ...
    def flush(self): ...
    def read(self, N: int = ...): ...
