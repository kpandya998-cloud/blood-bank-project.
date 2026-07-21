document.addEventListener('DOMContentLoaded', function () {
  const loader = document.getElementById('pageLoader');
  if (loader) {
    window.setTimeout(() => {
      loader.classList.add('fade-out');
      window.setTimeout(() => {
        loader.style.display = 'none';
      }, 400);
    }, 600);
  }

  const scrollBtn = document.getElementById('scrollTopBtn');
  if (scrollBtn) {
    window.addEventListener('scroll', () => {
      if (window.scrollY > 400) {
        scrollBtn.style.display = 'flex';
      } else {
        scrollBtn.style.display = 'none';
      }
    });

    scrollBtn.addEventListener('click', () => {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
  }

  const forms = document.querySelectorAll('.needs-validation');
  Array.from(forms).forEach(function (form) {
    form.addEventListener('submit', function (event) {
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  });

  const cityHospitalMap = {
    Rajkot: ['Rajkot Civil Hospital', 'Rajkot Civil Blood Bank', 'MVM Hospital Rajkot'],
    Ahmedabad: ['Ahmedabad Civil Hospital', 'Heera Hospital', 'Shalby Hospital'],
    Surat: ['Surat General Hospital', 'Lifeline Hospital', 'Global Care Hospital'],
    Vadodara: ['Vadodara Blood Bank', 'Mathura Hospital', 'Pragati Hospital']
  };

  const hospitalGroups = {
    'Rajkot Civil Hospital': ['A+', 'A-', 'B+', 'B-', 'O+', 'O-'],
    'Rajkot Civil Blood Bank': ['AB+', 'AB-', 'O+', 'O-', 'B+', 'B-'],
    'MVM Hospital Rajkot': ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
  };

  const hospitalContacts = {
    'Rajkot Civil Hospital': '+91 281 123 4567',
    'Rajkot Civil Blood Bank': '+91 281 765 4321',
    'MVM Hospital Rajkot': '+91 281 654 3210'
  };

  const requestCity = document.getElementById('requestCity');
  const requestHospital = document.getElementById('requestHospital');
  const requestBloodGroup = document.getElementById('requestBloodGroup');
  const hospitalContactInput = document.querySelector('input[readonly]');

  function createOptions(select, items, placeholder) {
    select.innerHTML = '';
    const placeholderOption = document.createElement('option');
    placeholderOption.value = '';
    placeholderOption.textContent = placeholder;
    placeholderOption.selected = true;
    placeholderOption.disabled = true;
    select.appendChild(placeholderOption);
    items.forEach((item) => {
      const option = document.createElement('option');
      option.value = item;
      option.textContent = item;
      select.appendChild(option);
    });
  }

  function updateHospitalOptions() {
    if (!requestCity || !requestHospital) return;
    const selectedCity = requestCity.value || 'Rajkot';
    const hospitals = cityHospitalMap[selectedCity] || ['Rajkot Civil Hospital', 'Rajkot Civil Blood Bank', 'MVM Hospital Rajkot'];
    createOptions(requestHospital, hospitals, 'Select Hospital');
    requestHospital.dispatchEvent(new Event('change'));
  }

  function updateBloodGroupOptions() {
    if (!requestHospital || !requestBloodGroup) return;
    const selectedHospital = requestHospital.value;
    const groups = hospitalGroups[selectedHospital] || ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
    createOptions(requestBloodGroup, groups, 'Select Blood Group');
    if (hospitalContactInput && selectedHospital && hospitalContacts[selectedHospital]) {
      hospitalContactInput.value = hospitalContacts[selectedHospital];
    }
  }

  if (requestCity && requestHospital && requestBloodGroup) {
    requestCity.addEventListener('change', updateHospitalOptions);
    requestHospital.addEventListener('change', updateBloodGroupOptions);
    updateHospitalOptions();
  }

  // Emergency Search Functionality
  const bloodBtns = document.querySelectorAll('.blood-btn');
  bloodBtns.forEach(btn => {
    btn.addEventListener('click', function(e) {
      e.preventDefault();
      bloodBtns.forEach(b => b.classList.remove('active'));
      this.classList.add('active');
      document.getElementById('selectedBlood').value = this.getAttribute('data-blood');
    });
  });
});

// Emergency Search Function
function performEmergencySearch() {
  const city = document.getElementById('emergencyCity').value;
  const bloodGroup = document.getElementById('selectedBlood').value;
  
  if (!city) {
    alert('Please select a city');
    return;
  }
  
  if (!bloodGroup) {
    alert('Please select a blood group');
    return;
  }
  
  // Show results with animation
  const resultsContainer = document.getElementById('emergencyResults');
  resultsContainer.style.opacity = '0.5';
  
  setTimeout(() => {
    resultsContainer.style.opacity = '1';
    // Add search success message
    console.log(`Searching for ${bloodGroup} in ${city}...`);
  }, 300);
}
