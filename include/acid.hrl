-ifndef(ABAC_ID).
-define(ABAC_ID, true).

-record(acid, {id = [] :: list() | binary(), % ACID
                 subject_type = [] :: organization | branch | employee | group,
                 subject = [] :: term(),
                 api_endpoint = [] :: list() | binary(),
                 description = <<>> :: binary(),
                 object_type = [] :: fileDesc | doc | process | monitor,
                 object = [] :: term(),
                 field_spec = [] :: list(atom()), % list of allowed/denied fields
                 type = auth :: auth | deny,
                 role_logic = [] :: list() | binary(), % role in /crm/roles, role monikers aka logic roles
                 role_inbox = register :: register | resolution | control
                            | execution | archive | approval | signing
                            | printsend | agreement | acquaintance % roles as distinct set of process stages
                                                                   % aka physical roles
                }).

-endif.
