// app/javascript/components/autocomplete.js
function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var farmAddress = document.getElementById('farm_address');

    if (farmAddress) {
      var autocomplete = new google.maps.places.Autocomplete(farmAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(farmAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
