TestSyslog
==========

This is an example project to demonstrate the syslog logger backend

## Usage Example

```
[root@ucx20 test_syslog]# iex -S mix
Erlang/OTP 17 [erts-6.0] [source] [64-bit] [smp:2:2] [async-threads:10] [hipe] [kernel-poll:false]
Compiled lib/test_syslog.ex
Compiled lib/worker.ex
Generated test_syslog.app
Interactive Elixir (0.15.0) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> TestSyslog.Worker.info "testing info"
:ok
iex(2)> 20:50:20.880 [info] testing info
iex(2)> TestSyslog.Worker.debug "testing debug"
:ok
iex(3)> 20:50:32.356 [debug] testing debug
iex(3)> TestSyslog.Worker.crash
:ok
iex(4)> 20:50:37.276 [debug] crashing now...
20:50:37.286 [error] GenServer :worker terminating
Last message: {:"$gen_cast", :crash}
State: []
** (exit) an exception was raised:
    ** (MatchError) no match of right hand side value: :crashing
        (test_syslog) lib/worker.ex:24: TestSyslog.Worker.handle_cast/2
        (stdlib) gen_server.erl:599: :gen_server.handle_msg/5
        (stdlib) proc_lib.erl:239: :proc_lib.init_p_do_apply/3

```
