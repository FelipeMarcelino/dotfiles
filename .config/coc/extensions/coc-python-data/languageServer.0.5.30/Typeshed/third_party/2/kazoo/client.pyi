from typing import Any

string_types = ...  # type: Any
bytes_types = ...  # type: Any
LOST_STATES = ...  # type: Any
ENVI_VERSION = ...  # type: Any
ENVI_VERSION_KEY = ...  # type: Any
log = ...  # type: Any

class KazooClient:
    logger = ...  # type: Any
    handler = ...  # type: Any
    auth_data = ...  # type: Any
    default_acl = ...  # type: Any
    randomize_hosts = ...  # type: Any
    hosts = ...  # type: Any
    chroot = ...  # type: Any
    state = ...  # type: Any
    state_listeners = ...  # type: Any
    read_only = ...  # type: Any
    retry = ...  # type: Any
    Barrier = ...  # type: Any
    Counter = ...  # type: Any
    DoubleBarrier = ...  # type: Any
    ChildrenWatch = ...  # type: Any
    DataWatch = ...  # type: Any
    Election = ...  # type: Any
    NonBlockingLease = ...  # type: Any
    MultiNonBlockingLease = ...  # type: Any
    Lock = ...  # type: Any
    Party = ...  # type: Any
    Queue = ...  # type: Any
    LockingQueue = ...  # type: Any
    SetPartitioner = ...  # type: Any
    Semaphore = ...  # type: Any
    ShallowParty = ...  # type: Any
    def __init__(self, hosts=..., timeout=..., client_id=..., handler=..., default_acl=..., auth_data=..., read_only=..., randomize_hosts=..., connection_retry=..., command_retry=..., logger=..., **kwargs) -> None: ...
    @property
    def client_state(self): ...
    @property
    def client_id(self): ...
    @property
    def connected(self): ...
    def set_hosts(self, hosts, randomize_hosts=...): ...
    def add_listener(self, listener): ...
    def remove_listener(self, listener): ...
    def start(self, timeout=...): ...
    def start_async(self): ...
    def stop(self): ...
    def restart(self): ...
    def close(self): ...
    def command(self, cmd=...): ...
    def server_version(self, retries=...): ...
    def add_auth(self, scheme, credential): ...
    def add_auth_async(self, scheme, credential): ...
    def unchroot(self, path): ...
    def sync_async(self, path): ...
    def sync(self, path): ...
    def create(self, path, value=..., acl=..., ephemeral=..., sequence=..., makepath=...): ...
    def create_async(self, path, value=..., acl=..., ephemeral=..., sequence=..., makepath=...): ...
    def ensure_path(self, path, acl=...): ...
    def ensure_path_async(self, path, acl=...): ...
    def exists(self, path, watch=...): ...
    def exists_async(self, path, watch=...): ...
    def get(self, path, watch=...): ...
    def get_async(self, path, watch=...): ...
    def get_children(self, path, watch=..., include_data=...): ...
    def get_children_async(self, path, watch=..., include_data=...): ...
    def get_acls(self, path): ...
    def get_acls_async(self, path): ...
    def set_acls(self, path, acls, version=...): ...
    def set_acls_async(self, path, acls, version=...): ...
    def set(self, path, value, version=...): ...
    def set_async(self, path, value, version=...): ...
    def transaction(self): ...
    def delete(self, path, version=..., recursive=...): ...
    def delete_async(self, path, version=...): ...
    def reconfig(self, joining, leaving, new_members, from_config=...): ...
    def reconfig_async(self, joining, leaving, new_members, from_config): ...

class TransactionRequest:
    client = ...  # type: Any
    operations = ...  # type: Any
    committed = ...  # type: Any
    def __init__(self, client) -> None: ...
    def create(self, path, value=..., acl=..., ephemeral=..., sequence=...): ...
    def delete(self, path, version=...): ...
    def set_data(self, path, value, version=...): ...
    def check(self, path, version): ...
    def commit_async(self): ...
    def commit(self): ...
    def __enter__(self): ...
    def __exit__(self, exc_type, exc_value, exc_tb): ...

class KazooState:
    ...
