-ifndef(OBJECTS_HRL).
-define(OBJECTS_HRL, true).

-record(object_process, {
  module = [] :: [] | atom(),
  stage = [] :: [] | list(),
  status = [] :: [] | atom(),
  sched = [] :: [] | tuple()
}).

-record(object_file, {
                     type = [] :: [] | term(),
                     sign = [] :: [] | boolean(),
                     convert = [] :: [] | failed | true | false
                   }).

-record(object_form, { id = [] :: [] | atom(),
                       fields = [] :: [] | atom()
                     }).

-record(object_corr, { id = [] :: [] | list() | binary(),
                       code = [] :: [] | list() | binary(),
                       sendType = [] :: [] | term(),
                       type = [] :: [] | list() | binary() }).

-record(object_email, { id = [] :: [] | list() | binary(),
                        email = [] :: [] | list() | binary(),
                        name = [] :: [] | list() | binary() }).

-record(object_employee, { id = [] :: [] | list() | binary(),
                           org = [] :: [] | list() | binary(),
                           branch = [] :: [] | list() | binary(),
                           roles = [] :: [] | list() }).

-endif.