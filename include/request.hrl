-ifndef(REQUEST_HRL).
-define(REQUEST_HRL, true).

-record(request, {
                 type = [] :: [] | atom(),
                 endpoint = [] :: [] | atom(),
                 subject = [] :: [] | term(),
                 context = [] :: [] | term(),
                 resources = [] :: [] | list()
}).

-record(context, {
                form = [] :: [] | tuple(),
                pid  = [] :: [] | list() | binary(),
                corr = [] :: [] | tuple(),
                notification = [] :: [] | tuple(),
                stage_status = [] :: [] | tuple(),
                files = [] :: [] | tuple(),
                employee = [] :: [] | tuple()
}).

-endif.