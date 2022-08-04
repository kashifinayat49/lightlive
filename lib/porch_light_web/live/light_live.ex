defmodule PorchLightWeb.LightLive do
  use PorchLightWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :brightness, 10)}
  end

  def render(assigns) do
    ~L"""
    <h1>Front Porch Light</h1>
    <div>
    <div>
    <span style="width: <%= @brightness %>%">
    <%= @brightness %>%
    </span>
    </div>

    <button phx-click="off">
    off
    </button>

    <button phx-click="down">
    down
    </button>

    <button phx-click="up">
    up
    </button>

    <button phx-click="on">
    on
    </button>
    </div>


    """
  end

  def handle_event("on", _, socket) do
    {:noreply, assign(socket, :brightness, 100)}
  end

  def handle_event("up", _, socket) do
    {:noreply, update(socket, :brightness, &(&1 + 10))}
  end

  def handle_event("down", _, socket) do
    {:noreply, update(socket, :brightness, &(&1 - 10))}
  end

  def handle_event("off", _, socket) do
    {:noreply, assign(socket, :brightness, 0)}
  end
end
