-ifndef(OBJECTS_HRL).
-define(OBJECTS_HRL, true).

-record(object_process, {
  module = [] :: [] | atom(),
  stage = [] :: [] | list(),
  status = false :: false | boolean(),
  sched = [] :: [] | tuple()
}).

-record(object_file, {
                     type = [] :: [] | any | template | external,
                     convert = [] :: [] | any | failed | finished | false,
                     sign = any :: any | boolean(),
                     needCert = any :: any | boolean(),
                     certificate = any :: any | boolean(),
                     attributes = [] :: [] | list(atom())
                   }).

-record(object_form, { id = [] :: [] | atom(),
                       fields = [] :: [] | atom()
                     }).

-record(object_corr, { id = [] :: [] | list() | binary(), code = [] :: [] | list() | binary(), sendType = [] :: [] | term(), type = [] :: [] | list() | binary() }).

-record(object_email, { id = [] :: [] | list() | binary(), email = [] :: [] | list() | binary(), name = [] :: [] | list() | binary() }).

-record(object_employee, { id = [] :: [] | list() | binary(), org = [] :: [] | list() | binary(), branch = [] :: [] | list() | binary(), roles = [] :: [] | list() }).

-record(object_executor, { status = [] :: [] | atom(), type = [] :: [] | list() | binary(), routing = [] :: [] | list(), roles = [] :: [] | list() }).

-record(object_notification, { id = [] :: [] | list() | binary() }).


-endif.