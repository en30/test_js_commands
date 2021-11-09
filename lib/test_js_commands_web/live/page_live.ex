defmodule TestJsCommandsWeb.PageLive do
  use TestJsCommandsWeb, :live_view

  alias Phoenix.LiveView.JS

  @fadeout {"transition ease-out duration-1000", "opacity-100", "opacity-0"}
  @fadein {"transition ease-out duration-1000", "opacity-0", "opacity-100"}
  @target "#target"
  @time 2000

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:commands, %{
        "add_class" =>
          JS.add_class("text-blue-500", to: @target, time: @time, transition: @fadeout),
        "hide" => JS.hide(to: @target, time: @time, transition: @fadeout),
        "remove_class" =>
          JS.remove_class("text-blue-500", to: @target, time: @time, transition: @fadeout),
        "show" => JS.show(to: @target, time: @time, transition: @fadein),
        "toggle" => JS.toggle(to: @target, time: @time, in: @fadein, out: @fadeout),
        "transition" => JS.transition(@fadeout, to: @target, time: @time)
      })

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="space-y-8">
      <ul class="flex space-x-4">
        <%= for {key, command} <- @commands do %>
          <li>
            <button
              type="button"
              class="inline-flex items-center px-3 py-2 border border-transparent text-sm rounded-md text-indigo-700 bg-indigo-100 hover:bg-indigo-200"
              phx-click={command}
            >
              <%= key %>
            </button>
          </li>
        <% end %>
      </ul>

      <div
        id="target"
        class="bg-gray-100 w-48 h-16 shadow flex justify-center items-center"
      >
        transition target
      </div>
    </div>
    """
  end

  def hide_modal(js \\ %JS{}) do
    js
    |> JS.hide(transition: "fade-out", to: "#modal")
    |> JS.hide(transition: "fade-out-scale", to: "#modal-content")
  end
end
