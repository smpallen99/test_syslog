defmodule TestSyslog do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Add the syslog backend 
    Logger.add_backend Logger.Backends.Syslog

    children = [
      # Define workers and child supervisors to be supervised
      worker(TestSyslog.Worker, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestSyslog.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
