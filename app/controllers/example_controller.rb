class ExampleController < ApplicationController
  def index
    @events = Event.all

    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow event.description + "<br>#{view_context.link_to "詳細を見る", event}"
      marker.picture({
        "url" => "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
        "width" => "32",
        "height" => "32"
        })
      marker.json({ title: event.title })
    end
  end
end
