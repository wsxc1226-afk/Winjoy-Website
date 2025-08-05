// Declare variables for the map, infoWindow, radius, and skiresort
let map, infoWindow;
const radius = 400000;
const skiresort = "snow skiing";

// Function to initialize the Google Map
function initMap() {
  // Initial location coordinates
  const initialLocation = { lat: 37.29402, lng: 126.97467 };

  // Create a new Google Map centered at the initial location
  map = new google.maps.Map(document.getElementById("map"), {
    center: initialLocation,
    zoom: 10,
  });

  // Create an infoWindow for displaying information about markers
  infoWindow = new google.maps.InfoWindow();

  // Add a button to center the map on the user's current location
  addLocationButton();

  // Search for nearby places related to skiing at the initial location
  searchNearby(initialLocation, radius, 'skiing', skiresort);
  
  // Event listener for clicking on the map to search nearby places
  map.addListener("click", (e) => {
    searchNearby(e.latLng, radius, 'skiing', skiresort);
  });

  // Event listener for changes in the center of the map to search nearby places
  map.addListener("center_changed", () => {
    searchNearby(map.getCenter(), radius, 'skiing', skiresort);
  });
}

// Function to add a button for centering the map on the user's current location
function addLocationButton() {
  const locationButton = document.createElement("button");
  locationButton.textContent = "Current Location";
  locationButton.classList.add("custom-map-control-button");
  map.controls[google.maps.ControlPosition.RIGHT_TOP].push(locationButton);
  locationButton.addEventListener("click", () => {
    // Get the user's current location and center the map on it
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
          const pos = { lat: position.coords.latitude, lng: position.coords.longitude };
          infoWindow.setPosition(pos);
          map.setCenter(pos);
        },
        () => {
          // Handle errors related to geolocation
          handleLocationError(true, infoWindow, map.getCenter());
        }
      );
    } else {
      // Handle cases where the browser doesn't support geolocation
      handleLocationError(false, infoWindow, map.getCenter());
    }
  });
}

// Function to search for nearby places based on location, radius, type, and keyword
function searchNearby(location, radius, type, keyword) {
  const request = { location, radius, type: [type], keyword };
  const service = new google.maps.places.PlacesService(map);
  let totalResultsCount = 0;

  // Function to handle search results and pagination
  function handleSearchResults(results, status, pagination) {
    if (status !== google.maps.places.PlacesServiceStatus.OK) {
      // Log an error message if the Places Service status is not OK
      console.error('Places Service status:', status);
      return;
    }

    // Process each result and create markers for them
    results.forEach((result) => {
      if (totalResultsCount < 50) {
        createMarker(result);
        totalResultsCount++;
      }
    });

    // If there are more results and the limit hasn't been reached, make the next pagination request
    if (pagination && pagination.hasNextPage && totalResultsCount < 50) {
      // Wait a short time before making the next pagination request
      setTimeout(() => pagination.nextPage(), 2000);
    } else if (totalResultsCount >= 50) {
      // Log a message if the limit of 50 results has been reached
      console.log("Reached limit of 50 results");
    }
  }

  // Use the Places Service to perform a nearby search
  service.nearbySearch(request, handleSearchResults);
}

// Function to create a marker for a place and set up an infoWindow
function createMarker(place) {
  if (!place.geometry || !place.geometry.location) return;

  // Create a marker for the place
  const marker = new google.maps.Marker({
    map,
    position: place.geometry.location
  });

  // Event listener for clicking on the marker to show information in an infoWindow
  marker.addListener("click", () => {
    // Encode the place name for constructing a Google Maps search URL
    const encodedPlaceName = encodeURIComponent(place.name || "");
    const googleMapsSearchUrl = `https://www.google.com/maps/search/?api=1&query=${encodedPlaceName}`;

    // Content to be displayed in the infoWindow
    const contentString = `
      <div style="color: black; font-size: 16px;"> <!-- Ensure inline CSS is correct -->
        <a href="${googleMapsSearchUrl}" target="_blank" style="color: black; text-decoration: none;">${place.name || ""}</a>
      </div>`;
    infoWindow.setContent(contentString);
    infoWindow.open(map, marker);
  });
}

// Function to handle errors related to geolocation
function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ? "Error: The Geolocation service failed." : "Error: Your browser doesn't support geolocation.");
  infoWindow.open(map);
}

// Set the initMap function as a property of the window object
window.initMap = initMap;
