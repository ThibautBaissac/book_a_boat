import mapboxgl from "mapbox-gl";
import "mapbox-gl/dist/mapbox-gl.css";

const initMapbox = () => {
  const mapElement = document.getElementById("map");

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  const addMarkersToMap = (map, markers) => {
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window); // add this

      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup) // add this
        .addTo(map);
    });
  };

  if (mapElement) {
    // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/lixek48110/cksha72cp4l6b18nvxihv0h26",
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      new mapboxgl.Marker().setLngLat([marker.lng, marker.lat]).addTo(map);
    });

    fitMapToMarkers(map, markers);
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
