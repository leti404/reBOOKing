  function previewImage(event) {
    const file = event.target.files[0];
    const preview = document.getElementById('image-preview');
    
    if (file) {
      const reader = new FileReader();
      reader.onload = function(e) {
        preview.style.backgroundImage = `url('${e.target.result}')`;
        preview.style.backgroundSize = 'cover';
        preview.style.backgroundPosition = 'center';
        preview.innerHTML = ''; 
      };
      reader.readAsDataURL(file);
    }
}

function toggleForm() {
  var enBD = document.getElementById("enBD").value;
  var bookForm = document.getElementById("bookForm");
  var bookSelection = document.getElementById("bookSelection");
  if (enBD === "No") {
      bookForm.style.display = "block";       
      bookSelection.style.display = "none";
  } else if (enBD === "Sí") {
      bookForm.style.display = "none";        
      bookSelection.style.display = "block";  
  } else {
      bookForm.style.display = "none";        
      bookSelection.style.display = "none";
  }
  $('#loginForm').submit(function(event) {
      event.preventDefault();
  });
}
$.ajax({
    url: '@Url.Action("Carrito", "Home")',
    type: 'GET',
    success: function(response) {
        alert(response.message);
    }
});


  let currentStep = 1;
  const totalSteps = 3;

  function showStep(step) {
    document.querySelectorAll('.form-step').forEach(el => el.classList.remove('active'));
    document.getElementById(`step-${step}`).classList.add('active');
    }

  function nextStep() {
    if (currentStep < totalSteps) {
      currentStep++;
      showStep(currentStep);
    }
    }

  function prevStep() {
      if (currentStep > 1) {
          currentStep--;
          showStep(currentStep);
      }
   }