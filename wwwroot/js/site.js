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
    for (let i = 1; i <= totalSteps; i++) {
        const formStep = document.getElementById(`register-step-${i}`);
        if (formStep) {
            formStep.style.display = (i === step) ? "block" : "none";
        }
    }
}

function validateCurrentStep() {
    const currentStepDiv = document.getElementById(`register-step-${currentStep}`);
    const inputs = currentStepDiv.querySelectorAll("input, select");
    for (let input of inputs) {
        input.setCustomValidity(""); // limpia mensajes anteriores
        if (!input.checkValidity()) {
            input.reportValidity();
            input.focus();
            return false;
        }
    }
    return true;
}

function nextStep() {
    if (validateCurrentStep()) {
        if (currentStep < totalSteps) {
            currentStep++;
            showStep(currentStep);
        }
    }
}

function prevStep() {
    if (currentStep > 1) {
        currentStep--;
        showStep(currentStep);
    }
}

function configurarFechaNacimiento() {
    const fechaNacimiento = document.getElementById("fecha_nacimiento");
    if (!fechaNacimiento) return;

    const hoy = new Date();
    const maxDate = new Date(hoy.getFullYear() - 12, hoy.getMonth(), hoy.getDate());
    
    const maxStr = maxDate.toISOString().split("T")[0];
    const minStr = "1900-01-01";

    fechaNacimiento.max = maxStr;
    fechaNacimiento.min = minStr;

    fechaNacimiento.addEventListener("change", () => {
        const valor = new Date(fechaNacimiento.value);
        fechaNacimiento.setCustomValidity(""); // limpia mensaje anterior

        if (valor > hoy) {
            fechaNacimiento.setCustomValidity("La fecha no puede ser posterior a hoy.");
        } else if (valor > maxDate) {
            fechaNacimiento.setCustomValidity("Debes tener al menos 12 años.");
        }

        fechaNacimiento.reportValidity();
    });
}

document.addEventListener("DOMContentLoaded", () => {
    showStep(currentStep);
    configurarFechaNacimiento();
});

function mostrarSeccion(seccion) {
    const publicaciones = document.getElementById('seccion-publicaciones');
    const datos = document.getElementById('seccion-datos');
    const reviews = document.getElementById('seccion-reviews');

    publicaciones.style.display = 'none';
    datos.style.display = 'none';
    reviews.style.display = 'none';

    if (seccion === 'publicaciones') {
        publicaciones.style.display = 'block';
    } else if (seccion === 'datos') {
        datos.style.display = 'block';
    } else if (seccion === 'reviews') {
        reviews.style.display = 'block';
    }

    // --- Marcar pestaña activa visualmente ---
    const tabs = document.querySelectorAll('.profile-tabs .tab');
    tabs.forEach(tab => {
        tab.classList.remove('active');
    });

    const activeButton = Array.from(tabs).find(tab => 
        tab.textContent.toLowerCase().includes(seccion)
    );
    if (activeButton) {
        activeButton.classList.add('active');
    }
}
