

{application, webchess,
  [{description,  "Webchess server"},
   {id,           "webchess"},
   {vsn,          "0.1.1"},
   {modules,      [webchess_app, webchess_sup, test_sup, test_child]},
%   {maxP,         infinity},
   {maxT,         infinity},
   {registered,   [test_child]},
   {included_applications, []},
   {optional_applications, []},
   {applications, [kernel, stdlib]},
   {env,          []},
   {mod,          {webchess_app, []}},
   {start_phases, undefined},
   {runtime_dependencies, []}
]}.


