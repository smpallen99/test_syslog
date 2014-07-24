defmodule TestSyslog.Worker do

  use GenServer
  require Logger

  def start_link do
    GenServer.start_link(__MODULE__, [], name: :worker)
  end

  def info(something), do: GenServer.cast(:worker, {:info, something})
  def debug(something), do: GenServer.cast(:worker, {:debug, something})
  def crash, do: GenServer.cast(:worker, :crash)
  
  def handle_cast({:info, something}, state) do
    Logger.info something
    {:noreply, state}
  end
  def handle_cast({:debug, something}, state) do
    Logger.debug something
    {:noreply, state}
  end
  def handle_cast(:crash, state) do
    Logger.debug "crashing now..."
    {:ok, _} = get_crash
    {:noreply, state}
  end

  defp get_crash, do: :crashing

end
